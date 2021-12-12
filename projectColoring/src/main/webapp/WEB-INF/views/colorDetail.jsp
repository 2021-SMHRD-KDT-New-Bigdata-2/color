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

</head>
<body>
<div class="palettes_list">
			<ul class="palettes">
				<c:forEach var="vo" items="${list}">
					<li><div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color1};">
								<span>${vo.palette_color1}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color2};">
								<span>${vo.palette_color2}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color3};">
								<span>${vo.palette_color3}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color4};">
								<span>${vo.palette_color4}</span>
							</div>
							<div class="palette_color"
								style="background-color: ${vo.palette_color5};">
								<span>${vo.palette_color5}</span>
							</div>
						</div></li>
				</c:forEach>
			</ul>
		</div>
</body>
</html>