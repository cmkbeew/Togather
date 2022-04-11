<%@ page contentType="text/html;charset=utf-8" session="false" %>
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
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
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
      href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />
  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="index.html">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

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

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>모임 이름</h1>
          <p>모임 소개? or 지역?</p>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Cource Details Section ======= -->

      <section id="course-details" class="course-details">
        <div class="container" data-aos="fade-up">
          <ul class="nav nav-tabs mb-3">
            <li class="nav-item">
              <a class="nav-link" href="groupInfo.do?gseq=${groupInfo.gseq}">정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">사진첩</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">게시판</a>
            </li>
          </ul>
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
              <li><a class="dropdown-item" href="board.do?ps=5">5</a></li>
              <li><a class="dropdown-item" href="board.do?ps=10">10</a></li>
              <li><a class="dropdown-item" href="board.do?ps=15">15</a></li>
            </ul>

            <c:if test="${not empty userphone}">
              <a
                type="submit"
                class="btn btn-dark btn-sm mb-1"
                style="float: right"
                href="board.do?m=input"
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
            <c:forEach items="boardList" var="groupBoard">
              <tr>
                <th scope="row">${groupBoard.gbnum}</th>
                <td><a href="/groupBoard/read?gbnum=${groupboard.gbnum}">${groupBoard.gbtitle}</a></td>
                <td>${groupBoard.mname}</td>
                <td><span class="badge bg-red">${groupBoard.gbview}</td>
                <td><fmt:formatDate value="${groupBoard.rdate}" pattern="yyyy-MM-dd (E) HH:mm" /></td>
              </tr>
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
                <li class="page-item">
                  <a class="page-link" href="#">Previous</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">Next</a>
                </li>
              </ul>
            </nav>
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
    <script src="assets/vendor/purecounter/purecounter.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
  </body>
</html>
