<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>구구단</h3>
<%--<table>--%>
<%--    <tr>--%>
<%--        <th>단</th>--%>
<%--        <th>수</th>--%>
<%--        <th>값</th>--%>
<%--    </tr>--%>
<%--&lt;%&ndash;    <c:forEach items="${dan}" var="dd">&ndash;%&gt;--%>
<%--    <c:forEach begin="2" end="9" var="dan">--%>
<%--&lt;%&ndash;        <c:forEach items="${su}" var="ss">&ndash;%&gt;--%>
<%--        <c:forEach begin="1" end="9" var="su">--%>
<%--            <tr>--%>
<%--                <td>${dan}</td>--%>
<%--                <td>${su}</td>--%>
<%--                <td>${dan * su}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </c:forEach>--%>
<%--</table>--%>

<c:forEach begin="2" end="9" var="dan">
    ${dan}단 <br>
    <c:forEach begin="1" end="9" var="su">
        ${dan} * ${su} = ${dan * su} <br>
    </c:forEach>
</c:forEach>
</body>
</html>
