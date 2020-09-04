<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
</body>
${param.id}가 좋아하는 색깔은 ${param.color}
<hr>
<c:choose>
    <c:when test="${param.color == 'yellow'}">
        <c:set var="c" value="노랑색"/>
    </c:when>
    <c:when test="${param.color == 'blue'}">
        <c:set var="c" value="파랑색"/>
    </c:when>
    <c:when test="${param.color == 'orange'}">
        <c:set var="c" value="오렌지색"/>
    </c:when>
    <c:when test="${param.color == 'pink'}">
        <c:set var="c" value="분홍색"/>
    </c:when>
</c:choose>
<c:set var="name" value="${param.id}"/>
<c:if test="${param.id == null || param.id == ''}">
    <c:set var="name" value="GUEST"/>
</c:if>
${name}가 좋아하는 색깔은
<span style="background-color: ${param.color}">${c}</span>
</body>
</html>
