<%@ page  contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Setup - Corporate Category Bootstrap Responsive Web Template - Blog Single : W3Layouts</title>
	<!-- google-fonts -->
    <link href="http://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&amp;display=swap" rel="stylesheet">
    <!-- //google-fonts -->
    <!-- Font-Awesome-Icons-CSS -->
    <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
    <!-- Template CSS Style link -->
    <link rel="stylesheet" href="/assets/css/style-liberty.css">
	<!-- alert  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- alert -->
    <script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
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
    
    function previousPost(athur){
    	console.log(athur);
		var qseq = ${qanda.qseq};
		console.log(qseq);
		var athur = athur;
		var result = {"athur":athur,"qseq":qseq};
		$(function(){
			$.ajax({
					url: "qaPreviousPostCheck.json",
					type: "POST",
					data: result,
					success: function(data){
						console.log(data);
						var PreviousQseq =data;
						
						if($.isNumeric(data)){
   							location.href="qaContent?qseq="+PreviousQseq+"&page=${page}&pageSize=${pageSize}";
						}else{
							Swal.fire({
								title:"이전 글이 없습니다",
								icon:"warning"
								});
						}
					}
				});  
			});			
	}
    
    function nextPost(athur){
			var qseq = ${qanda.qseq};
			var athur = athur;
			var result = {"athur":athur,"qseq":qseq};
			$(function(){
				$.ajax({
   					url: "qaNextPostCheck.json",
   					type: "POST",
   					data: result,
   					success: function(data){
   						console.log(data);
   						var nextQseq =data;
   						if($.isNumeric(data)){
	   							location.href="qaContent?qseq="+nextQseq+"&page=${page}&pageSize=${pageSize}";
	   						
   						}else if(jQuery.isEmptyObject(data)){
   							Swal.fire({
   								title:"마지막 글입니다",
   								icon:"warning"
   								});
   						}
   					}
   				});  
   			});	
	}
    	function updateCheck(mnumCheck){
    		var mnum = mnumCheck;
  			var qseq = ${qanda.qseq};
  			var result = {"mnum":mnum,"qseq":qseq};
  			var athur = ${m.athur}
	   			$(function(){
    				$.ajax({
	   					url: "qaUpdateCheck.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(athur==0){
	   							upDate();
	   						}else{
		   						if(data==0){//없을때
		   							Swal.fire({
		   								title:"본인만 수정가능합니다",
		   								icon:"warning"
		   								});
		   						}else {
		   							upDate();
		   						}
	   						}
	   					}
	   				});  
	   			});
    	}
    	
    	function deleteCheck(mnumCheck){
    		var mnum = mnumCheck;
  			var qseq = ${qanda.qseq};
  			var result = {"mnum":mnum,"qseq":qseq};
  			var athur = ${m.athur}
	   			$(function(){
    				$.ajax({
	   					url: "qaUpdateCheck.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(athur==0){
	   							qaDelete();
	   						}else{
		   						if(data==0){//없을때
		   							Swal.fire({
		   								title:"본인만 삭제가능합니다",
		   								icon:"warning"
		   								});
		   						}else {
		   							qaDelete();
		   						}
	   						}
	   					}
	   				});  
	   			});
    	}
    	
    	function upDate(){
    		location="qaUpDate?qseq=${qanda.qseq}";
    	}
    	function qaDelete(){
    		location="qaDelete?qseq=${qanda.qseq}";
    	}
		
    	function comment2(i,index,mnumCheck,athur){
    		var num=index;
    		var mnum= mnumCheck;
    		var athur = athur;
    		var liUp="liup";
    		liUp+=index;
    		var liDown="lidown";
    		liDown+=index;
    		$(function(){
    			$('#comment').remove();
    			$('#'+liDown).remove();
    			var li="";
    			li+="<li id='"+liDown+"'>";
    			li+="<a href='javascript:void(0)' onclick=\"location.href='javascript:comment(1,"+num+","+mnum+","+athur+")'\"><i class='fa fa-reply mr-1' aria-hidden='true'></i>Reply</a>";
    			li+="</li>";
    			$('#'+liUp).after(                     
                       li              		
        		);
    		});

    	}
    	
    	function comment(i,index,mnumCheck,athur){
    		//var arr = new Array();
    		//<c:forEach var="qaReply" items="${qaReply}">	              
	       // 	arr.push({qarDate:"${qaReply.qardate}"});
        	//</c:forEach>
        	//console.log(arr);
        	//console.log(arr[index].qarDate);
        	var num=index;
        	var liUp="liup";
    		liUp+=index;
    		var liDown="lidown";
    		liDown+=index;
    		var mnum= mnumCheck;
    		var qamnum=${qanda.mnum};
    		var athur = athur;
    		if(athur == 0 ||mnum==qamnum){
    			$('#comment').remove();
    			if(i==1){
    	    		$(function(){
    	    			$('#'+liDown).remove();
    	    			var li="";
    	    			li+="<li id='"+liDown+"'>";
    	    			li+="<a href='javascript:void(0)' onclick=\"location.href='javascript:comment2(0,"+num+","+mnum+","+athur+")'\"><i class='fa fa-reply mr-1' aria-hidden='true'></i>Reply</a>";
    	    			li+="</li>";
    	    			$('#'+liUp).after(                     
    	                    li              		
    	    			);
    					$('#divtest2').append(
    						"<div class='leave-comment-form' id='comment'> "
    						+"<h3 class='aside-title'>Leave a reply</h3>"
    						+ "<form action='qaReply?&mnum=${m.mnum}&qseq=${qanda.qseq}&mname=${m.mname}' method='post'>"
    						+ "<div class='input-grids'>"
    						+ "<div class='form-group'>"
    						+ "<input type='text' name='mname' class='form-control'  value='${m.mname}' required disabled>"
    						+ "</div>"
    						+ "<div class='form-group'>"
    						+"<textarea name='qarcontent' class='form-control' placeholder='Your Comment' required></textarea>"
    						+"</div>"
    						+"</div>"
    						+"<div class='text-right mt-4'>"
    						+"<button class='btn button-style'>Post Comment</button>"
    						+"</div>"
    						+"</form>"
    						+"</div>"
    					);
    					});
    	    		}else{
    	    			$('#comment').remove();
    	    		}
    		}else{
    			if(mnum!=qamnum){
        			Swal.fire({
    						title:"글쓴이만 가능합니다",
    						icon:"warning"
    						});
        			return false;
        		}
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
            <li><a href="groupTab/myGroup.do?mnum=${m.mnum }">나의 모임</a></li>
            <!--로그인시에만 보이게 하기-->
            <li><a href="board/listPage">게시판</a></li>
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
	  <section class="text-11 py-5">
    <div class="text11 py-md-5 py-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 text11-content m-auto">
                    
                    <h4>${qanda.qtitle}</h4> 
                    <h6><span class="fa fa-user mr-1 icon-color"></span>${qanda.mnum}, ${qanda.qdate}</h6>
                    <a href="#post" class="post"></a>
                    <p class="mt-4 mb-3">${qanda.qcontent}</p>
                    

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
                    <c:choose>
						<c:when test="${m eq null}" >
							<c:set var="athur" value="2"/>
						</c:when>
						<c:otherwise>
							<c:set var="athur" value="${m.athur}"/>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${m eq null}" >
							<c:set var="mnum" value="0"/>
						</c:when>
						<c:otherwise>
							<c:set var="mnum" value="${m.mnum}"/>
						</c:otherwise>
					</c:choose>
	                    <div class="new-posts mt-5">
	                        <a class="prev-post pull-left" href="javascript:previousPost(${athur})"><span class="fa fa-arrow-left"
	                                aria-hidden="true"></span>
	                            Previous Post</a>
	                       <a href="javascript:void(0)" onclick="location.href='javascript:updateCheck(${mnum})'">수정</a>
	                       <a href="qa?page=${page}&pageSize=${pageSize}">목록</a>
	                       <a href="javascript:void(0)" onclick="location.href='javascript: deleteCheck(${mnum})'">삭제</a>
	                        <a class="next-post pull-right" href="javascript:nextPost(${athur})">Next Post <span class="fa fa-arrow-right"
	                                aria-hidden="true"></span></a>
	                    </div>
                    <div id="divtest2" class="comments mt-5">
                        <h3 class="aside-title ">Recent comments(${qreplyCount })</h3>
                        <div class="comments-grids">
                            <!-- 여기부터 루프 -->

<c:if test="${qaReply ne null }">
<c:forEach var="qaReply" items="${qaReply }" varStatus="index">
                            <div class="media-grid">
                                <div class="media">
                                    <a class="comment-img" href="javascript:void(0)"><img src="/assets/img/trainers/trainer-1.jpg"
                                            class="img-responsive" width="100px" alt="placeholder image"></a>
                                    <div id="replyDiv" class="media-body comments-grid-right">
                                        <h5>${qaReply.mname}</h5>
                                        <ul id="ul" class="p-0 comment">
                                            <li id="liup${index.index}">${qaReply.qardate}</li>                         
                                            	<li id="lidown${index.index}">
                                                <a  href="javascript:void(0)" onclick="location.href='javascript:comment(1,${index.index},${mnum},${athur})'"><i class="fa fa-reply mr-1" aria-hidden="true"></i>Reply</a>
                                                </li>              
                                        </ul>
                                        <p>${qaReply.qarcontent }</p>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
</c:if>
					</div>
                </div>
                    <c:if test="${m.athur eq 0}">
                    
	                    <div class="leave-comment-form" id="comment">
	                        <h3 class="aside-title">Leave a reply</h3>
	                        <form action="/admin/qaReply?&mnum=${m.mnum}&qseq=${qanda.qseq}&mname=${m.mname}" method="post">
	                            <div class="input-grids">
	                                <div class="form-group">
	                                    <input type="text" name="Name" class="form-control"  value="${m.mname}" required disabled>
	                                </div>
	                                <div class="form-group">
	                                    <textarea name="qarcontent" class="form-control" placeholder="Your Comment" required></textarea>
	                                </div>
	                            </div>
	                            <div class="text-right mt-4">
	                                <button class="btn button-style">Post Comment</button>
	                            </div>
	                            </form> 
	                        </div>                          
	                  </c:if>          
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
