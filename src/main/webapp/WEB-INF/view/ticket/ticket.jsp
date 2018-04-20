<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/design/nav.jsp"></jsp:include>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/user.css" /><!-- 글자 자르는 태그 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
    	//영화선택시 함수
		function selectedmovie(id){
			$('#formdata > input[name=movieid]').val(id);
		}
		
        $(document).ready(function(){


        	//영화 선택시 리스트 출력
        	$("#selectmovie").on("click", function(){
					$('#radiodiv > ul').remove();		//ul 초기화
					var ul = "<ul/>";
					$('#radiodiv').append(ul);
					$("ul").attr("style","list-style:none;margin:0px;padding:0px");		//리스트 내부 점없애기
        			<c:forEach items="${movielist}" var="movie">
        				var json = new Object();
        				json.title = "${movie.title}";
        				json.id = "${movie.id}";
        					var li = $("<li id="+json.id+">"+json.title+"</li>");
        					li = li.attr("style","font-size:1.2em;padding:10px;margin-top:5px;border:1.5px white solid;background-color:white")
        					.attr("onclick","selectedmovie(${movie.id});");//"+json.title+","+json.id+"
        					$('#radiodiv > ul').append(li);
        				console.log(json);
        			</c:forEach>
        			
        	});
            


        	
        	
        	//영화관(팝콘) 선택시 리스트 출력
        	$("#selecttheater").on("click", function(){
				$('#radiodiv > ul').remove();		//ul 초기화
				var ul = "<ul/>";
				$('#radiodiv').append(ul);
				$("ul").attr("style","list-style:none;margin:0px;padding:0px");		//리스트 내부 점없애기
    			<c:forEach items="${theaterlist}" var="theater">
    				var json = new Object();
    				json.name = "${theater.name}";
    				json.id = "${theater.id}";
    					var li = $("<li id="+json.id+">"+json.name+"</li>");
    					li = li.attr("style","font-size:1.2em;padding:10px;margin-top:5px;border:1.5px white solid;background-color:white");
    					$('#radiodiv > ul').append(li);
    				console.log(json);
    			</c:forEach>
    		});
        	
        	//날짜 선택시 리스트 출력
        	$("#selectdate").on("click", function(){
				$('#radiodiv > ul').remove();		//ul 초기화
				var ul = "<ul/>";
				$('#radiodiv').append(ul);
				$("ul").attr("style","list-style:none;margin:0px;padding:0px");		//리스트 내부 점없애기
    			<c:forEach items="${datelist}" var="date">
    				var json = new Object();
    				json = "${fn:substring(date, 0, 10)}";
    					var li = $("<li id="+json+">"+json+"</li>");
    					li = li.attr("style","font-size:1.2em;padding:10px;margin-top:5px;border:1.5px white solid;background-color:white");
    					$('#radiodiv > ul').append(li);
    				console.log(json);
    			</c:forEach>
    		});        	
        	
        	//상영스케줄 선택시 리스트 출력
        	$("#selectschedule").on("click", function(){
				$('#radiodiv > ul').remove();		//ul 초기화
				var ul = "<ul/>";
				$('#radiodiv').append(ul);
				$("ul").attr("style","list-style:none;margin:0px;padding:0px");		//리스트 내부 점없애기
    			<c:forEach items="${datelist}" var="date">
    				var json = new Object();
//     				json = "${fn:substring(date, 0, 10)}";
//     					var li = $("<li id="+json+">"+json+"</li>");
//     					li = li.attr("style","font-size:1.2em;padding:10px;margin-top:5px;border:1.5px white solid;background-color:white");
    					$('#radiodiv > ul').append(li);
    				console.log(json);
    			</c:forEach>
    		});        	
        	<%-- 		            		<option value="${fn:substring(date, 0, 10)}">${fn:substring(date, 5, 10)}</option> --%>
        	
        	
        	
        	
        	
        	
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
	    }
	    select >option{
        	background-color:white;
	    }
	    .fourdiv{
            width: 15%;
            margin:auto;
            padding: 10px;
        }
        .outer{
            margin: auto;
            width: 80%;
            display: flex;
            flex-direction: row;    /*좌우전환*/
        }
        #radiodiv{
            width: 100%;
        }
        #movie{ 
        }
     	.emptydiv{
     		width:15%;
     	}   

	    
        @media screen and (max-width:740px){
			.outer{
			  width:100%;
			}

        }	    

        @media screen and (max-width:570px){
		    .fourdiv{
	            width: 25%;
	            padding: 0px;
	        }
	        .emptydiv{
     			width:1px;
     		}   
        }
    </style>
