<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Togather</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="/assets/img/favicon.png" rel="icon" />
    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="/assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <link
      href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
    
    <!-- Kakao Map API Key -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11400a9267d93835389eb9255fcaad0b&libraries=services,clusterer"></script>
  
    <!-- alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- alert -->
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
			  
	<script type="text/javascript">
	function gatheringJoin(){
    	Swal.fire({
			  title: '정모에 참석 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
				console.log(result.isConfirmed);
				if(${gatheringMemberCount} >= ${gatheringInfo.ga_limit}){
					Swal.fire({
						title: '정모 참여 인원이 다 찼습니다',
						icon: 'warning',
						showCancelButton: false,
						confirmButtonColor: '#3085d6',
						confirmButtonText: 'Yes'
					});
					return false;
				}else if (result.isConfirmed) {
				var mnum = ${m.mnum};
	  			var ga_seq = ${gatheringInfo.ga_seq};
	  			var result = {"mnum":mnum,"ga_seq":ga_seq};
		  		$(function(){
  				$.ajax({
	   					url: "memInGathering.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   					}
  				});
  				location.reload(); 
		  		});
		  		
			  }  			  
			});
    	}
	
	function gatheringQuit(){
		Swal.fire({
			  title: '정모 참석을 취소 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
				console.log(result.isConfirmed);
			  if (result.isConfirmed) {
				var mnum = ${m.mnum};
					var gseq = ${gatheringInfo.gseq};
		  			var ga_seq = ${gatheringInfo.ga_seq};
		  			var result = {"mnum":mnum,"ga_seq":ga_seq};
  		  		$(function(){
    				$.ajax({
	   					url: "gatheringQuit.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(data == 0){
	   location.href="../groupTab/groupInfo.do?gseq=${gatheringInfo.gseq}&mnum=${m.mnum}";
	   						}else{
	   							location.reload();
	   						}
	   					}
    				}); 
  		  		});
  		  		
			  }  			  
			});
	}
	function gatheringDeleteCheck(){ 
		var mnum = ${m.mnum};
		var ga_seq = ${gatheringInfo.ga_seq};
		var result = {"mnum":mnum,"ga_seq":ga_seq};
  			$(function(){
			$.ajax({
  					url: "gatheringDeleteCheck.json",
  					type: "POST",
  					data: result,
  					success: function(data){
  						if(data==0){//모임장일때일때
  							gatheringDelete();
  							console.log("check0: "+data);
  						}else{//모임장 아닐때
  							console.log("check1: "+data);
  							Swal.fire({
  							  title: "작성자만 삭제 가능합니다",
  							  icon: "error"
  							});
  						}
  					}
  				});  
  			});
	}
	
	function gatheringUpdateCheck(){ 
		var mnum = ${m.mnum};
		var ga_seq = ${gatheringInfo.ga_seq};
		var result = {"mnum":mnum,"ga_seq":ga_seq};
  			$(function(){
			$.ajax({
  					url: "gatheringUpdateCheck.json",
  					type: "POST",
  					data: result,
  					success: function(data){
  						if(data==0){//모임장일때일때
  							gatheringUpdate();
  							console.log("check0: "+data);
  						}else if(data==1){//운영진일때
  							gatheringUpdate();
  							console.log("check1: "+data);
  							//swal("모임장,운영자만 수정 가능합니다");
  						}else if(data==2){//일반회원
  							console.log("check2: "+data);
  							Swal.fire({
  							  title: "작성자만 수정 가능합니다",
  							  icon: "error"
  							});
  						}else {//모임에없을때
  							Swal.fire({
  							  title: "작성자만 수정 가능합니다",
  							  icon: "error"
  							});
  							console.log("check3: "+data);
  						}
  					}
  				});  
  			});
	}
	
	function gatheringUpdate(){
		location="gatheringUpdate.do?ga_seq=${gatheringInfo.ga_seq}&mnum=${m.mnum}";
	}
	function gatheringDelete(){
		location="gatheringDelete.do?ga_seq=${gatheringInfo.ga_seq}&gseq=${gatheringInfo.gseq}&mnum=${m.mnum}";
	}
	function memberInfo(index){
		var arr = new Array();
		<c:forEach var="memInGatheringName" items="${memInGatheringName}">	              
        	arr.push({mnum:"${memInGatheringName.MNUM}"});
    	</c:forEach>
    	console.log(arr);
    	console.log(arr[index].mnum);
    	baby_login = window.open(
    	  "../member/memberInfo?mnum="+arr[index].mnum+"&ga_seq=${gatheringInfo.ga_seq}", "memberInfo", 
    	   "width=1000, height=900, top=100, left=100");
    }
	
	
	</script>
	
	
	
  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="../">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="../">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="../myGroup.do?mnum=${m.mnum }">나의 모임</a></li>
            <!--로그인시에만 보이게 하기-->
            <li><a href="../board/listPage">게시판</a></li>
            <li>
              <a href="../wishTab/wishList?mnum=${m.mnum }"
                >찜목록
                <span class="badge bg-dark text-white ms-1 rounded-pill"
                  >0</span
                >
              </a>
            </li>

            <li class="dropdown">
              <a href="#"
                ><span>고객지원</span> <i class="bi bi-chevron-down"></i
              ></a>
              <ul>
                <li><a href="notice.html">공지사항</a></li>
                <li><a href="FAQ.html">자주묻는 질문</a></li>
                <li><a href="qa">Q&A</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>
            </li>
            <c:choose>
           		<c:when test="${m eq null}">
		            <li><a href="login.html">로그인</a></li>		       
	          	</c:when>
       			<c:otherwise>
       			<li><a href="javascript:void(0);" onclick="signout();">로그아웃</a></li>
            	</c:otherwise>
         	</c:choose>
            </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->

        <!--로그인전에는 회원가입만 보이고 로그인하면 모임만들기만 보이게 하는건 어떤지??-->
        <c:choose>
           		<c:when test="${m eq null}">
		        	<a href="../member/joinform.do" class="get-started-btn">회원가입</a>
		        </c:when>
		        <c:otherwise>
		        	<a href="groupCreate.do" class="get-started-btn">모임만들기</a>
		        </c:otherwise>
         </c:choose>
      </div>
    </header>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>${gatheringInfo.ga_name}</h1>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Cource Details Section ======= -->

      <section id="course-details" class="course-details">
        <div class="container" data-aos="fade-up">
          </ul>
          <div class="row">
              <div class="col-lg-2">

              </div>
            <div class="col-lg-4">
          <div id="map" style="width:100%;height:500px;"></div>
          <script type="text/javascript">
				var inputData = ['${gatheringInfo.ga_place}']
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
				};
				// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var count = 0;
				var ps = new kakao.maps.services.Places();
				var bounds = new kakao.maps.LatLngBounds();
				var geocoder = new kakao.maps.services.Geocoder();
				if (inputData != null) {
					kewwordSearch(inputData[count]);
				}
				function kewwordSearch(keword) {
					ps.keywordSearch(keword, placesSearchCB);
					count = count + 1;
				}
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {
						displayMarker(data[0]);
						bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
							if (count < inputData.length) {
								kewwordSearch(inputData[count]);
							} else if (count == inputData.length) {
								setBounds();
							}
					}
				}
				function displayMarker(place) {
					var marker = new kakao.maps.Marker({
						map: map,
						position: new kakao.maps.LatLng(place.y, place.x),
						
					});
					//위치 보기
					//var iwContent = "<div style='padding:5px;'>${gatheringCreateName.mname}님의 정모 <br><a href='https://map.kakao.com/link/map/${gatheringCreateName.mname}님의 정모,"+place.y+","+place.x+"' style='color:blue' target='_blank'>크게보기</a></div>";
					
					
					//누르면 길찾기 나옴
					var iwContent = "<div >${gatheringCreateName.mname}님의 정모 <br>${gatheringInfo.ga_place}<a href='https://map.kakao.com/link/to/"+place.id+"' style='color:blue' target='_blank'>길찾기</a></div>";
					
					//var iwContent = "<div style='width:10px'>${gatheringCreateName.mname}님의 정모</div>";
				    iwPosition = new kakao.maps.LatLng(place.y, place.x); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
				
					kakao.maps.event.addListener(marker, 'click', function () {
						var url = 'https://map.kakao.com/link/map/' + place.id;
						window.open(url, '_blank');
					});
				}
				function setBounds() {
					map.setBounds(bounds, 90, 30, 10, 30);
					console.log(bounds);
				} 
	</script>
          
              </div>
              
            <div class="col-lg-4">
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-hand-thumbs-up"></i></h5>
                <p>${gatheringCreateName.mname}</p>
              </div>

              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-calendar4"></i></h5>
                <p>${gatheringInfo.ga_date}</p>
              </div>
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-clock"></i></h5>
                <p>${gatheringInfo.time}</p>
              </div>

              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-geo-alt"></i></h5>
                <p>${gatheringInfo.ga_place}</p>
              </div>
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-cash-coin"></i></h5>
                <p>${gatheringInfo.price}</p>
              </div>
              
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5><i class="bi bi-people"></i></h5>
                <nav id="navbar" class="navbar order-last order-lg-0">
                <div class="dropdown">
                <a href="#">
	              ${gatheringMemberCount}/${gatheringInfo.ga_limit}명
	            </a>
	              <ul>
	              <c:forEach var="memInGatheringName" items="${memInGatheringName}" varStatus="index">
		              <c:choose>
			              <c:when test="${memInGatheringName.Grade eq 0}">
			              	<c:set var="grade" value="모임장"/>
			              </c:when>
			              <c:when test="${memInGatheringName.Grade eq 1}">
			              	<c:set var="grade" value="운영진"/>
			              </c:when>
			              <c:otherwise>
			              	<c:set var="grade" value="나"/>
			              </c:otherwise>
		              </c:choose>
		              <c:choose>
			              <c:when test="${m.mnum eq memInGatheringNmae.MNUM}">
			                <li><a href="javascript:void(0)">${memInGatheringName.MNAME}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${grade}</a></li>
			              </c:when>
			              <c:otherwise>  
			                <li><a href="javascript:void(0)" onclick="location.href='javascript:memberInfo(${index.index})'">${memInGatheringName.MNAME}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${grade}</a></li>
			              </c:otherwise>
		              </c:choose>
	              </c:forEach>
	              </ul>
	            </div>
	            </nav>
              </div>
              <!--  
              <div class="course-info d-flex justify-content-between align-items-center">
				
					<label><b>채팅방</b></label>
				</div>
				<div>
					<div id="msgArea" class="col">
					
					</div>
					<div class="col-6">
					<div class="input-group mb-3">
						<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
						</div>
					</div>
					</div>
			</div>
			-->
              
              
              <div class="d-grid gap-2 mt-3 mb-3">
              <c:choose>
	              <c:when test="${memInGatheringCheck eq null}">
	                <button type="button" class="btn btn-outline-primary"
	                onclick="location.href='javascript:gatheringJoin()'">
	                    참석하기
	                  </button>
                  </c:when>
                  <c:otherwise>
	                   <button type="button" class="btn btn-outline-danger"
	                onclick="location.href='javascript:gatheringQuit()'">
	                    참석 취소
	                  </button>
                  </c:otherwise>
               </c:choose>
                <button type="button" class="btn btn-outline-secondary" 
                onclick="location.href='javascript:gatheringUpdateCheck()'">
                  정모 수정하기
                </button>
                <button type="button" class="btn btn-outline-secondary"
                onclick="location.href='javascript:gatheringDeleteCheck()'">
                  정모 삭제하기
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Cource Details Section -->
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 footer-contact">
              <h3>Togather</h3>
              <p>
                서울시 금천구 <br />
                가산 디지털 2로 123<br />
                월드메르디앙 2차 <br /><br />
                <strong>Phone:</strong> +82 2 1234 1234<br />
                <strong>Email:</strong> service@togather.com<br />
              </p>
            </div>

            <div class="col-lg-2 col-md-6 footer-links">
              <h4>Useful Links</h4>
              <ul>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="index.html">Home</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="about.html">About us</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="#">Services</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="#">Terms of service</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="#">Privacy policy</a>
                </li>
              </ul>
            </div>

            <div class="col-lg-3 col-md-6 footer-links">
              <h4>Our Services</h4>
              <ul>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="notice.html">공지사항</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="FAQ.html">자주 묻는 질문</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="QA.html">Q & A</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="contact.html">Contact</a>
                </li>
              </ul>
            </div>

            <div class="col-lg-4 col-md-6 footer-newsletter">
              <h4>뉴스레터 구독하기</h4>
              <p>
                최신뉴스 및 프로모션 행사에 대한 안내메일을 받으실 수 있습니다.
              </p>
              <form action="" method="post">
                <input type="email" name="email" /><input
                  type="submit"
                  value="Subscribe"
                />
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="container d-md-flex py-4">
        <div class="me-md-auto text-center text-md-start">
          <div class="copyright">
            &copy; Copyright <strong><span>Togather</span></strong
            >. All Rights Reserved
          </div>
        </div>
        <div class="social-links text-center text-md-right pt-3 pt-md-0">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
      </div>
    </footer>
    <!-- End Footer -->

    <div id="preloader"></div>
    <a
      href="#"
      class="back-to-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

    <!-- Vendor JS Files -->
    <script src="/assets/vendor/purecounter/purecounter.js"></script>
    <script src="/assets/vendor/aos/aos.js"></script>
    <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="/assets/js/main.js"></script>
  </body>
</html>

