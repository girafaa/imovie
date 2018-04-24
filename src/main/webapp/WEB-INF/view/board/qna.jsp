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

<body>
	<c:if test="${re_edit_qna}">
		<script type="text/javascript">
			alert('수정이 완료되었습니다.');
		</script>
	</c:if>
	
	<c:if test="${re_qna_none}">
		<script type="text/javascript">
			alert('없는 글입니다.');
		</script>
	</c:if>
	<c:if test="${re_qna_secret}">
		<script type="text/javascript">
			alert('비밀 글입니다.');
			history.back();
		</script>
	</c:if>
	
	<c:if test="${re_qna_dfail eq 0}">
		<script type="text/javascript">
			alert('관리자 혹은 본인만 삭제 가능합니다.');
		</script>
	</c:if>
	
	<c:if test="${re_qna_dfail eq 2}">
		<script type="text/javascript">
			alert('삭제를 실패했습니다.');
		</script>
	</c:if>
	
	<c:if test="${re_qna_delete eq 1}">
		<script type="text/javascript">
			alert('삭제가 완료 되었습니다.');
		</script>
	</c:if>

	<c:if test="${re_qna}">
		<script type="text/javascript">
			location.href = 'qna';
		</script>
	</c:if>


	<script type="text/javascript">
	  	$(document).ready(function() {
	  		$(".form").submit(function() {
	  			event.preventDefault();
	  			submitIgnoreGuard(this);
	  		})
	  	})u
	
	</script>
					
				<div class="empty-row"></div>
	  <div id="main" class="wrapper style1">
	<div class="out-align-center in-align-center table-wrapper ">
              <h1 class="font-big" style="font-size: 40px;">질문과 답변</h1>
      <table id="table">
      	<thead>
      			<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="10%">작성자</th>
					<th width="20%">작성일</th>
					<th width="10%">조회</th>
				</tr>
      	</thead>
      	<tbody>
				<c:forEach var="qnaitem" items="${qnalist}">
					<tr>
						<td>${qnaitem.no}</td>
						<td><c:if test="${qnaitem.gno>0}">
						&nbsp; └
						</c:if> <font color="gray" size="2">[${qnaitem.head}]</font> <a
							href="<c:url value='/qnaShow'></c:url>?no=${qnaitem.no}" onclick="moveIgnoreGuard($(location).attr('href'))">${qnaitem.title}</a>
							<c:if test="${qnaitem.secret == 's'}">
								<font color="red" size="2">[비밀글]</font>
							</c:if></td>
						<td>${qnaitem.writerId}</td>
						<td>${fn:substring(qnaitem.reg, 0, 10)}</td>
						<td>${qnaitem.read}</td>
					</tr>
				</c:forEach>
		</tbody>
		</table>
		
		
		
		
		<!-- ==================================================== -->
					
				<div class="empty-row"></div>
		<!-- 검색 기능 -->
			  <form action="<c:url value='/qna'></c:url>">
				<!--       검색 옵션 선택(드롭다운)-->
				<div style="width: 20%; display:inline-block;">
					<div class="select-wrapper">
						<select name="search">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writerId">작성자</option>
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
	
	
	
	
	
	
	
	
	



	