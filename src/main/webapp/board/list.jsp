<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="org.board.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%
    BoardDAO dao = BoardDAO.getInstance();
    ArrayList<BoardDTO> arr = dao.boardList();
%>
</head>
<body>
<div align="right" style="margin-right: 20px">
    <a href="writeForm.jsp">글쓰기</a>
</div>
<h2>게시글 목록</h2>
<div class="container">
    <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>IP주소</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < arr.size(); i++) {
        %>
        <tr>
            <td align="right"><%=arr.get(i).getNum()%></td>
            <td><a href="boardView.jsp?num=<%=arr.get(i).getNum()%>"><%=arr.get(i).getSubject()%></a></td>
            <td><%=arr.get(i).getWriter()%></td>
            <td><%=arr.get(i).getReg_date()%></td>
            <td align="right"><%=arr.get(i).getReadcount()%></td>
            <td><%=arr.get(i).getIp()%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
