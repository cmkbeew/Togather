package team1.togather.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import team1.togather.domain.Gathering;
import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGathering;
import team1.togather.domain.Member;
import team1.togather.service.GatheringService;
import team1.togather.service.GroupTabService;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("gathering")
public class GatheringController {
	@Autowired
	private GatheringService gatheringService;
	private GroupTabService groupTabService;
	/** 위경도 좌표로 격자 X Y 좌표 구하기 */
	public HashMap<String, Object> getGridXY(double la, double ma) {
		double RE = 6371.00877; // 지구 반경(km)
		double GRID = 5.0; // 격자 간격(km)
		double SLAT1 = 30.0; // 투영 위도1(degree)
		double SLAT2 = 60.0; // 투영 위도2(degree)
		double OLON = 126.0; // 기준점 경도(degree)
		double OLAT = 38.0; // 기준점 위도(degree)
		double XO = 43; // 기준점 X좌표(GRID)
		double YO = 136; // 기1준점 Y좌표(GRID)
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			//HashMap<String, Object> siteMap = dao.getSiteAddr(params); //현장 주소 가져오기
			//HashMap<String, Object> latLon = getLatLon(siteMap);	//현장 주소를 통한 위경도 좌표 가져오기

			double DEGRAD = Math.PI / 180.0;
			// double RADDEG = 180.0 / Math.PI;
			double re = RE / GRID;
			double slat1 = SLAT1 * DEGRAD;
			double slat2 = SLAT2 * DEGRAD;
			double olon = OLON * DEGRAD;
			double olat = OLAT * DEGRAD;

			double sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
			sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
			double sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
			sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
			double ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
			ro = re * sf / Math.pow(ro, sn);

			double lat = la; //위도
			double lon = ma; //경도

			double ra = Math.tan(Math.PI * 0.25 + (lat) * DEGRAD * 0.5);
			ra = re * sf / Math.pow(ra, sn);
			double theta = lon * DEGRAD - olon;

			if (theta > Math.PI)
				theta -= 2.0 * Math.PI;
			if (theta < -Math.PI)
				theta += 2.0 * Math.PI;
			theta *= sn;

			resultMap.put("nx", Math.floor(ra * Math.sin(theta) + XO + 0.5));
			resultMap.put("ny", Math.floor(ro - ra * Math.cos(theta) + YO + 0.5));
			log.info("======= XY : "+resultMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	@ResponseBody
	@GetMapping("getWeather")
	public Map<String, String> getWeather(@RequestParam("La") double la,@RequestParam("Ma") double ma,
										  @RequestParam("Acode") String acode, @RequestParam("appliDate") String applidate ) throws IOException, ParseException {
		Date date = new Date();
		long diffDate=0L;
		applidate=applidate.replace("-", "");
		System.out.println("La: "+la+" Ma: "+ ma+" acode: "+acode+" applicdate: "+applidate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		try {
			Date applicableDate = sdf.parse(applidate);
			diffDate = ((applicableDate.getTime()-date.getTime())/(24*60*60*1000))+1;
			System.out.println("diffdate: "+diffDate);
			System.out.println("applicableDate: "+sdf.format(applicableDate));
			applidate = sdf.format(applicableDate);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		// la가 경도 126대 ma가 위도 37대
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";	//동네예보조회
		HashMap<String, Object> map = getGridXY(la,ma);
		// 홈페이지에서 받은 키
		String serviceKey = "JyJZxQDP4oClg8XUlud0/YHRfHXXqFtqjvVbo6iqEiduQOGx1UrpbTUvBDR5/gxW4WvrNOGsG7NDFHOr4pX91Q==";
		String nx = String.valueOf(map.get("nx"));	//위도
		String ny = String.valueOf(map.get("ny"));	//경도
		int nxlastIndex = nx.lastIndexOf(".");
		int nylastIndex = ny.lastIndexOf(".");
		System.out.println("date "+date);
		String baseDate = sdf.format(date);	//조회하고싶은 날짜
		String baseTime = "0800";	//API 제공 시간
		String dataType = "json";	//타입 xml, json
		String numOfRows = "250";	//한 페이지 결과 수
		Map<String,String> midMap = midWeather(acode, baseDate); //중기예보
		//동네예보 -- 전날 05시 부터 225개의 데이터를 조회하면 모레까지의 날씨를 알 수 있음
		midMap.put("diffDate",String.valueOf(diffDate));
		int intDiffDate = Integer.parseInt(String.valueOf(diffDate));
		if(intDiffDate<=7) {
			switch(intDiffDate) {
				case 0 :
					midMap.put("climate",midMap.get(""));
					break;
				case 1 :
					break;
				case 2 :
					break;
				case 3 :
					break;
				case 4 :
					break;
				case 5 :
					break;
				case 6 :
					break;
				case 7 :
					break;
			}
		}
		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지번호
		urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx.substring(0, nxlastIndex), "UTF-8")); //경도
		urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny.substring(0, nylastIndex), "UTF-8")); //위도
		urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜*/
		urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
		urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(dataType, "UTF-8"));	/* 타입 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"));	/* 한 페이지 결과 수 */

