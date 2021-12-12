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
<link rel="stylesheet" href="${cpath}/resources/css/style3.css" />
<script src="${cpath}/resources/js/bootstrap.min.js"></script>
<script src="${cpath}/resources/js/SmoothScroll.js"></script>
<script src="${cpath}/resources/js/theme-scripts.js"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Coloring - Describe Your Emotions</title>
<style>
#logo {
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
</style>
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
						<li><a onClick="location.href='${cpath}/mypage'"
							style="cursor: pointer;">MYPAGE</a></li>
						<li><a id="logoutBtn" onClick="location.href='Logout.do'"
							style="cursor: pointer;">LOG OUT</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단 로그인, 로그아웃 바 끝 -->

	<div id="target" class="specific">
		<ul id="list" class="main">
			<li class="mc-block">
				<div class="palette_color"
					style="background-color: ${vo.palette_color1};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color"
					style="background-color: ${vo.palette_color2};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color"
					style="background-color: ${vo.palette_color3};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color"
					style="background-color: ${vo.palette_color4};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color"
					style="background-color: ${vo.palette_color5};"></div>
			</li>
		</ul>
	</div>

	<section id="portfolio">
		<div class="color-info">
			<div class="section-title">
				<h2 style="text-align: center;">
					<b>SAVED NAME : ${vo.palette_name}</b>
				</h2>
				<table>
					<tbody>
						<tr>
							<th>Color</th>
							<th>Information</th>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: right;"><span
								class="color-display" style="background: ${vo.palette_color1};">
							</span></td>
							<td>
								<ul>
									<li>HEX: <span id="hex1">${vo.palette_color1}</span></li>
								</ul>
								<ul>
									<li id="rgb1"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: right;"><span
								class="color-display" style="background: ${vo.palette_color2};">
							</span></td>
							<td>
								<ul>
									<li>HEX: <span id="hex2">${vo.palette_color2}</span></li>
								</ul>
								<ul>
									<li id="rgb2"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: right;"><span
								class="color-display" style="background: ${vo.palette_color3};">
							</span></td>
							<td>
								<ul>
									<li>HEX: <span id="hex3">${vo.palette_color3}</span></li>
								</ul>
								<ul>
									<li id="rgb3"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: right;"><span
								class="color-display" style="background: ${vo.palette_color4};">
							</span></td>
							<td>
								<ul>
									<li>HEX: <span id="hex4">${vo.palette_color4}</span></li>
								</ul>
								<ul>
									<li id="rgb4"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: right;"><span
								class="color-display" style="background: ${vo.palette_color5};">
							</span></td>
							<td>
								<ul>
									<li>HEX: <span id="hex5">${vo.palette_color5}</span></li>
								</ul>
								<ul>
									<li id="rgb5"></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	
	// 헥스코드-> RGB 변환
	function changeRGB(hexColor) {
	      const c = hexColor.substring(1)  // 색상 앞의 # 제거
	      const rgb = parseInt(c, 16)   // rrggbb를 10진수로 변환
	      const r = (rgb >> 16) & 0xff  // red 추출
	      const g = (rgb >>  8) & 0xff  // green 추출
	      const b = (rgb >>  0) & 0xff  // blue 추출
	      return "RGB : ("+r+","+g+","+b+")";
	    }
	$(document).ready(function() {
		var c1 = document.getElementById( "hex1" ).innerHTML;
		var c2 = document.getElementById( "hex2" ).innerHTML;
		var c3 = document.getElementById( "hex3" ).innerHTML;
		var c4 = document.getElementById( "hex4" ).innerHTML;
		var c5 = document.getElementById( "hex5" ).innerHTML;

        document.getElementById( "rgb1" ).innerHTML = changeRGB( c1 );
        document.getElementById( "rgb2" ).innerHTML = changeRGB( c2 );
        document.getElementById( "rgb3" ).innerHTML = changeRGB( c3 );
        document.getElementById( "rgb4" ).innerHTML = changeRGB( c4 );
        document.getElementById( "rgb5" ).innerHTML = changeRGB( c5 );
	});
	</script>
</body>
</html>