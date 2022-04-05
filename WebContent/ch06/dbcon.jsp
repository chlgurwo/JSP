<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>db 연동</title>
</head>
<body>
<%
   //1. jdbc driver를 로드한다.
   Class.forName("org.mariadb.jdbc.Driver");
   
   //2. db와의 연결(connection)을 생성한다.
   String url = "jdbc:mariadb://localhost:3306/hyukjaedb";
   String user ="hyukjaedb";
   String pwd = "1111";
   Connection con = DriverManager.getConnection(url, user, pwd);
   
   //3. 연결 후 그 통로를 통해 sql문을 실행한다.
   String sql = "select * from login";
   Statement stmt=con.createStatement();
   
   //4. 연결확인
   //out.println("연결성공!!!!");
   
   //4. SQL 실행
   ResultSet rs = stmt.executeQuery(sql);
<%  
   //5. 반환된 데이터 출력
   while(rs.next()){
      out.println(rs.getString("id"));
      out.println(rs.getString("pwd"));
%>
   }
   
   //6. 객체해지
   rs.close();
   stmt.close();
   con.close();
   %>

</body>
</html>