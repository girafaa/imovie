<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" />
<body>
        <div class="empty-row"></div>
        <div class="empty-row"></div>
    <div class="container-80 out-align-center">
        	<h3 class="in-align-center">로그인</h3>
								<form method="post" action="<c:url value='/login'/>">
									<div class="row uniform 50%">
										<div class="12u$">
											<input type="text" name="id" id="id" value="" placeholder="아이디" required />
										</div>
										<div class="12u$">
											<input type="password" name="pw" id="email" value="" placeholder="비밀번호" required />
										</div>
										<div class="4u 12u$(medium)">
											<input type="checkbox" id="priority-low" name="priority" checked>
											<label for="priority-low">아이디저장</label>
										</div>
										<div class="12u$ in-align-center">
												<input type="submit" value="로 그 인" class="special" style="width: 49%;display: inline-block;"/></li>
												<a href="<c:url value='/register'/>"><input type="button" style="width: 49%;display: inline-block;" value="회원가입"/></a></li>
										</div>
									</div>
								</form>
    </div>
</body>
</html>




				
<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>


