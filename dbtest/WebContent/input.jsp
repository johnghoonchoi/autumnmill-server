<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/dbtest/DBtest.jsp" method="post">
	
	id : <input type="text" name ="txtid"> <br>
	password : <input type="text" name ="txtpassword"> <br>
	name : <input type="text" name ="txtname"><br>
	email : <input type="text" name ="txtemail"><br>
	<br>
	<input type="submit" value="입력 완료">
	<input type="button" value="메인페이지로!" onclick="location.href='main.jsp'";>
	
	
	
	
	
	</form>
</body>
</html>