<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 글자 자르는 태그 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>


	<c:if test="${re_no}">
		<script type="text/javascript">
		location.href = 'notice';
		</script>
	</c:if>
	
	<c:if test="${re_no_edit}">
		<script type="text/javascript">
		alert('수정이 완료되었습니다');
		location.href = 'notice';
		</script>
	</c:if>
	
	<c:if test="${re_no_delete}">
		<script type="text/javascript">
		alert('삭제가 완료되었습니다');
		location.href = 'notice';
		</script>
	</c:if>
	
	<c:if test="${re_no_no}">
		<script type="text/javascript">
			alert('권한이 부족합니다.');
			history.back();
		</script>
	</c:if>
	<c:choose>
	<c:when test="${sessionScope.loginGrade eq 'admin' or sessionScope.loginGrade eq '관리자'}">
		<form action="<c:url value='/noticewrite'></c:url>">
			<div align="center">
				<button type="submit" class="btn btn-outline-secondary"
					style="position: relative; left: 360px;">글쓰기</button>
			</div>
		</form>
	</c:when>
	
	<c:otherwise>
		<br><br>
	</c:otherwise>
	
	</c:choose>

	<!--전체를 감는 div-->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" />
<style>
		.table-wrapper{
			width:80%;
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
  <div id="main" class="wrapper style1">
	<div class="out-align-center in-align-center table-wrapper ">
        <h1 class="in-align-center">공지사항</h1>
      <table id="table">
      	<thead>
      			<tr>
					<th scope="row"  width="18%">번호</th>
					<th scope="row"  width="46%">제목</th>
					<th scope="row"  width="20%">작성일</th>
					<th scope="row"  width="16%">조회</th>
				</tr>
      	</thead>
      	<tbody>
				<c:forEach var="noticeitem" items="${noticelist}">
					<tr>
						<td>${noticeitem.no}</td>
						<td><font color="gray" size="2">[${noticeitem.head}]</font> <a
							href="<c:url value='/noticeShow'></c:url>?no=${noticeitem.no}">${noticeitem.title}</a></td>
						<td>${noticeitem.reg}</td>
						<td>${noticeitem.read}</td>
					</tr>
				</c:forEach>
		</tbody>
		</table>
		
		
		
		
		<!-- ==================================================== -->
					
				<div class="empty-row"></div>
		<!-- 검색 기능 -->
			  <form action="<c:url value='/notice'></c:url>">
				<!--       검색 옵션 선택(드롭다운)-->
				<div style="width: 20%; display:inline-block;">
					<div class="select-wrapper">
						<select name="search">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="head">말머리</option>
						</select>
					</div>
				</div>
				<!-- 검색할 단어 입력-->
				<input type="text" style="width: 60%; display:inline-block;"class="form-control"name="keyword"  placeholder="검색어">
				<input style="width:10%; display:inline-block;" type="submit" value="검색"/>


			</form>
			<!-- /input-group -->
		</div>
		<!-- /.col-lg-6 -->
		<br>
		<!-- ==================================================== -->

		<!-- 페이징 기능 -->
		<div class="col-lg-6" data-example-id="simple-pagination">
			<nav>
				<ul class="pagination pagination-sm">
					<c:if test="${pagingNum>0}">
						<li class="page-item"><a class="page-link" href='<c:url value='/notice'></c:url>?pg=${pagingNum}'
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="1" end="${pageLast}" varStatus="page">
						<c:set var="pageidx" value="${pagingNum+page.count}" />
						<c:choose>
							<c:when test="${pageidx == param.pg}">

								<li class="page-item active"><a class="page-link"
									href='<c:url value='/notice'></c:url>?pg=${pageidx}'>${pageidx}</a>
								</li>
							</c:when>

							<c:otherwise>
								<li class="page-item"><a class="page-link" href='<c:url value='/notice'></c:url>?pg=${pageidx}'>${pageidx}</a>
								</li>
							</c:otherwise>

						</c:choose>
					</c:forEach>

					<c:if test="${lastPage-pagingNum>10}">
					<li class="page-item">
							<a class="page-link" href='<c:url value='/notice'></c:url>?pg=${pagingNum+11}'
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
						</c:if>
				</ul>
			</nav>
		</div>
		


	</div>
	<!--/bs-example -->

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	



</body>
</html>
			
<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>
