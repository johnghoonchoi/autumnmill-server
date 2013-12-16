<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.net.URLEncoder"%>

<html>
<head>
<title>조회 페이지 입니다.</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
String jdbcDriver = "jdbc:mysql://localhost:3306/autumnmill";;
String dbUser = "root";
String dbPass = "1q2w3e4r";
String query = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='선물셋트' order by p_no";
String query2 = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='개별포장떡' order by p_no";
String query3 = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='떡케익' order by p_no";
String query4 = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='행사떡' order by p_no";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

stmt = conn.createStatement();
rs= stmt.executeQuery(query);
//json배열 선언
JSONArray mainarr = new JSONArray();
JSONArray arr = new JSONArray();
JSONArray arr2 = new JSONArray();
JSONArray arr3 = new JSONArray();
JSONArray arr4 = new JSONArray();
JSONObject obj = new JSONObject();
JSONObject obj2 = new JSONObject();
JSONObject obj3 = new JSONObject();
JSONObject obj4 = new JSONObject();
JSONObject mainobj = new JSONObject();

System.out.println("=======================================");

while(rs.next()){
	//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
		String menuNum = rs.getString("p_no");
		String menuName = rs.getString("p_name");
		String menuPrice = rs.getString("p_price");
		String menuImage = rs.getString("p_image");
		String menuAbout = rs.getString("p_about");
	
		//제이슨 객체 생성
		obj.put("id", menuNum);
		obj.put("name", menuName);
		obj.put("price", menuPrice);
		obj.put("picture",menuImage);
		obj.put("about",menuAbout);
		
		if(obj != null){
			arr.add(obj);
		}
	}

		System.out.println("arr출력 " +arr);


rs= stmt.executeQuery(query2);
while(rs.next()){
		//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
		String menuNum = rs.getString("p_no");
		String menuName = rs.getString("p_name");
		String menuPrice = rs.getString("p_price");
		String menuImage = rs.getString("p_image");
		String menuAbout = rs.getString("p_about");
		System.out.println(menuNum+menuName);

		//제이슨 객체 생성
		obj2.put("id", menuNum);
		obj2.put("name", menuName);
		obj2.put("price", menuPrice);
		obj2.put("picture",menuImage);
		obj2.put("about",menuAbout);
		arr2.add(obj2);
	/*	if(obj2 != null){
			arr2.add(obj2);
		}		
*/

	}
			System.out.println("arr2출력 " +arr2);

rs= stmt.executeQuery(query3);
while(rs.next()){
		//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
		String menuNum = rs.getString("p_no");
		String menuName = rs.getString("p_name");
		String menuPrice = rs.getString("p_price");
		String menuImage = rs.getString("p_image");
		String menuAbout = rs.getString("p_about");
		
		//제이슨 객체 생성
		obj3.put("id", menuNum);
		obj3.put("name", menuName);
		obj3.put("price", menuPrice);
		obj3.put("picture",menuImage);
		obj3.put("about",menuAbout);

		if(obj3 != null){
			arr3.add(obj3);
		}		


	}
			System.out.println("arr3출력 " +arr3);


rs= stmt.executeQuery(query4);
while(rs.next()){
		//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
		String menuNum = rs.getString("p_no");
		String menuName = rs.getString("p_name");
		String menuPrice = rs.getString("p_price");
		String menuImage = rs.getString("p_image");
		String menuAbout = rs.getString("p_about");
		
		//제이슨 객체 생성
		obj4.put("id", menuNum);
		obj4.put("name", menuName);
		obj4.put("price", menuPrice);
		obj4.put("picture",menuImage);
		obj4.put("about",menuAbout);

		if(obj4 != null){
			arr4.add(obj4);
		}		



	}	
		System.out.println("arr4출력 " +arr4);

	//콘솔 출력 하기
//		System.out.println(arr);
		mainobj.put("id",1);
		mainobj.put("category","선물셋트");
		mainobj.put("list",arr);
 		mainobj.put("id",2);
		mainobj.put("category","행사떡");
		mainobj.put("list",arr2);
		mainobj.put("id",3);
		mainobj.put("category","개별포장떡");
		mainobj.put("list",arr3);
		mainobj.put("id",4);
		mainobj.put("category","떡케익");
		mainobj.put("list",arr4);
 				
		mainarr.add(mainobj);
		System.out.println("메인 출력 ");
		System.out.println(mainarr);	
%>

<%= mainarr %>	
<%
}


		
		catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
		}
		finally{
		if(rs != null) 
			try{rs.close(); } 
		
			catch(SQLException ex){
			}
		
		if(stmt != null) try{
		stmt.close();
		} catch(SQLException ex){}

		if(conn != null) try{ conn.close();} catch(SQLException ex) {}

		}
%>

	<input type="button" value="입력페이지로!"
		onclick="location.href='input.jsp'";>
	<input type="button" value="메인페이지로!" onclick="location.href='main.jsp'";>


</body>
</html>