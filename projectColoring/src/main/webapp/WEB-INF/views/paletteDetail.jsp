<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<script src="${cpath}/resources/js/colorflow.min.js"></script>
<script src="${cpath}/resources/js/jquery.wheelcolorpicker.js"></script>
<link type="text/css" rel="stylesheet" href="${cpath}/resources/css/wheelcolorpicker.css" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Coloring - Describe Your Emotions</title>
<!-- Style 시작 -->
<style>

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
						<li><a id="mypageBtn" onClick="location.href='${cpath}/'"
							style="cursor: pointer;">HOME</a></li>
						<li>
							<!-- modal 시작 --> <a id="loginBtn" style="cursor: pointer;">LOG
								IN</a>
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

	<div class="modal fade" id="colorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="login-form" style="margin-bottom: 10%">
				<div style="text-align: center; margin-bottom: 10px;">
					<span class="colorModal-display colorHex"></span>
				</div>
				<div style="text-align: center">
					<input id="inputHex" class="colorHex colorHexInput" data-wcp-format="css" value="">
					<br>
					<select name="bo-sack" id="bo-sack-select">
						<option value="bande">Complementary</option>
						<option value="mono">Monochromatic</option>
						<option value="sam-sack">Triadic</option>
						<option value="sa-sack">Tetradic</option>
						<option value="o-sack">Pentadic</option>
					</select>
				</div>
				<div class="palettes_list boSack_list">
					<ul class="palettes boSacks">
						<li>
							<div id="bo-sack" class="colors"></div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="target" class="specific">
		<ul id="list" class="main">
			<li class="mc-block">
				<div class="palette_color callColor"
					style="background-color: ${vo.palette_color1};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color callColor"
					style="background-color: ${vo.palette_color2};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color callColor"
					style="background-color: ${vo.palette_color3};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color callColor"
					style="background-color: ${vo.palette_color4};"></div>
			</li>
			<li class="mc-block">
				<div class="palette_color callColor"
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
					<colgroup>
						<col width="20%">
						<col width="70%">
					</colgroup>
					<tbody>
						<tr>
							<th>Color</th>
							<th>Information</th>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: center;"><span
								class="color-display callColor"
								style="background: ${vo.palette_color1};"> </span></td>
							<td>
								<ul>
									<li><span id="name1"></span></li>
								</ul>
								<ul>
									<li>HEX : <span class="hex" id="hex1">${vo.palette_color1}</span></li>
								</ul>
								<ul>
									<li id="rgb1"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: center;"><span
								class="color-display callColor"
								style="background: ${vo.palette_color2};"> </span></td>
							<td>
								<ul>
									<li><span id="name2"></span></li>
								</ul>
								<ul>
									<li>HEX : <span class="hex" id="hex2">${vo.palette_color2}</span></li>
								</ul>
								<ul>
									<li id="rgb2"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: center;"><span
								class="color-display callColor"
								style="background: ${vo.palette_color3};"> </span></td>
							<td>
								<ul>
									<li><span id="name3"></span></li>
								</ul>
								<ul>
									<li>HEX : <span class="hex" id="hex3">${vo.palette_color3}</span></li>
								</ul>
								<ul>
									<li id="rgb3"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: center;"><span
								class="color-display callColor"
								style="background: ${vo.palette_color4};"> </span></td>
							<td>
								<ul>
									<li><span id="name4"></span></li>
								</ul>
								<ul>
									<li>HEX : <span class="hex" id="hex4">${vo.palette_color4}</span></li>
								</ul>
								<ul>
									<li id="rgb4"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="color-pre" style="text-align: center;"><span
								class="color-display callColor"
								style="background: ${vo.palette_color5};"> </span></td>
							<td>
								<ul>
									<li><span id="name5"></span></li>
								</ul>
								<ul>
									<li>HEX : <span class="hex" id="hex5">${vo.palette_color5}</span></li>
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
	
	$(".callColor").mouseenter(function() {
		var rgb = $(this).css("background-color");
		var hex = rgb2hex(rgb);
		$(".colorModal-display").css("background-color", hex)
		$("#inputHex").val(hex);
		$("#inputHex").trigger("change");
	})
	
	$('.callColor').click(function(e) {
		e.preventDefault();
		$('#colorModal').modal('show');
	});
	
	$("#bo-sack-select").on("change", function() {
      $("#inputHex").trigger("change")
    });
	
	$(function() {
        $('#inputHex').wheelColorPicker();
    });
	
	$(document).on("mousemove", ".jQWCP-wWidget", function() {
		$("#inputHex").trigger("change");
	});

    // 보색을 찾자 ^^77777
    $("#inputHex").on("change", function() {
      var hex = $("#inputHex").val();
      $(".colorModal-display").css("background-color", hex)
      var select = $("#bo-sack-select").val()
      if(select == "bande") {
        bande(hex, select);
      };

      if(select == "mono") {
        mono(hex, select);
      };
      
      if(select == "sam-sack") {
        sam_sack(hex, select);
      };

      if(select == "sa-sack") {
        sa_sack(hex, select);
      };

      if(select == "o-sack") {
        o_sack(hex, select);
      }
    });

    function bande(hex, select) {
      var result = $ui.color.complement(hex);
      var view = "<div class='palette_color' style='background-color:"+result+";'>";
        view += "<span class='hex'>"+result+"</span>";
        view += "</div>";
      $("#bo-sack").html(view);
    };

    function mono(hex, select) {
      var result = [$ui.color.lighten(hex, 50),hex,$ui.color.darken(hex, 50)];
      var view = "";
      $.each(result, function(i, color) {
        view += "<div class='palette_color' style='background-color:"+color+";'>";
        view += "<span class='hex'>"+color+"</span>";
        view += "</div>";
      });
      $("#bo-sack").html(view);
    };
    
    function sam_sack(hex, select) {
      var result = $ui.color.triadic(hex);
      var view = "";
      $.each(result, function(i, color) {
        view += "<div class='palette_color' style='background-color:"+color+";'>";
        view += "<span class='hex'>"+color+"</span>";
        view += "</div>";
      });
      $("#bo-sack").html(view);
    };

    function sa_sack(hex, select) {
      var result = $ui.color.tetradic(hex);
      var view = "";
      $.each(result, function(i, color) {
        view += "<div class='palette_color' style='background-color:"+color+";'>";
        view += "<span class='hex'>"+color+"</span>";
        view += "</div>";
      });
      $("#bo-sack").html(view);
    };

    function o_sack(hex, select) {
      var result = $ui.color.pentadic(hex);
      var view = "";
      $.each(result, function(i, color) {
        view += "<div class='palette_color' style='background-color:"+color+";'>";
        view += "<span class='hex'>"+color+"</span>";
        view += "</div>";
      });
      $("#bo-sack").html(view);
    };

    // rgb -> 헥스
   function rgb2hex(rgb) {
	if (  rgb.search("rgb") == -1 ) {
	     return rgb;
	 } else {
     rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
     function hex(x) {
          return ("0" + parseInt(x).toString(16)).slice(-2);
     }
     return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]); 
	 }
	};
	
	// 클릭시 복사
	$(document).on("click", ".palette_color", function() {
		var tmp = document.createElement("textarea");
		document.body.append(tmp);
		tmp.value = $(this).children().html();
		tmp.select();
		tmp.focus();
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
		const c = hexColor.substring(1) // 색상 앞의 # 제거
		const rgb = parseInt(c, 16) // rrggbb를 10진수로 변환
		const r = (rgb >> 16) & 0xff // red 추출
		const g = (rgb >> 8) & 0xff // green 추출
		const b = (rgb >> 0) & 0xff // blue 추출
		const luma = 0.2126 * r + 0.7152 * g + 0.0722 * b // per ITU-R BT.709
		// 색상 선택
		return luma < 127.5 ? "white" : "black";
	}
    
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
        
        document.getElementById( "name1" ).innerHTML = "Color Name : "+nearestColor(c1).name;
        document.getElementById( "name2" ).innerHTML = "Color Name : "+nearestColor(c2).name;
        document.getElementById( "name3" ).innerHTML = "Color Name : "+nearestColor(c3).name;
        document.getElementById( "name4" ).innerHTML = "Color Name : "+nearestColor(c4).name;
        document.getElementById( "name5" ).innerHTML = "Color Name : "+nearestColor(c5).name;
	});
	
	// 헥스코드 -> rgb
    function hexToRgb(hex) {
      var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
      hex = hex.replace(shorthandRegex, function(m, r, g, b) {
        return r + r + g + g + b + b;
      });
      var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
      return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
      } : null;
    };
	
	// 색상 거리
    function distance(a, b) {
      return Math.sqrt(Math.pow(a.r - b.r, 2) + Math.pow(a.g - b.g, 2) + Math.pow(a.b - b.b, 2));
    };

    // 가장 유사한 색상 찾기
    function nearestColor(colorHex){
      var lowest = Number.POSITIVE_INFINITY;
      var tmp;
      let index = 0;
      baseColors.forEach( (el, i) => {
          tmp = distance(hexToRgb(colorHex), hexToRgb(el.hex))
          if (tmp < lowest) {
            lowest = tmp;
            index = i;
          };   
      });
      return baseColors[index];
    };
	
	// 색상 목록
    const baseColors = [
    {
      "name": "Lavender",
      "hex": 	"E6E6FA"
    },
    {
      "name": "Thistle",
      "hex": 	"D8BFD8"
    },
    {
      "name": "Plum",
      "hex": 	"DDA0DD"
    },
    {
      "name": "Violet",
      "hex": 	"EE82EE"
    },
    {
      "name": "Orchid",
      "hex": 	"DA70D6"
    },
    {
      "name": "Fuchsia",
      "hex": 	"FF00FF"
    },
    {
      "name": "Magenta",
      "hex": 	"FF00FF"
    },
    {
      "name": "MediumOrchid",
      "hex": 	"BA55D3"
    },
    {
      "name": "MediumPurple",
      "hex": 	"9370DB"
    },
    {
      "name": "BlueViolet",
      "hex": 	"8A2BE2"
    },
    {
      "name": "DarkViolet",
      "hex": 	"9400D3"
    },
    {
      "name": "DarkOrchid",
      "hex": 	"9932CC"
    },
    {
      "name": "DarkMagenta",
      "hex": 	"8B008B"
    },
    {
      "name": "Purple",
      "hex": 	"800080"
    },
    {
      "name": "Indigo",
      "hex": 	"4B0082"
    },
    {
      "name": "DarkSlateBlue",
      "hex": 	"483D8B"
    },
    {
      "name": "SlateBlue",
      "hex": 	"6A5ACD"
    },
    {
      "name": "MediumSlateBlue",
      "hex": 	"7B68EE"
    },
    {
      "name": "Pink",
      "hex": 	"FFC0CB"
    },
    {
      "name": "LightPink",
      "hex": 	"FFB6C1"
    },
    {
      "name": "HotPink",
      "hex": 	"FF69B4"
    },
    {
      "name": "DeepPink",
      "hex": 	"FF1493"
    },
    {
      "name": "PaleVioletRed",
      "hex": 	"DB7093"
    },
    {
      "name": "MediumVioletRed",
      "hex": 	"C71585"
    },
    {
      "name": "LightSalmon",
      "hex": 	"FFA07A"
    },
    {
      "name": "Salmon",
      "hex": 	"FA8072"
    },
    {
      "name": "DarkSalmon",
      "hex": 	"E9967A"
    },
    {
      "name": "LightCoral",
      "hex": 	"F08080"
    },
    {
      "name": "IndianRed",
      "hex": 	"CD5C5C"
    },
    {
      "name": "Crimson",
      "hex": 	"DC143C"
    },
    {
      "name": "FireBrick",
      "hex": 	"B22222"
    },
    {
      "name": "DarkRed",
      "hex": 	"8B0000"
    },
    {
      "name": "Red",
      "hex": 	"FF0000"
    },
    {
      "name": "OrangeRed",
      "hex": 	"FF4500"
    },
    {
      "name": "Tomato",
      "hex": 	"FF6347"
    },
    {
      "name": "Coral",
      "hex": 	"FF7F50"
    },
    {
      "name": "DarkOrange",
      "hex": 	"FF8C00"
    },
    {
      "name": "Orange",
      "hex": 	"FFA500"
    },
    {
      "name": "Yellow",
      "hex": 	"FFFF00"
    },
    {
      "name": "LightYellow",
      "hex": 	"FFFFE0"
    },
    {
      "name": "LemonChiffon",
      "hex": 	"FFFACD"
    },
    {
      "name": "LightGoldenrodYellow",
      "hex": 	"FAFAD2"
    },
    {
      "name": "PapayaWhip",
      "hex": 	"FFEFD5"
    },
    {
      "name": "Moccasin",
      "hex": 	"FFE4B5"
    },
    {
      "name": "PeachPuff",
      "hex": 	"FFDAB9"
    },
    {
      "name": "PaleGoldenrod",
      "hex": 	"EEE8AA"
    },
    {
      "name": "Khaki",
      "hex": 	"F0E68C"
    },
    {
      "name": "DarkKhaki",
      "hex": 	"BDB76B"
    },
    {
      "name": "Gold",
      "hex": 	"FFD700"
    },
    {
      "name": "Cornsilk",
      "hex": 	"FFF8DC"
    },
    {
      "name": "BlanchedAlmond",
      "hex": 	"FFEBCD"
    },
    {
      "name": "Bisque",
      "hex": 	"FFE4C4"
    },
    {
      "name": "NavajoWhite",
      "hex": 	"FFDEAD"
    },
    {
      "name": "Wheat",
      "hex": 	"F5DEB3"
    },
    {
      "name": "BurlyWood",
      "hex": 	"DEB887"
    },
    {
      "name": "Tan",
      "hex": 	"D2B48C"
    },
    {
      "name": "RosyBrown",
      "hex": 	"BC8F8F"
    },
    {
      "name": "SandyBrown",
      "hex": 	"F4A460"
    },
    {
      "name": "Goldenrod",
      "hex": 	"DAA520"
    },
    {
      "name": "DarkGoldenrod",
      "hex": 	"B8860B"
    },
    {
      "name": "Peru",
      "hex": 	"CD853F"
    },
    {
      "name": "Chocolate",
      "hex": 	"D2691E"
    },
    {
      "name": "SaddleBrown",
      "hex": 	"8B4513"
    },
    {
      "name": "Sienna",
      "hex": 	"A0522D"
    },
    {
      "name": "Brown",
      "hex": 	"A52A2A"
    },
    {
      "name": "Maroon",
      "hex": 	"800000"
    },
    {
      "name": "DarkOliveGreen",
      "hex": 	"556B2F"
    },
    {
      "name": "Olive",
      "hex": 	"808000"
    },
    {
      "name": "OliveDrab",
      "hex": 	"6B8E23"
    },
    {
      "name": "YellowGreen",
      "hex": 	"9ACD32"
    },
    {
      "name": "LimeGreen",
      "hex": 	"32CD32"
    },
    {
      "name": "Lime",
      "hex": 	"00FF00"
    },
    {
      "name": "LawnGreen",
      "hex": 	"7CFC00"
    },
    {
      "name": "Chartreuse",
      "hex": 	"7FFF00"
    },
    {
      "name": "GreenYellow",
      "hex": 	"ADFF2F"
    },
    {
      "name": "SpringGreen",
      "hex": 	"00FF7F"
    },
    {
      "name": "MediumSpringGreen",
      "hex": 	"00FA9A"
    },
    {
      "name": "LightGreen",
      "hex": 	"90EE90"
    },
    {
      "name": "PaleGreen",
      "hex": 	"98FB98"
    },
    {
      "name": "DarkSeaGreen",
      "hex": 	"8FBC8F"
    },
    {
      "name": "MediumSeaGreen",
      "hex": 	"3CB371"
    },
    {
      "name": "SeaGreen",
      "hex": 	"2E8B57"
    },
    {
      "name": "ForestGreen",
      "hex": 	"228B22"
    },
    {
      "name": "Green",
      "hex": 	"008000"
    },
    {
      "name": "DarkGreen",
      "hex": 	"006400"
    },
    {
      "name": "MediumAquamarine",
      "hex": 	"66CDAA"
    },
    {
      "name": "Aqua",
      "hex": 	"00FFFF"
    },
    {
      "name": "Cyan",
      "hex": 	"00FFFF"
    },
    {
      "name": "LightCyan",
      "hex": 	"E0FFFF"
    },
    {
      "name": "PaleTurquoise",
      "hex": 	"AFEEEE"
    },
    {
      "name": "Aquamarine",
      "hex": 	"7FFFD4"
    },
    {
      "name": "Turquoise",
      "hex": 	"40E0D0"
    },
    {
      "name": "MediumTurquoise",
      "hex": 	"48D1CC"
    },
    {
      "name": "DarkTurquoise",
      "hex": 	"00CED1"
    },
    {
      "name": "LightSeaGreen",
      "hex": 	"20B2AA"
    },
    {
      "name": "CadetBlue",
      "hex": 	"5F9EA0"
    },
    {
      "name": "DarkCyan",
      "hex": 	"008B8B"
    },
    {
      "name": "Teal",
      "hex": 	"008080"
    },
    {
      "name": "LightSteelBlue",
      "hex": 	"B0C4DE"
    },
    {
      "name": "PowderBlue",
      "hex": 	"B0E0E6"
    },
    {
      "name": "LightBlue",
      "hex": 	"ADD8E6"
    },
    {
      "name": "SkyBlue",
      "hex": 	"87CEEB"
    },
    {
      "name": "LightSkyBlue",
      "hex": 	"87CEFA"
    },
    {
      "name": "DeepSkyBlue",
      "hex": 	"00BFFF"
    },
    {
      "name": "DodgerBlue",
      "hex": 	"1E90FF"
    },
    {
      "name": "CornflowerBlue",
      "hex": 	"6495ED"
    },
    {
      "name": "SteelBlue",
      "hex": 	"4682B4"
    },
    {
      "name": "RoyalBlue",
      "hex": 	"4169E1"
    },
    {
      "name": "Blue",
      "hex": 	"0000FF"
    },
    {
      "name": "MediumBlue",
      "hex": 	"0000CD"
    },
    {
      "name": "DarkBlue",
      "hex": 	"00008B"
    },
    {
      "name": "Navy",
      "hex": 	"000080"
    },
    {
      "name": "MidnightBlue",
      "hex": 	"191970"
    },
    {
      "name": "White",
      "hex": 	"FFFFFF"
    },
    {
      "name": "Snow",
      "hex": 	"FFFAFA"
    },
    {
      "name": "Honeydew",
      "hex": 	"F0FFF0"
    },
    {
      "name": "MintCream",
      "hex": 	"F5FFFA"
    },
    {
      "name": "Azure",
      "hex": 	"F0FFFF"
    },
    {
      "name": "AliceBlue",
      "hex": 	"F0F8FF"
    },
    {
      "name": "GhostWhite",
      "hex": 	"F8F8FF"
    },
    {
      "name": "WhiteSmoke",
      "hex": 	"F5F5F5"
    },
    {
      "name": "Seashell",
      "hex": 	"FFF5EE"
    },
    {
      "name": "Beige",
      "hex": 	"F5F5DC"
    },
    {
      "name": "OldLace",
      "hex": 	"FDF5E6"
    },
    {
      "name": "FloralWhite",
      "hex": 	"FFFAF0"
    },
    {
      "name": "Ivory",
      "hex": 	"FFFFF0"
    },
    {
      "name": "AntiqueWhite",
      "hex": 	"FAEBD7"
    },
    {
      "name": "Linen",
      "hex": 	"FAF0E6"
    },
    {
      "name": "LavenderBlush",
      "hex": 	"FFF0F5"
    },
    {
      "name": "MistyRose",
      "hex": 	"FFE4E1"
    },
    {
      "name": "Gainsboro",
      "hex": 	"DCDCDC"
    },
    {
      "name": "LightGray",
      "hex": 	"D3D3D3"
    },
    {
      "name": "Silver",
      "hex": 	"C0C0C0"
    },
    {
      "name": "DarkGray",
      "hex": 	"A9A9A9"
    },
    {
      "name": "Gray",
      "hex": 	"808080"
    },
    {
      "name": "DimGray",
      "hex": 	"696969"
    },
    {
      "name": "LightSlateGray",
      "hex": 	"778899"
    },
    {
      "name": "SlateGray",
      "hex": 	"708090"
    },
    {
      "name": "DarkSlateGray",
      "hex": 	"2F4F4F"
    },
    {
      "name": "Black",
      "hex": 	"000000"
    }];
	</script>
</body>
</html>