		// GET방식으로 전송해서 파라미터 받아오기
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String data= sb.toString();
		System.out.println("data: " +data);
		// Json parser를 만들어 만들어진 문자열 데이터를 객체화
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(data);
		// response 키를 가지고 데이터를 파싱
		JSONObject parse_response = (JSONObject) obj.get("response");
		// response 로 부터 body 찾기
		JSONObject parse_body = (JSONObject) parse_response.get("body");
		// body 로 부터 items 찾기
		JSONObject parse_items = (JSONObject) parse_body.get("items");
		JSONArray parse_item = (JSONArray) parse_items.get("item");
		//JSONObject item = (JSONObject) parse_item.get("item");
		System.out.println("parse_item.size() "+parse_item.size());
		JSONObject jObj;
		return midMap;
	}
	public Map<String, String> midWeather(String regId, String tmFc) throws IOException, ParseException{
		HashMap<String, String> map = new HashMap<>();
		String midLandUrl ="http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst";
		String midTempUrl ="http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa";
		String serviceKey ="JyJZxQDP4oClg8XUlud0%2FYHRfHXXqFtqjvVbo6iqEiduQOGx1UrpbTUvBDR5%2FgxW4WvrNOGsG7NDFHOr4pX91Q%3D%3D";
		//예보구역코드 조사하기! 세부별은안되고 서울경기등 특별시와 광역시단위로
		if(regId.substring(0, 2).equals("11")||regId.substring(0, 2).equals("28")||regId.substring(0, 2).equals("41")) {
			regId = "11B00000"; //서울, 인천, 경기
		}else if(regId.substring(0, 2).equals("26")||regId.substring(0, 2).equals("31")||regId.substring(0, 2).equals("48")) {
			regId = "11H20000"; // 부산, 울산, 경남
		}else if(regId.substring(0, 2).equals("27")||regId.substring(0, 2).equals("47")) {
			regId = "11H10000"; // 대구, 경북
		}else if(regId.substring(0, 2).equals("29")||regId.substring(0, 2).equals("46")) {
			regId = "11F20000"; // 광주, 전남
		}else if(regId.substring(0, 2).equals("30")||regId.substring(0, 2).equals("36")||regId.substring(0, 2).equals("44")) {
			regId = "11C20000"; //대전, 세종, 충남
		}else if(regId.substring(0, 2).equals("42")) {
			regId = "11D10000"; //강원
		}else if(regId.substring(0, 2).equals("50")) {
			regId = "11G00000"; //제주
		}
		if(tmFc.length()<12) {
			tmFc += "0600";
			System.out.println("midWeather안 tmFc: "+ tmFc);
		}
		String numOfRows ="1";
		String type = "json";
		HashMap<String, HashMap<String,String>> rst = new HashMap<>();
		HashMap<String, String> sky = new HashMap<>();
		HashMap<String, String> tpt = new HashMap<>();
		StringBuilder landUrlBuilder = new StringBuilder(midLandUrl);
		landUrlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
		landUrlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "="+URLEncoder.encode("1", "UTF-8"));
		landUrlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode(regId, "UTF-8"));
		landUrlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(tmFc, "UTF-8")); /* 조회하고싶은 날짜*/
		landUrlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
		landUrlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* 타입 */
		URL url = new URL(landUrlBuilder.toString());
		//어떻게 넘어가는지 확인하고 싶으면 아래 출력분 주석 해제
		//System.out.println(url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String result= sb.toString();
		System.out.println("result: "+result);
		// Json parser를 만들어 만들어진 문자열 데이터를 객체화
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(result);
		// response 키를 가지고 데이터를 파싱
		JSONObject parse_response = (JSONObject) obj.get("response");
		// response 로 부터 body 찾기
		JSONObject parse_body = (JSONObject) parse_response.get("body");
		// body 로 부터 items 찾기
		JSONObject parse_items = (JSONObject) parse_body.get("items");
		// items로 부터 itemlist 를 받기
		JSONArray parse_item = (JSONArray) parse_items.get("item");

		System.out.println("parse_item(0): "+parse_item.get(0));
		JSONObject parse_item_json = (JSONObject) parse_item.get(0);
		System.out.println("wf8출력: "+parse_item_json.get("wf8"));
		map.put("wf3Am", parse_item_json.get("wf3Am").toString());
		map.put("wf3Pm", parse_item_json.get("wf3Pm").toString());
		map.put("wf4Am", parse_item_json.get("wf4Am").toString());
		map.put("wf4Pm", parse_item_json.get("wf4Pm").toString());
		map.put("wf5Am", parse_item_json.get("wf5Am").toString());
		map.put("wf5Pm", parse_item_json.get("wf5Pm").toString());
		map.put("wf6Am", parse_item_json.get("wf6Am").toString());
		map.put("wf6Pm", parse_item_json.get("wf6Pm").toString());
		map.put("wf7Am", parse_item_json.get("wf7Am").toString());
		map.put("wf7Pm", parse_item_json.get("wf7Pm").toString());


		return map;
	}

	@GetMapping("gatheringInfo.do") //정모 디테일
	public ModelAndView gatheringInfo(long ga_seq, MemInGathering memInGathering) {
		Gathering gatheringInfo = gatheringService.ga_selectByGaSeqS(ga_seq);
		Long gatheringMemberCount = gatheringService.gatheringMemberCount(ga_seq);
		Member gatheringCreateName = gatheringService.gatheringCreaterName(ga_seq);
		Long memInGatheringCheck = gatheringService.memInGatheringCheck(memInGathering);
		log.info("#mnum memInGatheringCheck: " + memInGatheringCheck);
		List<Map<String, String>> memInGatheringName = gatheringService.memInGatheringName(memInGathering);
//		Member user = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		log.info("==================================");
//		log.info("@ChatController, GET Chat / Username : " + user.getMname());
		try {
			getCoordinate(gatheringInfo.getGa_place());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("gathering/gatheringInfo", "gatheringInfo", gatheringInfo);
		mv.addObject("gatheringMemberCount", gatheringMemberCount); //정모 참여인원 카운트
		mv.addObject("gatheringCreateName", gatheringCreateName); //정모 만든사람 이름
		mv.addObject("memInGatheringName", memInGatheringName); //정모 참여자들 이름
		mv.addObject("memInGatheringCheck", memInGatheringCheck); //정모 참여 여부 판단
//		mv.addObject("user", user);
		return mv;
	}
	@GetMapping("gatheringCreate.do") //정모만들기 페이지로 이동
	public ModelAndView gatheringCreate(long gseq, HttpSession session) {
		GroupTab groupInfo = groupTabService.selectByGSeqS(gseq);
		Member m = (Member)session.getAttribute("m");
		ModelAndView mv = new ModelAndView("gathering/gatheringCreate", "gseq", gseq);
		mv.addObject("groupInfo", groupInfo);
		mv.addObject("m", m);
		return mv;
	}
	@PostMapping("gatheringCreate.do") //정모 만들기 값 포스트
	public String gatheringCreate(Gathering gathering, HttpSession session) {
		gatheringService.ga_insertS(gathering);
		Gathering g = gatheringService.insertGatheringInfo(gathering); //max(ga_seq) gathering 정보
		GroupTab groupInfo = groupTabService.selectByGSeqS(gathering.getGseq());
		Member m = (Member)session.getAttribute("m");
		log.info("#mnum in Controller: " + m.getMnum());
		return "redirect:../gathering/gatheringInfo.do?ga_seq=" + g.getGa_seq() +"&mnum="+m.getMnum();
	}
	@PostMapping("gatheringDeleteCheck")
	@ResponseBody
	public Long gatheringDeleteCheck(MemInGathering memInGathering) {
		Long grade = gatheringService.grade(memInGathering);
		if(grade == null) {
			grade=(long)3;
			return grade;
		}else {
			return grade;
		}
	}

	@GetMapping("gatheringDelete.do") //정모삭제
	public String gatheringDelete(long ga_seq, long gseq, long mnum) {
		gatheringService.memInGatheringDelete(ga_seq);
		gatheringService.ga_deleteS(ga_seq);
		return "redirect:../groupTab/groupInfo.do?gseq="+gseq+"&mnum="+mnum;
	}

	@PostMapping("gatheringUpdateCheck")
	@ResponseBody
	public Long gatheringUpdateCheck(MemInGathering memInGathering) {
		Long grade = gatheringService.grade(memInGathering);
		if(grade == null) {
			grade = (long) 3;
			return grade;
		}else {
			return grade;
		}
	}

	@GetMapping("gatheringUpdate.do")
	public ModelAndView gatheringUpdate(long ga_seq) {
		Gathering updateList = gatheringService.ga_selectByGaSeqS(ga_seq);
		ModelAndView mv = new ModelAndView("gathering/gatheringUpdate", "updateList", updateList);
		return mv;
	}

	@PostMapping("gatheringUpdate.do")
	public String gatheringUpdate(Gathering gathering, long mnum) {
		long ga_seq = gathering.getGa_seq();
		gatheringService.ga_updateS(gathering);
		return "redirect:gatheringInfo.do?ga_seq="+ga_seq+"&mnum="+mnum;
	}

	@PostMapping("memInGathering")
	@ResponseBody
	public String memInGathering(MemInGathering memInGathering, HttpSession session) {
		gatheringService.memInGathering(memInGathering);
		return "ok";
	}

	@PostMapping("gatheringQuit")
	@ResponseBody
	public String gatheringQuit(MemInGathering memInGathering, long ga_seq) {
		log.info("#gatheringQuit: "+memInGathering);
		List<Map<String, String>> memInGatheringName = gatheringService.memInGatheringName(memInGathering);
		log.info("#memInGatheringName: "+memInGatheringName);
		gatheringService.gatheringQuit(memInGathering);
		Long gatheringMemeberCount = gatheringService.gatheringMemberCount(ga_seq);
		log.info("#gatheringMemberCount: "+ gatheringMemeberCount);
		String result="";
		if(gatheringMemeberCount==0) {
			gatheringService.memInGatheringDelete(ga_seq);
			gatheringService.ga_deleteS(ga_seq);
			result="0";
		}else {
			result="1";
		}
		log.info("#result: "+ result);
		return result;
	}
	public void getCoordinate(String address) throws Exception{
		System.out.println("getCoordinate 들어옴 address값:"+address);
		//주소안에 띄어쓰기때문에 400에러가 나는것을 해결

		address = URLEncoder.encode(address,"UTF-8");

		String url = "https://dapi.kakao.com/v2/local/search/address.json?query="+ address;

		String jsonString = new String();

		String buf;

		URL Url = new URL(url);

		HttpsURLConnection conn = (HttpsURLConnection) Url.openConnection();
		String auth ="KakaoAK " +"2f62f5373a7e0b4cb76d5c23097577a6";
		conn.setRequestMethod("GET");
		conn.setRequestProperty("X-Requested-With", "curl");
		conn.setRequestProperty("Authorization", auth);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		while((buf = br.readLine()) != null) {
			jsonString += buf;
		}
		JSONParser paser = new JSONParser();

		JSONObject J = (JSONObject)paser.parse(jsonString);
		JSONObject meta = (JSONObject) J.get("meta");

		JSONArray data = (JSONArray) J.get("documents");
		long size = (long) meta.get("total_count");
		System.out.println("size확인 :: " + size);

		if(size > 0) {
			JSONObject jsonX = (JSONObject)data.get(0);
			System.out.println(jsonX.get("x").toString());
			System.out.println(jsonX.get("y").toString());
		}
	}

	@GetMapping("gatheringSearchMap.do")
	public ModelAndView gatheringSearchMap(String place) {
		System.out.println("place: "+place);
		ModelAndView mv = new ModelAndView("gathering/searchMap","place",place);
		return mv;
	}

}
