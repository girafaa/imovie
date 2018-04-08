<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" />
<style>
	.container{
		width:40%;
	}
	input[type=password]{
		display:inline-block;
	}
</style>
<body>
	<div id="main" class="wrapper style1">
		<div class="container">
			<h1 class="in-align-center">회원가입</h1>
			<form action="<c:url value='/register'/>" method="post">
			
			
				<div class="row uniform 50%">

					<div class="12u$">
						<input type="text" name="id" id="id" value="" placeholder="아이디" required />
					</div>
					<div class="12u$">
						<input type="email" name="email" id="email" value="" placeholder="이메일주소" required />
					</div>
					<div class="6u 12u$(xsmall)">
						<input type="password" name="pw" id="password" value="" placeholder="비밀번호" required />
					</div>
					<div class="6u$ 12u$(xsmall)">
						<input type="password" name="pwcheck" id="passwordcheck" value="" placeholder="비밀번호 확인" required />
					</div>
					<div class="12u$">
						<input type="text" name="birth" id="birth" value="" placeholder="생년월일 ex)180101" required />
					</div>
					<div class="12u$">
						<input type="text" name="phone" id="phone" value="" placeholder="휴대폰 번호 '-'생략" required />
					</div>

					<div class="12u$">
							<input type="submit" value="회원가입" class="special" style="width:49%"  />
							<a href="<c:url value='/login'/>"><input type="button" value="취소" style="width:49%"/></a>
					</div>
				</div>			
			
			
			
			</form>
		</div>

	</div>


</body>
</html>
			
<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>























<!-- <body> -->

<!-- 	<article class="container"> -->
<!-- 		<br><br> -->
<!-- 		<div class="page-header" align="center"> -->
<!-- 			<h1>회원가입</h1> -->
<!-- 		</div> -->
<!-- 		<br> -->
<!-- 		<div class="col-md-6"  style="float: none; margin: 0 auto;"> -->
<!-- 			<form role="form" action='register' method="post" -->
<!-- 				onsubmit="return checkPw()"> -->
<!-- 				아이디 입력 및 중복확인 기능 -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="id">아이디</label> -->
<!-- 					<div class="input-group"> -->
<!-- 						<input type="text" class="form-control" id="id" name="id" -->
<!-- 							placeholder="아이디" required> <span class="input-group-btn"> -->
<!-- 							<button class="btn btn-success" id="idCheck" type="button" -->
<!-- 								onclick=""> -->
<!-- 								중복 확인<i class="fa fa-mail-forward spaceLeft"></i> -->
<!-- 							</button> -->
<!-- 						</span> -->
<!-- 						<p id="checkMsg"></p> -->
<!-- 					</div> -->
<!-- 				</div>  -->
<!-- 				비밀번호 입력 -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="pw">비밀번호</label> <input type="password" -->
<!-- 						class="form-control" id="pw" name="pw" placeholder="비밀번호" required> -->
<!-- 				</div> -->
<!-- 				비밀번호 확인 -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="pwcheck">비밀번호 확인</label> <input type="password" -->
<!-- 						class="form-control" id="pwCheck" name="pwcheck" -->
<!-- 						placeholder="비밀번호 확인"> -->
<!-- 					<p id="pwsame" style="color: red;"></p> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label for="birth">생년월일</label> <input type="text" -->
<!-- 						class="form-control" id="birth" name="birth" -->
<!-- 						placeholder="주민번호 앞 6자리" required> -->
<!-- 				</div> -->

<!-- 				핸드폰   입력 -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="tel">핸드폰 번호</label> <input type="tel" -->
<!-- 						class="form-control" id="phone" name="phone" -->
<!-- 						placeholder="-없이 입력해주세요" required> -->
<!-- 				</div> -->

<!-- 				이메일 입력 -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="email">E-mail</label> <input type="email" -->
<!-- 						class="form-control" id="email" name="email" placeholder="이메일 주소" -->
<!-- 						required> -->
<!-- 				</div> -->


<!-- 				<div class="form-group text-center"> -->
<!-- 					<button type="submit" class="btn btn-info"> -->
<!-- 						회원가입<i class="fa fa-check spaceLeft singnupBtn"></i> -->
<!-- 					</button> -->
<!-- 				</div> -->

<!-- 			</form> -->
<!-- 		</div> -->


<!-- 	</article> -->


<!-- </body> -->
<!-- </html> -->
