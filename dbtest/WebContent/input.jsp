<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>가을방아 메뉴 입력</title>
</head>
<body>
<h1>Input Data!</h1> <br>
<form action="/dbtest/DBtest.jsp" method="post" ENCTYPE="multipart/form-data">
		
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
	<li>떡케익 : <input type="radio" name ="rdcategory" value="떡케익" > <br>
	</li>
	</ul>
	</li>
	<li>이미지 : <input type="file" name="txtimg"> <br>
	</li>
	<li>설명 : <input type="text" name="txtabout" size="60"><br>
	</li>
	</ul>
	


	<br>
	<input type="submit" value="입력 완료">
	<input type="button" value="메인페이지로!" onclick="location.href='main.jsp'">
	
	
	</form>
</body>
</html>