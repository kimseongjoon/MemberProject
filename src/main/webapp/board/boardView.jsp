<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="org.board.dto.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오후 3:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));

    BoardDAO dao = BoardDAO.getInstance();
    BoardDTO bd = dao.boardView(num);

    int ref = bd.getRef();
    int re_step = bd.getRe_step();
    int re_level = bd.getRe_level();
%>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function del() {
            if (confirm("정말 삭제할까요?")) {
                location.href = "deletePro.jsp?num=" + <%=num%>;
            }
        }
    </script>
</head>
<body>
<table border="1" cellspacing="0">
    <tr>
        <td>글번호</td>
        <td><%=bd.getNum()%></td>
        <td>조회수</td>
        <td><%=bd.getReadcount()%></td>
    </tr>
    <tr>
        <td>작성자</td>
        <td><%=bd.getWriter()%></td>
        <td>작성일</td>
        <td><%=bd.getReg_date()%></td>
    </tr>
    <tr>
        <td>글제목</td>
        <td colspan="3"><%=bd.getSubject()%></td>
    </tr>
    <tr>
        <td>글내용</td>
        <td colspan="3"><%=bd.getContent()%></td>
    </tr>
    <tr>
        <td align="center" colspan="4">
            <input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=num%>'"/>
            <input type="reset" value="글삭제" onclick="del()"/>
            <input type="button" value="답글쓰기" onclick="location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'"/>
            <input type="button" value="목록보기" onclick="location.href='list.jsp'"/>
        </td>
    </tr>
</table>
</body>
</html>
