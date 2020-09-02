<%@ page import="org.board.dao.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));

    BoardDAO dao = BoardDAO.getInstance();
    int flag = dao.boardDelete(num);

    if (flag == 1) {
%>
<script>
    alert("삭제완료");
    location.href = "list.jsp";
</script>
<%
    }
%>