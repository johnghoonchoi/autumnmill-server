<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.*" %>
<%@ page import="java.net.URLEncoder" %>

<%
/*
request.setCharacterEncoding("utf-8");
String menuname = request.getParameter("txtmenuname");
String price = request.getParameter("txtprice");
String category = request.getParameter("rdcategory");
String image = request.getParameter("");
String about = request.getParameter("txtabout");

*/
%>


<html>
<head><title>조회 페이지 입니다.</title></head>
<body>

<table width="100%" border="1">
<tr>
<td>no</td>
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
String query = "select * from menu order by p_no";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

stmt = conn.createStatement();
rs= stmt.executeQuery(query);
//json배열 선언
JSONArray arr = new JSONArray();
System.out.println("=======================================");

while(rs.next()){
	
	/*
	//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
	String menuNum = URLEncoder.encode(rs.getString("p_no"),"utf-8");
	String menuName = URLEncoder.encode(rs.getString("p_name"),"utf-8");
	String menuPrice = URLEncoder.encode(rs.getString("p_price"),"utf-8");
	String menuCategory = URLEncoder.encode(rs.getString("p_category"),"utf-8");
	String menuImage = URLEncoder.encode(rs.getString("p_image"),"utf-8");
	String menuAbout = URLEncoder.encode(rs.getString("p_about"),"utf-8");
	이렇게 하니까 한글이 깨지네요 
	*/
	
	//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
		String menuNum = rs.getString("p_no");
		String menuName = rs.getString("p_name");
		String menuPrice = rs.getString("p_price");
		String menuCategory = rs.getString("p_category");
		String menuImage = rs.getString("p_image");
		String menuAbout = rs.getString("p_about");
		
		
	
	
	
	//제이슨 객체 생성
	JSONObject obj = new JSONObject();
	obj.put("id", menuNum);
	obj.put("name", menuName);
	obj.put("price", menuPrice);
	obj.put("category",menuCategory);
	obj.put("picture",menuImage);
	obj.put("about",menuAbout);
	
	if(obj != null){
		arr.add(obj);
	}
	

		
%>

<tr>
<td><%= rs.getString("p_no") %>
<td><%= rs.getString("p_name") %></td>
<td><%= rs.getString("p_price") %> </td>
<td> <%= rs.getString("p_category") %> </td>
<td><%= rs.getString("p_image") %> </td>
<td> <%= rs.getString("p_about") %> </td>
</tr>
<%

%>
<%}
//콘솔 출력 하기
	System.out.println(arr);

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