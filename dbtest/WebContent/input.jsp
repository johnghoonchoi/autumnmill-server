<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������� �޴� �Է�</title>
</head>
<body>
<h1>Input Data!</h1> <br>

	<form action="/dbtest/DBtest.jsp" method="post">
	<ul>
	<li>�޴��̸� : <input type="text" name ="txtmenuname"> <br>
	</li>
	<li>
	���� : <input type="text" name ="txtprice"> <br>
	</li>
	<li>ī�װ� �з� : 
	<ul>
	<li>������Ʈ : <input type="radio" name ="rdcategory" value="������Ʈ" > <br>
	</li>
	<li>��綱 : <input type="radio" name ="rdcategory" value="��綱" > <br>
	</li>
	<li>�������嶱 : <input type="radio" name ="rdcategory" value="�������嶱" > <br>
	</li>
	<li>�ǸŶ� : <input type="radio" name ="rdcategory" value="��ʶ�" > <br>
	</li>
	<li>������ : <input type="radio" name ="rdcategory" value="������" > <br>
	</li>
	</ul>
	</li>
	<li>�̹��� : <input type="text" name="txtimg"> <br>
	</li>
	<li>���� : <input type="text" name="txtabout" size="60"><br>
	</li>
	</ul>


	<br>
	<input type="submit" value="�Է� �Ϸ�">
	<input type="button" value="������������!" onclick="location.href='main.jsp'";>
	
	
	</form>
</body>
</html>