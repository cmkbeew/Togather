<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*, team1.togather.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 	<script src="http://code.jquery.com/jquery-latest.js"></script>  
  	<script type="text/javascript">
  		$(document).on("click","#postComment" ,function(){
  			var outerform = document.getElementById('div#outerreplyform');
  			var data = JSON.stringify({
  					content:$("#content").val(),
  					mnum:"${m.mnum}",
  					mname:"${m.mname}",
  					bnum:"${bnum}"
  			});
  			$.ajax({
  				url:"/board/addReply",
  				type:"POST",
  				dataType:"json",
  				contentType: "application/json",
  				data: data,
  				success: function(result){
  					console.log("1postcomment success");
  					var divlen = $("#outerreplyform #middleform").length;
  					if(divlen!=0){
	  					for(var t=0;t<divlen;t++){
	  						console.log("44middle div길이: "+divlen);
	  						$("#outerreplyform #middleform").empty(); 
	  					}
	  				}
  					
  					$(result).each(function(){
  						
  						if(this.content==null){
  							console.log("contentnull");
  							this.content=" ";
  						} 
  						$("#outerreplyform").append(
  								"<div id=\"middleform\" class=\"media-grid\">"
  								+"<div class=\"media\">"
  								+"<a class=\"comment-img\" href=\"#url\"><img src=\"/assets/images/team1.jpg\""
  								+" class=\"img-responsive\" width=\"100px\" alt=\"placeholder image\"></a>"
  								+"<div id=\"innerreplyform\" class=\"media-body comments-grid-right\">"
  		  						+"<h5>"+this.mname+"</h5>"
  		  						+"<ul class=\"p-0 comment\">"
  		  							+"<li>"+this.rdate+"</li>"
  		  							+"<li onclick=\"setR_like(this)\"><p>"+this.r_like+"</p><a><i class=\"bi bi-hand-thumbs-up\" aria-hidden=\"true\"></i>좋아요</a>"
  		  							+"<div class=\"hiddenrseq\" style=\"display:none\">"+this.rseq+"</div><li></ul>"
  		  						+"<p>"+this.content+"</p>"
  		  						+"</div></div></div>" 
  		  					);
  						$("#content").val("");
  						var totalreply = result.length;
   						document.getElementById('commentsNum').innerHTML = "Recent Comments("+totalreply+")";
  						
  					})
  				},
  				error: function(error){
  					console.log("##postComment error");
  				}
  				
  			});
  		});
  	</script>
 	<script>
 	function setR_like(e){
 		var data = JSON.stringify({
 			rseq: $(e).find('div').text(),
 			mnum:"${m.mnum}"
 		})
		$.ajax({
			url:"/board/setR_like",
			type:"POST",
			dataType:"json",
			contentType: "application/json",
			data : data,
			success: function(result){
				console.log("##success: "+result); 
				$(e).find('p').text(result);
  			},
  			error: function(error){
  				console.log("##error: "+error); 
  			}
  		});
  	}
 	
 	</script>
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
            <li><a href="myGroup.html">나의 모임</a></li><!--로그인시에만 보이게 하기-->
            <li><a href="boardMain.html">게시판</a></li>
            <li><a href="wishlist.html">찜목록
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>

            </a></li>
            

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

<section class="text-11 py-5">
    <div class="text11 py-md-5 py-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 text11-content m-auto">
                    
                    <h4>${board.btitle}</h4> 
                    <h6><span class="fa fa-user mr-1 icon-color"></span>${board.mname}, ${board.rdate}</h6>
                    <a href="#post" class="post">${board.bcategory}</a>
                    <p class="mt-4 mb-3">${board.bcontent}</p>
                    

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
                       <a href="boardUpdate?bnum=${bnum }">수정</a>
                       <a href="listPage?page=${page }&pageSize=${pageSize}">목록</a>
                       <a href="boardDelete?bnum=${bnum }">삭제</a>
                        <a class="next-post pull-right" href="#next">Next Post <span class="fa fa-arrow-right"
                                aria-hidden="true"></span></a>
                    </div>
                    <div id="outerreplyform" class="comments mt-5">
                        <h3 id="commentsNum" class="aside-title ">Recent comments(${totalReply })</h3>
                        <div class="comments-grids">
                            <!-- 여기부터 루프 -->
<c:if test="${not empty reply }">
<c:forEach var="replyList" items="${reply }">
							<div  >
                            <div id="middleform" class="media-grid">
                                <div class="media">
                                    <a class="comment-img" href="#url"><img src="/assets/images/team1.jpg"
                                            class="img-responsive" width="100px" alt="placeholder image"></a>
                                    <div id="innerreplyform" class="media-body comments-grid-right">
                                        <h5>${replyList.mname }</h5>
                                        <ul class="p-0 comment">
                                            <li class="">${replyList.rdate }</li>
                                            <c:if test="${m ne null }">
                                            <li onclick="setR_like(this)">
                                            	<p>${replyList.r_like}</p> 
                                                <a > 좋아요<i class="bi bi-hand-thumbs-up"
                                                        aria-hidden="true"></i> </a>
                                                
                                                <div class="hiddenrseq" style="display:none">${replyList.rseq }</div>
                                            </li> 
                                            </c:if>
                                            <c:if test="${m eq null }">
                                            <li>
                                            	<p>${replyList.r_like}</p> 
                                                <a > 좋아요<i class="bi bi-hand-thumbs-up"
                                                        aria-hidden="true"></i></a>
                                                
                                                <div class="hiddenrseq" style="display:none">${replyList.rseq }</div>
                                            </li>
                                            </c:if>
                                        </ul>
                                        <p>${replyList.content }</p>

                                    </div> 
                                </div>
                            </div>
                            </div>
</c:forEach>
</c:if>
                        </div>
                    </div>
                    <div class="leave-comment-form" id="comment">
                        <h3 class="aside-title">Leave a reply</h3>
                       	 <c:if test="${m ne null}">
                            <div class="input-grids">
                                <div class="form-group">
                                    <textarea id="content" name="content" class="form-control" placeholder="Your Comment"
                                        required></textarea>
                                </div>
                            </div>
                            <div class="text-right mt-4">
                                <button id="postComment"  class="btn button-style">Post Comment</button>
                            </div>
                         </c:if>
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
