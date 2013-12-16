
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<!-- 파일 중복처리 객체 임포트 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
String urlurl = "192.168.0.30:8080/dbtest/picfolder/";
String fileName ="";
	try{
		String savePath = "/Users/choijohnghoon/autumnmill-server/dbtest/WebContent/picfolder";
		int sizeLimit = 15 * 1024 * 1024 ; // 15메가까지 제한 넘어서면 예외발생
   	 	MultipartRequest multi=new MultipartRequest
   		(request, savePath, sizeLimit,"utf-8", new DefaultFileRenamePolicy());
   	   
   	 	Enumeration formNames=multi.getFileNames(); // 폼의 이름 반환	

	    String formName=(String)formNames.nextElement(); // 자료가 많을 경우엔 while 문을 사용
    
 		fileName=multi.getFilesystemName(formName); // 파일의 이름 얻기
	
	 	//out.print(savePath+fileName);
 		
 		request.setCharacterEncoding("utf-8");
 		String name = multi.getParameter("txtmenuname");
 		String price = multi.getParameter("txtprice");
 		String category = multi.getParameter("rdcategory");
 		String image = "<img src="+"'"+urlurl+fileName+"'"+">";
 		String about = multi.getParameter("txtabout");
		
 		System.out.println(image);
 		
 		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn = null;
 		PreparedStatement pstmt = null;
 		
 		
 		
 		
 		try{
 			String jdbcDriver = "jdbc:mysql://localhost:3306/autumnmill";
 			String dbUser = "root";
 			String dbPass = "1q2w3e4r";
 			String sql ="insert into menu(p_name, p_price, p_category, p_image, p_about)";
 			sql = sql + "values(?,?,?,?,?)";
 			System.out.println(sql);
 			
 			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, name);
 			pstmt.setString(2, price);
 			pstmt.setString(3, category);
 			pstmt.setString(4, image);
 			pstmt.setString(5, about);
 			pstmt.executeUpdate();
 			
 		}
 		finally{
 			if(pstmt!=null) try {pstmt.close();} catch(SQLException ex){}
 			if(conn!=null) try {conn.close();} catch(SQLException ex){}
 			
 		}

 		
	
    	if(fileName == null) { // 파일이 업로드 되지 않았을때
        	out.print("파일 업로드 되지 않았음");
    	} else { // 파일이 업로드 되었을때
        	fileName=new String(fileName.getBytes("8859_1"),"utf-8"); // 한글인코딩 - 브라우져에 출력
        	out.print("User Name : " + multi.getParameter("userName") + "<BR>");
        	out.print("Form Name : " + formName + "<BR>");
        	out.print("File Name : " + fileName);
    	} // end if
    	
    	
    	
    	
	} catch(Exception e) {
	    out.print(e+"예외 상황 발생..! ");
}


	
%>




<html>
<head><title>오오오오</title></head>
<body>menu table에 새로운 레코드 삽입 완료!

<br>
<input type="button" value="입력페이지로!" onclick="location.href='input.jsp'">
<input type="button" value="조회 페이지로!" onclick="location.href='ViewPage.jsp'">
</body>
</html>