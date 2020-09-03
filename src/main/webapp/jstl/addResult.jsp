<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
    int num1 = Integer.parseInt(request.getParameter("num1"));
    int num2 = Integer.parseInt(request.getParameter("num2"));

    int sum = num1 + num2;
%>
<body>
    덧셈결과<%=sum%> <hr>
    결과<%=num1 + num2%> <hr>
<%
    if (num1 % 2 == 0) {

    } else {

    }
%>
</body>
</html>
