<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    
    <script type="text/javascript" language="javascript" 
		    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

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

    <!-- Template Main CSS File -->

    <link href="/assets/css/style.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Setup - Corporate Category Bootstrap Responsive Web Template - Blog Single : W3Layouts</title>
    <!-- google-fonts -->
    <link href="http://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&amp;display=swap" rel="stylesheet">
    <!-- //google-fonts -->
    <!-- Font-Awesome-Icons-CSS -->
    <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
    <!-- Template CSS Style link -->
    <link rel="stylesheet" href="/assets/css/style-liberty.css">

    <!-- =======================================================
  * Template Name: Mentor - v4.7.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="/index.html">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="/index.html">Home</a></li>
            <li><a href="/about.html">About</a></li>
            <li><a href="/myGroup.html">나의 모임</a></li><!--로그인시에만 보이게 하기-->
            <li><a href="/boardMain.html">게시판</a></li>
            <li><a href="/wishlist.html">찜목록
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>

            </a></li>
            

            <li class="dropdown">
              <a href="#"
                ><span>고객지원</span> <i class="bi bi-chevron-down"></i
              ></a>
              <ul>
                <li><a href="/notice.html">공지사항</a></li>
                <li><a href="/FAQ.html">자주묻는 질문</a></li>
                <li><a href="/QA.html">Q&A</a></li>
                <li><a href="/contact.html">Contact</a></li>
              </ul>
            </li>
            <li><a href="/login.html">로그인</a></li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>

        </nav>
        <!-- .navbar -->

        <!--로그인전에는 회원가입만 보이고 로그인하면 모임만들기만 보이게 하는건 어떤지??-->
        <a href="/join.html" class="get-started-btn">회원가입</a>
        <a href="/groupCreate.html" class="get-started-btn">모임만들기</a>
      </div>
    </header>
    
	

