package team1.togather.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import team1.togather.domain.Notification;
import team1.togather.domain.NotificationCriteria;


public interface NotificationMapper {

	List<Notification> list();	
	ArrayList<Notification> list(int pageAt, int ps);		//페이지
	ArrayList<Notification> list(String option, String ocontent);// 옵션이랑
	
	ArrayList<String> getCategory();
	
		
	//조회수
	public void updateNView(Long nseq);

	//페이징
	public List<Notification> listPage(Integer page); //특정페이지 글정보확인
	public List<Notification> listPageCri(NotificationCriteria cri); // 페이징처리(cri객체사용)	
	public List<Notification> getNotificationBySearch(Map map);
	Notification getNotificationContent(Long nseq);	// nseq으로 내용가저옴
	
	public Integer pageCount(); 		//페이지 카운트 계산
	
	//운영자 인서트 업데이트 삭제
	void insert(Notification notification);
	void update(Notification notification);
	void delete(long nseq);
	
	
}
