<%@ page import="org.member.dao.MemberDAO" %>
<%@ page import="org.member.dao.MemberDAOimpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.member.dto.BoardDTO" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%--
Created by IntelliJ IDEA.
  User: admin
  Date: 2020-09-01(001)
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String userid = request.getParameter("userid");
    MemberDAO dao = MemberDAOimpl.getInstance();
    dao.memDelete(userid);

    ArrayList<BoardDTO> arr = dao.memList();
    int count = dao.getCount();

    JSONArray jarr = new JSONArray();
    for (BoardDTO dto : arr) {
        JSONObject obj = new JSONObject();

        obj.put("name", dto.getName());
        obj.put("userid", dto.getUserid());
        obj.put("phone", dto.getPhone());
        obj.put("email", dto.getEmail());

        String adminStr = (dto.getAdmin() == 0) ? "일반회원" : "관리자";

        obj.put("admin", adminStr);

        jarr.add(obj);
    }

    JSONObject countObj = new JSONObject();
    countObj.put("count", count);

    JSONObject mainObject = new JSONObject();
    mainObject.put("jarr", jarr);
    mainObject.put("countObj", countObj);

    out.print(mainObject.toString());
%>