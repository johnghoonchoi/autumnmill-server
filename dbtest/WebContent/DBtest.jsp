
<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String memberID = request.getParameter("txtid");
	String password = request.getParameter("txtpassword");
	String name = request.getParameter("txtname");
	String email = request.getParameter("txtemail");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/chap12";;
		String dbUser = "root";
		String dbPass = "3783296w";
		String query = "select * from member order by memberid";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("insert into member values(?,?,?,?)");
		pstmt.setString(1, memberID);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.executeUpdate();
		
	}
	finally{
		if(pstmt!=null) try {pstmt.close();} catch(SQLException ex){}
		if(conn!=null) try {conn.close();} catch(SQLException ex){}
		
	}

%>




<html>
<head><title>asd</title></head>
<body>member table에 새로운 레코드 삽입
</body>
</html>