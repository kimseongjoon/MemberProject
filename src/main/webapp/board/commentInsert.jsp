<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="org.board.dto.CommentDTO" %>
<%@ page import="org.dao.CommonDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String comment = request.getParameter("comment");
    String bnum = request.getParameter("bnum");

    CommentDTO commentDTO = new CommentDTO();

    String userid = (String) session.getAttribute("userid");
    if (userid == null) {
        out.print(1);
    } else {
        BoardDAO dao = BoardDAO.getInstance();
        commentDTO.setUserId(userid);
        commentDTO.setBNum(bnum);
        commentDTO.setMsg(comment);
//    dao.commentInsert(comment, bnum);

//    CommonDAO<CommentDTO> commonDAO = new CommonDAO<>(CommentDTO.class);
//    commonDAO.insert(commentDTO);

//    out.print(commentDTO.getMsg() + commentDTO.getBNum());
        dao.commentInsert(commentDTO);
    }
%>