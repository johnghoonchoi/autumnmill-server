<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="jong.FileJson" %>

<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/autumnmill";
			;
			String dbUser = "root";
			String dbPass = "1q2w3e4r";
			String query = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='선물셋트' order by p_no";
			String query2 = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='개별포장떡' order by p_no";
			String query3 = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='떡케익' order by p_no";
			String query4 = "select p_no,p_name,p_price,p_image,p_about from menu where p_category='행사떡' order by p_no";

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			//json배열 선언
			JSONArray mainarr = new JSONArray();
			JSONArray arr = new JSONArray();
			JSONArray arr2 = new JSONArray();
			JSONArray arr3 = new JSONArray();
			JSONArray arr4 = new JSONArray();
			JSONObject obj;
			JSONObject obj2;
			JSONObject obj3;
			JSONObject obj4;
			JSONObject mainobj;

			System.out.println("=======================================");

			while (rs.next()) {
				//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
				String menuNum = rs.getString("p_no");
				String menuName = rs.getString("p_name");
				String menuPrice = rs.getString("p_price");
				String menuImage = rs.getString("p_image");
				String menuAbout = rs.getString("p_about");

				//제이슨 객체 생성
				obj = new JSONObject();
				obj.put("id", menuNum);
				obj.put("name", menuName);
				obj.put("price", menuPrice);
				obj.put("picture", menuImage);
				obj.put("about", menuAbout);

				if (obj != null) {
					arr.add(obj);
				}
			}

			System.out.println("arr출력 " + arr);

			rs = stmt.executeQuery(query2);
			while (rs.next()) {
				obj2 = new JSONObject();

				//json객체에 넣으려고 스트링으로 따로 뺌 -_-;; 
				String menuNum = rs.getString("p_no");
				String menuName = rs.getString("p_name");
				String menuPrice = rs.getString("p_price");
				String menuImage = rs.getString("p_image");
				String menuAbout = rs.getString("p_about");
				System.out.println(menuNum + menuName);

				//제이슨 객체 생성
				obj2.put("id", menuNum);
				obj2.put("name", menuName);
				obj2.put("price", menuPrice);
				obj2.put("picture", menuImage);
				obj2.put("about", menuAbout);
				arr2.add(obj2);
				/*	if(obj2 != null){
						arr2.add(obj2);
					}		
				 */

			}
			System.out.println("arr2출력 " + arr2);

			rs = stmt.executeQuery(query3);
			while (rs.next()) {
				obj3 = new JSONObject();

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
				obj3.put("picture", menuImage);
				obj3.put("about", menuAbout);

				if (obj3 != null) {
					arr3.add(obj3);
				}

			}
			System.out.println("arr3출력 " + arr3);

			rs = stmt.executeQuery(query4);
			while (rs.next()) {
				obj4 = new JSONObject();

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
				obj4.put("picture", menuImage);
				obj4.put("about", menuAbout);

				if (obj4 != null) {
					arr4.add(obj4);
				}

			}
			System.out.println("arr4출력 " + arr4);

			//콘솔 출력 하기
			//		System.out.println(arr);
			
		mainobj = new JSONObject();
			String[] TestArray = new String[4];
			
			TestArray[0]="선물셋트";
			TestArray[1]="행사떡";
			TestArray[2]="개별포장떡";
			TestArray[3]="떡케익";
		
			for(int i = 1; i<5; i++){
				mainobj = new JSONObject();
				
				
				mainobj.put("id", i);
				mainobj.put("category", TestArray[i-1]);
				
				if(i==1){
					//mainobj.put("list",arr);
					mainobj.put("list",arr);
				}
				else if(i==2){
					mainobj.put("list", arr2);				
				}
				else if(i==3){
					mainobj.put("list", arr3);				
				}
				else if(i==4){
					mainobj.put("list", arr4);				
				}
				mainarr.add(mainobj);

			}
		/*
			mainobj.put("id", 1);
			mainobj.put("category", "선물셋트");
			mainobj.put("list", arr);
			
			mainobj.put("idd", 2);
			mainobj.put("categoryy", "행사떡");
			mainobj.put("listt", arr2);
			System.out.println("-----------------1~2---------------------");
			System.out.println(mainobj);
			
			mainobj.put("id", 3);
			mainobj.put("category", "개별포장떡");
			mainobj.put("list", arr3);
			mainobj.put("id", 4);
			mainobj.put("category", "떡케익");
			mainobj.put("list", arr4);
*/
			System.out.println("----------------1~4----------------------");
			System.out.println(mainobj);
			
			System.out.println("메인 출력 ");
			System.out.println(mainarr);
			FileJson fj = new FileJson();
			fj.writeFileIO(mainarr);
			
	%>

	<%=mainarr%>
	<%
		}

		catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				}

				catch (SQLException ex) {
				}

			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException ex) {
				}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}

		}
%>
