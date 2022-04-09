<%@ page session="true" contentType="text/html; charset=utf-8"%>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <link
      href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
    <!-- alert  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- alert -->
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
    <script>
    function popularGroups(){
    	let groupDiv="";
    	groupDiv+="<div class='container' data-aos='fade-up'>";
    	groupDiv+="<div class='section-title'>";
    	groupDiv+="<h2>소모임</h2>";
    	groupDiv+="<p>Popular Groups</p>";
    	groupDiv+="</div>";
    	groupDiv+="<div id='group' class='row' data-aos='zoom-in' data-aos-delay='100'>";
    	groupDiv+="<c:forEach var='groupList' items='${list}'  varStatus='status' >";
    	groupDiv+="<div class='col-lg-4 col-md-6 d-flex align-items-stretch'>";
    	groupDiv+="<div class='course-item'>";
    	groupDiv+="<img src='/assets/img/course-1.jpg' class='img-fluid' alt='...'/>";
    	groupDiv+="<div class='course-content'>";
    	groupDiv+="<div class='d-flex justify-content-between align-items-center mb-3'>";
    	groupDiv+="<h4>${groupList.interest}</h4>";
    	groupDiv+="<p class='price'>${groupList.gloc}</p>";
    	groupDiv+="</div>";
    	groupDiv+="<h3><a href='groupTab/groupInfo.do?gseq=${groupList.gseq}&mnum=${m.mnum}'>${groupList.gname}</a></h3>";
    	groupDiv+=" <p>";
    	groupDiv+="${groupList.gintro}";
    	groupDiv+="</p>";
    	groupDiv+=" <p><i class='fa fa-map-marker-alt text-primary me-2'></i>${groupList.gloc}</p>";
    	groupDiv+="<div class='trainer d-flex justify-content-between align-items-center'>";
    	groupDiv+="<div class='trainer-profile d-flex align-items-center'>";
    	groupDiv+="<img src='/assets/img/trainers/trainer-1.jpg' class='img-fluid' alt='' />";
    	groupDiv+="<span>${namelist[status.index].mname}</span> ";
    	groupDiv+="</div>";
    	groupDiv+="<div class='trainer-rank d-flex align-items-center'>";
    	groupDiv+="<i class='bx bx-user'></i>&nbsp;${groupMemberCount[status.index]} &nbsp;&nbsp;";
    	groupDiv+="<i class='bx bx-heart'></i>&nbsp;65";
    	groupDiv+="</div>";
    	groupDiv+="</div>";
    	groupDiv+=" </div>";
    	groupDiv+="</div>";
    	groupDiv+="</div>";
    	groupDiv+="</c:forEach>";
    	groupDiv+="</div>";
    	groupDiv+=" </div>";
    	$('#popular-courses').append(                     
    			groupDiv              		
		);   	
    	
    }
    
    
    function pageSend(i,criPageSize){
		let idx=i;
		let pageSize=criPageSize;
		let result={"page":idx,"pageSize":pageSize};
		$.ajax({
				url: "page.json",
				type: "POST",
				data: result,
				success: function(data){
					console.log(data);
					
				}
		});
	}
  //메세지-------
    $(function(){
 		document.getElementById('my_btn').click();
 	});
     function buttonCheck(messageCheck,loginCheck){
    	 console.log("messageCheck: "+messageCheck);
    	 var mnum = loginCheck;
    	 if(messageCheck !=null && messageCheck!=0){//checkNum이 널이면 로그인이 안되어있거나 메세지가없는것,0이면 알림을끝상태
    		 const Toast = Swal.mixin({
    			  toast: true,
    			  position: 'top-end',
    			  showConfirmButton: true,
    			  showCancelButton: true,
    			  confirmButtonText : "메세지 보러가기",
    			  cancelButtonText: '알림끄기',
    			  timer: 3000,
    			  timerProgressBar: true,
    			  didOpen: (toast) => {
    			    toast.addEventListener('mouseenter', Swal.stopTimer);
    			    toast.addEventListener('mouseleave', Swal.resumeTimer);
    			  }
    			})
    			Toast.fire({
    			  icon: 'success',
    			  title: '새로운 메세지가 있습니다'
    			}).then((result) => {
    				  if (result.isConfirmed) {//여기에 로직 메세지 이동하는
				   			location.href="member/messageList?mnum="+mnum;

    					  } else if (
    					    /* Read more about handling dismissals below */
    					    result.dismiss === Swal.DismissReason.cancel
    					  ) {//여기에 로직 알림끄는 
    						  var result = {"mnum":mnum};
    						  $.ajax({
    			   					url: "viewChecked.json",
    			   					type: "POST",
    			   					data: result,
    			   					success: function(data){
    			   						console.log(data);
    			   					}
    		  				});  
    					  }	 
    			})
    	 }
     }
     //메세지-------
     
      Kakao.init('11400a9267d93835389eb9255fcaad0b');
      function signout(){
        if(Kakao.Auth.getAccessToken() != null){
    	  Kakao.Auth.logout(function(){
    	    setTimeout(function(){
              location.href="member/logout.do";
              
           },500);
         });
        }else{
        	location.href="member/logout.do";
        	 
        }
      }

     	$(function(){
     		$("#찜하기버튼id").on("click", function(){
     			$.ajax({
     				url:"handleWishList",
     				type:"POST",
     				dataType:"json",
     				contentType:"application/json",
     				data:{
     					
     				},
     				success: function(result){
     					$("numberOfWish").empty();
     					$("numberOfWish").append();
     				},
     				error:function(error){
     					
     				}
     			})
     		});
     	});
     	window.onpageshow = function(event) {
     		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {  			
     			location.reload();
     		} 
     		
     	}
      </script>
  </head>

  <body onload="popularGroups()" >
  	<c:choose>
		<c:when test="${message eq null}">
			<c:set value="null" var="message"/>
		</c:when>
		<c:otherwise>
			<c:set value="${message}" var="message"/>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${m eq null}">
			<c:set value="null" var="loginCheck"/>
		</c:when>
		<c:otherwise>
			<c:set value="${m.mnum}" var="loginCheck"/>
		</c:otherwise>
	</c:choose>
	<input 
	  id='my_btn'
	  type='button' 
	  onclick='buttonCheck(${message},${loginCheck})'
	  />
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="/">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
		
        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="/">Home</a></li>
            <li><a href="about.html">About</a></li>
          <c:if test="${m ne null}">
            <li><a href="groupTab/myGroup.do?mnum=${m.mnum }">나의 모임</a></li><!--로그인시에만 보이게 하기-->
           	<li><a href="wishlist.html">찜목록
           	<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
           	</a></li>
           </c:if>
            <li><a href="board/listPage">게시판</a></li>
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
            		<li><a href="member/login.do">로그인 ${sessionScope.m} </a></li>
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
		        	<a href="member/joinform.do" class="get-started-btn">회원가입</a>
		        </c:when>
		        <c:otherwise>
        			<a href="groupTab/groupCreate.do" class="get-started-btn">모임만들기</a>
        		</c:otherwise>
         </c:choose>
        
        
      </div>
    </header>
    <!-- End Header -->

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex justify-content-center align-items-center">
      <div
        class="container position-relative"
        data-aos="zoom-in"
        data-aos-delay="100"
      >
        <h1>
          Togather에 가입하고<br />자기개발과 취미생활을 <br />시작해보세요
        </h1>
        <h2>전국 모든 지역에 1825개의 소모임이 진행중입니다</h2>
        <a href="courses.html" class="btn-get-started">시작하기</a>
      </div>
    </section>
    <!-- End Hero -->
    <!-- Search Start -->
    <div
      class="container-fluid mb-5 wow fadeIn mt-5"
      data-wow-delay="0.1s"
      style="padding: 35px; background-color: #5fcf80"
    >
      <div class="container">
        <div class="row g-2">
          <div class="col-md-10">
            <div class="row g-2">
              <div class="col-md-4">
                <input
                  type="text"
                  class="form-control border-0 py-3"
                  placeholder="모임찾기"
                />
              </div>
              <div class="col-md-4">
                <select class="form-select border-0 py-3">
                  <option selected disabled>관심사</option>
                  <option value="1">아웃도어/여행</option>
                  <option value="2">외국/언어</option>
                  <option value="3">음악/악기</option>
                  <option value="4">차/오토바이</option>
                  <option value="5">요리/제조</option>
                  <option value="6">업종/직무</option>
                  <option value="7">문화/공연/축제</option>
                  <option value="8">공예/만들기</option>
                  <option value="9">댄스/무용</option>
                  <option value="10">봉사활동</option>
                  <option value="11">인문학/책/글</option>
                  <option value="12">사진/영상</option>
                  <option value="13">게임/오락</option>
                  <option value="14">반려동물</option>
                  <option value="15">자유주제</option>
                </select>
              </div>
              <div class="col-md-4">
                <select class="form-select border-0 py-3">
                  <option selected disabled>지역</option>
                  <option value="1">서울</option>
                  <option value="2">경기</option>
                  <option value="3">인천</option>
                  <option value="4">강원</option>
                  <option value="5">충북</option>
                  <option value="6">충남</option>
                  <option value="7">전북</option>
                  <option value="8">전남</option>
                  <option value="9">경북</option>
                  <option value="10">경남</option>
                  <option value="11">제주</option>
                </select>
              </div>
            </div>
          </div>
          <div class="col-md-2">
            <button class="btn btn-dark border-0 w-100 py-3">Search</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Search End -->

          <!-- ======= Counts Section ======= -->
          <section id="counts" class="counts section-bg mb-5">
            <div class="container">
              <div class="row counters">
                <div class="col-lg-3 col-6 text-center">
                  <span
                    data-purecounter-start="0"
                    data-purecounter-end="${membercount }"
                    data-purecounter-duration="1"
                    class="purecounter"
                  ></span>
                  <p>회원수</p>
                </div>
    
                <div class="col-lg-3 col-6 text-center">
                  <span
                    data-purecounter-start="0"
                    data-purecounter-end="${groupcount }"
                    data-purecounter-duration="1"
                    class="purecounter"
                  ></span>
                  <p>개설된 모임</p>
                </div>
    
                <div class="col-lg-3 col-6 text-center">
                  <span
                    data-purecounter-start="0"
                    data-purecounter-end="629"
                    data-purecounter-duration="1"
                    class="purecounter"
                  ></span>
                  <p>개설된 정모</p>
                </div>
    
                <div class="col-lg-3 col-6 text-center">
                  <span
                    data-purecounter-start="0"
                    data-purecounter-end="2198"
                    data-purecounter-duration="1"
                    class="purecounter"
                  ></span>
                  <p>하루평균 방문자</p>
                </div>
              </div>
            </div>
          </section>
          <!-- End Counts Section -->

   

      <!-- ======= Features Section ======= -->
      <section id="features" class="features">
        <div class="container" data-aos="fade-up">
          <div class="row" data-aos="zoom-in"  data-aos-delay="100">
            <div class="col-lg-3 col-md-4">
              <div class="icon-box">
                <i class="ri-football-fill" style="color: #ffbb2c"></i>
                <h3><a href="">운동/스포츠</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
              <div class="icon-box">
                <i class="ri-footprint-line" style="color: #5578ff"></i>
                <h3><a href="">아웃도어/여행</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
              <div class="icon-box">
                <i class="ri-translate-2" style="color: #e80368"></i>
                <h3><a href="">외국/언어</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-lg-0">
              <div class="icon-box">
                <i class="ri-music-2-line" style="color: #e361ff"></i>
                <h3><a href="">음악/악기</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-roadster-line" style="color: #47aeff"></i>
                <h3><a href="">차/오토바이</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-cake-3-line" style="color: #ffa76e"></i>
                <h3><a href="">요리/제조</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-briefcase-5-line" style="color: #4233ff"></i>
                <h3><a href="">업종/직무</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-open-arm-line" style="color: #b2904f"></i>
                <h3><a href="">문화/공연/축제</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-palette-line" style="color: #b20969"></i>
                <h3><a href="">공예/만들기</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-group-line" style="color: #ff5828"></i>
                <h3><a href="">댄스/무용</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-user-heart-line" style="color: #29cc61"></i>
                <h3><a href="">봉사활동</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-book-2-line" style="color: #11dbcf"></i>
                <h3><a href="">인문학/책/글<a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-camera-line" style="color: #26c2d6"></i>
                <h3><a href="">사진/영상</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-gamepad-line" style="color: #e737cf"></i>
                <h3><a href="">게임/오락</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-mickey-line" style="color: #909b00"></i>
                <h3><a href="">반려동물</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-send-plane-fill" style="color: #093166"></i>
                <h3><a href="">자유주제</a></h3>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Features Section -->

      <!-- ======= Popular Courses Section ======= -->
      <section id="popular-courses" class="courses">
        
        <c:if test="${m ne null }">
        <div>
            <nav aria-label="Page navigation example">
                  <ul
                    id="paging"
                    class="pagination"
                    style="justify-content: center"
                  >
                  <c:if test="${pm.prev}">
                    <li class="page-item">
                      <a class="page-link" href="/?page=${pm.startPage-1}&pageSize=${cri.pageSize}">처음</a>
                    </li>
                  </c:if>
                  <c:if test="${pm.prev}">
                    <li class="page-item">
                      <a class="page-link" href="/?page=${cri.page-1}&pageSize=${cri.pageSize}">이전</a>
                    </li>
                  </c:if>
                  <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
                    <li class="page-item">
                      <a id="pageId" class="page-link" href="javascript:void(0)" onclick="location.href='javascript:pageSend(${idx},${cri.pageSize})'">${idx}</a><!-- /?page=${idx}&pageSize=${cri.pageSize} -->
                    </li> 
                  </c:forEach>
                  <c:if test="${pm.next && pm.endPage > 0}">
                    <li class="page-item">
                      <a class="page-link" href="/?page=${cri.page+1}&pageSize=${cri.pageSize}">다음</a>
                    </li>
                  </c:if>
                  <c:if test="${pm.next && pm.endPage > 0}">
                    <li class="page-item">
                      <a class="page-link" href="/?page=${pm.endPage}&pageSize=${cri.pageSize}">끝</a>
                    </li>
                  </c:if>
                  </ul>
                </nav>
          </div>
          </c:if>
      </section>
      <!-- End Popular Courses Section -->

   
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
                  <i class="bx bx-chevron-right"></i> <a href="index.html">Home</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="about.html">About us</a>
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
                  <i class="bx bx-chevron-right"></i> <a href="notice.html">공지사항</a>
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
                  <i class="bx bx-chevron-right"></i> <a href="contact.html">Contact</a>
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
    <script src="../assets/vendor/purecounter/purecounter.js"></script>
    <script src="../assets/vendor/aos/aos.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="/assets/js/main.js"></script>
  </body>
</html>
