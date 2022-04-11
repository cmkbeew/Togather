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
       <script type="text/javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
	function checkedBox(box){
		if(box.checked==true){
			var checked = box.value;
			console.log("box.checked: "+box.checked);
			console.log("checked: "+checked);
			if(checked=="ck1"){
				$('#checkBox1').val(checked);
				$('#ck1').remove();
				$('#category_first').remove();
				$('#category_first1').val("");
				$('#category_firstCheck1').val("");
				$('#ck1').prop('checked',false);
				$('#checkBox1').val("");
			}else if(checked=="ck2"){
				$('#checkBox2').val(checked);
				$('#ck2').remove();
				$('#category_second').remove();
				$('#category_first2').val("");
				$('#category_firstCheck2').val("");
				$('#ck2').prop('checked',false);
				$('#checkBox2').val("");
			}else{
				$('#checkBox3').val(checked);
				$('#ck3').remove();
				$('#category_third').remove();
				$('#category_first3').val("");
				$('#category_firstCheck3').val("");
				$('#ck3').prop('checked',false);
				$('#checkBox3').val("");
			}
		}else{
			var checked = box.value;
			if(checked=="ck1"){
				$('#checkBox1').val("");
			}else if(checked=="ck2"){
				$('#checkBox2').val("");
			}else{
				$('#checkBox3').val("");
			}
			console.log("checked: "+checked);
			console.log("box.checked: "+box.checked);
		}
		
		/*<input id="checkBox1" type="hidden"  value="">	
		<input id="checkBox2" type="hidden"  value="">
		<input id="checkBox3" type="hidden"  value="">*/
	
	}
	
	
	function joinCancel(){
		$('#mname_id').val("");
		$('#email_id').val("");
		$('#birth_id').val("");
		$('#pwd_id').val("");
		$('#pwd2_id').val("");
		$('#phone_id').val("");
		$('#maddr').val("");
		$('#pfr_loc_id').val("");
		$('#mname_id').focus();
	}
	function reset(){

		$('#ul2').remove();
		$('#ul3').remove();
		$('#button2').remove();
		$('#button3').remove();
		$('#Selectbutton').remove();
		var div2="";
		div2+="<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' onclick='javascript:reset2()' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
		div2+="<span id='span2'>하위관심사</span>";
		div2+="</button>";
		div2+="<ul id='ul2' class='dropdown-menu'>";
		div2+="</ul>";
		$('#div2').after(                     
			div2              		
		);
		var div3="";
		div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
		div3+="<span id='span3'>세부관심사</span>";
		div3+="</button>";
		div3+="<ul id='ul3' class='dropdown-menu'>";
		div3+="</ul>";
		$('#div3').after(                     
			div3              		
		);
		$('#button2').hide();
		$('#button3').hide();
	}
	
	function reset2(){
	
		$('#ul3').remove();
		$('#button3').remove();
		$('#Selectbutton').remove();
		var div3="";
		div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
		div3+="<span id='span3'>세부관심사</span>";
		div3+="</button>";
		div3+="<ul id='ul3' class='dropdown-menu'>";
		div3+="</ul>";
		$('#div3').after(                     
			div3              		
		);
		$('#button3').hide();
	}
	
	function reset3(){

	}
	//<button id='Cancelbutton' type='button' class='btn btn-secondary' onclick='categorys(6,0)' style='margin:7px 0px 0px 5px' >취소</button>
	function selectedCategory(){
		let categoryValue1 =$('#category_first1').val();
		let categoryValue2 =$('#category_first2').val();
		let categoryValue3 =$('#category_first3').val();
		let checkBoxValue1 =$('#checkBox1').val();
		let checkBoxValue2 =$('#checkBox2').val();
		let checkBoxValue3 =$('#checkBox3').val();
		let categoryCheckValue1 =$('#category_firstCheck1').val();
		let categoryCheckValue2 =$('#category_firstCheck2').val();
		let categoryCheckValue3 =$('#category_firstCheck3').val();
		if(categoryValue1==categoryValue2 || categoryValue1==categoryValue3){
			console.log("5");
			Swal.fire({
				title:"다른 카테고리를 선택해주세요.",
				icon:"error"
			});
			return false;
		}else{
			if(categoryValue2!=""){
				if(categoryValue3==categoryValue2){
					Swal.fire({
						title:"다른 카테고리를 선택해주세요.",
						icon:"error"
					});
					return false;
				}else{
					if($('#category_firstCheck1').val()==""){
						console.log("1: ");
						let selectedText1="";
						selectedText1+="<input id='ck1' value='ck1' type='checkbox' onclick='checkedBox(this)'></input>";
						selectedText1+="<input id='category_first' type='text' name='category_first' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue1+"' readonly>";
						$('#firstappendDiv').append(                     
								selectedText1              		
						);
						$('#category_firstCheck1').val("1");
					}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
						console.log("2");
						let selectedText2="";
						selectedText2+="<input id='ck2' value='ck2' type='checkbox' onclick='checkedBox(this)'></input>";
						selectedText2+="<input id='category_second' type='text' name='category_second' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue2+"' readonly>";
						$('#firstappendDiv').append(                     
							selectedText2              		
						);
						$('#category_firstCheck2').val("2");
					}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()==""){
						console.log("3");
						let selectedText3="";
						selectedText3+="<input id='ck3' value='ck3' type='checkbox' onclick='checkedBox(this)'></input>";
						selectedText3+="<input id='category_third' type='text' name='category_third' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue3+"' readonly>";
						$('#firstappendDiv').append(                     
								selectedText3              		
						);
						$('#category_firstCheck3').val("3");
						$('#button1').remove();
						$('#button2').remove();
						$('#button3').remove();
						$('#ul1').remove();
						$('#ul2').remove();
						$('#ul3').remove();
						$('#span1').remove();
						$('#span2').remove();
						$('#span3').remove();
						categoryCheckValue1 =$('#category_firstCheck1').val();
						categoryCheckValue2 =$('#category_firstCheck2').val();
						categoryCheckValue3 =$('#category_firstCheck3').val();
						console.log("categoryCheckValue1: "+categoryCheckValue1);
						console.log("categoryCheckValue2: "+categoryCheckValue2);
						console.log("categoryCheckValue3: "+categoryCheckValue3);
					}else {
						console.log("4");
						Swal.fire({
							title:"카테고리는 3개까지만 선택가능합니다.",
							icon:"error"
						});
					}
				}
			}else{
				if($('#category_firstCheck1').val()==""){
					console.log("1: ");
					let selectedText1="";
					selectedText1+="<input id='ck1' value='ck1' type='checkbox' onclick='checkedBox(this)'></input>";
					selectedText1+="<input id='category_first' type='text' name='category_first' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue1+"' readonly>";
					$('#firstappendDiv').append(                     
							selectedText1              		
					);
					$('#category_firstCheck1').val("1");
				}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
					console.log("2");
					let selectedText2="";
					selectedText2+="<input id='ck2' value='ck2' type='checkbox' onclick='checkedBox(this)'></input>";
					selectedText2+="<input id='category_second' type='text' name='category_second' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue2+"' readonly>";
					$('#firstappendDiv').append(                     
						selectedText2              		
					);
					$('#category_firstCheck2').val("2");
				}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()==""){
					console.log("3");
					let selectedText3="";
					selectedText3+="<input id='ck3' value='ck3' type='checkbox' onclick='checkedBox(this)'></input>";
					selectedText3+="<input id='category_third' type='text' name='category_third' style='width:100px;height:50px;border:none;text-align: center' value='"+categoryValue3+"' readonly>";
					$('#firstappendDiv').append(                     
							selectedText3              		
					);
					$('#category_firstCheck3').val("3");
					$('#button1').remove();
					$('#button2').remove();
					$('#button3').remove();
					$('#ul1').remove();
					$('#ul2').remove();
					$('#ul3').remove();
					$('#span1').remove();
					$('#span2').remove();
					$('#span3').remove();
					categoryCheckValue1 =$('#category_firstCheck1').val();
					categoryCheckValue2 =$('#category_firstCheck2').val();
					categoryCheckValue3 =$('#category_firstCheck3').val();
					console.log("categoryCheckValue1: "+categoryCheckValue1);
					console.log("categoryCheckValue2: "+categoryCheckValue2);
					console.log("categoryCheckValue3: "+categoryCheckValue3);
				}else {
					console.log("4");
					Swal.fire({
						title:"카테고리는 3개까지만 선택가능합니다.",
						icon:"error"
					});
				}
			}	
		}
		
		$('#Selectbutton').remove();
		$('#button2').hide();
		$('#button3').hide();
		categorys(5,0);
		
	}
	
	<c:set var="firstCategory1" value="${firstCategory}"/>
	function categorys(sequence,i){
		if(sequence==1){
			$('#button2').hide();
			$('#button3').hide();
			let catagory="";	
			catagory+="<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
			catagory+="<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})' onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
			catagory+="</c:forEach>";
			$('#ul1').append(                     
					catagory              		
			);
		}else if(sequence==2){
			$('#button2').show();
			let index="li";
			index+=i;
			let categoryValue=document.getElementById(index).getAttribute('data-value');
			$('#span1').text(categoryValue);
			var result = {"int_out":categoryValue,"sequence":sequence};
			$.ajax({
				url: "category.json",
				type: "GET",
				data: result,
				success: function(data){
					var secondCategory=data;
					let catagory="";
					for(var i =0;i<data.length;i++){
						let idNum=i;
						catagory+="<li><a id='"+i+"' class='dropdown-item' href='javascript:categorys(3,"+i+")' onclick='javascript:reset2()' data-value='"+secondCategory[i].int_in+"'>"+secondCategory[i].int_in+"</a></li>";
					}	
					
					$('#ul2').append(                     
							catagory              		
					);
				}
			});
		}else if(sequence==3){
			console.log("3들어옴");
			let index=i;
			let categoryValue=document.getElementById(index).getAttribute('data-value');
			$('#span2').text(categoryValue);
			var result = {"int_in":categoryValue,"sequence":sequence};
			$.ajax({
				url: "category.json",
				type: "GET",
				data: result,
				success: function(data){
					var thirdCategory=data;
					let catagory="";
					if(Object.keys(data).length!=1){
						$('#button3').show();
						for(var i =0;i<data.length;i++){
							catagory+="<li><a id='"+i+"li' class='dropdown-item' href='javascript:categorys(4,"+i+")' onclick='javascript:reset3()' data-value='"+thirdCategory[i].first_option+"'>"+thirdCategory[i].first_option+"</a></li>";
						}
						$('#ul3').append(                     
								catagory              		
						);
					}else{
						if($('#category_firstCheck1').val()==""){
							$('#category_first1').val(categoryValue);
						}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
								$('#category_first2').val(categoryValue);
						}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!=""){
								$('#category_first3').val(categoryValue);
						}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()!=""){
							Swal.fire({
								title:"카테고리는 3개까지만 선택가능합니다.",
								icon:"error"
							});
							categorys(5,0);
						}
						let catagoryButton="<button id='Selectbutton' type='button' class='btn btn-secondary' onclick='selectedCategory()' style='margin-top:7px' >선택</button>";
						console.log("엘스안 categoryValue: "+categoryValue);
						$('#Cancelbutton').before(                     
								catagoryButton              		
							);
					}
					
				}
			});
		}else if(sequence==4){
			$('#Selectbutton').remove();
			var index=i;
			index+="li";
			let categoryValue=document.getElementById(index).getAttribute('data-value');
			$('#span3').text(categoryValue);
			if($('#category_firstCheck1').val()==""){
				$('#category_first1').val(categoryValue);
			}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()==""){
					$('#category_first2').val(categoryValue);
			}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!=""){
					$('#category_first3').val(categoryValue);
			}else if($('#category_firstCheck1').val()!="" && $('#category_firstCheck2').val()!="" && $('#category_firstCheck3').val()!=""){
				Swal.fire({
					title:"카테고리는 3개까지만 선택가능합니다.",
					icon:"error"
				});
				categorys(5,0);
			}
			let catagoryButton="<button id='Selectbutton' type='button' class='btn btn-secondary' onclick='selectedCategory()' style='margin-top:7px' >선택</button>";
			$('#Cancelbutton').before(                     
				catagoryButton              		
			);
		}else if(sequence==5){
			$('#button1').remove();
			$('#button2').remove();
			$('#button3').remove();
			$('#ul1').remove();
			$('#ul2').remove();
			$('#ul3').remove();
			$('#span1').remove();
			$('#span2').remove();
			$('#span3').remove();
			var div1="";
			div1+="<button id='button1' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div1+="<span id='span1'>관심사</span>";
			div1+="</button>";
			div1+="<ul id='ul1' class='dropdown-menu'>";
			div1+="<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
			div1+="<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})' onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
			div1+="</c:forEach>";
			div1+="</ul>";		
			$('#div1').append(                     
				div1              		
			);
			var div2="";
			div2+="<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div2+="<span id='span2'>하위관심사</span>";
			div2+="</button>";
			div2+="<ul id='ul2' class='dropdown-menu'>";
			div2+="</ul>";
			$('#div2').append(                     
				div2              		
			);
			var div3="";
			div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div3+="<span id='span3'>세부관심사</span>";
			div3+="</button>";
			div3+="<ul id='ul3' class='dropdown-menu'>";
			div3+="</ul>";
			$('#div3').append(                     
				div3              		
			);				
			$('#button2').hide();
			$('#button3').hide();
		}else if(sequence==6){
			$('#category_first1').val("");
			$('#category_first2').val("");
			$('#category_first3').val("");
			$('#category_firstCheck1').val("");
			$('#category_firstCheck2').val("");
			$('#category_firstCheck3').val("");
			$('#category_first').remove();
			$('#category_second').remove();
			$('#category_third').remove();
			$('#button1').remove();
			$('#button2').remove();
			$('#button3').remove();
			$('#ul1').remove();
			$('#ul2').remove();
			$('#ul3').remove();
			$('#span1').remove();
			$('#span2').remove();
			$('#span3').remove();
			$('#Selectbutton').remove();
			$('#ck1').remove();
			$('#ck2').remove();
			$('#ck3').remove();
			var div1="";
			div1+="<button id='button1' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div1+="<span id='span1'>관심사</span>";
			div1+="</button>";
			div1+="<ul id='ul1' class='dropdown-menu'>";
			div1+="<c:forEach items='${firstCategory1}' var='firstCategory' varStatus='index'>";
			div1+="<li><a id='li${index.index}' class='dropdown-item' href='javascript:categorys(2,${index.index})' onclick='javascript:reset()' data-value='${firstCategory.int_out}'>${firstCategory.int_out}</a></li>";
			div1+="</c:forEach>";
			div1+="</ul>";		
			$('#div1').after(                     
				div1              		
			);
			var div2="";
			div2+="<button id='button2' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div2+="<span id='span2'>하위관심사</span>";
			div2+="</button>";
			div2+="<ul id='ul2' class='dropdown-menu'>";
			div2+="</ul>";
			$('#div2').after(                     
				div2              		
			);
			var div3="";
			div3+="<button id='button3' type='button' class='btn btn-outline-light dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' style='color: black; border-color: black'>";
			div3+="<span id='span3'>세부관심사</span>";
			div3+="</button>";
			div3+="<ul id='ul3' class='dropdown-menu'>";
			div3+="</ul>";
			$('#div3').after(                     
				div3              		
			);
			$('#button2').hide();
			$('#button3').hide();
		}
	}
	$(function(){
		$("#updatebutton").on("click",function(){
			if($('#category_firstCheck1').val()==""){ 
				Swal.fire({
					title:"카테고리를 선택해주세요",
					icon:"warning"
					});
				return false;
			}
			$.ajax({
				url: "../mypage/updatecategory.json",
				type: "POST",
				data: $('#updateform').serialize(),
				success: function(data){
					console.log(data);
					if(data == 0){
						Swal.fire({
							title:"다른 카테고리를 선택해주세요!",
							icon:"warning"
							})
						return false;
					}else{
						Swal.fire({
							title:"수정성공",
							icon:"success"
							}).then((result) =>{
								console.log(data);
								opener.location.reload();
				       			window.close();	   					
			   			  });			
					}
				 }
    		});
    	});
	});
	
  </script>
  </head>
