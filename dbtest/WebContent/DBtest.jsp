
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("txtmenuname");
	String price = request.getParameter("txtprice");
	String category = request.getParameter("rdcategory");
	String image = request.getParameter("txtimg");
	String about = request.getParameter("txtabout");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/autumnmill";
		String dbUser = "root";
		String dbPass = "1q2w3e4r";
		String sql ="insert into menu(p_name, p_price, p_category, p_image, p_about)";
		sql = sql + "values(?,?,?,?,?)";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement(sql);
		//pstmt = conn.prepareStatement("insert into menu(p_name, p_price, p_category, p_image, p_about) values(?,?,?,?,?)");
		pstmt.setString(1, name);
		pstmt.setString(2, price);
		pstmt.setString(3, category);
		pstmt.setString(4, image);
		pstmt.setString(5, about);
		pstmt.executeUpdate();
		
	}
	finally{
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex){}
		if(conn!=null) try {conn.close();} catch(SQLException ex){}
		
	}

%>




<html>
<head><title>오오오오</title></head>
<body>menu table에 새로운 레코드 삽입 완료!
<br>
<input type="button" value="입력페이지로!" onclick="location.href='input.jsp'">
<input type="button" value="조회 페이지로!" onclick="location.href='ViewPage.jsp'">
</body>
</html>