<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%    
 	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("txtmenuname");
	String price = request.getParameter("txtprice");
	String category = request.getParameter("txtcategory");
	String image="1q2wxx";
	//String image = "<img src="+urlurl+fileName+">";
	String about = request.getParameter("txtabout");   
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
<%

	System.out.println(name);
System.out.println(price);
System.out.println(category);
System.out.println(image);
System.out.println(about);


%>



</body>
</html>