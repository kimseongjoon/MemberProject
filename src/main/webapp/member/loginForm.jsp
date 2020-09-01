<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-31(031)
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(function () {
        $('#loginBtn').click(function () {
            if ($('#userid').val() == "") {
                alert("ID 입력");
                $('userid').focus();
                return false;
            }
            if ($('#pwd').val() == "") {
                alert("PWD 입력");
                $('pwd').focus();
                return false;
            }
            $.ajax({
                type: "post",
                url: "loginPro.jsp",
                data: {"userid": $("#userid").val(), "pwd": $("#pwd").val()},
                success: function (d) {
                    if (d.trim() == -1) {
                        alert("회원이 아닙니다. 회원가입하세요");
                    } else if (d.trim() == 2) {
                        alert("비밀번호가 틀립니다. 비번 확인하세요");
                    } else if (d.trim() == 0) {
                        $(location).attr("href", "memberView.jsp");
                    } else if (d.trim() == 1) {
                        $(location).attr("href", "memberList.jsp");
                    }
                },
                error: function (e) {
                    alert("error:" + e);
                }
            })
        })
    });
</script>
<body>
<form>
    <table>
        <tr>
            <td>
                <label for="userid">아이디</label>
            </td>
            <td>
                <input type="text" id="userid" name="userid">
            </td>
        </tr>
        <tr>
            <td>
                <label for="pwd">암호</label>
            </td>
            <td>
                <input type="password" id="pwd" name="pwd">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <input type="button" value="로그인" id="loginBtn">
                <input type="reset" value="취소">
                <input type="button" value="회원가입" onclick="location.href='memberForm.jsp'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
