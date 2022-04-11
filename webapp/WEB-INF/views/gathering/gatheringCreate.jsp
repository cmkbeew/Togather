<%@ page contentType="text/html;charset=utf-8" session="true" %>
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
  <!-- alert -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <!-- alert -->
  <script type="text/javascript" language="javascript"
          src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet" />
  <script>
    window.onload = function() {
      today = new Date();
      console.log("today.toISOString() >>>" + today.toISOString());
      today = today.toISOString().slice(0, 10);
      console.log("today >>>> " + today);
      bir = document.getElementById("now_date");
      bir.value = today;
      bir.min= bir.value;

      document.getElementById('time').value = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(11, 16);
      console.log(new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString());
    }

    function Check(){
      today = new Date();
      today = today.toISOString().slice(0, 10);
      bir = document.getElementById("now_date");
      var mindate = bir.min;//여기까지 현재날짜

      var nowTime = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString();
      var nowDateCheck= document.getElementById('now_date').value;
      var nowTimeCheck=nowDateCheck;
      nowTimeCheck+="T";
      nowTimeCheck+= document.getElementById('time').value;
      //var nowTimeCheck = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 11);

      console.log("nowTime: "+nowTime);
      console.log("nowTimeCheck: "+nowTimeCheck);

      if(bir.value<today){
        Swal.fire({
          title:"날짜는 오늘 이후로만 가능합니다.",
          icon:"error"
        });
        return false;
      }else if(nowTimeCheck<nowTime){
        Swal.fire({
          title:"시간은 현재시간 이후로만 가능합니다.",
          icon:"error"
        });
        return false;
      }else if($('#ga_name').val()=="" || $('#time').val()=="" || $('#placeParent').val()=="" || $('#now_date').val()=="" || $('#price').val()=="" || $('#ga_limit').val()==""){
        Swal.fire({
          title:"모든 항목을 입력해주세요.",
          icon:"error"
        });
        return false;
      }else{
        f.submit();
      }

    }
  </script>

</head>

<body>
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
        <li><a href="../groupTab/myGroup.do?mnum=${m.mnum }">나의 모임</a></li>
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
            <li><a href="../notification/notice">공지사항</a></li>
            <li><a href="../faq/listPage">자주묻는 질문</a></li>
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
        <a href="../member/joinform.do" class="get-started-btn">회원가입</a>
      </c:when>
      <c:otherwise>
        <a href="../groupTab/groupCreate.do" class="get-started-btn">모임만들기</a>
      </c:otherwise>
    </c:choose>
  </div>
</header>
<!-- End Header -->
<main id="main">
  <!-- ======= Breadcrumbs ======= -->
  <div class="breadcrumbs" data-aos="fade-in">
    <div class="container">
      <h1>정모 만들기</h1>
    </div>
  </div>

  <section class="d-flex justify-content-center align-items-center">
    <div class="container py-5 h-100" data-aos="zoom-in">
      <div
              class="row d-flex justify-content-center align-items-center h-75"
              style="text-align: center"
      >
        <!--정모이름, 정모날짜, 정모장소, 정모시간, 회비, 정원-->
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <form name="f" action="gatheringCreate.do?gseq=${groupInfo.gseq}&mnum=${m.mnum}" method="post">
            <div class="form-outline mb-4">
              <input
                      id="ga_name"
                      type="text"
                      name="ga_name"
                      class="form-control form-control-lg"
                      placeholder="정모이름"

              />
            </div>
            <div class="form-outline mb-4">
              <input
                      id="placeParent"
                      type="text"
                      name="ga_place"
                      class="form-control form-control-lg"
                      placeholder="장소"

              /><button  style='float: right;' id='searchButton' type='button' class='btn btn-success' onclick='searchMap()'>장소 검색하기</button>

            </div>
            <div class="form-outline mb-4">
              <input
                      id="time"
                      type="time"
                      name="time"
                      class="form-control form-control-lg"
                      placeholder="시간"

              />
            </div>
            <div class="form-outline mb-4">
              <input
                      id="now_date"
                      type="date"
                      name="ga_date"
                      class="form-control form-control-lg"
                      placeholder="날짜"
                      max="2022-12-31"

              />
            </div>
            <div class="form-outline mb-4">
              <input
                      id="price"
                      type="text"
                      name="price"
                      class="form-control form-control-lg"
                      placeholder="회비"

              />
            </div>
            <div class="form-outline mb-4">
              <input
                      id="ga_limit"
                      type="number"
                      name="ga_limit"
                      class="form-control form-control-lg"
                      min="2"
                      max="20"
                      placeholder="정원(2~20명)"

              />
            </div>

            <button class="btn btn-success" type="button" onclick="Check()">만들기</button>
            <button class="btn btn-secondary">취소</button>
          </form>
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
<input type="hidden" id="latitude2" name="latitude" value="">
<input type="hidden" id="longitude2" name="longitude" value="">
<input type="hidden" id="place" name="longitude" value="">
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11400a9267d93835389eb9255fcaad0b&libraries=services"></script>
<script>
  function searchMap(){
    navigator.geolocation.getCurrentPosition(function(pos) {
      var latitude = pos.coords.latitude;
      var longitude = pos.coords.longitude;
      $('#latitude2').val(latitude);
      $('#longitude2').val(longitude);
      //alert("현재 위치는 : " + latitude + ", "+ longitude);
      console.log("1: "+$('#latitude2').val());
      getAddr($('#latitude2').val(),$('#longitude2').val());
    });

    /*let lat = 33.450701;
    let lng = 126.570667;
    getAddr(lat,lng);*/
    function getAddr(lat,lng){
      console.log("2: "+$('#latitude2').val());
      let geocoder = new kakao.maps.services.Geocoder();

      let coord = new kakao.maps.LatLng(lat, lng);
      let callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          console.log("result[0]: ",result);
          console.log("result[0].address.address_name: ",result[0].address.address_name);
          $('#place').val(result[0].address.region_3depth_name);
          let place=$('#place').val();
          console.log("place: "+place);

          window.name="parentForm";
          openWin = window.open(
                  "gatheringSearchMap.do?place="+place, "gatheringSearchMap",
                  "width=1000, height=530, top=100, left=100");
        }
      };

      geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
    }


  }
</script>
</body>
</html>

