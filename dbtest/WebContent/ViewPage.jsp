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
<% test.setName("닥쳐"); %>
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

try{
String jdbcDriver = "jdbc:mysql://localhost:3306/chap12";;
String dbUser = "root";
String dbPass = "3783296w";
String query = "select * from member order by memberid";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

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


<input type="button"  value="입력페이지로!" onclick="location.href='input.jsp'";>
<input type="button"  value="메인페이지로!" onclick="location.href='main.jsp'";>


</body>
</html>