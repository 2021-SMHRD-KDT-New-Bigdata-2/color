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

<!-- Style 시작 -->
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
<body id="page-top">
	<!-- 상단 로그인, 로그아웃 바 시작 -->
	<nav class="navbar navbar-default" style="padding-top: 0%">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="${cpath}/"> <img
					id="logo" src="${cpath}/resources/images/coloringLogo_small.png"
					alt="Treviso theme logo"></a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1" style="padding-top: 0.6%">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<c:if test="${userVO==null}">
						<li>
							<!-- modal 시작 --> <a id="loginBtn" style="cursor: pointer;">LOG
								IN</a>
							<div class="modal fade" id="loginModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="login-form" style="margin-bottom: 10%">
										<div style="text-align: center; margin-bottom: 10%;">
											<img src="${cpath}/resources/images/colorLogo.png"
												style="width: 50%; height: 50%;"> <img
												src="${cpath}/resources//images/coloringLogo_small.png"
												style="width: 50%; height: 50%;">
										</div>
										<form action="${cpath}/Login.do" method="post">
											<input type="text" name="user_id" class="text-field"
												placeholder="아이디"> <input type="password"
												name="user_pwd" class="text-field" placeholder="비밀번호">
											<input type="submit" value="로그인" class="submit-btn">
										</form>
									</div>
								</div>
							</div> <!-- modal 끝 -->
						</li>
						<li><a id="joinBtn" style="margin-left: 5%; cursor: pointer;"
							onClick="location.href='join'">JOIN</a></li>
					</c:if>
					<c:if test="${userVO!=null}">
						<li style="font-size: 16px; margin-top: 3%">Welcome,
							${userVO.getUser_name()}.</li>
						<li><a id="mypageBtn"
							onClick="location.href='${cpath}/mypage'"
							style="cursor: pointer;">MY PAGE</a></li>
						<li><a id="logoutBtn" onClick="location.href='Logout.do'"
							style="cursor: pointer;">LOG OUT</a></li>

					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단 로그인, 로그아웃 바 끝 -->

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
					<div class="palettes_list">
						<ul id="palettes_result" class="palettes">
						</ul>
					</div>
				</div>
			</section>
		</div>
		<div class="palettes_list">
			<ul class="palettes">
				<c:forEach var="vo" items="${list}">
					<li><div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color1};">
								<span class="hex">${vo.palette_color1}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color2};">
								<span class="hex">${vo.palette_color2}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color3};">
								<span class="hex">${vo.palette_color3}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color4};">
								<span class="hex">${vo.palette_color4}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color5};">
								<span class="hex">${vo.palette_color5}</span>
							</div>
						</div></li>
				</c:forEach>
			</ul>
		</div>
	</section>


	<!-- Modal for portfolio item 1 -->
	<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-1">Dean & Letter</h4>
				</div>
				<div class="modal-body">
					<img src="${cpath}/resources/images/demo/portfolio-1.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 2 -->
	<div class="modal fade" id="Modal-2" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-2">Startup Framework</h4>
				</div>
				<div class="modal-body">
					<img src="${cpath}/resources/images/demo/portfolio-2.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 3 -->
	<div class="modal fade" id="Modal-3" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-3">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-3">Lamp & Velvet</h4>
				</div>
				<div class="modal-body">
					<img src="${cpath}/resources/images/demo/portfolio-3.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 4 -->
	<div class="modal fade" id="Modal-4" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-4">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-4">Smart Name</h4>
				</div>
				<div class="modal-body">
					<img src="${cpath}/resources/images/demo/portfolio-4.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 5 -->
	<div class="modal fade" id="Modal-5" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-5">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-5">Fast People</h4>
				</div>
				<div class="modal-body">
					<img src="${cpath}/resources/images/demo/portfolio-5.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script type="text/javascript">
		function sendInput() {
			var inputText = $("#inputText").val();
			if (inputText == "") {
				alert("텍스트를 입력해주세요.");
				$("#inputText").focus();
				return false;
			}
			$.ajax({
				url : "${cpath}/genPalette.do",
				type : "get",
				data : {
					"inputText" : inputText
				},
				dataType : "json",
				success : showPalResult,
				error : function() {
					alert("fail");
				}
			});
		}
		function showPalResult(data) {
			for (var i = 0; i < 4; i++) {
				var view = "<li>";
				view += "<div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color1+";'>";
				view += "<span class='hex'>" + data[i].palette_color1 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color2+";'>";
				view += "<span class='hex'>" + data[i].palette_color2 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color3+";'>";
				view += "<span class='hex'>" + data[i].palette_color3 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color4+";'>";
				view += "<span class='hex'>" + data[i].palette_color4 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color5+";'>";
				view += "<span class='hex'>" + data[i].palette_color5 + "</span>";
				view += "</div>";
				view += "</div>";
				view += "<a class='savePalette' style='cursor: pointer;'>저장하기</a>"
				view += "</li>";
				$("#palettes_result").append(view).children(':last').hide()
						.fadeIn();
			}
		}
		$('#loginBtn').click(function(e) {
			e.preventDefault();
			$('#loginModal').modal('show');
		});

		$(".colorDiv").click(function() {
			$('#inputText').val(this.id);
			$('#searchColorBtn').click();
		});

		$(document).ready(function() {
			$(".colorDiv").tooltip();
		});

		// 클릭시 복사
		$(document).on("click", ".palette_color", function() {
			var tmp = document.createElement("textarea");
			document.body.append(tmp);
			tmp.value = $(this).children().html();
			tmp.select();
			document.execCommand('copy');
			document.body.removeChild(tmp);
			$(this).children().html("Copied!");
		});

		// 마우스 호버 헥스코드 표시/초기화
		var tmp_code
		$(document).on("mouseenter", ".palette_color", function() {
			tmp_code = $(this).children().html();
			$(this).children().css("color", getColorByLuma(tmp_code))
			$(this).children().css("display", "inline");
		});
		$(document).on("mouseleave", ".palette_color", function() {
			$(this).children().css("display", "none");
			$(this).children().html(tmp_code);
		});

		// 밝기 값에 따라서 텍스트 색상 변경
	    function getColorByLuma(hexColor) {
	      const c = hexColor.substring(1)      // 색상 앞의 # 제거
	      const rgb = parseInt(c, 16)   // rrggbb를 10진수로 변환
	      const r = (rgb >> 16) & 0xff  // red 추출
	      const g = (rgb >>  8) & 0xff  // green 추출
	      const b = (rgb >>  0) & 0xff  // blue 추출
	      const luma = 0.2126 * r + 0.7152 * g + 0.0722 * b // per ITU-R BT.709
	      // 색상 선택
	      return luma < 127.5 ? "white" : "black"
	    }
		
		// 저장하기 기능
		$(document).on("click",".savePalette",function(){
			var palette_color1 = $(this).parent().find('div:eq(0)').find('div:eq(0)').children().html();
			var palette_color2 = $(this).parent().find('div:eq(0)').find('div:eq(1)').children().html();
			var palette_color3 = $(this).parent().find('div:eq(0)').find('div:eq(2)').children().html();
			var palette_color4 = $(this).parent().find('div:eq(0)').find('div:eq(3)').children().html();
			var palette_color5 = $(this).parent().find('div:eq(0)').find('div:eq(4)').children().html();
			var palette_name = $("#inputText").val();
			var user_seq = "${userVO.user_seq}";
			$.ajax({
				url : "insertMyPalettes.do",
				type : "POST",
				
				data : {
					"palette_name" : palette_name,
					"palette_color1" : palette_color1,
					"palette_color2" : palette_color2,
					"palette_color3" : palette_color3,
					"palette_color4" : palette_color4,
					"palette_color5" : palette_color5,
					"user_seq" : user_seq
				},
				dataType : "text",
				success : function(res){
					console.log(res)
					alert("success");
				},
				error : function(err) {
					console.log(err)
					alert("fail");
				}
			});
		})
		
		
	</script>
</body>
</html>