<%@ page import="org.member.dao.MemberDAO" %>
<%@ page import="org.member.dao.MemberDAOimpl" %>
<%@ page import="org.member.dto.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-31(031)
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%
        String userid = (String) session.getAttribute("userid");
        MemberDAO dao = MemberDAOimpl.getInstance();
        MemberDTO member = dao.findById(userid);
    %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%=userid%>님 반갑습니다. / <a href="logout.jsp">로그아웃</a>
<br><br>
<h3>회원정보변경 / <a href="userDelete.jsp">회원탈퇴</a></h3>
<form action="memberUpdate.jsp" method="post">
<input type="hidden" name="userid" id="userid" value="<%=userid%>">
<table>
    <tr>
        <td>이름</td>
        <td><input type="text" name="name" id="name" value="<%=member.getName()%>"></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td><input type="text" name="pwd" id="pwd" value="<%=member.getPwd()%>"></td>
    </tr>
    <tr>
        <td>이메일</td>
        <td><input type="text" name="email" id="email" value="<%=member.getEmail()%>"></td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td><input type="text" name="phone" id="phone" value="<%=member.getPhone()%>"></td>
    </tr>
    <tr>
        <td colspan="2">
            등급
            <label class="form-check-label" for="radio1">
                일반회원 <input type="radio" class="form-check-input" id="radio1" value="0">
            </label>
            <label class="form-check-label" for="radio2">
                관리자 <input type="radio" class="form-check-input" id="radio2" value="1">
            </label>
            <script>
                if (<%=member.getAdmin()%> == 0)
                {
                    $("input:radio[value='0']").prop("checked", true);
                }
                else
                {
                    $("input:radio[value='1']").prop("checked", true);
                }
            </script>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <button>수정</button>
            <input type="reset" value="취소">
        </td>
    </tr>
</table>
</form>
</body>
</html>
