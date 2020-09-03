<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String[] movieList = {"타이타닉", "시네마 천국", "혹성 탈출", "킹콩"};
    pageContext.setAttribute("movieList", movieList);
%>
<table >
    <tr>
        <th>index</th>
        <th>count</th>
        <th>title</th>
    </tr>
    <c:forEach items="${movieList}" var="movie" varStatus="st">
        <tr>
            <td align="right">${st.index}</td>
            <td align="right">${st.count}</td>
            <td>${movie}</td>
            <th>
                <c:if test="${st.first}">
                    첫번째
                </c:if>
                <c:if test="${st.last == true}">
                    마지막
                </c:if>
            </th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
