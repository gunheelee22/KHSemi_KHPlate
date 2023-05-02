<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,800,900">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<title>아이디/비번 찾기</title>
</head>

<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');


body{
 font-family: 'Nanum Gothic', sans-serif;
  font-weight: 300;
  font-size: 15px;
  line-height: 1.7;
  color: #000000;
  background-color: #ED1C16;
  overflow-x: hidden;
}
a {
  cursor: pointer;
  transition: all 200ms linear;
}
a:hover {
  text-decoration: none;
}
.link {
  color: #ffffff;
}
.link:hover {
  color: #ffeba7;
}
p {
  font-weight: 500;
  font-size: 14px;
  line-height: 1.7;
}
h4 {
  font-weight: 600;
}
h6 span{
	color: #ffffff;
  padding: 0 20px;
  text-transform: uppercase;
  font-weight: 700;
}
.section{
  position: relative;
  width: 100%;
  display: block;
}
.full-height{
  min-height: 100vh;
}
[type="checkbox"]:checked,
[type="checkbox"]:not(:checked){
  position: absolute;
  left: -9999px;
}
.checkbox:checked + label,
.checkbox:not(:checked) + label{
  position: relative;
  display: block;
  text-align: center;
  width: 60px;
  height: 16px;
  border-radius: 8px;
  padding: 0;
  margin: 10px auto;
  cursor: pointer;
  background-color: #ffeba7;
}
.checkbox:checked + label:before,
.checkbox:not(:checked) + label:before{
  position: absolute;
  display: block;
  width: 36px;
  height: 36px;
  border-radius: 50%;
  color: #ffeba7;
  background-color: #57b846;
  font-family: 'unicons';
  content: '\eb4f';
  z-index: 20;
  top: -10px;
  left: -10px;
  line-height: 36px;
  text-align: center;
  font-size: 24px;
  transition: all 0.5s ease;
}
.checkbox:checked + label:before {
  transform: translateX(44px) rotate(-270deg);
}


.card-3d-wrap {
  position: relative;
  width: 440px;
  max-width: 100%;
  height: 400px;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  perspective: 800px;
  margin-top: 60px;
}
.card-3d-wrapper {
  width: 100%;
  height: 100%;
  position:absolute;    
  top: 0;
  left: 0;  
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  transition: all 600ms ease-out; 
}
.card-front, .card-back {
  width: 100%;
  height: 100%;
  background-color: #ffffff;
  background-position: bottom center;
  background-repeat: no-repeat;
  background-size: 300%;
  position: absolute;
  border-radius: 6px;
  left: 0;
  top: 0;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  -o-backface-visibility: hidden;
  backface-visibility: hidden;
}
.card-back {
  transform: rotateY(180deg);
}
.checkbox:checked ~ .card-3d-wrap .card-3d-wrapper {
  transform: rotateY(180deg);
}
.center-wrap{
  position: absolute;
  width: 100%;
  padding: 0 35px;
  top: 50%;
  left: 0;
  transform: translate3d(0, -50%, 35px) perspective(100px);
  z-index: 20;
  display: block;
}


