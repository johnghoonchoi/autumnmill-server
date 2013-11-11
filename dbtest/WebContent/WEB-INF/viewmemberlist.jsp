<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="test" class="jong.Jong" scope="page" />
<%
	String memberID = request.getParameter("txtid");
	String password = request.getParameter("txtpassword");
	String name = request.getParameter("txtname");
	String email = request.getParameter("txtemail");


%>


<html>
<head><title>asd</title></head>
<body>
	<% test.setName("´ÚÃÄ"); %>
	<%= test.getName() %>
	<table width="100%">
	<tr>
	<td> name</td>
	<td>id</td>
	<td>email</td>
	</tr>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
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
			
			stmt = conn.createStatement();
			
			rs= stmt.executeQuery(query);
			
			while(rs.next()){
		
	
	%>
	<tr>
	
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("memberid") %> </td>
		<td> <%= rs.getString("email") %> </td>
		
		</tr>
		<%}
			}
			catch(SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
			}
		finally{
			if(rs != null) try{
				rs.close(); } catch(SQLException ex){
					
				}
			if(stmt != null) try{
				stmt.close();
			} catch(SQLException ex){}
			
			if(conn != null) try{ conn.close();} catch(SQLException ex) {}
				
			}
		
			%>
	
	</table>


</body>
</html>