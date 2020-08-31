<%@ page import="org.member.dao.MemberDAO" %>
<%@ page import="org.member.dao.MemberDAOimpl" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-31(031)
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");

    String userid = (String) session.getAttribute("userid");

    MemberDAO dao = new MemberDAOimpl();
    dao.memDelete(userid);
    session.invalidate();
    response.sendRedirect("loginForm.jsp");
%>