.form-group{ 
  position: relative;
  display: block;
    margin: 0;
    padding: 0;
}
.form-style {
  padding: 13px 20px;
  padding-left: 55px;
  height: 48px;
  width: 100%;
  font-weight: 500;
  border-radius: 4px;
  font-size: 14px;
  line-height: 22px;
  letter-spacing: 0.5px;
  outline: none;
  color: #c4c3ca;
  background-color: #f2f2f2;
  border: none;
  -webkit-transition: all 200ms linear;
  transition: all 200ms linear;
  box-shadow: 0 4px 8px 0 rgba(21,21,21,.2);
}
.form-style:focus,
.form-style:active {
  border: none;
  outline: none;
  box-shadow: 0 4px 8px 0 rgba(21,21,21,.2);
}
.input-icon {
  position: absolute;
  top: 0;
  left: 18px;
  height: 48px;
  font-size: 24px;
  line-height: 48px;
  text-align: left;
  color: #ffeba7;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}

.form-group input:-ms-input-placeholder  {
  color: #c4c3ca;
  opacity: 0.7;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input::-moz-placeholder  {
  color: #c4c3ca;
  opacity: 0.7;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input:-moz-placeholder  {
  color: #c4c3ca;
  opacity: 0.7;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input::-webkit-input-placeholder  {
  color: #c4c3ca;
  opacity: 0.7;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input:focus:-ms-input-placeholder  {
  opacity: 0;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input:focus::-moz-placeholder  {
  opacity: 0;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input:focus:-moz-placeholder  {
  opacity: 0;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}
.form-group input:focus::-webkit-input-placeholder  {
  opacity: 0;
  -webkit-transition: all 200ms linear;
    transition: all 200ms linear;
}

.btn{  
  border-radius: 4px;
  height: 44px;
  font-size: 13px;
  font-weight: 600;
  text-transform: uppercase;
  -webkit-transition : all 200ms linear;
  transition: all 200ms linear;
  padding: 0 30px;
  letter-spacing: 1px;
  display: -webkit-inline-flex;
  display: -ms-inline-flexbox;
  display: inline-flex;
  -webkit-align-items: center;
  -moz-align-items: center;
  -ms-align-items: center;
  align-items: center;
  -webkit-justify-content: center;
  -moz-justify-content: center;
  -ms-justify-content: center;
  justify-content: center;
  -ms-flex-pack: center;
  text-align: center;
  border: none;
  background-color: #57b846;
  color: #ffffff;
  box-shadow: 0 8px 24px 0 rgba(255,235,167,.2);
}
.btn:active,
.btn:focus{  
  background-color: #4dae3c;
  color: #ffffff;
  box-shadow: 0 8px 24px 0 rgba(16,39,112,.2);
}
.btn:hover{  
  background-color: #4dae3c;
  color: #ffffff;
  box-shadow: 0 8px 24px 0 rgba(16,39,112,.2);
}

</style>


<body>

<c:if test="${result!=null}">
<script>
	alert("비밀번호 변경완료하였습니다");
	location.href="/page/main.jsp"
</script>
</c:if>

	<form id="frm" method="post" onsubmit="return false;">
		<div class="section">
			<div class="container">
				<div class="row full-height justify-content-center">
					<div class="col-12 text-center align-self-center py-5">
						<div class="section pb-5 pt-5 pt-sm-2 text-center">
							<h6 class="mb-0 pb-3">
								<span>아이디 찾기</span><span>비밀번호 찾기</span>
							</h6>
							<input class="checkbox" type="checkbox" id="reg-log"
								name="reg-log"> <label for="reg-log"></label>
							<div class="card-3d-wrap mx-auto">
								<div class="card-3d-wrapper">
									<div class="card-front">
										<div class="center-wrap">
											<div class="section text-center">
												<!-- 						<form action="" method="post"> -->
												<h4 class="mb-4 pb-3">아이디 찾기</h4>
												
												
												
													<!-- 아이디 찾기 -->
												<div class="form-group">
													<input type="text" name="name" class="form-style" id="name"
														placeholder="이름 입력" autocomplete="off">
												</div>

												<div class="form-group mt-2">
													<div class="searchClass">
														<select id="class" name="classes">
															<option disabled="disabled" selected="selected">Class</option>
															<option value="A">A</option>
															<option value="B">B</option>
															<option value="C">C</option>
															<option value="D">D</option>
															<option value="E">E</option>
															<option value="F">F</option>
														</select>
														<div class="select-dropdown"></div>
													</div>
												</div>
													
												<div class="form-group mt-2">
													<input type="text" id="email" name="email"
														class="form-style" placeholder="이메일 입력" autocomplete="off">
												</div>
												<input type="button" value=제출하기 class="btn mt-4"
													id="idsearch">
													
													
													
													
													
													
													
								<!-- 비밀번호 찾기 -->
													
												<p class="mb-0 mt-4 text-center">
													<a href="#0" class="link">Forgot your password?</a>
												</p>
											</div>
										</div>
									</div>



									<div class="card-back">
										<div class="center-wrap">
											<div class="section text-center">
												<h4 class="mb-4 pb-3">비밀번호 찾기</h4>
												<div class="form-group">
													<input type="text" name="pwname" class="form-style" id="pwname"
														placeholder="이름 입력" autocomplete="off">
												</div>
												<div class="form-group mt-2">
													<input type="text" id="pwid" name="pwid" class="form-style"
														placeholder="아이디 입력" autocomplete="off">
												</div>
												<div class="form-group mt-2">
													<input type="text" id="pwemail" name="pwemail"
														class="form-style" placeholder="이메일 입력" autocomplete="off">
												</div>
												<input type="button" value=제출하기 id="passwordcheck"
													class="btn mt-4">
											</div>
										</div>
									</div>
	</form>


	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>


	<!-- 	</form> -->






	<script>
		$("#idsearch").on("click", function() {

			//입력 형식 제한
			var regexName = /^[가-힣]+$/;
			var regexEmail = /.+@.+\..+/;

			var name = $("#name").val();
			var email = $("#email").val();

			if (name == "" || email == "") { //필수항목 입력 여부 체크
				Swal.fire({
					icon : "error",
					title : "Oops...",
					text : "필수 항목을 모두 입력해주세요."
				});
				return false;
			}

			//형식 제한 준수 여부 체크

			if (!regexName.test(name)) {
				Swal.fire({
					icon : "error",
					title : "NAME 형식 오류",
					text : "한글만 입력 가능"
				});
				return false;
			}

			if (!regexEmail.test(email)) {
				Swal.fire({
					icon : "error",
					title : "EMAIL 형식 오류",
					text : "ID@address 형식으로 입력"
				});
				return false;
			}

			$("#frm").prop("action", "/idsearch.members");
			$("#frm").prop("onsubmit", true);

			$("#frm").submit();
		});

		
		
		
		
		
		$("#passwordcheck").on("click", function() {

			//입력 형식 제한
			var regexID = /^[a-z0-9_]{7,13}$/;
			var regexName = /^[가-힣]+$/;
			var regexEmail = /.+@.+\..+/;

			var name = $("#pwname").val();
			var email = $("#pwemail").val();
			var id = $("#pwid").val();
			

			if (name == "" || email == "" || id == "") { //필수항목 입력 여부 체크
				Swal.fire({
					icon : "error",
					title : "Oops...",
					text : "필수 항목을 모두 입력해주세요."
				});

				return false;
			}

			//형식 제한 준수 여부 체크

			if (!regexName.test(name)) {
				Swal.fire({
					icon : "error",
					title : "NAME 형식 오류",
					text : "한글만 입력 가능"
				});
				return false;
			}

			if (!regexEmail.test(email)) {
				Swal.fire({
					icon : "error",
					title : "EMAIL 형식 오류",
					text : "ID@address 형식으로 입력"
				});
				return false;
			}

			if (!regexID.test(id)) {
				Swal.fire({
					icon : "error",
					title : "ID 형식 오류",
					text : "7-13자의 알파벳 소문자, 숫자, _",
				});
				return false;
			}

			$("#frm").prop("action", "/pwsearch.members");
			$("#frm").prop("onsubmit", true);

			$("#frm").submit();

		});
		
		</script>

<!-- 		//         $("#frm").on( -->
<!-- 		//             "submit", -->
<!-- 		//             function () { -->

<!-- 		//                 //입력 형식 제한 -->
<!-- 		//                 var regexName = /^[가-힣]+$/; -->
<!-- 		//                 var regexEmail = /.+@.+\..+/; -->

<!-- 		//                 var name = $("#name").val(); -->
<!-- 		//                 var email = $("#email").val(); -->

<!-- 		//                 if (name == "" || email == ""  ) { //필수항목 입력 여부 체크 -->
<!-- 		//                     Swal.fire({ -->
<!-- 		//                         icon: "error", -->
<!-- 		//                         title: "Oops...", -->
<!-- 		//                         text: "필수 항목을 모두 입력해주세요." -->
<!-- 		//                     }); -->
<!-- 		//                     return false; -->
<!-- 		//                 } -->

<!-- 		//                 //형식 제한 준수 여부 체크 -->

<!-- 		//                 if (!regexName.test(name)) { -->
<!-- 		//                     Swal.fire({ -->
<!-- 		//                         icon: "error", -->
<!-- 		//                         title: "NAME 형식 오류", -->
<!-- 		//                         text: "한글만 입력 가능" -->
<!-- 		//                     }); -->
<!-- 		//                     return false; -->
<!-- 		//                 } -->

<!-- 		//                 if (!regexEmail.test(email)) { -->
<!-- 		//                     Swal.fire({ -->
<!-- 		//                         icon: "error", -->
<!-- 		//                         title: "EMAIL 형식 오류", -->
<!-- 		//                         text: "ID@address 형식으로 입력" -->
<!-- 		//                     }); -->
<!-- 		//                     return false; -->
<!-- 		//                 } -->
<!-- 		//             }); -->

		






	<!-- // <script>	$("#frm").on( -->
	<!-- // 		"submit", -->
	<!-- // 		function () { -->
	<!-- // 			//입력 형식 제한 -->
	<!-- // 			var regexID = /^[a-z0-9_]{7,13}$/; -->
	<!-- // 			var regexPW = /^[A-Za-z0-9]{7,13}$/; -->
	<!-- // 			var regexName = /^[가-힣]+$/; -->
	<!-- // 			var regexEmail = /.+@.+\..+/; -->


	<!-- // 			var id = $("#id").val(); -->
	<!-- // 			var pw1 = $("#pw1").val(); -->
	<!-- // 			var name = $("#name").val(); -->
	<!-- // 			var email = $("#email").val(); -->



	<!-- // 			if (id == "" || name == "" -->
	<!-- // 				|| email == "") { //필수항목 입력 여부 체크 -->
	<!-- // 				Swal.fire({ -->
	<!-- // 					icon: "error", -->
	<!-- // 					title: "Oops...", -->
	<!-- // 					text: "필수 항목을 모두 입력해주세요." -->
	<!-- // 				}); -->
	<!-- // 				return false; -->
	<!-- // 			} -->



	<!-- // 			//형식 제한 준수 여부 체크 -->
	<!-- // 			if (!regexID.test(id)) { -->
	<!-- // 				Swal.fire({ -->
	<!-- // 					icon: "error", -->
	<!-- // 					title: "ID 형식 오류", -->
	<!-- // 					text: "7-13자의 알파벳 소문자, 숫자, _", -->
	<!-- // 				}); -->
	<!-- // 				return false; -->
	<!-- // 			} -->

	<!-- // 			if (!regexName.test(name)) { -->
	<!-- // 				Swal.fire({ -->
	<!-- // 					icon: "error", -->
	<!-- // 					title: "NAME 형식 오류", -->
	<!-- // 					text: "한글만 입력 가능", -->
	<!-- // 				}); -->
	<!-- // 				return false; -->
	<!-- // 			} -->
	<!-- // 			if (!regexEmail.test(email)) { -->
	<!-- // 				Swal.fire({ -->
	<!-- // 					icon: "error", -->
	<!-- // 					title: "EMAIL 형식 오류", -->
	<!-- // 					text: "ID@address 형식으로 입력", -->
	<!-- // 				}); -->
	<!-- // 				return false; -->
	<!-- // 			} -->
	<!-- // 		}); -->

</body>

</html>