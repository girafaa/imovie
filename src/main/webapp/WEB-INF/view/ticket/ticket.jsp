<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" /><!-- 글자 자르는 태그 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<head>
    <style> 

		.font-black{
			color:black;
		}

 	    #nav, #page-wrapper, #logo{ 
 	    	background-color: rgb(249,246,236); 
 	    	color:black; 
 	    } 
	    form{
	    	background-color: rgb(249,246,236);
	    	color:black;
	    }
	    select >option{
        	background-color:white;
	    	color:black;
	    }
    
    
        .emptysmall{
            height: 10px;
        }
        .empty-row{
            height: 50px;
        }
        select{
        	height: 120px;
        }
    </style>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(document).ready(function(){
        	//버튼 클릭시 결제창 출력
            $("#schedulebutton").on("click", function(){
             	var movieselect = document.getElementById("movieselect");	//select에서 선택한 값 가져오기
             	var movieselectvalue = movieselect.options[movieselect.selectedIndex].value;
//              	alert(movieselectvalue);
             	
             	var theaterselect = document.getElementById("theaterselect");	//select에서 선택한 값 가져오기
             	var theaterselectvalue = theaterselect.options[theaterselect.selectedIndex].value;
//              	alert(theaterselectvalue);
             	var dateselect = document.getElementById("dateselect");	//select에서 선택한 값 가져오기
             	var dateselectvalue = dateselect.options[dateselect.selectedIndex].value;
//              	alert(dateselectvalue);
             	
             	//상영시간표 불러오는 ajax
			    $.ajax({
					url:'${pageContext.request.contextPath}'+"/ticket/schedule",
					type:"get",
					data:{
							theaterid:theaterselectvalue,
							movieid:movieselectvalue,
							date:dateselectvalue
					},
					dataType:"json",
					success:function(schedulelist){
// 						alert(schedulelist);
						//이전 내용 삭제
						$('#scheduleselect').empty();
						document.getElementById('scheduleselect').innerHTML = '';
						
						$.each(schedulelist, function(index,schedule){
							 var option = $("<option>"+schedule.starttime+"</option>");
				                option = option.val(schedule.id);
		            		$("#scheduleselect").append(option); 
						});
					}
	            });	//ajax
				
           });	//button
        	
       });	//ready
	</script>
</head>
<body>
    <div class="empty-row"></div>
    <div class="container-50 out-align-center">
        <form action="<c:url value='/selectseat'/>" method="post">
              <h1 class="font-big" style="font-size: 40px; color: black">예매하기</h1>
              <!--영화선택-->    
              <div class="row font-big">영화 고르기</div>
              <select multiple="" name="movieid" class="form-control" id="movieselect" required>
            	<c:forEach var="movie" items="${movielist}">
            		<option value="${movie.id}">${movie.title}</option>
            	</c:forEach>
              </select>

              <div class="row">영화관 고르기</div>    
              <select multiple="" name="theaterid" class="form-control" id="theaterselect" required>
            	<c:forEach var="theater" items="${theaterlist}">
            		<option value="${theater.id}">${theater.name}</option>
            	</c:forEach>
              </select>
              <div class="row">관람일자 고르기</div>   
              <select multiple="" name="date" class="form-control" id="dateselect" required>
            	<c:forEach var="date" items="${datelist}">
            		<option value="${fn:substring(date, 0, 10)}">${fn:substring(date, 0, 10)}</option>
            		
            	
            	</c:forEach>
              </select>
              <div class="emptysmall"></div>     
              
              
            <div class="row"><input type="button" id="schedulebutton" class="form-btn-full special" value="상영시간표 조회"></div>  							
                <br>
                
              <div class="row">상영시간 선택하기</div>       
              <select multiple="" name="scheduleid" class="form-control" id="scheduleselect" required>
              </select>
           <div class="row"><input type="submit" id="schedulebutton" class="form-btn-full special" value="다음 단계로"></div>  							
        </form>
    </div>
</body>





<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>

	
	
	

