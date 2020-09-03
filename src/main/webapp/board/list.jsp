<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="org.board.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <%
        request.setCharacterEncoding("utf-8");

        String pageNum = request.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }

        String field = "", word = "";
        if (request.getParameter("word") != null) {
            word = request.getParameter("word");
            field = request.getParameter("field");
        }

        int currentPage = Integer.parseInt(pageNum);
        int pageSize = 5; // 한 화면에 보여지는 페이지 수
        int startRow = ((currentPage - 1) * pageSize) + 1;
        int endRow = currentPage * pageSize;

        BoardDAO dao = BoardDAO.getInstance();
        ArrayList<BoardDTO> arr = dao.boardList(field, word, startRow, endRow);
        int count = dao.boardCount(field, word);
        //             23
        int number = count - (currentPage - 1) * pageSize; // 1번 페이지 -> count  2번 페이지 - > count - 5
        String userid = (String) session.getAttribute("userid");
    %>
</head>
<body>
<div class="container">
    <h2>게시글 목록(<%=count%>)</h2>
    <div align="right" style="margin-right: 20px">
        <%
            if (userid != null) {
        %>
        <a href="../member/memberView.jsp"><%=userid%></a>님 반갑습니다. /
<%--        <a href="../member/logout.jsp">로그아웃</a>--%>
        <a href="/Gradle___org_example___Member_Project_1_0_SNAPSHOT_war__exploded_/member/logout.jsp">로그아웃</a>
        <a href="writeForm.jsp">글쓰기</a>
        <%
            }
        %>
    </div>
    <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < arr.size(); i++) {
        %>
        <tr>
<%--            <td align="right"><%=arr.get(i).getNum()%></td>--%>
            <td align="right"><%=number--%></td>
            <td><a href="boardView.jsp?num=<%=arr.get(i).getNum()%>"><%=arr.get(i).getSubject()%>
            </a></td>
            <td><%=arr.get(i).getWriter()%>
            </td>
            <td><%=arr.get(i).getReg_date()%>
            </td>
            <td align="right"><%=arr.get(i).getReadcount()%>
            </td>
            <td><%=arr.get(i).getReg_date()%>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <form action="list.jsp" name="search" method="get">
        <td align="center">
            <select name="field" size="1">
                <option value="subject">제 목
                <option value="writer">작성자
            </select>
            <input type="text" size="16" name="word">
            <input type="submit" name="찾기">
        </td>
    </form>
    <div align="center">
        <%
/*
            int currentPage = Integer.parseInt(pageNum); pageNum가 NULL이면 1
            int pageSize = 5; // 한 화면에 보여지는 컬럼 수
            int startRow = ((currentPage - 1) * pageSize) + 1;
            int endRow = currentPage * pageSize;*/
            if (count > 0) {    // 43 / 8        + (43 % 8==0? +0: +1)
                int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
                int pageBlock = 3; //
                int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
                int endPage = startPage + pageBlock - 1;

                if (endPage > pageCount) {
                    endPage = pageCount;
                }

                if (startPage > pageBlock) {
        %>
<%--                    <a href="list.jsp?pageNum=<%=startPage - pageBlock%>&field=<%=field%>&word=<%=word%>">[이전]</a>--%>
                    <a href="list.jsp?pageNum=<%=startPage - 1%>&field=<%=field%>&word=<%=word%>">[이전]</a>
        <%
                }

                for (int i = startPage; i <= endPage; i++) {
                    if (i == currentPage) {
        %>
                        [<%=i%>]
        <%
                    }
                    else {
        %>
                        <a href="list.jsp?pageNum=<%=i%>&field=<%=field%>&word=<%=word%>"><%=i%></a>
        <%
                    }
                }

                if (endPage < pageCount) {
        %>
<%--                    <a href="list.jsp?pageNum=<%=startPage + pageBlock%>&field=<%=field%>&word=<%=word%>">[다음]</a>--%>
                    <a href="list.jsp?pageNum=<%=endPage + 1%>&field=<%=field%>&word=<%=word%>">[다음]</a>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
