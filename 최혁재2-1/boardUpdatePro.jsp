<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbcon.jsp" %>

<%
	// 한글 처리
	request.setCharacterEncoding("utf-8");

	// 웹 브라우저에 전달될 정보
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	
	// 3. SQL문 준비
	String sql = "update board set title=?, pwd=?, content=? where name=?";
	
	// 4. SQL문 실행
	/* Statement stmt = con.createStatement(); */
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, pwd);
	pstmt.setString(3, content);
	pstmt.setString(4, name);
	
	int i = pstmt.executeUpdate();
	
	// 5. 객체 해제
	pstmt.close();
	con.close();
	
	
	response.sendRedirect("boardlist.jsp");
%>