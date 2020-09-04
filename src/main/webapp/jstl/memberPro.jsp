<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("utf-8");
    String userid = request.getParameter("userid");
//    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String pwd = request.getParameter("pwd");
    String admin = request.getParameter("admin");
    String email = request.getParameter("email");
%>
<body>

</body>
<sql:setDataSource dataSource="jdbc/member" var="dataSource" scope="application"/>
<sql:update dataSource="${dataSource}">
    INSERT INTO MEMBER(NAME, USERID, PWD, EMAIL, PHONE, ADMIN) VALUES (?, ?, ?, ?, ?, ?)
<%--    <sql:param value="<%=name%>"/>
    <sql:param value="<%=userid%>"/>
    <sql:param value="<%=pwd%>"/>
    <sql:param value="<%=email%>"/>
    <sql:param value="<%=phone%>"/>
    <sql:param value="<%=admin%>"/>--%>
    <sql:param value="${param.name}"/>
    <sql:param value="<%=userid%>"/>
    <sql:param value="<%=pwd%>"/>
    <sql:param value="<%=email%>"/>
    <sql:param value="<%=phone%>"/>
    <sql:param value="<%=admin%>"/>
</sql:update>

<c:import url="memberList.jsp"/>