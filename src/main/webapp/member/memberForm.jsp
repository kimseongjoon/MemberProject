<%@ page import="org.member.dao.MemberDAOimpl" %>
<%@ page import="org.member.dto.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-27(027)
  Time: 오전 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--<script>
        function IdDupChk() {
            // if (document.getElementById("word").value == "") {
            id = document.querySelector("#userid").value;

            if (id == "") {
                alert("아이디를 입력하세요");
                return;
            } else {
                <%
                    MemberDAOimpl dao = MemberDAOimpl.getInstance();
                    MemberDTO md = dao.findById(id);

//                    if (md == null){
                %>
                alert("사용가능한 아이디입니다.");
                <%
                    } else{
                %>
                alert("이미 사용중인 아이디입니다.")
                <%
                    }
                %>
            }

            frm.submit(); // list.jsp로 field, word값 가지고 이동
        }
    </script>--%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="member.js"></script>

</head>
<body>
<div class="container">
    <h3>회원가입</h3>
    '*' 표시 항목은 필수 입력 항목입니다.
    <form action="memberPro.jsp" id="frm" method="post">
        <div class="form-group">
            <label for="name">(*) 이름: </label>
            <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요" name="name" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="userid">(*) 아이디:</label>
            <div class="form-inline">
                <input type="text" class="form-control mr-sm-2" id="userid" placeholder="아이디를 입력하세요" name="userid" style="width: 90%;" required readonly>
                <input type="button" value="중복 체크" id="idCheckBtn">
            </div>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="pwd">(*) 암호:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="암호를 입력하세요" name="pwd" required>
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="pwd_check">(*) 암호확인:</label>
                    <input type="password" class="form-control" id="pwd_check" placeholder="암호를 다시 입력하세요" name="pwd_check" required>
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" name="email">
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="phone">전화번호:</label>
            <input type="tel" class="form-control" id="phone" placeholder="전화번호를 입력하세요" name="phone" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div>
            등급
            <div class="form-check-inline">
                <label class="form-check-label" for="radio1">
                    일반회원 <input type="radio" class="form-check-input" id="radio1" value="1" checked>
                </label>
            </div>
            <div class="form-check-inline">
                <label class="form-check-label" for="radio2">
                    관리자 <input type="radio" class="form-check-input" id="radio2" value="2">
                </label>
            </div>
        </div>
        <div align="center">
            <button type="submit" class="btn btn-primary" id="send">확인</button> <button type="reset" class="btn btn-primary">취소</button>
        </div>
    </form>
</div>
</body>
</html>
