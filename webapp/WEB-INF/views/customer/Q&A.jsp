<%@ page session="true" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<!-- alert  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- alert -->
    <script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
    function secretQA(index,athurCheck){
        var athur = athurCheck;
        if(athur!=0){
        swal({  		
              title: "비밀번호를 입력해주세요", 	
              content:{
                  element:"input",
                  attribute:{
                      placeholder:"비밀번호를 입력해주세요",
                      type:"password"
                  },
              },
              button: {
                  text:"확인!",
                  value:true
                  },
              closeOnClickOutside : false
            }).then((result)=>{
                if(result){//입력값들어감
                    var arr = new Array();
                    <c:forEach var="list" items="${list}">	              
                        arr.push({qseq:"${list.qseq}"});
                    </c:forEach>
                    var qpwd = result;
                      console.log(arr);
                      console.log(arr[index].qseq);
                      var qseq=arr[index].qseq;
                      var result = {"qpwd":qpwd,"qseq":qseq};
                    $(function(){
                        $.ajax({
                               url: "qaPwdContent.json",
                               type: "POST",
                               data: result,
                               success: function(data){
                                   closeOnClickOutside : false
                                   if(data==0){
                                       Swal.fire({
                                           title:"비밀번호가 다릅니다",
                                           icon:"error"
                                           });
                                   }else{
                                       location.href="qaContent?qseq="+qseq+"&page=${cri.page}&pageSize=${cri.pageSize}";
                                   }
                               }
                           });  
                       });
                }
            });
        }else{
            var arr = new Array();
            <c:forEach var="list" items="${list}">	              
                arr.push({qseq:"${list.qseq}"});
            </c:forEach>
            var qseq=arr[index].qseq;
            location.href="qaContent?qseq="+qseq+"&page=${cri.page}&pageSize=${cri.pageSize}";
        }
    }
    	
    	window.onpageshow = function(event) {
     		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) { 
     			location.reload();
     		} 
     		
     	}

            Kakao.init('11400a9267d93835389eb9255fcaad0b');
            function signout(){
              if(Kakao.Auth.getAccessToken() != null){
          	  Kakao.Auth.logout(function(){
          	    setTimeout(function(){
                    location.href="../member/logout.do";
                 },500);
               });
              }else{
              	location.href="../member/logout.do";
              }
            }

    </script>
  </head>

  <body >
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="/">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="/">Home</a></li>
            <li><a href="about.html">About</a></li>
            <!--로그인시에만 보이게 하기-->
            <li><a href="board/listPage">게시판</a></li>
            <c:if test="${m ne null}">
            <li><a href="groupTab/myGroup.do?mnum=${m.mnum }">나의 모임</a></li><!--로그인시에만 보이게 하기-->
           	<li><a href="wishlist.html">찜목록
           	<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
           	</a></li>
           </c:if>

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
    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>Q & A</h1>
        </div>
      </div>
	  <section id="course-details" class="course-details">
	   <div class="container" data-aos="fade-up">
         <div class="button_group">
            <button
                  class="btn btn-outline-dark btn-sm dropdown-toggle mb-1 mx-md-0"
                  type="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  style="float: left"
                >
                  페이지당 게시글 수
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="qa?pageSize=1">1</a></li>
                  <li><a class="dropdown-item" href="qa?pageSize=5">5</a></li>
                  <li><a class="dropdown-item" href="qa?pageSize=10">10</a></li>
                  <li><a class="dropdown-item" href="qa?pageSize=15">15</a></li>
                </ul>

              <c:if test="${not empty m}">
              <a
                type="submit"
                class="btn btn-dark btn-sm mb-1"
                style="float: right"
                href="qaCreate"
              >
                글쓰기
              </a>
            </c:if>
          </div>
          <table class="table table-hover" style="text-align: center">
            <thead>
              <tr>
                <th class="col-sm-2">글번호</th>
                <th class="col-sm-6">제목</th>
                <th scope="col-sm-4">작성자</th>
                <th scope="col-sm-2">조회수</th>
                <th scope="col-sm-2">작성일</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="list" varStatus="status">
            		<c:choose>
		            	<c:when test="${list.qpwd eq null}">
		            		<tr>
				                <th scope="row">${list.qseq }</th>
				                <td><a href="qaContent?qseq=${list.qseq}&page=${cri.page}&pageSize=${cri.pageSize}">${list.qtitle }</a></td>
				                <td>${nameList[status.index].mname}</td>
				                <td>${list.qcount }</td>
				                <td><fmt:formatDate value="${list.qdate }" pattern="yyyy-MM-dd (E) HH:mm" /></td>
				           </tr>
		            	</c:when>
	            	<c:otherwise>
	            	<c:choose>
						<c:when test="${m eq null}" >
							<c:set var="athur" value="2"/>
						</c:when>
						<c:otherwise>
							<c:set var="athur" value="${m.athur}"/>
						</c:otherwise>
					</c:choose>
	            		<tr>
			                <th scope="row">${list.qseq }</th>
			                <td><a href="javascript:void(0)" onclick="location.href='javascript:secretQA(${status.index},${athur})'">비밀글입니다</a></td>
			                <td>${nameList[status.index].mname}</td>
			                <td>${list.qcount }</td>
			                <td><fmt:formatDate value="${list.qdate }" pattern="yyyy-MM-dd (E) HH:mm" /></td>
			           </tr>
	            	</c:otherwise>
              	</c:choose>	
            </c:forEach>  
             
            </tbody>
          </table>

          <div>
            <nav aria-label="Page navigation example">
                  <ul
                    id="paging"
                    class="pagination"
                    style="justify-content: center"
                  >
                  <c:if test="${pm.prev}">
                    <li class="page-item">
                      <a class="page-link" href="qa?page=${pm.startPage-1}&pageSize=${cri.pageSize}">처음</a>
                    </li>
                  </c:if>
                  <c:if test="${pm.prev}">
                    <li class="page-item">
                      <a class="page-link" href="qa?page=${cri.page-1}&pageSize=${cri.pageSize}">이전</a>
                    </li>
                  </c:if>
                  <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
                    <li class="page-item">
                      <a class="page-link" href="qa?page=${idx }&pageSize=${cri.pageSize}">${idx}</a>
                    </li> 
                  </c:forEach>
                  <c:if test="${pm.next && pm.endPage > 0}">
                    <li class="page-item">
                      <a class="page-link" href="qa?page=${cri.page+1}&pageSize=${cri.pageSize}">다음</a>
                    </li>
                  </c:if>
                  <c:if test="${pm.next && pm.endPage > 0}">
                    <li class="page-item">
                      <a class="page-link" href="qa?page=${pm.endPage}&pageSize=${cri.pageSize}">끝</a>
                    </li>
                  </c:if>
                  </ul>
                </nav>
          </div>
        </div>
		</div>
      </section>
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
