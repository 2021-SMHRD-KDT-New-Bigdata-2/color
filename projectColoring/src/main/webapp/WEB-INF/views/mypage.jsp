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
}

.colorDiv .tooltip-bottom::after {
	bottom: 100%;
	left: 50%;
	margin-left: -5px;
	border-color: transparent transparent black transparent;
}

<
style>#logo {
	height: 36px;
	width: 150px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.effect-bubba {
	width: 20%;
	height: 20%;
}

.save_icon {
	text-align: right;
}

.palettes_list {
	/* background-color: rgb(254,209,54); */
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	border-radius: 10px;
	overflow: hidden;
}

.myinfo {
	margin-top: 20px;
	padding: 10px 0 12px;
	background-color: #f6f6f6;
	border-top: 1px dotted #e3e3e3;
	border-bottom: 1px dotted #e3e3e3;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
	padding-top: 20px;
	padding-bottom: 20px;
	border: 1px dotted #e3e3e3;
	font-weight: 500;
}

td {
	padding-top: 20px;
	padding-bottom: 20px;
	border: 1px dotted #e3e3e3;
	font-weight: 500;
}

th {
	text-align: center;
}

.myinfo_table {
	height: 40%;
	width: 40%;
	margin-left: auto;
	margin-right: auto;
	padding: 1%;
}
/* 아래쪽 툴팁 끝 */
</style>
<!-- Style 끝 -->

</head>
<body>
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
						<li><a id="mypageBtn" onClick="location.href='${cpath}/'"
							style="cursor: pointer;">HOME</a></li>
						<li><a id="logoutBtn" onClick="location.href='Logout.do'"
							style="cursor: pointer;">LOG OUT</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단 로그인, 로그아웃 바 끝 -->
	<section id="portfolio">
		<!-- <div class="container"> -->
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="section-title">
					<h2>
						<b>INFOMATION</b>
					</h2>
					<div class="myinfo_table">
						<table cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${userVO.getUser_id()}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${userVO.getUser_email()}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${userVO.getUser_name()}</td>
								</tr>
								<tr>
									<th>핸드폰번호</th>
									<td>${userVO.getUser_phone()}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<h2>
						<b>My Favorites</b>
					</h2>
					<div class="palettes_list">
						<ul id="palettes_result" class="palettes">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 팔레트 불러오기 시작 -->
	<script type="text/javascript">
		$(document).ready(function() {
			loadPalettes();
		});

		function loadPalettes() {
			var user_seq = ${userVO.user_seq}
			$.ajax({
				url : "${cpath}/getMyPalettes.do",
				type : "GET",
				data : {
					"user_seq" : user_seq
				},
				dataType : "json",
				success : showPalettes,
				error : function() {
					alert("error");
				}
			});
		}

		function showPalettes(data) {
			console.log(data)
			console.log(data[1])
			for (let i = 0; i < data.length; i++) {
				var view = "<li>";
				view += "<div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color1+";'>";
				view += "<span>" + data[i].palette_color1 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color2+";'>";
				view += "<span>" + data[i].palette_color2 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color3+";'>";
				view += "<span>" + data[i].palette_color3 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color4+";'>";
				view += "<span>" + data[i].palette_color4 + "</span>";
				view += "</div>";
				view += "<div class='palette_color' style='background-color: "+data[i].palette_color5+";'>";
				view += "<span>" + data[i].palette_color5 + "</span>";
				view += "</div>";
				view += "</div>";
				view += "<a href='${cpath}/colorDetail.do?idx=${vo.idx}' class='palettes_name'>" + data[i].palette_name + "</a>";
				view += "<a onclick='deleteMyPalette(" + data[i].palette_seq + ")' style='cursor: pointer;'>삭제하기</a>";
				view += "</li>";
				$("#palettes_result").append(view);
			}
		}

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
		
		// 팔레트 삭제
		function deleteMyPalette(seq) {
			$.ajax({
				url : "${cpath}/deleteMyPalette.do",
				type : "get",
				data : {
					"seq" : seq
				},
				success : function(){location.reload();},
				error : function() {
					alert("error")
				}
			})
		}
		
	</script>
	<!-- 팔레트 불러오기 끝 -->
</body>
</html>