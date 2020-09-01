<%@ page import="org.member.dao.MemberDAO" %>
<%@ page import="org.member.dao.MemberDAOimpl" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-31(031)
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="md" class="org.member.dto.BoardDTO"/>
<jsp:setProperty name="md" property="*"/>
<%

//    String userid = (String) session.getAttribute("userid");
//    md.setUserid(userid);

    MemberDAO dao = new MemberDAOimpl();
    int flag = dao.memUpdate(md);
    if (flag == 1) {
//        session.removeAttribute("userid");
        session.invalidate();
        response.sendRedirect("loginForm.jsp");
    }
%>