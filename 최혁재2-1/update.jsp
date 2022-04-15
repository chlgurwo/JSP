<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	String email = request.getParameter("email");

	// 한글 처리
	request.setCharacterEncoding("utf-8");
	
	// 1. 드라이버 코드
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. 커넥션 연결
	String url = "jdbc:mariadb://localhost:3307/hyukjaedb";
	Connection con = DriverManager.getConnection(url, "root", "1111");
	
	// 3. SQL문 준비
	/* String sql = "insert into login1(id, pwd) values('" + id +"', '" + pwd + "')"; */
	String sql = "select * from login1 where email=?";
	
	// 4. SQL문 실행
	/* Statement stmt = con.createStatement(); */
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, email);
	
	ResultSet rs = pstmt.executeQuery();
	
	String name="";
	String pwd2="";
	
	while(rs.next()) {
		name = rs.getString("name");
		pwd2 = rs.getString("pwd");
	}
	
	// 5. 객체 해제
	rs.close();
	pstmt.close();
	con.close();
	
	/* response.sendRedirect("dbcon.jsp"); */
%>
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Noto Sans KR", sans-serif;
  }
  
  a {
    text-decoration: none;
    color: black;
  }
  
  li {
    list-style: none;
  }
  
  .wrap {
    width: 100%;
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
  
  h2 {
    color: tomato;
    font-size: 2em;
  }
  .login_sns {
    padding: 20px;
    display: flex;
  }
  
  .login_sns li {
    padding: 0px 15px;
  }
  
  .login_sns a {
    width: 50px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px;
    border-radius: 50px;
    background: white;
    font-size: 20px;
    box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px rgba(0, 0, 0, 0.1);
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
  
    .delete {
    margin-top: 50px;
    width: 80%;
    padding:10px;
    text-align: center;
    
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
</head>
<body>
<form name="login" action="updatePro.jsp" method="post">
    <div class="wrap">
        <div class="login">
            <h2>회원 정보 수정</h2>
            <div class="login_id">
                <h4>E-mail</h4>
                <input type="email" name="email" id="email" value=<%=email %>>
            </div>
            <div class="login_id">
                <h4>Name</h4>
                <input type="text" name="name" id="name" placeholder="Name" value=<%=name %>>
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="pwd" id="pwd" placeholder="Password" value=<%=pwd2 %>>
            </div>
            <div class="submit">
                <input type="submit" value="submit">
            </div>
            
        </div>
    </div>
</form>
<a href="deletePro.jsp?email=<%=email %>"><button>삭제</button></a>
</body>
</html>