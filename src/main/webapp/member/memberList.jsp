<%@ page import="org.member.dao.MemberDAO" %>
<%@ page import="org.member.dao.MemberDAOimpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.member.dto.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-31(031)
  Time: 오후 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="member.js"></script>
    <%
        String userid = (String) session.getAttribute("userid");
        MemberDAO dao = MemberDAOimpl.getInstance();
        ArrayList<MemberDTO> arr = dao.memList();
        int count = dao.getCount();
    %>
</head>
<body>
<div align="right">
    <a href="memberView.jsp"><%=userid%></a>관리자님 반갑습니다.
    <a href="logout.jsp">로그아웃</a>
    <span id="cnt">전체회원수:<%=count%></span>
</div>
<table border="1" cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <th>이름</th>
        <th>아이디</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>구분</th>
        <th>삭제</th>
    </tr>
    </thead>
    <tbody id="tbody">
    <%
        for (MemberDTO dto : arr) {
            /*int admin = dto.getAdmin();
            String adminStr = "";
            if (admin == 0) {
                adminStr = "일반회원";
            } else if (admin == 1) {
                adminStr = "관리자";
            }*/
            String adminStr = (dto.getAdmin() == 0) ? "일반회원" : "관리자";
    %>
    <tr>
        <td><%=dto.getName()%>
        </td>
        <td><%=dto.getUserid()%>
        </td>
        <td><%=dto.getPhone()%>
        </td>
        <td><%=dto.getEmail()%>
        </td>
        <td><%=adminStr%>
        </td>
        <td><a href="javascript:del('<%=dto.getUserid()%>', '<%=adminStr%>')">삭제</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
