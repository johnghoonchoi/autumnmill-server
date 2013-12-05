<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("utf-8");
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
<td>no</td>
<td>menu name</td>
<td>price</td>
<td>category</td>
<td>image</td>
<td>about</td>
<td>수정</td>
<td>삭제</td>
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
String query = "select * from menu order by p_no";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

stmt = conn.createStatement();

rs= stmt.executeQuery(query);

while(rs.next()){


%>
<tr>
<td><%= rs.getString("p_no") %>
<td><%= rs.getString("p_name") %></td>
<td><%= rs.getString("p_price") %> </td>
<td> <%= rs.getString("p_category") %> </td>
<td><%= rs.getString("p_image") %> </td>
<td> <%= rs.getString("p_about") %> </td>
<td><input type="button" value="수정" onclick="location.href='updateForm.jsp'";>
<td><input type="button" value="삭제" onclick="location.href='input.jsp'";></td>
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