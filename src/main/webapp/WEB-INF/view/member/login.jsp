<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" />

        <div class="empty-row"></div>
        <div class="empty-row"></div>
    <div class="container-80 out-align-center">
        	<h3 class="in-align-center">로그인</h3>
								<form method="post" id="loginForm" action="<c:url value='/login'/>">
									<div class="row uniform 50%">
										<div class="12u$">
											<input type="text" name="id" id="id" value="" placeholder="아이디" required />
										</div>
										<div class="12u$">
											<input type="password" name="pw" id="pw" value="" placeholder="비밀번호" required />
										</div>
										
<!-- 										<div class="4u 12u$(medium)"> -->
<!-- <!-- 											<input type="checkbox" name="save" id="priority-low" value="1"> -->
<!-- <!-- 											<label for="priority-low">아이디저장</label> -->
<!-- 										</div> -->
										<div class="12u$ in-align-center">
												<input type="submit" value="로 그 인" class="special" style="width: 49%;display: inline-block;"/>
												<a href="<c:url value='/register'/>"><input type="button" style="width: 49%;display: inline-block;" value="회원가입"/></a>
										</div>
									</div>
								</form>
								 
		<!-- 실제 서버로 전송되는 form -->
		<form action="<c:url value='/login'/>" method="post" id="hiddenForm">
		    <fieldset>
		        <input type="hidden" name="id" />
		        <input type="hidden" name="pw" />
		    </fieldset>
		</form>
 		 
    </div>
<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>

    	<!-- javascript lib load -->
		<script src="https://code.jquery.com/jquery-latest.js"></script>
		<script src="js/jsbn.js"></script>
		<script src="js/prng4.js"></script>
		<script src="js/rng.js"></script>
		<script src="js/rsa.js"></script>
		
<!-- 유저 입력 form의 submit event 재정의 -->
<script>
    var $id = $("#hiddenForm input[name='id']");
    var $pw = $("#hiddenForm input[name='pw']");
 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#loginForm").submit(function(e) {
        // 실제 유저 입력 form은 event 취소
        // javascript가 작동되지 않는 환경에서는 유저 입력 form이 submit 됨
        // -> Server 측에서 검증되므로 로그인 불가
        e.preventDefault();
 
        // 아이디/비밀번호 암호화 후 hidden form으로 submit
        var id = $(this).find("#id").val();
        var pw = $(this).find("#pw").val();
        $id.val(rsa.encrypt(id)); // 아이디 암호화
        $pw.val(rsa.encrypt(pw)); // 비밀번호 암호화
        $("#hiddenForm").submit();
    });
</script>

	

				


