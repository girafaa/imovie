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
  		<!-- 좌석 디자인 --> 
        .empty-row{
            height: 20px;
        }   
        .screen{  
        	margin: auto;
            background-color: dimgray;
            border: 1px solid dimgray;
            color: white;
            text-align: center;
            font-size: 20px;
            width: 750px;
            height: 35px;
        }
        .seats{
            padding-top: 30px;
            border: 1px solid black;
            width: 500px;
            height: 280px;
            margin: auto;
        }
        .block{
            width:20px;
            height:20px;
            border:0.5px solid black;
            display: inline-block;
            position: absolute;
            overflow: hidden;
            text-align: center;
            font-size: 8pt;
        }
        .seat-wrap{
	        border: 1px dotted black;
            width: 750px;
            height: 350px;
            margin: auto;
	    }
	    .seat{
	        border:1px solid black;
	        display:inline-block;
	        width:28px;
	        height:28px;
	    }
	    .seatdisabled{
	        border:1px solid black;
	        display:inline-block;
	        width:28px;
	        height:28px;
	    }	    
	    
  		<!-- 기타 디자인 -->
	    .emptysmall{
            height: 10px;
        }
        .empty-row{
            height: 50px;
        }
        #mantotal{
            height:20px;
        }

        
    </style>
 
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script>
    	//다음 페이지 뒤로가기 방지
		window.history.forward();
		function noBack() {
			window.history.forward();
		}

    	//상영관 좌석 배치도 가져오는 함수(ajax이용한다.)
	    function seatlist(screenid){
	    	$.ajax({
	    		async:false,	//ajax 동시 작동 방지
	    		type: 'POST',
	       		url: '${pageContext.request.contextPath}'+"/seat/list",
	    		data: {screenid:'${screenid}'},
	    		dataType: "json", 
	    		success: function(data){
					console.log(data);	    			
	    			for(var r=0; r<=11; r++){
	    				for(var c=1; c<=23; c++){
	    					var id = "#" + String.fromCharCode(r+97) + c;
	    					$(id).css("visibility","hidden");
	    				}
	    			}
	    			//data에 들어있는 정보를 검사하여
	                //해당하는 id를 가진 자리를 표시
	                $.each(data, function(i, d){
	                    var id = "#" + d.reallocation;
	                    $(id).css("background-color", "white").css("color", "black").css("visibility","visible").val(d.id);
	                });
	    		}
	    	});
       		 ticketingseatlist('${scheduleid}');
	    }
    	
    	//예매 좌석 가져오는 함수(ajax이용한다.)
    	//payment에서 상영시간표id가 같은 seat리스트를 가져온다.
	    function ticketingseatlist(scheduleid){
	    	$.ajax({
	    		async:false,	//ajax 동시 작동 방지
	    		type: 'POST',
	       		url: '${pageContext.request.contextPath}'+"/ticket/seat",
	    		data: {scheduleid:'${scheduleid}'},
	    		dataType: "json", 
	    		success: function(data){
	    			//data에 들어있는 정보를 검사하여
	                //해당하는 id를 가진 자리를 표시
	                $.each(data, function(i, d){
	                    var id = "#" + d.reallocation;
	                    $(id).css("background-color", "gray");
	                	$(id).off("click");
	 	            });
	    		}
	    	});
	    }    	
    	
	    
	    
    
        $(document).ready(function(){
			$(".screen").css("visibility","hidden");
			$(".seat-wrap").css("visibility","hidden");
        	var total=Number(0);
        	
            $("#man").on("click", function(){
            	
				$("#select > input[type=hidden]").remove();		//이 것에 해당하는 input태그를 지운다.
                //인원수 계산
             	var adult = document.getElementById("adult").value;	//select에서 선택한 값 가져오기
                var child = document.getElementById("child").value;	//select에서 선택한 값 가져오기
                var senior = document.getElementById("senior").value;	//select에서 선택한 값 가져오기
                var temp = Number(adult)+Number(child)+Number(senior);
                
       	  	    // 숫자만인지 체크하는 정규식
                regNumber = /^[0-9]*$/;
                if(!regNumber.test(temp)) {
                    alert('인원 수를 숫자로 입력해주세요.');
                    return;
                }
                
          	 	total = temp;
                //입력 인원수가 기준인원 초과시 좌석선택창을 보여주지 않는다.
                if(total>8){
                    alert("8명을 초과할 수 없습니다.");
                    $(".screen").css("visibility","hidden");
   					$(".seat-wrap").css("visibility","hidden");
   					$(".seat").css("visibility","hidden");
                } 
                //정상적인 인원입력이라면 ajax로 상영관의 좌석을 보여준다.
                if(total<=8){
                //ajax
                 $("#nextpagebtn").attr("style","display:inline")
                 $(".screen").css("visibility","visible");
				 $(".seat-wrap").css("visibility","visible");
// 				 console.log('${screenid}')
            	 seatlist('${screenid}');
            	 total = temp;
                }
            });	//button
            
            //좌석 div 하나 선택했을 때 이벤트 함수            
            $(".seat").on("click",function(){
            	console.log($(this));
            	console.log($(this).attr('id'));
            	console.log($(this).val());
            	
            	//이미 선택했던 좌석이라면 색상을 변경하고 #select에서 선택좌석input을 제거한다.
 				if($(this).css("background-color") =='rgb(255, 0, 0)'){
 					$(this).css("background-color","white").css("color","black");
 					var value = $(this).val();
 					$("input[value="+value+"]").remove();		//이 것에 해당하는 input태그를 지운다.
 					
 				//선택되지 않았던 좌석이라면
 				}else{
                	//선택갯수 제한
					//만약 선택하지 않은 것이라면 갯수를 미리봐서 total보다 작으면 팝업 나오고 더 이상 입력되지 않게해야한다.
                	var inputcount = $("#select > input[type=hidden]").length;
                	if(Number(inputcount)>=total){
                		alert("입력한 인원 수 초과");
                	}else{
	            		$(this).css("background-color","red").css("color","white");
		            	var input = $("<input/>");
	                	input = input.attr("type", "hidden").attr("name","seatid").attr("value",$(this).val());
	                	$("#select").append(input);	
                	}
 				}
            	
            });
        	
       });	//ready
	</script> 

