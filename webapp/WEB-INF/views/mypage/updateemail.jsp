<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*, team1.togather.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Pricing - Mentor Bootstrap Template</title>
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
	<!-- alert  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- alert -->
    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />

    <!-- =======================================================
  * Template Name: Mentor - v4.7.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
   <script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
    	$("#checkbutton").on("click",function(){
    		var emailcheck = $("#emailcheck").val();
			emailcheck.trim();
			let check = /\S+@\S+\.\S+/;
			if(emailcheck != null){
				if (!check.test(emailcheck)) {
					Swal.fire({
						title:"이메일을 제대로된 형식으로 입력해주세요.",
						icon:"warnig"
						});
					$("#emailcheck").val("");
					return false;
				}
			}
    		$.ajax({
    			url: "../mypage/emailcheck.json",
				type: "Post",
				data: $('#checkform').serialize(),
				success: function(data){
					console.log(data);
					
					if(data == 1){
						var emailcheck = $("emailcheck").val();
						Swal.fire({
							title:"이미 존재하는 이메일입니다.",
							icon:"warning"
							})
						return false
					}else{
						var emailcheck = $("emailcheck").val();
						Swal.fire({
							title:"사용 가능한 이메일 입니다..",
							icon:"success"
							});
					}
				}
    		});
    	});
	});
	
	 $(function(){
	    	$("#updatebutton").on("click",function(){
	    		var emailcheck = $("#emailcheck").val();
	    		var email = $('#email').val();
	    		emailcheck.trim();
	    		if(email==emailcheck){
						Swal.fire({
							title:"다른 이메일을 입력해주세요.",
							icon:"warnig"
							});
						$("#emailcheck").focus();
						return false;
	    		}
				let check = /\S+@\S+\.\S+/;
				if(emailcheck != null){
					if (!check.test(emailcheck)) {
						Swal.fire({
							title:"이메일을 제대로된 형식으로 입력해주세요.",
							icon:"warnig"
							});
						$("#emailcheck").val("");
						return false;
					}
				}
	    		Swal.fire({
					title:"수정 성공",
					icon:"success",
					 confirmButtonColor: '#3085d6',
			         cancelButtonColor: '#d33',
			         confirmButtonText: 'oK'
					}).then((result) => {
			           if (result.isConfirmed) {
			        	   var emailcheck = $("#emailcheck").val();
			        	   var mnum=${m.mnum};
			        	   var result={"mnum":mnum,"email":emailcheck};
			        	   $.ajax({
			       			url: "../mypage/updateemail.json",
			   				type: "POST",
			   				data: result,
			   				success: function(data){
			   					
			   					console.log(data);			   					
			   						opener.location.reload();
					       			window.close();
			   					
				   						}
				   					});
					             }
			           		});
			         });
	    	});
	 
  </script>
  </head>

  <body>

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs mt-0" data-aos="fade-in" >
        <div class="container">
          <h1>이메일 수정</h1>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Pricing Section ======= -->
      <section
        class="vh-100"
        style="background-color: #eee; box-sizing: content-box"
      >
        <div class="container h-100" data-aos="flip-down">
          <div
            class="row d-flex justify-content-center align-items-center "
          >
            <div class="col-lg-12 col-xl-11">
              <div class="card text-black" style="border-radius: 25px">
                <div class="card-body p-md-5">
                  <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                      <!--거주지/관심지역/이름/생년월일/비번/비번확인/전화번호/성별-->
                      <form class="mx-1 mx-md-4" action="../mypage/updateemail?mnum=${m.mnum}" id= "checkform" name="checkform" method="post" >
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >현재 이메일</label
                            >
                            <input
                              type="text"
                              name="btitle"
                              id="email"
                              class="form-control"
                              value = "${member.email}"
                              readonly
                            />
                          </div>
                        </div>
					
						<div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >변경할 이메일 입력 
                              </label
                            >
                             <div class="input-group">
                            	<input                            
	                              type="text"
	                              name="email"
	                              id="emailcheck"	                            
	                              class="form-control"
	                              value=""
	                                                                                      
                           	 >
                           	 <span class="input-group-btn">
							<button class="btn btn-secondary" name="checkbutton" id = "checkbutton" type="button">중복확인</button>
	   					   </span>
	    				  </div>
                          </div>
                        </div>

                       				

                        <div
                          class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                        >
                          <button
                            type="button"
                            id = "updatebutton"
                            name = "updatebutton"
                            
                            class="btn btn-success"
                            style="margin-right: 30px"
                          >
                            	변경
                          </button>
                          <button type="button" class="btn btn-secondary" onclick="window.close()">
                            	취소
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Pricing Section -->
    </main>
   
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
