<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
</body>
${param.id} 가 좋아하는 색깔은 ${param.color}
<c:choose>
    <c:set var="c" value"노랑색"/>
</c:choose>
<c:choose>
    <c:set var="c" value"노랑색"/>
</c:choose>
<c:choose>
    <c:set var="c" value"노랑색"/>

</c:choose>
<c:choose>
    <c:set var="c" value"노랑색"/>

</c:choose>
<c:set var="name" value="${param.id}"/>
<c:if test="${param.id == null || param.id == "}">
 <c:set var="name" value="GUEST"/>
</c:if>

</body>
</html>
