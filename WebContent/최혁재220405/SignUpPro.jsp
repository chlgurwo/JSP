<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String sex = request.getParameter("sex");
	String joinpath = request.getParameter("joinpath");
	String location = request.getParameter("location");
	String memo = request.getParameter("memo");
%>

<meta charset="UTF-8">
<title>회원가입 양식</title>
</head>
<body>
	당신의 성함은 <%=name %> <br><br>
	당신의 아이디는 <%=id %> <br><br>
	당신의 암호는 <%=pwd %> <br><br>
	당신의 이메일은 <%=email %> <br><br>
	당신의 성별은 <%=sex %> <br><br>
	가입경로 <%=joinpath %> <br><br>
	주소지 <%=location %> <br><br>
	메모 <%=memo %>
</body>
</html>