<%@ page import="org.board.dao.BoardDAO" %>
<%@ page import="org.board.dto.CommentDTO" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String num = request.getParameter("bnum");

    BoardDAO dao = BoardDAO.getInstance();
    ArrayList<CommentDTO> arr = dao.commentList("4");

    JSONArray jarr = new JSONArray();
    for (CommentDTO dto : arr) {
        JSONObject obj = new JSONObject();

        obj.put("userid", dto.getUserId());
        obj.put("cnum", dto.getCNum());
        obj.put("regdate", dto.getRegdate());
        obj.put("msg", dto.getMsg());
        obj.put("bnum", dto.getBNum());

        jarr.add(obj);
    }

    JSONObject mainObject = new JSONObject();
    mainObject.put("jarr", jarr);

    out.print(mainObject.toString());
%>