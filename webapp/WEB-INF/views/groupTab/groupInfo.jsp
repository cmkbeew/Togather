<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html >
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <!-- alert -->
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
    <script type="text/javascript">
    $(function(){
   		document.getElementById('my_btn').click();
   	});
    function endTimeGatheringCheck(EndCheck,noticeCheck){
    	if(EndCheck!=null && noticeCheck==0){
	    		$('#count').hide();
	        	var endDayCheck;
	        	var endTimeCheck; 
	        	
	        	var timeName;
	    		endDayCheck="${endTimeGathering.ga_date}";
	    		endTimeCheck="${endTimeGathering.time}";
	    		var dday = new Date(endDayCheck+" "+endTimeCheck).getTime();
	    		//setInterval(function() {
	       		var today = new Date().getTime();
	       		 var gap = dday - today;
	       			var day = Math.floor(gap / (1000 * 60 * 60 * 24));
	       		  if(0<=day && day<7){
		       		  var hour = Math.floor((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		       		  var min = Math.floor((gap % (1000 * 60 * 60)) / (1000 * 60));
		       		  var sec = Math.floor((gap % (1000 * 60)) / 1000);
		       		  document.getElementById("count").innerHTML = "${name}님의 모임(${gatheringName})이 D-DAY까지 " + day + "일 " + hour + "시간 " + min + "분 " + sec + "초 남았습니다.";
		       		  
		       		  $('#hiddenInput').val($('#count').text());
	       		  }	 
	       		//}, 1000);
	       		timeName+=$('#hiddenInput').val();
	       		if(0<=day && day<7){	
	       			var ga_seq=${notice.ga_seq};
	       			checkTime(ga_seq);
	       		}
    	}
	    
    }

    	
    function checkTime(ga_seq){
    	const Toast = Swal.mixin({
			  toast: true,
			  position: 'top-end',
			  showConfirmButton: true,
			  showCancelButton: true,
			  confirmButtonText : "알림 끄기",
			  timer: 3000,
			  timerProgressBar: true,
			  didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer);
			    toast.addEventListener('mouseleave', Swal.resumeTimer);
			  }
		})
		Toast.fire({
		  icon: 'success',
		  title: $('#hiddenInput').val()
		}).then((result) => {
		  if (result.isConfirmed) {//여기에 로직 메세지 이동하는
			  var mnum = ${m.mnum};
			  var result = {"ga_seq":ga_seq,"mnum":mnum};
				  $.ajax({
	   					url: "noticeChecked.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						console.log(data);
	   					}
				});

			  } else if (
			    result.dismiss === Swal.DismissReason.cancel
			  ) {//여기에 로직 알림끄는 

			  }	 
		})
    }
    
    function groupJoin(){
    	Swal.fire({
			  title: '모임에 가입 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
				console.log(result.isConfirmed);
			  if (result.isConfirmed) {
				var mnum = ${m.mnum};
	  			var gseq = ${groupInfo.gseq};
	  			var result = {"mnum":mnum,"gseq":gseq};
	  				$.ajax({
		   					url: "memInGroup.json",
		   					type: "POST",
		   					data: result,
		   					success: function(data){
		   						if(data==1){
		   							Swal.fire({
			  							  title: "모임 정원이 꽉 찼습니다",
			  							  icon: "error"
		   							});
		   						}else{
		   							location.reload();
		   						}	
		   					}
	  				});
			  }  			  
			});
    	}

    function groupQuit(){
        var mnum = ${m.mnum};
        var arr = new Array();
        <c:forEach var="memInGroupName" items="${memInGroupName}" varStatus="index">
        arr.push({gseq: "${groupInfo.gseq}", mnum: "${memInGroupName.MNUM}", grade: "${memInGroupName.GRADE}"});
        </c:forEach>

        if(mnum == arr[0].mnum){ //로그인 한 사람이 모임장인가? ( 모임장이 제일 위로 나오게 정렬함 => order by grade, mnum )
            grade = arr[0].grade;
        }else{ //운영진 or 일반회원
        }

        $(function(){
            $.ajax({
                url: "kingQuitCheck.json",
                type: "POST",
                data: {gseq: "${groupInfo.gseq}", mnum: "${m.mnum}", grade: "${grade}"},
                success: function(data){
                    if(data == 0){
                        Swal.fire({
                            title: '모임장이 탈퇴하면 맨 위의 멤버에게 모임장을 위임합니다.',
                            icon: 'question',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes'
                        }).then((result) => {
                            if(result.isConfirmed){
                                location="delegate.do?gseq=${groupInfo.gseq}&mnum=${m.mnum}&grade=${grade}";
                            }
                        })
                    }else{
                        Swal.fire({
                            title: '모임에서 탈퇴 하시겠습니까?',
                            icon: 'question',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                var mnum = ${m.mnum};
                                var gseq = ${groupInfo.gseq};
                                var result = {"mnum":mnum,"gseq":gseq};
                                $(function(){
                                    $.ajax({
                                        url: "groupQuit.json",
                                        type: "POST",
                                        data: result,
                                        success: function(data){
                                        }
                                    });
                                    location.reload();
                                });
                            }
                        });
                    }
                }
            })
        })
    }
    	
    	function groupDeleteCheck(){ 
            var mnum = ${m.mnum};
             var gseq = ${groupInfo.gseq};
             var result = {"mnum":mnum,"gseq":gseq};
                 $(function(){
                  $.ajax({
                       url: "groupDeletecheck.json",
                       type: "POST",
                       data: result,
                       success: function(data){
                          if(data==0){//모임장일때일때
                             Swal.fire({
                               title: '모임을 삭제 하시겠습니까?',
                               icon: 'question',
                               showCancelButton: true,
                               confirmButtonColor: '#3085d6',
                               cancelButtonColor: '#d33',
                               confirmButtonText: 'Yes'
                             }).then((result) => {
                                console.log(result.isConfirmed);
                               if (result.isConfirmed) {
                                   groupDelete();
                               }
                             });
                             console.log("check0: "+data);
                          }else{//모임장 아닐때
                             console.log("check1: "+data);
                             Swal.fire({
                                 title: "모임장만 삭제 가능합니다",
                                 icon: "error"
                             });
                          }
                       }
                    });  
                 });
         }
    	
    	function groupUpdateCheck(){ 
    		var mnum = ${m.mnum};
  			var gseq = ${groupInfo.gseq};
  			var result = {"mnum":mnum,"gseq":gseq};
	   			$(function(){
    				$.ajax({
	   					url: "groupUpdatecheck.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(data==0){//모임장일때일때
	   							groupUpdate();
	   							console.log("check0: "+data);
	   						}else if(data==1){//운영진일때
	   							groupUpdate();
	   							console.log("check1: "+data);
	   							//swal("모임장,운영자만 수정 가능합니다");
	   						}else if(data==2){//일반회원
	   							console.log("check2: "+data);
	   							Swal.fire({
		  							  title: "모임장,운영자만 수정 가능합니다",
		  							  icon: "error"
	   							});
	   						}else {//모임에없을때
	   							Swal.fire({
		  							  title: "모임장,운영자만 수정 가능합니다",
		  							  icon: "error"
	   							});
	   							console.log("check3: "+data);
	   						}
	   					}
	   				});  
	   			});
    	}
    	
    	function groupUpdate(){
    		location="groupUpdate.do?gseq=${groupInfo.gseq}";
    	}
    	
    	function groupDelete(){
    		location="groupDelete.do?gseq=${groupInfo.gseq}";
    	}

    function memberInfo(index){
        var arr = new Array();
        <c:forEach var="memInGroupName" items="${memInGroupName}" varStatus="index">
        arr.push({mnum: "${memInGroupName.MNUM}", mname: "${memInGroupName.MNAME}", birth: "${memInGroupName.BIRTH}", maddr: "${memInGroupName.MADDR}"});
        </c:forEach>

        $("#memInfo").replaceWith(
            "<div class='col-lg-9 mt-4 mt-lg-0' id='memInfo'>"
            +"<div class='tab-content'>"
            +"<div class='tab-pane active show' id='tab-1'>"
            +"<div class='row'>"
            +"<div class='col-lg-8 details order-2 order-lg-1'>"
            +"<h3>멤버정보</h3>"
            +"<p>이름: "+arr[index].mname+"</p>"
            +"<p>생년월일: "+arr[index].birth+"</p>"
            +"<p>거주지: "+arr[index].maddr+"</p>"
            +"<div class='d-grid gap-2 mt-3 mb-3'>"
            +"<c:if test='${grade == 0 || grade==1}'>"
            +"<button type='button' id='deleMan' class='btn btn-outline-secondary' onclick='delegateManCheck("+index+")'>"
            +"운영진 위임/해제"
            +"</button>"
            +"</c:if>"
            +"</div>"
            +"</div>"
            +"<div class='col-lg-4 text-center order-1 order-lg-2'>"
            +"<img src='/assets/img/course-details-tab-1.png' alt='' class='img-fluid'/>"
            +"</div>"
            +"</div>"
            +"</div>"
            +"</div>"
            +"</div>"
        );
    }

    function delegateManCheck(index){
        console.log(index);
        console.log("운영진 위임");
        var arr = new Array();
        <c:forEach var="memInGroupName" items="${memInGroupName}" varStatus="index">
        arr.push({gseq: "${groupInfo.gseq}", mnum: "${memInGroupName.MNUM}", grade: "${memInGroupName.GRADE}"});
        </c:forEach>
        console.log(arr);

        $(function(){
            $.ajax({
                url: "delegateCheck.json",
                type: "POST",
                data: {gseq: "${groupInfo.gseq}", mnum: arr[index].mnum, grade: arr[index].grade},
                success: function(data){
                    console.log("controller_delegate return 값: " + data);
                    if(data == 0){
                        Swal.fire({
                            title: "이미 모임장입니다.",
                            icon: "error"
                        });
                    }else if(data == 1){
                        Swal.fire({
                            title: "이미 운영진입니다. 해제하시겠습니까?",
                            icon: "question",
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes'
                        }).then((result) => {
                            console.log("운영진일 때: " + result.isConfirmed);
                            if(result.isConfirmed){
                                Swal.fire({
                                    title: "운영진 권한을 해제했습니다.",
                                    icon: "success"
                                }).then((result) =>{
                                    location="delegate.do?gseq=${groupInfo.gseq}&mnum="+arr[index].mnum+"&grade="+arr[index].grade+"";
                                })
                            }
                        })
                    }else{
                        Swal.fire({
                            title: '운영진 위임을 하시겠습니까?',
                            icon: 'question',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes'
                        }).then((result) => {
                            console.log("일반 회원일 때: " + result.isConfirmed);
                            if(result.isConfirmed){
                                Swal.fire({
                                    title: "운영진으로 위임했습니다.",
                                    icon: "success"
                                }).then((result) =>{
                                    location="delegate.do?gseq=${groupInfo.gseq}&mnum="+arr[index].mnum+"&grade="+arr[index].grade+"";
                                })
                            }
                        })
                    }
                }
            });
        });
    }

    </script>
    <script type="text/javascript">
	    function gatheringCreateCheck(){
  			var gseq = ${groupInfo.gseq};
  			var result = {"gseq":gseq};
  			$(function(){
 				$.ajax({
   					url: "gatheringCreateCheck.json",
   					type: "POST",
   					data: result,
   					success: function(data){
	   					if(data == 0){
							Swal.fire({
								title: '정모는 5개까지만 개설 가능합니다.',
								icon: 'warning',
								showCancelButton: false,
								confirmButtonColor: '#3085d6',
								confirmButtonText: 'Yes'
							});
						}else{
							gatheringCreate();
						}
   					}
   				});  
   			});
		}
	           	
    	function gatheringCreate(){
    		location="../gathering/gatheringCreate.do?gseq=${groupInfo.gseq}&mnum=${m.mnum}";
    	}
    </script>
    <c:forEach items="${memInGroupName}" var="memInGroupName">
      <script type="text/javascript">
    function groupMembercheck(){
    		var mnum = ${m.mnum};
  			var gseq = ${groupInfo.gseq};
  			var result = {"mnum":mnum,"gseq":gseq};
	   			$(function(){
    				$.ajax({
	   					url: "groupMembercheck.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(data!=3){
	   							groupMember();
	   						}else {
	   							Swal.fire({
		  							  title: "가입회원만 조회가 가능합니다.",
		  							  icon: "error"
	   							});
	   						}
	   					}
	   				});
	   			});
    	}
    	function groupMember(){
    		location="../gboard/gblistPage?gseq=${groupInfo.gseq}&mnum=${memInGroupName.MNUM}";
    	}
    	</script>
    </c:forEach>
    <!-- 04/05 대현추가 (사진첩 멤버체크)-->
    <c:forEach items="${memInGroupName}" var="memInGroupName">
    <script type="text/javascript">
    function galleryCheck(){
    		var mnum = ${m.mnum};
  			var gseq = ${groupInfo.gseq};
  			var result = {"mnum":mnum,"gseq":gseq};
	   			$(function(){
    				$.ajax({
	   					url: "galleryCheck.json",
	   					type: "POST",
	   					data: result,
	   					success: function(data){
	   						if(data!=3){
	   							galleryMember();
	   						}else {
	   							Swal.fire({
		  							  title: "가입회원만 조회가 가능합니다.",
		  							  icon: "error"
	   							});
	   						}
	   					}
	   				});
	   			});
    	}
    	function galleryMember(){
    		location="groupGallery.do?gseq=${groupInfo.gseq}&mnum=${m.mnum}";
    	}
    	</script>
    </c:forEach>
    <!-- 04/05 대현추가 끝-->
    
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
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

  <body>
	<c:choose>
		<c:when test="${endTimeGathering eq null}">
			<c:set value="null" var="endTimeGathering"/>
		</c:when>
		<c:otherwise>
			<c:set value="1" var="endTimeGathering"/>
		</c:otherwise>
	</c:choose>
		<input 
		  id='my_btn'
		  type='button' 
		  onclick="endTimeGatheringCheck(${endTimeGathering},${notice.notice})"
		  />
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
    <div id="count" ></div>
    <input id="hiddenInput" type="hidden"  value=""/>
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="../">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="../">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="myGroup.do?mnum=${m.mnum }">나의 모임</a></li>
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
                <li><a href="../qa">Q&A</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>
            </li>
            <c:choose>
           		<c:when test="${m eq null}">
		            <li><a href="login.html">로그인</a></li>		       
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
		        	<a href="groupCreate.do" class="get-started-btn">모임만들기</a>
		        </c:otherwise>
         </c:choose>
      </div>
    </header>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>${groupInfo.gname}</h1>
          <p>${groupInfo.rdate }</p>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Cource Details Section ======= -->
      <section id="course-details" class="course-details">
        <div class="container" data-aos="fade-up">
        <ul class="nav nav-tabs mb-3">
        	<li class="nav-item">
        		<a class="nav-link active" aria-current="page" href="#">정보</a>
        	</li>
        	<li class="nav-item">
        		<a class="nav-link" href="javascript:galleryCheck()">사진첩</a>
        	</li>
        	<li class="nav-item">
        		<a class="nav-link" href="javascript:groupMembercheck()">게시판</a>
        	</li>
        </ul> 
          <div class="row">
            <div class="col-lg-8">
              <img
                src="/assets/img/groupImages/${groupInfo.fname}"
                width="856px"
	            height="383px"
                alt=""
              />
              <h3>${groupInfo.gname}</h3>
              <p>
                ${groupInfo.gintro}
              </p>
            </div>
            <div class="col-lg-4">
              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5>모임장</h5>
                <p><a href="#">${groupMemberName.mname }</a></p>
              </div>

              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5>지역</h5>
                <p>${groupInfo.gloc}</p>
              </div>

              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5>관심사</h5>
                <p>${groupInfo.interest}</p>
              </div>

              <div
                class="course-info d-flex justify-content-between align-items-center"
              >
                <h5>정원</h5>
                <p>${groupMemberCount}/${groupInfo.limit}</p>
              </div>
              <!-- 정모목록 부분-->
              <c:if test="${memInGroupCheck ne null}">
              <div class="accordion acoordion-flush" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button
                      class="accordion-button collapsed"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#collapseOne"
                      aria-expanded="true"
                      aria-controls="collapseOne"
                    >정모목록(${gatheringCountInGroup}/5)
                    </button>
                  </h2>
                  <div
                    id="collapseOne"
                    class="accordion-collapse collapse"
                    aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample"
                  >
                  <c:forEach items="${gatheringList}" var="gathering">
                    <div class="accordion-body">
                      <a href="../gathering/gatheringInfo.do?ga_seq=${gathering.ga_seq}&mnum=${m.mnum}">${gathering.ga_name}</a>
                    </div>
                   </c:forEach>
                  </div>
                </div>
              </div>
              </c:if>
              <!--정모목록 끝-->
              <div class="d-grid gap-2 mt-3 mb-3">
                <c:if test="${memInGroupCheck ne null}">
                <button
                  type="button"
                  class="btn btn-outline-success"
                  onclick="location.href='javascript:gatheringCreateCheck()'"
                >
                 	정모만들기
                </button>
                </c:if>
                <button type="button" class="btn btn-outline-secondary" 
                	onclick="location.href='javascript:groupUpdateCheck()'">
                  	모임 수정하기
                </button>
                <button type="button" class="btn btn-outline-secondary"
                onclick="location.href='javascript:groupDeleteCheck()'">
                 	 모임 삭제하기
                </button>
                <c:choose>
			         <c:when test="${memInGroupCheck eq null }">
		                <button type="button" class="btn btn-outline-secondary"
		                onclick="location.href='javascript:groupJoin()'">
		                 	 모임 가입하기
		                </button>
		              </c:when>
			          <c:otherwise>
		                <button type="button" class="btn btn-outline-secondary"
		                onclick="location.href='javascript:groupQuit()'">
		                 	 모임 탈퇴하기
		                </button>
	                </c:otherwise>
                </c:choose>
              </div>
		         
            </div>
           
          </div>
          
        </div>
      </section>
      <!-- End Cource Details Section -->

      <!-- ======= Cource Details Tabs Section ======= -->
        <section id="cource-details-tabs" class="cource-details-tabs">
            <div class="container" data-aos="fade-up">
                <div class="row">
                    <div class="col-lg-3">
                        <ul class="nav nav-tabs flex-column">
                            <c:forEach var='memInGroupName' items='${memInGroupName}' varStatus="index">
                                <c:choose>
                                    <c:when test="${memInGroupName.GRADE eq 0}">
                                        <c:set var="grade" value="모임장"/>
                                    </c:when>
                                    <c:when test="${memInGroupName.GRADE eq 1}">
                                        <c:set var="grade" value="운영진"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="grade" value=""/>
                                    </c:otherwise>
                                </c:choose>
                                <li class='nav-item'>
                                    <a class='nav-link' data-bs-toggle='tab' href="javascript:void(0);" onclick="memberInfo(${index.index});">${memInGroupName.MNAME}&nbsp;&nbsp;&nbsp;${grade}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-lg-9 mt-4 mt-lg-0" id="memInfo">
                        <div class="tab-content">
                            <div class="tab-pane active show" id="tab-1">
                                <div class="row">
                                    <div class="col-lg-8 details order-2 order-lg-1">
                                        <h3>멤버정보</h3>
                                        <p> 이름: ${memberInfo.mname}</p>
                                        <p> 생년월일: ${memberInfo.birth} </p>
                                        <p> 거주지: ${memberInfo.maddr} </p>
                                    </div>
                                    <div class="col-lg-4 text-center order-1 order-lg-2">
                                        <img
                                                src="/assets/img/course-details-tab-1.png"
                                                alt=""
                                                class="img-fluid"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Cource Details Tabs Section -->
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
                  <a href="../">Home</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="../about">About us</a>
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
