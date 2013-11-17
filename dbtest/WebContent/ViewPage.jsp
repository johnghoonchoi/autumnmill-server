<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>

<%
String menuname = request.getParameter("txtmenuname");
String price = request.getParameter("txtprice");
String category = request.getParameter("rdcategory");
String image = request.getParameter("");
String about = request.getParameter("txtabout");


%>


<html>
<head><title>asd</title></head>
<body>

<table width="100%" border="1">
<tr>
<td>menu name</td>
<td>price</td>
<td>category</td>
<td>image</td>
<td>about</td>

</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
String jdbcDriver = "jdbc:mysql://localhost:3306/autumnmill";;
String dbUser = "root";
String dbPass = "1q2w3e4r";
String query = "select * from menu order by menuname";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

stmt = conn.createStatement();

rs= stmt.executeQuery(query);

while(rs.next()){


%>
<tr>

<td><%= rs.getString("menuname") %></td>
<td><%= rs.getString("price") %> </td>
<td> <%= rs.getString("category") %> </td>
<td><%= rs.getString("image") %> </td>
<td> <%= rs.getString("about") %> </td>


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