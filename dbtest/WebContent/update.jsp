<!-- 수정필요 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ  -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String menuname = request.getParameter("txtmenuname");
String price = request.getParameter("txtprice");
String category = request.getParameter("rdcategory");
String image = request.getParameter("txtimg");
String about = request.getParameter("txtabout");

int updateCount = 0;
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
Statement stmt = null;
PreparedStatement psmt=null;
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/autumnmill";
	String dbUser="root";
	String dbPass="1q2w3e4r";
	String query = "update menu set p_price=?,p_category=?,p_image=?,p_about=?";
	query = query + "where p_name=?";

	conn = DriverManager.getConnection(jdbcDriver , dbUser, dbPass);
	
	psmt = conn.prepareStatement(query);

	psmt.setString(1, price);
	psmt.setString(2, category);
	psmt.setString(3, image);
	psmt.setString(4, about);
	psmt.setString(5, menuname);
	updateCount = psmt.executeUpdate();

}
finally{
	if (stmt != null) try{stmt.close(); } catch(SQLException ex){}
	if (conn != null) try{conn.close(); } catch(SQLException ex){}
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
<%=
	updateCount
%>
수정
</body>
</html>