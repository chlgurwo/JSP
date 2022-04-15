<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	//한글 처리
	request.setCharacterEncoding("utf-8");
	
	// 1. 드라이버 코드
	Class.forName("org.mariadb.jdbc.Driver");
	
	// 2. 커넥션 연결
	String url = "jdbc:mariadb://localhost:3307/hyukjaedb";
	Connection con = DriverManager.getConnection(url, "root", "1111");
%>