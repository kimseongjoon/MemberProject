<%@ page import="org.board.dto.BoardDTO" %>
<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="java.util.Calendar" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bd" class="org.board.dto.BoardDTO"/>
<jsp:setProperty name="bd" property="*"/>
<%
    BoardDAO dao = BoardDAO.getInstance();
    String ip = request.getRemoteAddr(); // ip 주소

    bd.setIp(ip);
    dao.boardInsert(bd); // 5개 컬럼 셋팅
//    response.sendRedirect("list.jsp");
    out.print(Calendar.getInstance().getTime().toString());
%>