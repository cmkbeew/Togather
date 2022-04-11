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
    <!-- alert  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" language="javascript"
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <style type="text/css">
   .swal-footer{
      text-align:center;
   }
   </style>
    <script>
	
	 	function uploadCheck(){
            var form = $("#uploadPhoto")[0];
            var formData = new FormData(form);
	 	    $.ajax({
	 	        processData: false,
				url: "galleryUpload.json",
				type: "POST",
			    contentType: false,
				data: formData,
				success: function(data){
					console.log(data);
					swal({
						  title: "업로드 성공!",
						  icon: "success",
						  button: {
							  text:"확인",
							  value:true
							  },
						  closeOnClickOutside : false
						}).then((result)=>{
							if(result){
								opener.location.reload();
								window.close();
							}
						});
					
				},
		 	   	error:function(error){
					console.log("##error: "+error); 
				}
			}); 
	 	}
	</script>

</head>

<body   >
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs mt-0" data-aos="fade-in">
        <div class="container">
            <h1>사진 올리기</h1>
        </div>
    </div>

    <section
            class="h-100"
            style="background-color: #eee; box-sizing: content-box"
    >
        <div class="container h-100" data-aos="flip-down">
            <div
                    class="row d-flex justify-content-center align-items-center h-100"
            >
                <div class="col-lg-12 col-xl-11">
                    <div class="card text-black" style="border-radius: 25px">
                        <div class="card-body p-md-5">
                            <div class="row justify-content-center">
                                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                    <!--모임지역/이름/모임소개/관심사/정원/모임사진-->
                                    <form name="f" class="mx-1 mx-md-4" method="post" id="uploadPhoto" action="galleryUpload?mnum=${m.mnum}&gseq=${galleryUpload.gseq}&mname=${m.mname}" enctype="multipart/form-data">
                                        <!-- 파일 업로드 폼 -->
                                        <div class="d-flex flex-row align-items-center mb-0">
                                            <div class="form-outline flex-fill mb-2">
                                            <input type="hidden" value="${m.mnum}" name="mnum" />
                                            <input type="hidden" value="${galleryUpload.gseq}" name="gseq" />
                                            <input type="hidden" value="${m.mname}" name="mname" />
                                            
                                                <label class="form-label mb-0" for="form3Example1c"
                                                >사진 선택</label
                                                >
                                                <input
                                                        type="file"
                                                        id="form3Example1c"
                                                        class="form-control"
                                                        name="uploadFile"
                                                        required
                                                />
                                            </div>
                                        </div>
                                        <!-- 버튼부 -->
                                        <div
                                                class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                                        >
                                            <button
                                                    type="button"
                                                    class="btn btn-success"
                                                    style="margin-right: 30px"
                                                    onclick="javascript:uploadCheck()"
                                            >
                                                올리기
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
</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">

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
