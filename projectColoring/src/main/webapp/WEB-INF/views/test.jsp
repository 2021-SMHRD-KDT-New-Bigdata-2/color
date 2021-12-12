<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${cpath}/resources/js/theme-scripts.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<head>
   <meta charset="UTF-8">
   <title>HTML for python flask</title>
</head>

<body>
 <form>
      <p>이름 : <input type="text" id="inputText" name="inputText"></p>
      <p>이름을 입력하고 제출버튼을 누르세요. <input type="submit" value="제출" onclick="sendInput()" /></p>
  </form>
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
            inputText : inputText
        },
        dataType : 'json',
        success : function(src) {
            console.log(src)
        },
        error : function(){
            alert('요청실패')
        }
        

        });
}

</script>
</html>
