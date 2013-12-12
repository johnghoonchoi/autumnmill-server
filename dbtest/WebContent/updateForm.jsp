<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
String menuname = request.getParameter("txtmenuname");
String price = request.getParameter("txtprice");
String category = request.getParameter("rdcategory");
String image = request.getParameter("txtimg");
String about = request.getParameter("txtabout");
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>수정 페이지 입니다.</title>
</head>
<body>
<form action="/dbtest/update.jsp" method="post">

	<ul>
	<li>메뉴이름 : <input type="text" name ="txtmenuname"> <br>
	</li>
	<li>
	가격 : <input type="text" name ="txtprice"> <br>
	</li>
	<li>카테고리 분류 : 
	<ul>
	<li>선물셋트 : <input type="radio" name ="rdcategory" value="선물셋트" > <br>
	</li>
	<li>행사떡 : <input type="radio" name ="rdcategory" value="행사떡" > <br>
	</li>
	<li>개별포장떡 : <input type="radio" name ="rdcategory" value="개별포장떡" > <br>
	</li>
	<li>판매떡 : <input type="radio" name ="rdcategory" value="답례떡" > <br>
	</li>
	<li>떡케익 : <input type="radio" name ="rdcategory" value="떡케익" > <br>
	</li>
	</ul>
	</li>
	<li>이미지 : <input type="text" name="txtimg"> <br>
	</li>
	<li>설명 : <input type="text" name="txtabout" size="60"><br>
	</li>
	</ul>
<input type="submit" value="변경"> 
<input type="button" value="취소" onclick="location.href='main.jsp'";>
<input type="button" value="삭제 페이지로!" onclick="location.href='deleteForm.jsp'";>

</form>
</body>
</html>