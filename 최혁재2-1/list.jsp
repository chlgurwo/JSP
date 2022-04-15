<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Noto Sans KR", sans-serif;
  }
  
  a {
    text-decoration: none;
    color: green;
  }
  
  li {
    list-style: none;
  }
  
  table {
  	margin-left: 100px;
  	margin-right: 100px;
  	
  }
  th {
  	border: 1px solid black;
  }
  tr {
  	border: 1px solid black;
  }
  
  .wrap {
    width: 100%;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, 0.1);
  }
  
    .wrap2 {
    width: 30%;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, 0.1);
  }
  
  .login {
    width: 30%;
    height: 600px;
    background: white;
    border-radius: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }
  .h2black {
  	font-size: 2em;
  	color: black;
  	text-align: center;
  }
  h2 {
    color: tomato;
    font-size: 2em;
    text-align: center;
  }
  .login_sns {
    padding: 20px;
    display: flex;
  }
  
  .login_id {
    margin-top: 20px;
    width: 80%;
  }
  
  .login_id input {
    width: 100%;
    height: 50px;
    border-radius: 30px;
    margin-top: 10px;
    padding: 0px 20px;
    border: 1px solid lightgray;
    outline: none;
  }
  
  .login_pw {
    margin-top: 20px;
    width: 80%;
  }
  
  .login_pw input {
    width: 100%;
    height: 50px;
    border-radius: 30px;
    margin-top: 10px;
    padding: 0px 20px;
    border: 1px solid lightgray;
    outline: none;
  }
  
  .login_etc {
    padding: 10px;
    width: 80%;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
  }
  
  .submit {
    margin-top: 50px;
    width: 80%;
  }
  .submit input {
    width: 100%;
    height: 50px;
    border: 0;
    outline: none;
    border-radius: 40px;
    background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
    color: white;
    font-size: 1.2em;
    letter-spacing: 2px;
  }
    </style>
<%
	// 1. JDBC Driver 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. DB와의 연결(connection)을 생성
	String url = "jdbc:mariadb://localhost:3307/hyukjaedb";
	Connection con = DriverManager.getConnection(url, "root", "1111");
	
	// 3. 연결 후 그 통로를 통해 SQL문을 실행시킨다.
	String sql = "select * from login1";
	Statement stmt = con.createStatement();
	
	// 4. SQL문 실행
	ResultSet rs = stmt.executeQuery(sql);
%>
<meta charset="UTF-8">
<title>DB 연동</title>
</head>
<body>
	
	<div class="wrap">
		<div class="wrap2"><h2 class="h2black">회원정보 리스트</h2></div>
	
	<table class="table">
		<tr>
			<th>Email</th>
			<th>Name</th>
			<th>Password</th>
		</tr>
		
<%
	// 5. 반환된 데이터 출력
	while(rs.next()) {
		String email = rs.getString("email");
		String name = rs.getString("name");
		String pwd2 = rs.getString("pwd");
%>
		<tr>
			<td><a href='update.jsp?email=<%=email %>'><%=email %></a></td>
			<td><%=name  %></td>
			<td><%=pwd2  %></td>
		</tr>
		
<%	} %>
	</table>
	</div>
	
<%
	// 6. 객체 해지
	rs.close();
	stmt.close();
	con.close();
%>
</body>
</html>