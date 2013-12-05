<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String number = request.getParameter("txtnumber");

int updateCount = 0;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
PreparedStatement psmt=null;
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/autumnmill";
	String dbUser="root";
	String dbPass="1q2w3e4r";
	String query = "DELETE FROM menu ";
	query = query + "WHERE p_no = ?";
	System.out.println(query);
	

	conn = DriverManager.getConnection(jdbcDriver , dbUser, dbPass);
	
	psmt = conn.prepareStatement(query);
	
	psmt.setInt(1, Integer.parseInt(number) );
		
//	psmt.executeQuery();
	psmt.executeUpdate();

}
finally{
	if (psmt != null) try{psmt.close(); } catch(SQLException ex){}
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
ㅇ/ㅅ/
</body>
</html>