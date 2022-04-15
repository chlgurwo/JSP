<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="boardPro.jsp" method="post">
	<table>
	  <tr>
	   <td>
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
	     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
	      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
	      <td>글쓰기</td>
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
	    </table>
	   </td>
	  </tr>
	 </table>
 </form>

</body>
</html>