<%@ page import="org.member.dao.MemberDAOimpl" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-31(031)
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="md" class="org.member.dto.MemberDTO"/>
<jsp:setProperty name="md" property="*"/>
<%
    MemberDAOimpl dao = MemberDAOimpl.getInstance();
    dao.memInsert(md);
    response.sendRedirect("loginForm.jsp");
%>