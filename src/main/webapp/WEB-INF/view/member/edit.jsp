<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" /><!-- 글자 자르는 태그 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript"> 
    function tocheckpw() {
        var pw = document.getElementById("pw").value;
        var pwck = document.getElementById("pwCheck").value;
 
        if (pw != pwck) {
            document.getElementById('pwsame').innerHTML = '비밀번호와 비밀번호 확인이 일치하지 않슶니다.';
            return false;
        }
    }
</script>
<div class="empty-row"></div>
    <div class="container-40 out-align-center">
	 <h1 class="font-big " style="font-size: 40px;">내 정보</h1>
      <form action="edit" method="post" onsubmit="return tocheckpw()">
      <input type="hidden" class="form-control" id="id" name="id" value="${myInfo.id}">
      <table class="">
        <tbody>
          <tr>
            <th scope="row" colspan="40%">아이디</th>
            <td>${member.id}</td>
          </tr>
         <tr>
            <th scope="row" colspan="40%">비밀번호</th>
            <td><input type="password" class="form-control" id="pw" name="pw"></td>
         </tr>
         
         <tr>
            <th scope="row" colspan="40%">비밀번호 확인</th>
            <td><input type="password" class="form-control" id="pwCheck" name="pwCheck">
            <br><p id="pwsame" style="color:green;"></p></td>
         </tr>
         

         <tr>
            <th scope="row" colspan="40%">생년월일</th>
            <td>${fn:substring(member.birth, 0, 10)}</td>
         </tr>
         
        <tr>
            <th scope="row" colspan="40%">이메일</th>
            <td><input type="email" class="form-control" id="email" name="email" value="${member.email}" required></td>
          </tr>
          
         <tr>
            <th scope="row" colspan="40%">전화번호</th>
            <td><input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" required></td>
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
    <div class="row"><input type="submit" class="special" value="수정완료" style="width:49%">
     <input type="button" onClick="history.back();" class="" value="취소" style="width:49%">
   
    </div>
   </form>
    </div>
    
<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>

	
