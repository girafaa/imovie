<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 글자 자르는 태그 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>
<style>
		.table-wrapper{
			width:40%;
		}
        @media screen and (max-width:740px){
            .table-wrapper{
                width:80%;
            }

        }
        @media screen and (max-width:570px){
            .table-wrapper{
                width:100%;
            }

        }

</style>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" />
<body>
  <div id="main" class="wrapper style1">
	<div class="out-align-center in-align-center table-wrapper ">
        <h1 class="in-align-center">내 정보</h1>
      <table id="table">
        <tbody>
          <tr>
            <th scope="row" colspan="40%">아이디</th>
            <td>${member.id}</td>
          </tr>
         
         <tr>
            <th scope="row" colspan="40%">생년월일</th>
            <td>${fn:substring(member.birth, 0, 10)}</td>
         </tr>
         
        <tr>
            <th scope="row" colspan="40%">이메일</th>
            <td>${member.email}</td>
          </tr>
          
         <tr>
            <th scope="row" colspan="40%">전화번호</th>
            <td>${member.phone}</td>
         </tr>
          
         <tr>
            <th scope="row" colspan="40%">회원등급</th>
            <td>${member.grade}</td>
         </tr>
         
         <tr>
            <th scope="row" colspan="40%">포인트</th>
            <td>${member.point}</td>
         </tr>
          
         <tr>
            <th scope="row" colspan="40%">가입일</th>
            <td>${fn:substring(member.reg, 0, 10)}</td>
         </tr>
        </tbody>
      </table>
      <a href="<c:url value='/edit'/>"><input type="button"  class="special" style="width:49%" value="정보 수정"/></a>
      <a href="<c:url value='/'/>"><input type="button" style="width: 49%"  value="홈으로"/></a>
      </div>
   </div>





</body>
</html>
			
<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>












<!-- <html lang="en"> -->
<!--   <head>  -->
<!--     <meta charset="utf-8"> -->
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--     <title>내정보</title> -->


<%--     <c:if test="${re_login_myInfo}"> --%>
<!--     	<script> alert('이미 로그인 하신 상태입니다'); </script> -->
<%--     </c:if> --%>
    
<%--     <c:if test="${re_login_success}"> --%>
<!--     	<script> alert('환영합니다'); </script> -->
<%--     </c:if> --%>
<%--     <c:if test="${re_reg_reg eq 'no'}"> --%>
<!--     	<script> history.back(); </script> -->
<%--     </c:if> --%>
<!--     <div align="center"> <h1> 내정보</h1> </div><hr> -->
<!--   </head> -->
<!--   <body> -->
       
<!--     <div align="center"> -->
<!--       <form action="edit" id="forEdit"> -->
      	
<!--       Table -->
<!--       <table class="table table-bordered" align="center"  style="position: relative; width: 400px; top:30px"> -->
        
<!--         <tbody> -->
         
<!--           <tr> -->
<!--             <th scope="row" colspan="40%">아이디</th> -->
<%--             <td>${myInfo.id}</td> --%>
<!--           </tr> -->
         
<!--          <tr> -->
<!--             <th scope="row" colspan="40%">생년월일</th> -->
<%--             <td>${myInfo.birth}</td> --%>
<!--          </tr> -->
         
<!--         <tr> -->
<!--             <th scope="row" colspan="40%">이메일</th> -->
<%--             <td>${myInfo.email}</td> --%>
<!--           </tr> -->
          
<!--          <tr> -->
<!--             <th scope="row" colspan="40%">전화번호</th> -->
<%--             <td>${myInfo.phone}</td> --%>
<!--          </tr> -->
          
<!--          <tr> -->
<!--             <th scope="row" colspan="40%">회원등급</th> -->
<%--             <td>${myInfo.grade}</td> --%>
<!--          </tr> -->
         
<!--          <tr> -->
<!--             <th scope="row" colspan="40%">포인트</th> -->
<%--             <td>${myInfo.point}</td> --%>
<!--          </tr> -->
          
<!--          <tr> -->
<!--             <th scope="row" colspan="40%">가입일</th> -->
<%--             <td>${myInfo.reg}</td> --%>
<!--          </tr> -->
         
           
<!--         </tbody> -->
        
<!--       </table> -->
<!--       <br> <hr> -->
    
<!--     <button type="submit" class="btn btn-primary" style="width: 100px">내정보 수정</button> -->
<!--     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--     <button type="button" onClick="location.href='home'" class="btn btn-warning"  style="width: 100px">홈으로</button> -->
<!--    </form> -->
<!--     <form action="logout" id="forLogout"> -->
<!--      <button type="submit" class="btn btn-default" style="width: 200px" >로그아웃</button> -->
<!--     </form> -->
    
<!--     </div> -->
<!--     jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!--     Include all compiled plugins (below), or include individual files as needed -->
<!--     <script src="js/bootstrap.min.js"></script> -->
    
<!--   </body> -->
<!-- </html> -->
