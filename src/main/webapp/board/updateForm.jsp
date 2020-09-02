<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="org.board.dto.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오후 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));

    BoardDAO dao = BoardDAO.getInstance();
    BoardDTO bd = dao.boardView(num);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>글 수정하기</h3>
<form action="updatePro.jsp" method="post">
    <input type="hidden" name="num" value="<%=bd.getNum()%>">
    <table border="1" cellspacing="0">
        <tr>
            <td align="right" colspan="2"><a href="list.jsp">글목록</a></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><%=bd.getWriter()%></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject" value="<%=bd.getSubject()%>"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" value="<%=bd.getEmail()%>"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea cols="50" rows="50" name="content"><%=bd.getContent()%></textarea></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="passwd"></td>
        </tr>
        <tr>
            <td align="center" colspan="2">

                <input type="submit" value="글수정"/>
                <input type="reset" value="다시작성"/>
                <input type="button" value="목록보기" onclick="location.href='list.jsp'"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
