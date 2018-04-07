<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>
<html>
    <head>
        <title>상영관 상세 조회</title>
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
                margin: auto;
                text-align: left;
                padding: 50px;
                width: 60%;
            }
        </style>
        <link rel="stylesheet" href="https://bootswatch.com/4/minty/bootstrap.css">
        <link rel="stylesheet" href="https://bootswatch.com/4/minty/bootstrap.min.css">
    </head>
    <body>
        <div class="empty-row"></div>
        <div class="area">
            <div class="text-right" style="margin-right: 20px;">
                <a href='<c:url value="/screen/delete?screenid=${screen.id }"/>' class="btn btn-outline-secondary">상영관 삭제</a>
            </div>
            <div class="content">
                <div class="card border-primary mb-3" style="max-width: 20rem; margin: auto;">
                    <div class="card-header">${screen.no }관</div>
                    <div class="card-body" style="text-align: left;">
                        <h6 class="card-title">지점명 : </h6><h5 class="card-text">${theater.name }</h5>
                        <h6 class="card-title">총좌석수 : </h6><h5 class="card-text">${screen.seats } 석</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="empty-row"></div>
    </body>
</html>