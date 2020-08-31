<%@ page import="org.member.dao.MemberDAO" %>
<%@ page import="org.member.dao.MemberDAOimpl" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-31(031)
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String userid = request.getParameter("userid");
    String pwd = request.getParameter("pwd");
    MemberDAO dao = MemberDAOimpl.getInstance();

    int flag = dao.loginCheck(userid, pwd);
    if (flag == 0 || flag == 1) {
        session.setAttribute("userid", userid);
    }
    out.print(flag);
%>