<body onload="categorys(1,0)">
    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs mt-0" data-aos="fade-in" >
        <div class="container">
          <h1>카테고리 수정</h1>
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
                     <!--바꿔야함  --> <form class="mx-1 mx-md-4" action="../mypage/updatecategory?mnum=${m.mnum}" id= "updateform" name="updateform" method="post" >
                        <div id='firstappendDiv' style='padding: 0px 15px 7px' class='d-flex flex-row align-items-center mb-0'>
                        </div>
                         <div  id="selectdiv1" class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                          <div id="selectdiv2" class="form-outline flex-fill mb-2">
                           <!-- 카테고리 붙이기 -->
                          	<div id="div1" class="btn-group">
									<button id="button1"
									  type="button"
									  class="btn btn-outline-light dropdown-toggle"
									  data-bs-toggle="dropdown"
									  aria-expanded="false"
									  style="color:  black; border-color: black">
									<span id='span1'>관심사</span>
									</button>
									<ul id="ul1" class="dropdown-menu">
									</ul>
								  </div>
							
								  <div id="div2" class="btn-group" style="margin-left: 5px">
									<button
									  type="button" id="button2"
									  class="btn btn-outline-light dropdown-toggle"
									  data-bs-toggle="dropdown"
									  aria-expanded="false"
									  style="color: black; border-color: black">
									<span id='span2'>하위관심사</span>
									</button>
									<ul id="ul2" class="dropdown-menu">
									</ul>
								  </div>
							
								  <div id="div3" class="btn-group" style="margin-left: 5px">
									<button
									  type="button" id="button3"
									  class="btn btn-outline-light dropdown-toggle"
									  data-bs-toggle="dropdown"
									  aria-expanded="false"
									  style="color: black; border-color: black">
										<span id='span3'>세부관심사1</span> 
									</button>
									<ul id="ul3" class="dropdown-menu">
									</ul>
								  </div>
 									<input id="category_first1" type="hidden"  value="">	
 									<input id="category_first2" type="hidden"  value="">
 									<input id="category_first3" type="hidden"  value="">
 									<input id="category_firstCheck1" type="hidden"  value="">	
 									<input id="category_firstCheck2" type="hidden"  value="">
 									<input id="category_firstCheck3" type="hidden"  value="">
 									<input id="checkBox1" type="hidden"  value="">	
 									<input id="checkBox2" type="hidden"  value="">
 									<input id="checkBox3" type="hidden"  value="">
 									
 									<button id='Cancelbutton' type='button' class='btn btn-secondary' onclick='categorys(6,0)' style='margin:7px 0px 0px 5px' >취소</button>
 													
					          <!-- 카테고리 붙이기 -->
                          </div>
                        </div>
                        
						<div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >첫번쨰 카테고리
                              </label
                            >
                             <div class="input-group">
                             <c:choose>
	                              <c:when test ="${not empty m.category_first}"> 
	                            	<input                            
		                              type="text"
		                            
		                              id="category_first2"	                            
		                              class="form-control"
		                              value="${m.category_first}"
		                              readonly                                                 
	                           	 >
	                           	 	</c:when>
	                           	 	<c:otherwise>
	                           	 		데이터가 없습니다..
	                           	 	</c:otherwise> 
                           	 	</c:choose>                          	 
	    				  </div>
                          </div>
                        </div>
                        
						<div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >두번째 카테고리
                              </label
                            >
                             <div class="input-group">
                             <c:choose>
									<c:when test="${ not empty m.category_second }"> 
	                            	<input                            
		                              type="text"
		                           
		                              id="category_second2"	                            
		                              class="form-control"
		                              value="${m.category_second}"
		                              readonly                                                 
	                           	 >
                          	 	 	 </c:when>
                          	 	  <c:otherwise>
	                           	 		<input                            
			                              type="text"
			                              
			                              id="category_second2"	                            
			                              class="form-control"
			                              placeholder="카테고리가 비었습니다."
			                              readonly                                                 
		                           	 >
	                           </c:otherwise> 
	                           </c:choose>
	    				  </div>
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >세번째 s카테고리
                              </label
                            >
                            
	                             <div class="input-group">
	                             <c:choose>
									<c:when test="${not empty m.category_third }"> 
		                            	<input                            
			                              type="text"
			                           
			                              id="category_third2"	                            
			                              class="form-control"
			                              value="${m.category_third}"
			                              readonly                                                 
		                           		 >
		                           	 </c:when>
		                           	 <c:otherwise>
			                           	 <input                            
			                              type="text"
			                            
			                              id="category_third2"	                            
			                              class="form-control"
			                              placeholder="카테고리가 비었습니다."
			                              readonly                                                 
		                           	 >
	                           	 		
	                           		</c:otherwise> 
	                           	</c:choose>              	 
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