</head>
<body>


  <div id="main" class="wrapper style1">
	<div class="out-align-center font-black">
		  <h1 class="text-center in-align-center " style="color: black">예매하기</h1>
	 <div class="outer in-align-center">
        <div class="fourdiv in-align-center" id="selectmovie">
            <img src="icon/film.png" width="100%">
        </div>
        <div class="fourdiv" id="selecttheater">
            <img src="icon/building.png" width="100%">
        </div>
        <div class="fourdiv" id="selectdate">
            <img src="icon/calendar.png" width="100%">
        </div>
        <div class="fourdiv" id="selectschedule">
            <img src="icon/time.png" width="100%">
        </div>
     </div> 
        
    <div class="outer">
         <div id="radiodiv">
          <ul class="alt">
      	    <li style="padding: 10px;">아이콘을 클릭해 예매정보를 입력하세요.</li>
          </ul>
        </div>
    </div>
	
	</div>
	<div id="formdata" class="empty-row">
		<input type="text" name="movieid"/>
		<input type="text" name="theaterid"/>
		<input type="text" name="date"/>
		<input type="text" name="scheduleid"/>
	</div>
	<div class="empty-row"></div>
  </div>	
</body>
<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>

	
	
	
<%--         <form action="<c:url value='/selectseat'/>" method="post"> --%>
<!--             <div class="container"> -->
<!--               <h1 class="text-center in-align-center">예매하기</h1> -->
<!--               영화선택    -->
<!--                   <div class="outer in-align-center"> -->
<!-- 			        <div class="empty"></div> -->
<!-- 			        <div id="selectmovie"> -->
<!--                           <label for="movieselect">영화 선택</label>  -->
<!-- 			              <select multiple="" name="movieid" class="form-control" id="movieselect" required style=" height:80%;" > -->
<%-- 			            	<c:forEach var="movie" items="${movielist}"> --%>
<%-- 			            		<option value="${movie.id}">${movie.title}</option> --%>
<%-- 			            	</c:forEach> --%>
<!-- 			              </select> -->
<!-- 			        </div> -->
<!-- 			        <div class="empty"></div> -->
<!-- 			        <div id="selecttheater"> -->
<!--                       <label for="theaterselect">영화관 선택</label>         -->
<!-- 		              <select multiple="" name="theaterid" class="form-control" id="theaterselect" required style=" height:80%;" > -->
<%-- 		            	<c:forEach var="theater" items="${theaterlist}"> --%>
<%-- 		            		<option value="${theater.id}">${theater.name}</option> --%>
<%-- 		            	</c:forEach> --%>
<!-- 		              </select> -->
<!-- 			        </div> -->
<!-- 			        <div class="empty"></div> -->
<!-- 			        <div id="selectdate"> -->
<!-- 		              <label for="dateselect">관람 일자</label> -->
<!-- 		              <select multiple="" name="date" class="form-control" id="dateselect" required style=" height:80%;" > -->
<%-- 		            	<c:forEach var="date" items="${datelist}"> --%>
<%-- 		            		<option value="${fn:substring(date, 0, 10)}">${fn:substring(date, 5, 10)}</option> --%>
		            		
<%-- 		            	</c:forEach> --%>
<!-- 		              </select> -->
<!-- 			        </div> -->
<!-- 			        <div class="empty"></div> -->
<!-- 			        <div id="selectschedule"> -->
<!-- 		              <label for="scheduleselect">상영 시간</label>         -->
<!-- 		              <select multiple="" name="scheduleid" class="form-control" id="scheduleselect" required style=" height:80%;" > -->
<!-- 		              </select> -->
<!-- 			        </div> -->
<!-- 			        <div class="empty"></div> -->
<!-- 			    </div> -->
              
               




<!--               <div class="empty-row"></div>          -->
<!-- <!--               <button id="schedulebutton" type="button" class="btn btn-secondary">상영시간표 조회</button>     --> 
<!--             <HR></HR> -->
<!--                 <br> -->
                


<!--             <button type="submit" class="btn btn-secondary">자리 찜하기!</button> -->
<!--             </div> -->

<!--         </form> -->
<!--     </div> -->
<!--     </div> -->
				
