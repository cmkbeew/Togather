<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      href="../assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
	<!-- alert -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <!-- alert -->
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
		$("#joinbutton").on("click",function(){
			var checkbox=$('#checkbox').is(':checked');
			console.log("checkbox: "+checkbox);
			if(!checkbox){
					Swal.fire({
						title:"ToGater 이용약관에 동의해주세용.",
						icon:"warning"
						});
					return false;
			}
			var emailcheck = $("#email_id").val();
			emailcheck.trim();
			let check = /\S+@\S+\.\S+/;
			if(emailcheck != null){
				if (!check.test(emailcheck)) {
					Swal.fire({
						title:"이메일을 제대로된 형식으로 입력해주세요.",
						icon:"warning"
						});
					$("#email_id").val("");
					return false;
				}
			}
			var pwcheck = $("#pwd_id").val();
			var pwcheck2 = $("#pwd2_id").val();
			if(pwcheck!=pwcheck2){
				Swal.fire({
					title:"비밀번호가 다릅니다",
					icon:"warning"
					})
				return false;
			}
		
			if($('#category_firstCheck1').val()==""){ //<-- 첫번쨰 벨류에다가 0을 넣었으니까 0으로 검사해서 0이면 안선택한거
				Swal.fire({
					title:"카테고리를 선택해주세요",
					icon:"warning"
					});
				return false;
			}
			
			$.ajax({
				url: "../member/join.json",
				type: "POST",
				data: $('#joinform').serialize(),
				success: function(data){
					console.log(data);
					if(data==0){
						Swal.fire({
							   title:"환영합니다!",
							   icon:"success"
							}).then((result)=>{
								location="../";
							});
					}else if(data==1){
						Swal.fire({
							title:"이미 가입된 번호입니다",
							icon:"error"
							});
					}else if(data==2){
						Swal.fire({
							title:"이미 가입된 이메일입니다.",
							icon:"error"
							});
						}
					}
			});
		});
	});
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    //카카오회원가입
      window.Kakao.init("11400a9267d93835389eb9255fcaad0b");
      function kakaojoin(){
    	  Kakao.Auth.loginForm({
            scope:'profile_nickname, account_email, gender,	birthday',
            success:function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url:'/v2/user/me',
                    success:res => {
                        const kakao_account =res.kakao_account;
                        console.log(kakao_account);
                        var kakaoname = res.properties['nickname'];
                        var kakaoemail = res.kakao_account.email;
                        var kakaogender = res.kakao_account.gender;
                        var kakaobirth = res.kakao_account.birthday;
                        $("#mname_id").val(kakaoname);
                        $("#email_id").val(kakaoemail);
                        $("#birth_id").val(kakaobirth);
                        if(kakaogender=="male") $("#gender1_id").prop('checked', true);
                        if(kakaogender=="female") $("#gender2_id").prop('checked', true);
                  		//alert("이름: "+kakaoname+",이메일: "+kakaoemail+",생일 : "+kakaobirth+",성별 : "+kakaogender);
                      //alert(res.kakao_account.email + ' (' + res.properties['nickname'] + ') 님 환영합니다.');
                              
                    }
                })
            }
          });
      }
      </script>
      <script>
		window.history.forward();
	 	function noBack(){window.history.forward();}
	</script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    //document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById('sample6_postcode').value = data.zonecode;//우편번호
	                document.getElementById("maddr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("maddr2").focus();
	            }
	        }).open();
	    }
	</script>
  </head>

  <body onload="noBack();categorys(1,0)" onpageshow="if(event.persisted) noBack();">
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="/">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li><a class="active" href="/">Home</a></li>
            <li><a href="about.html">About</a></li>
            <!--로그인시에만 보이게 하기-->
            <li><a href="boardMain.html">게시판</a></li>
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
            <li><a href="login.do">로그인</a></li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->
        <!--로그인전에는 회원가입만 보이고 로그인하면 모임만들기만 보이게 하는건 어떤지??-->

      </div>
    </header>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>회원가입</h1>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- ======= Pricing Section ======= -->
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
                      <p class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-2">
                        <button
                          type="button"
                          class="btn btn-warning btn-lg btn-block mt-0 mb-0"
                          onclick="location.href='javascript:kakaojoin()'"
                        >
                          <i class="bi bi-chat-fill"></i>
                          카카오톡 계정으로 회원가입
                        </button>
                      </p>
                      <p class="divider-text mt-2 mb-2">
                        <span class="bg-light">OR</span>
                      </p>
                      <!--거주지/관심지역/이름/생년월일/비번/비번확인/전화번호/성별-->
                      <form class="mx-1 mx-md-4" id="joinform">
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >이름</label
                            >
                            <input
                              type="text"
                              name="mname"
                              id="mname_id"
                              class="form-control"
                              value=""
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >이메일</label
                            >
                            <input
                              type="email"
                              name="email"
                              id="email_id"
                              class="form-control"
                              placeholder="example@google.com"
                              value=""
                            />
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example3c"
                              >생년월일</label
                            >
                            <input
                              type="date"
                              name="birth"
                              id="birth_id"
                              class="form-control"
                              value=""
                              min="1985-01-02"
                              max="2003-12-31"
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4c"
                              >비밀번호</label
                            >
                            <input
                              type="password"
                              name="pwd"
                              id="pwd_id"
                              class="form-control"
                              value=""
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4c"
                              >비밀번호 확인</label
                            >
                            <input
                              type="password"
                              name="pwd2_id"
                              id="pwd2_id"
                              class="form-control"
                            />
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4c"
                              >전화번호</label
                            >
                            <input
                              type="text"
                              name="phone"
                              pattern="[0-9]+"
                              id="phone_id"
                              class="form-control"
                              maxlength="11"
                              value=""
                              oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                            />
                          </div>
                        </div>
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
									  style="color: black; border-color: black">
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
										<span id='span3'>세부관심사</span> 
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
 									<div align="right">
 									<button id='Cancelbutton' type='button' class='btn btn-secondary' onclick='categorys(6,0)' style='margin:7px 0px 0px 5px' >취소</button>
 									</div>				
					          <!-- 카테고리 붙이기 -->
                          </div>
                        </div>
                        
                         <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example1c"
                              >거주지</label
                            >
                            <input
                              id="maddr"
                              type="text"
                              name="maddr"
                              class="form-control"
                              value=""
                              placeholder="주소찾기눌러주세요"
                              onclick="sample6_execDaumPostcode()"
                              readonly
                            /> 
                            <input
                              id="maddr2"
                              type="text"
                              name="maddr"
                              class="form-control"
                              value=""
                              placeholder="상세주소"
                              onclick="sample6_execDaumPostcode()"
                              
                            />
                            <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
                            
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4cd"
                              >관심지역</label
                            >
                            <select id="pfr_loc_id" class="form-control" name="pfr_loc">
                              <option>선택</option>
                              <option value="서울">서울</option>
                              <option value="경기">경기</option>
                              <option value="인천">인천</option>
                            </select>
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-0">
                          <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-2">
                            <label class="form-label mb-0" for="form3Example4cd"
                              >성별</label
                            ><br />
                            <div
                              class="btn-group btn-group-toggle col-12"
                              data-toggle="buttons"
                            >
                              <label class="btn btn-light active">
                                <input
                                  type="radio"
                                  name="gender"
                                  id="gender1_id"
                                  value="male"
                                  autocomplete="off"
                                  checked
                                />
                                남
                              </label>
                              <label class="btn btn-light">
                                <input
                                  type="radio"
                                  name="gender"
                                  value="female"
                                  id="gender2_id"
                                  autocomplete="off"
                                />
                                여
                              </label>
                            </div>
                            <br />
                            <br />
                          </div>
                        </div>

                        <div
                          class="form-check d-flex justify-content-center mb-3"
                        >
                          <input
                            class="form-check-input me-2"
                            type="checkbox"
                            value=""
                            id="checkbox"
                          />
                          <label class="form-check-label" for="form2Example3">
                            <a href="#!">ToGather 이용약관</a>에
                            동의합니다(필수)
                          </label>
                        </div>

                        <div
                          class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                        >
                          <button
                            type="button"
                            class="btn btn-success"
                            style="margin-right: 30px" id="joinbutton"
                            
                          >
                            가입하기
                          </button>
                          <button type="button" class="btn btn-secondary" onclick="joinCancel()">
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
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer" style="padding-top: 50px">
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 footer-contact">
              <h3>Togather</h3>
              <p>
                A108 Adam Street <br />
                New York, NY 535022<br />
                United States <br /><br />
                <strong>Phone:</strong> +1 5589 55488 55<br />
                <strong>Email:</strong> info@example.com<br />
              </p>
            </div>

            <div class="col-lg-2 col-md-6 footer-links">
              <h4>Useful Links</h4>
              <ul>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="#">Home</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="#">About us</a>
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
                  <i class="bx bx-chevron-right"></i> <a href="#">Web Design</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="#">Web Development</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="#">Product Management</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i> <a href="#">Marketing</a>
                </li>
                <li>
                  <i class="bx bx-chevron-right"></i>
                  <a href="#">Graphic Design</a>
                </li>
              </ul>
            </div>

            <div class="col-lg-4 col-md-6 footer-newsletter">
              <h4>Join Our Newsletter</h4>
              <p>
                Tamen quem nulla quae legam multos aute sint culpa legam noster
                magna
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
            &copy; Copyright <strong><span>Mentor</span></strong
            >. All Rights Reserved
          </div>
          <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
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
  <script src="../assets/js/main.js"></script>
</html>
