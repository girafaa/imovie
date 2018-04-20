<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>IMOVIE</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="landing">
		<div id="page-wrapper">

			<!-- 상단 메뉴바 -->
				<header id="header">
					<h1 id="logo"><a href="<c:url value='/'/>">IMOVIE</a></h1>
					<nav id="nav">
						<ul>
							<li><a href="<c:url value='/'/>">홈</a></li>
							<li>
								<a href="<c:url value='/ticket'/>">예매</a>
							</li>
							<li><a href="<c:url value='/movie'/>">영화</a></li>
							<li><a href="<c:url value='/notice'/>">게시판</a>
                            	<ul>						
									<li><a href="<c:url value='/notice'/>">공지사항</a></li>
									<li><a href="<c:url value='/qna'/>">질문과 답변</a></li>
								</ul>
                            </li>
                            <li><a href="<c:url value='/movie'/>">영화관리</a></li>	
							<li>
							    <a href="<c:url value='/theater'/>">영화관관리</a>
                            	<ul>			
									<li><a href="<c:url value='/theater'/>">영화관관리</a></li>
									<li><a href="<c:url value='/screen'/>">상영관관리</a></li>
									<li><a href="<c:url value='/seat'/>">좌석관리</a></li>
								</ul>
                            </li>
							<li><a href="<c:url value='/admin'/>">관리자</a></li>
							<c:if test="${sessionScope.loginId == null}">
							<li><a href="<c:url value='/login'/>" class="button special">로그인</a></li>
							</c:if>
          					<c:if test="${sessionScope.loginId!=null}">
							<li><a href="<c:url value='/myinfo'/>">${loginId}님</a></li>
							<li><a href="<c:url value='/logout'/>" class="button special">로그아웃</a></li>
							</c:if>
						</ul>
					</nav>
				</header>
<body>
