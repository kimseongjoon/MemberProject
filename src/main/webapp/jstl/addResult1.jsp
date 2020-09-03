<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
첫번째:${param.num1}<br>
두번째:${param.num2}<br>
<hr>
결과:${param.num1 + param.num2} <br>
<c:set var="no" value="${param.num1}"></c:set>
${no}<br>
<c:out value="${no}"/>
<c:choose>
    <c:when test="${no % 2 == 0}">
        짝수
    </c:when>
    <c:otherwise>
        홀수
    </c:otherwise>
</c:choose>
<hr>
<c:if test="${no%2!=0}">
홀수입니다.
</c:if>
</body>
</html>
