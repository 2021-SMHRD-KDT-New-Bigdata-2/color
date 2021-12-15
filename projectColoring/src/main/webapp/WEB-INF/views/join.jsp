<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${cpath}/resources/css/style1.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Coloring - Describe Your Emotions</title>
</head>
<script type="text/javascript">
function checkBtn(){
	var user_email=$("#user_email").val();
    if(user_email==""){
       alert("이메일은 필수 입력사항입니다.");
       $("#user_email").focus();
       return false;
    }
    var user_id=$("#user_id").val();
    if(user_id==""){
       alert("아이디는 필수 입력사항입니다.");
       $("#user_id").focus();
       return false;
    }
    var user_pwd=$("#user_pwd").val();
    if(user_pwd==""){
       alert("비밀번호는 필수 입력사항입니다.");
       $("#user_pwd").focus();
       return false;
    }
    var user_name=$("#user_name").val();
    if(user_name==""){
       alert("이름은 필수 입력사항입니다.");
       $("#user_name").focus();
       return false;
    }
    var user_phone=$("#user_phone").val();
    if(user_phone==""){
       alert("전화번호는 필수 입력사항입니다.");
       $("#user_phone").focus();
       return false;
    }
     $("#frm").submit();
     
}
</script>
<body>
	<div class="login-form">
		<form action="${cpath}/register.do" method="post" id="frm">
			<div style="text-align: center; margin-bottom: 10%;">
				<img src="${cpath}/resources/images/colorLogo.png"
					style="width: 50%; height: 50%;"> <img
					src="${cpath}/resources//images/coloringLogo_small.png"
					style="width: 50%; height: 50%;">
			</div>
			<input type="text" name="user_email" class="text-field"
				placeholder="Email" id="user_email"> <input type="text"
				name="user_id" class="text-field" placeholder="아이디" id="user_id">
			<input type="password" name="user_pwd" class="text-field"
				placeholder="비밀번호" id="user_pwd"> <input type="text"
				name="user_name" class="text-field" placeholder="이름" id="user_name">
			<input type="text" name="user_phone" class="text-field"
				placeholder="핸드폰번호" id="user_phone">
			<button type="button" class="submit-btn" onclick="checkBtn()" style="cursor:pointer;">가입</button>
		</form>
	</div>
</body>
</html>