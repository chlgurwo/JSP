<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<%@include file="dbcon.jsp" %>
    
<%
	// 한글 처리
	request.setCharacterEncoding("utf-8");

	// 웹 브라우저에 전달될 정보
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	// 3. SQL문 준비
	/* String sql = "update login1 set name=?, pwd=? where id=?"; */
	String sql = "update login1 set name=?, pwd=? where email=?";
	
	// 4. SQL문 실행
	/* Statement stmt = con.createStatement(); */
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pwd);
	pstmt.setString(3, email);
	
	int i = pstmt.executeUpdate();
	
	// 5. 객체 해제
	pstmt.close();
	con.close();
	
	
	response.sendRedirect("list.jsp");
%>