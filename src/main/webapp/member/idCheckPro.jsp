<%@ page import="org.member.dao.MemberDAO" %>
<%@ page import="org.member.dao.MemberDAOimpl" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String userid = request.getParameter("userid");
    MemberDAO dao = MemberDAOimpl.getInstance();

    String flag = dao.idCheck(userid);

    out.print(flag);
%>