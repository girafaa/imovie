<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" /><!-- 글자 자르는 태그 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>

        <style>
            .empty-row{
                height: 50px;
            }
            .area{
                margin: auto;
                text-align: center;
                width: 80%;
            }
            .content{
                width: 100%; height: 100%;
                text-align: center;
            }
        </style>
    <body>
    	<div class="empty-row"></div>
        <div class="in-align-right" style="margin-right: 20px;">
    	<div class="empty-row"></div>
         <c:if test="${loginGrade=='영화사'||loginGrade=='관리자'}">
            <a class="button small" href='<c:url value="/movie/register"/>'>영화 등록</a>
            <a class="button small" href='<c:url value="/movie/mylist"/>'>나의 영화 리스트</a>
         </c:if>
         <c:if test="${loginGrade=='관리자'}">
            <a class="button small" href='<c:url value="/movie/list"/>'>영화사별 검색(관리자용)</a>
         </c:if>
        </div>
        <div class="empty-row"></div>
        <div class="area">
            <a class="button special icon " href='<c:url value="/movie/now"/>'>현재 상영작</a>
            <a class="button icon" href='<c:url value="/movie/soon"/>'>상영 예정작</a>
            <div class="empty-row"></div>
            <div class="card border-secondary mb-3" style="width: 100%; display:inline-block;">
                <c:forEach var="list" items="${list }">
                    <div style="width: 30%; overflow: hidden; display: inline-block; margin: auto;">
                        <img src="${pageContext.request.contextPath}/image/${list.poster}" style="margin: 20px; width: 300px; height:380px;">
                        <a class="button small" href='<c:url value="/movie/info?movieid=${list.id}"/>' style="margin: 20px;">${list.title }</a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="empty-row"></div>
</body>

<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>