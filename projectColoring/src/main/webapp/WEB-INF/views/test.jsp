<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${cpath}/resources/js/theme-scripts.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/style.css" />
<link rel="stylesheet" href="${cpath}/resources/css/style1.css" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Coloring - Describe Your Emotions</title>
    
<style>

/* 툴팁 기본 스타일 설정 시작 */
.colorDiv {
	position: relative;
	display: block;
}

.colorDiv .tooltiptext {
	visibility: hidden;
	width: 120px;
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
}

.colorDiv:hover .tooltiptext {
	visibility: visible;
}
/* 툴팁 기본 스타일 설정 끝 */

/* 툴팁 화살표 기본 스타일 설정 시작 */
.colorDiv .tooltiptext::after {
	content: " ";
	position: absolute;
	border-style: solid;
	border-width: 5px;
}
/* 툴팁 화살표 기본 스타일 설정 끝 */

/* 왼쪽 툴팁 시작 */
.colorDiv .tooltip-left {
	top: -5px;
	right: 105%;
}

.colorDiv .tooltip-left::after {
	top: 50%;
	left: 100%;
	margin-top: -5px;
	border-color: transparent transparent transparent black;
}
/* 왼쪽 툴팁 끝 */

/* 오른쪽 툴팁 시작 */
.colorDiv .tooltip-right {
	top: -5px;
	left: 105%;
}

.colorDiv .tooltip-right::after {
	top: 50%;
	right: 100%;
	margin-top: -5px;
	border-color: transparent black transparent transparent;
}
/* 오른쪽 툴팁 끝 */

/* 위쪽 툴팁 시작 */
.colorDiv .tooltip-top {
	width: 120px;
	bottom: 150%;
	left: 50%;
	margin-left: -60px;
}

.colorDiv .tooltip-top::after {
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-color: black transparent transparent transparent;
}
/* 위쪽 툴팁 끝 */

/* 아래쪽 툴팁 시작 */
.colorDiv .tooltip-bottom {
	width: 120px;
	top: 150%;
	left: 50%;
	margin-left: -60px;
	z-index: 500;
}

.colorDiv .tooltip-bottom::after {
	bottom: 100%;
	left: 50%;
	margin-left: -5px;
	border-color: transparent transparent black transparent;
	z-index: 500;
}
/* 아래쪽 툴팁 끝 */
</style>
<!-- Style 끝 -->

</head>


<body>
	<section id="portfolio">
		<div class="container">
			<!-- 텍스트 입력부 시작 -->
			<section id="about" class="mz-module">
				<div class="light-bg">
					<div class="row">
						<div class="col-lg-12 text-center">
							<div class="section-title">
								<h2 class="dye">
									<b>Describe Your Emotions</b>
								</h2>
							</div>
							<div class="color">
								<ul class="bycolor">
									<li>
										<div class="colorDiv" id="red"
											style="background-color: #ff2000; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Red</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="orange"
											style="background-color: #ff7c00; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Orange</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="hotpink"
											style="background-color: #f52394; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Hot Pink</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="purple"
											style="background-color: purple; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Purple</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="blue"
											style="background-color: blue; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Blue</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="sky"
											style="background-color: #00b2d4; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Sky</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="green"
											style="background-color: #00ab00; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Green</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="greenyellow"
											style="background-color: #90e200; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Green Yellow</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="yellow"
											style="background-color: #ffcf00; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Yellow</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="violet"
											style="background-color: #7f00ff; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Violet</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="gray"
											style="background-color: #c4c4c4; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Gray</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="brown"
											style="background-color: #593111; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">Brown</span>
										</div>
									</li>
									<li>
										<div class="colorDiv" id="white"
											style="background-color: white; border: 1px solid black; cursor: pointer;">
											<span class="tooltiptext tooltip-bottom">White</span>
										</div>
									</li>

								</ul>
							</div>
						</div>
					</div>

					<form class="palette-search-form" onsubmit="return false"
						style="margin-top: 40px">
						<div class="input-group" style="margin: 0% 20% 0% 20%;">
							<input onkeypress="if( event.keyCode==13 ){sendInput();}"
								id="inputText" type="text" class="form-control"
								placeholder="Search" style="height: 40px;">
							<div class="input-group-btn">
								<button onclick="sendInput()" class="btn btn-default"
									type="button" id="searchColorBtn"
									style="border: 1px solid #C0C0C0; height: 40px">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
							
						</div>
					</form>
						<div class="input-group" style="margin: 0% 20% 0% 20%;" id='message1'>
							
						</div>
					<div class="palettes_list">
						<ul id="palettes_result" class="palettes">
						</ul>
					</div>
				</div>
			</section>
		</div>
	</section>
	
</body>

<script type="text/javascript">
function sendInput() {
        var inputText = $("#inputText").val();
        if (inputText == "") {
            alert("텍스트를 입력해주세요.");
            $("#inputText").focus();
            return false;
        }
        $.ajax({
            url : 'http://172.30.1.8:8000/post',
            type : 'post',
            data : {
                'inputText' : inputText,
            },
            dataType : 'json',
            success : function(res){
            	console.log("데이터" , res)
            	input(res);
            },
         	error : function(){
                alert('요청실패');
            }

            });
    }
	function input(data){
		var inputText = data.inputText;
		var inputText1 = data.inputText1;
		
		if(inputText1 == null){
			
		}else{
			var searchDiv = document.getElementById('message1');
			searchDiv.innerHTML += "<button id='inputTbtn'>"+inputText1+"</button>"
			searchDiv.innerHTML += "<button id='inputXbtn'>"+"x"+"</button>"
		}
		
		
}
	//inputTbtn 눌렀을 때 복사, 이후 내용 삽입
	$(document).on("click","#inputTbtn",function(){
		var copyT = document.createElement("textarea");
		document.body.append(copyT);
		copyT.value = $(this).html();
		copyT.select();
		document.execCommand('copy');
		document.body.removeChild(copyT);
		$('div').remove('#message1');
	});
	//inputXbtn 그냥 삭제
	$(document).on("click","#inputXbtn",function(){
		$('div').remove('#message1');
	});

</script>
</html>
