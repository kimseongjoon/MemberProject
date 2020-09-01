<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오후 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>글쓰기</h3>
<form action="writePro.jsp" method="post">
<table border="1" cellspacing="0">
    <tr>
        <td align="right" colspan="2"><a href="">글목록</a></td>
    </tr>
    <tr>
        <td>이름</td>
        <td><input type="text" name="writer"></td>
    </tr>
    <tr>
        <td>제목</td>
        <td><input type="text" name="subject"></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><input type="text" name="email"></td>
    </tr>
    <tr>
        <td>내용</td>
        <td><textarea cols="50" rows="50" name="content"></textarea></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td><input type="password" name="passwd"></td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <input type="submit" value="글쓰기"/>
            <input type="reset" value="다시작성"/>
        </td>
    </tr>
</table>
</form>
</body>
</html>
