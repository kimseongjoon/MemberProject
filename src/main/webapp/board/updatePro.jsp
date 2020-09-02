<%@ page import="org.board.dto.BoardDTO" %>
<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="org.dao.CommonDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bd" class="org.board.dto.BoardDTO"/>
<jsp:setProperty name="bd" property="*"/>
<%
    BoardDAO dao = BoardDAO.getInstance();

    String ip = request.getRemoteAddr(); // ip 주소
    bd.setIp(ip);

    int flag = dao.boardUpdate(bd); // 6개 컬럼 셋팅
    if (flag == 1) {
        response.sendRedirect("list.jsp");
    } else {
%>
    <script>
        alert("비밀번호가 일치하지 않습니다.");
        history.back(); // history.go(-1)
    </script>
<%
    }
//    CommonDAO<BoardDTO> commonDAO = new CommonDAO<BoardDTO>(BoardDTO.class);
//    commonDAO.insert(bd);

//    out.print(Calendar.getInstance().getTime().toString());
%>