<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>수정 페이지 입니다.</title>
</head>
<body>
<form action="/dbtest/delete.jsp" method="post">
	삭제 할 행 번호를 입력 하세요 : <input type="text" name="txtnumber">
<input type="submit" value="삭제"> 
<input type="button" value="수정 페이지로!" onclick="location.href='updateForm.jsp'">
<input type="button" value="메인 페이지로!" onclick="location.href='main.jsp'">

</form>
</body>
</html>