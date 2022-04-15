<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<%@include file="dbcon.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	// String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	
	// 3. SQL문 준비
	/* String sql = "insert into login(id, pwd) values('" + id +"', '" + pwd + "')"; */
	String sql = "select * from board where name=?";
	
	// 4. SQL문 실행
	/* Statement stmt = con.createStatement(); */
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	
	ResultSet rs = pstmt.executeQuery();
	
	String title="";
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
</head>
<body>
<form action="boardUpdatePro.jsp" method="post">
	<table>
	  <tr>
	   <td>
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
	     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
	      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
	      <td>게시글 수정</td>
	      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
	     </tr>
	    </table>
	   <table>
	     <tr>
	      <td>
	      </td>
	      <td align="center">제목</td>
	      <td><input name="title" size="50" maxlength="100" name="title"></td>
	      <td>
		</td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	    <tr>
	      <td> </td>
	      <td align="center">이름</td>
	      <td><input name="name" size="50" maxlength="50" name="name"></td>
	      <td> </td>
	     </tr>
	      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	    <tr>
	      <td> </td>
	      <td align="center">비밀번호</td>
	      <td><input name="pwd" size="50" maxlength="50" name="pwd"></td>
	      <td> </td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr>
	      <td> </td>
	      <td align="center">내용</td>
	      <td><textarea name="content" cols="50" rows="13"></textarea></td>
	      <td> </td>
	     </tr>
	     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
	     <tr align="center">
	      <td> </td>
	      <td colspan="1"><input type="submit" value="등록">
	      <td> </td>
	     </tr>
	     <%-- <button type="button" onclick="location.href='boardDeletePro.jsp?name=<%=name %>'">삭제</button> --%>
	    </table>
	   </td>
	  </tr>
	 </table>
 </form>
 	<a href="boardDeletePro.jsp?name=<%=name %>"><button>삭제</button></a>
</body>
</html>