<%@ page contentType="text/html;charset=utf-8" session="true" %>
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
      href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />

    <!-- =======================================================
  * Template Name: Mentor - v4.7.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/table/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="/table/vendor/bootstrap/css/bootstrap.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="/table/fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="/table/vendor/animate/animate.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="/table/vendor/select2/select2.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="/table/vendor/perfect-scrollbar/perfect-scrollbar.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/table/css/util.css" />
    <link rel="stylesheet" type="text/css" href="/table/css/main.css" />
  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="index.html">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="index.html">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="myGroup.html">나의 모임</a></li>
            <!--로그인시에만 보이게 하기-->
            <li><a href="boardMain.html">게시판</a></li>
            <li>
              <a href="wishlist.html"
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
                <li><a href="QA.html">Q&A</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>
            </li>
            <li><a href="login.html">로그인</a></li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->

        <!--로그인전에는 회원가입만 보이고 로그인하면 모임만들기만 보이게 하는건 어떤지??-->
        <a href="join.html" class="get-started-btn">회원가입</a>
        <a href="groupCreate.html" class="get-started-btn">모임만들기</a>
      </div>
    </header>
    <!-- End Header -->

    <main id="main" data-aos="fade-in">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs">
        <div class="container">
          <h2>공지사항</h2>
          <p>공지사항 설명</p>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Trainers Section ======= -->
      
	  <section id="trainers" class="trainers" style="padding-top: 0">
        <div class="table">
          <div class="container-table100">
            <div class="wrap-table100">
              <div class="table100">
					 
                <table class="table">
						<head>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%">${noticeContent.ntitle}</th>
                            </tr>
                        </head>
					<body>
						<tr>
							<td>작성일</td>
							<td>${noticeContent.rdate}</td>						
						</tr>
						<tr>
							 <td>글쓴이</td>
                              <td>${noticeContent.mname} <span style='float:right'>조회수 : ${noticeContent.nview}</span></td>					
						</tr> 
						 <tr>
                              <td colspan="2" align="center">
                                 <p>
								${noticeContent.ncontent}
								 </p>
                       
                              </td>
                          </tr>               
					</body>
				</table>
				
				<c:if test = "${ m.mname eq noticeContent.getMname() }">
						 <a 
	                    type="submit"
	                    class="btn btn-dark btn-sm mb-1"
	                    style="float: right"
	                    href="noticeUpdate?nseq=${noticeContent.nseq }"
	                   >
	                 	   수정
						</a>
						 <a 
	                    type="submit"
	                    class="btn btn-dark btn-sm mb-1"
	                    style="float: right"
	                    href="noticeDelete?nseq=${noticeContent.nseq }"                   
	                   >
	                 	   삭제
						</a>
				</c:if>
						 <a 
	                    type="submit"
	                    class="btn btn-dark btn-sm mb-1"
	                    style="float: center"
	                    href="notice"
	                   >
	                 	   목록
						</a>

              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Trainers Section -->
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