</head>


<body>
    <div class="empty-row"></div>
    <div class="container-50 out-align-center">
        <form action ="<c:url value='/payment'/>" method="get">
 
        <h1 class="font-big" style="font-size: 40px; color:rgb(255,0,127);"><b>좌석 선택하기</b></h1>
              <!--인원선택-->    
              <div class="form-group">
                  <label class="col-form-label" for="adult">성인</label>
                  <input type="text" name ="adult" class="form-control" placeholder="인원수 입력 ex) 3" value="0" id="adult">
                  <label class="col-form-label" for="child">어린이</label>
                  <input type="text" name ="child"  class="form-control" placeholder="인원수 입력 ex) 3" value="0" id="child">
                  <label class="col-form-label" for="senior">어르신</label>
                  <input type="text" name ="senior"  class="form-control" placeholder="인원수 입력 ex) 3" value="0" id="senior">
                  <div id="mantotal"></div>
                </div>
                
               <div class="row"><input type="button" id="man" class="special form-btn-full" value="인원 선택 완료"></div>
                <input type = "hidden" name="theaterid" value="${theaterid}">
                <input type = "hidden" name="movieid" value="${movieid}" ><br>
                <input type = "hidden" name="scheduleid" value="${scheduleid}">
                <input type = "hidden" name="screenid" value="${screenid}" ><br>
               <!-- 좌석 뿌려주기 -->
                   <div class="screen">screen</div>
				    <div class="empty-row"></div>
					<div class="seat-wrap">
						<c:forEach var="r" begin="0" end="11">
						    <c:forEach var="c" begin="1" end="23">
						        <div class="seat" id="&#${r+97};${c}"> <!--  (만약 ID가 해당되면 색갈 변경)  -->
						            &#${r+97};${c}
						        </div>
						    </c:forEach>
						    <br>
						</c:forEach>
					</div>
				   <div class="empty-row"></div>
     
               <div class="row"><input type="submit" id="nextpagebtn" class="special form-btn-full" value="다음 단계로" style="display:none"></div>  							
              
            	<div id="select"></div>
        </form>
       </div>
</body>

</html>



<jsp:include page="/WEB-INF/view/design/footer.jsp"></jsp:include>

	