<section class="text-11 py-5">
    <div class="text11 py-md-5 py-4">
            <div class="row">
                <div class="col-lg-9 text11-content m-auto">
                    
                    <h4>${gboard.gbtitle}</h4>
                    <h6><span class="fa fa-user mr-1 icon-color"></span>${gboard.mname}, ${gboard.rdate}.</h6>
                    <a href="#post" class="post">조회수: ${gboard.gbview}</a>
                    <p class="mt-4 mb-3">${gboard.gbcontent}
                     </p>
                    <!--  <p class="mb-3">글내용2</p> -->
                    <hr width='600' size='2' color='gray' noshade>
						<font color='gray' size='4' face='휴먼편지체'>
							<a href='gbupdate.do?gbnum=${gboard.gbnum}'>수정</a>
							 &nbsp;&nbsp;| 
							<a href='gbdel.do?gbnum=${gboard.gbnum}'>삭제</a>
                    	</font>
					<hr width='600' size='2' color='gray' noshade>

                    <!--
                    글 공유 
                        <div class="social-share-blog mt-5 pb-4">
                        <ul class="column3 social m-0 p-0">
                            <li>
                                <p class="m-0 mr-4">Share this post :</p>
                            </li>
                            <li><a href="#facebook" class="facebook"><span class="fab fa-facebook-f"></span></a>
                            </li>
                            <li><a href="#twitter" class="twitter"><span class="fab fa-twitter"></span></a></li>
                            <li><a href="#instagram" class="instagram"><span class="fab fa-instagram"></span></a>
                            </li>
                            <li><a href="#linkedin" class="linkedin"><span class="fab fa-linkedin-in"></span></a>
                            </li>
                        </ul>
                    </div> -->
                    <div class="new-posts mt-5">
                        <a class="prev-post pull-left" href="#prev"><span class="fa fa-arrow-left"
                                aria-hidden="true"></span>
                            Previous Post</a>
                        <a class="next-post pull-right" href="#next">Next Post <span class="fa fa-arrow-right"
                                aria-hidden="true"></span></a>
                    </div>
                    <div class="comments mt-5">
                        <h3 class="aside-title ">Recent comments</h3>
  
				  <script language="javascript">
					   function check()
					   {
					       for(var i=0; i<document.input.elements.length; i++)
						   {
						      if(document.input.elements[i].value == "")
							  {
							     alert("모든 값을 입력 하셔야 합니다. ");
								 return false;
							  }
						   }
						   document.input.submit();
				       }
					</script>
				  
				  
                                	
                                    
                                	<c:forEach items="${gbrlist}" var="gbreply">
                           <c:if test="${gbrseq.gbrseq == gbreply.gbrseq}">
                           <div class="comments-grids">
                            <div class="media-grid">
                                    <a class="comment-img" href="#url"><img src="/assets/images/team1.jpg"
                                            class="img-responsive" width="100px" alt="placeholder image"></a>
                                    <div class="media-body comments-grid-right">
                                        <h5>${gbreply.mname}</h5>
					
                                        <ul class="p-0 comment">
                                            <li class="">${gbreply.rdate}</li>
                                            <li>
                                                <a href="#comment"><i class="fa fa-reply mr-1"
                                                        aria-hidden="true"></i>Reply</a>
                                            </li>
                                        </ul>
                                        <form name='input' method='post' action='gbrupdate.do?gbrseq=${gbreply.gbrseq}&gbnum=${gbreply.gbnum}'>
                                        <input type="hidden" name="gbrseq" value="${gbreply.gbrseq}">
                                        <table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>	
                                        <tr>
											<td align='center'>댓글을 수정해주세요</td>
											<td><input name='gbrcontent' value='${gbreply.gbrcontent}'/></td>
										</tr>
										<tr>
											 <td colspan='2' align='center'>
												<input type='submit' value='수정'>
											 </td>
										</tr>
										</table>
										<hr width="600" size="2" color="gray" noshade>
										</form>
                                        <!-- <p>${gbreply.gbrcontent}</p> -->
                                    </div>
                                  
						</c:if>
 				 </c:forEach>
							<div class="comments-grids">
                            <div class="media-grid">
                                	<c:forEach items="${gbrlist}" var="gbreply">
                                    <a class="comment-img" href="#url"><img src="/assets/images/team1.jpg"
                                            class="img-responsive" width="100px" alt="placeholder image"></a>
                                    <div class="media-body comments-grid-right">
                                        <h5>${gbreply.mname}</h5>
                                        
                                        
                                        
							
					
					
					
                                        <ul class="p-0 comment">
                                            <li class="">${gbreply.rdate}</li>
                                            <li>
                                                <a href="#comment"><i class="fa fa-reply mr-1"
                                                        aria-hidden="true"></i>Reply</a>
                                            </li>
                                        </ul>
                                        <p>${gbreply.gbrcontent}</p>
                                    </div>
                                    </c:forEach>
					
                            <div class="media-grid">
                                <div class="media">
                                    <a class="comment-img" href="#url"><img src="/assets/images/team2.jpg"
                                            class="img-responsive" width="100px" alt="placeholder image"></a>
                                    <div class="media-body comments-grid-right">
                                        <h5>Charlie</h5>
                                        <ul class="p-0 comment">
                                            <li class="">Jan 28th, 2021 at 05:45 pm </li>
                                            <li>
                                                <a href="#comment"><i class="fa fa-reply mr-1"
                                                        aria-hidden="true"></i>Reply</a>
                                            </li>
                                        </ul>
                                        <p>Mattis ut hendrerit non, facilisis eget mauris. Sed ultricies nec purus
                                            quis
                                            tempor. Phasellus eu nec purus quis tempor.
                                        </p>
                                        <div class="media mt-5 mb-0 px-0 pb-0 media-sub">
                                            <a class="comment-img" href="#url"><img src="/assets/images/team3.jpg"
                                                    class="img-responsive" width="100px"
                                                    alt="placeholder image"></a>
                                            <div class="media-body comments-grid-right">
                                                <h5>Jack Harry</h5>
                                                <ul class="p-0 comment">
                                                    <li class="">Jan 28th, 2021 at 11:00 am</li>
                                                    <li>
                                                        <a href="#comment"><i class="fa fa-reply mr-1"
                                                                aria-hidden="true"></i>Reply</a>
                                                    </li>
                                                </ul>
                                                <p>Mattis ut hendrerit non, facilisis eget mauris. Sed ultricies nec
                                                    purus quis
                                                    tempor. dolor set.</p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="leave-comment-form" id="comment">
                        <h3 class="aside-title">Leave a reply</h3>
                        <form action="#" method="post">
                            <div class="input-grids">
                                <div class="form-group">
                                    <input type="text" name="Name" class="form-control" placeholder="Your Name"
                                        required="">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="Email" class="form-control" placeholder="Email"
                                        required="">
                                </div>
                                <div class="form-group">
                                    <textarea name="Comment" class="form-control" placeholder="Your Comment"
                                        required=""></textarea>
                                </div>
                            </div>
                            <div class="text-right mt-4">
                                <button class="btn button-style">Post Comment</a>
                            </div>
                        </form>
                    </div>
                </div>
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
              <i class="bx bx-chevron-right"></i> <a href="/index.html">Home</a>
            </li>
            <li>
              <i class="bx bx-chevron-right"></i> <a href="/about.html">About us</a>
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
              <i class="bx bx-chevron-right"></i> <a href="/notice.html">공지사항</a>
            </li>
            <li>
              <i class="bx bx-chevron-right"></i>
              <a href="/FAQ.html">자주 묻는 질문</a>
            </li>
            <li>
              <i class="bx bx-chevron-right"></i>
              <a href="/QA.html">Q & A</a>
            </li>
            <li>
              <i class="bx bx-chevron-right"></i> <a href="/contact.html">Contact</a>
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
</body>
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
</html>
