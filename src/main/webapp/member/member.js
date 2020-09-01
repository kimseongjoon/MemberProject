var exp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/

//
// $(function () {
//
//     var validator = $( "#frm" ).validate();
//
//
//     $('#name').on('focustout', function (event) {
//         validator.element( "#name" );
//         alert("bb");
//         // if (this.checkValidity() === false) {
//         //
//         // }
//     });
//
//
//     $('#name').on('blur', function (event) {
//         validator.element( "#name" );
//         alert("aa");
//         // if (this.checkValidity() === false) {
//         //
//         // }
//     });
//
//     $('#send').on("click", function () {
//         $('#frm').submit();
//     });
// });









$(function () { // $(document).ready(function() { 과 같음
    $("#send").click(function () {
        if ($("#name").val() == "") {
            alert("이름을 넣어주세요");
            $("#name").focus();

            return false;
        }

        if ($("#userid").val() == "") {
            alert("아이디를 넣어주세요");
            $("#userid").focus();

            return false;
        }

        if ($("#pwd").val() == "") {
            alert("비밀번호를 입력하세요");
            $("#pwd").focus();

            return false;
        }

        if ($("#pwd").val() != $("#pwd_check").val()) {
            alert("비밀번호가 일치하지 않습니다.");
            $("#pwd_check").focus();

            return false;
        }

        if ($("#email").val() == "") {
            alert("이메일을 넣어주세요");
            $("#email").focus();

            return false;
        }

        if (!$("#phone").val().match(exp)) {
            alert("전화번호 양식이 아닙니다.");
            $("#phone").focus();

            return false;
        }

        $("#frm").submit();
    })
    // 아이디 입력창
    $("#idCheckBtn").click(function () {
        window.open("idCheck.jsp", "", "width = 800 height = 500");

    })

    //아이디 중복확인
    $("#idBtn").on("click", function () {
        $.ajax({
            type:"post",
            url:"idCheckPro.jsp",
            data:{"userid" : $("#userid").val()},
            success:function (d) {
                // alert(d.trim());

                if (d.trim() == "yes") {
                    alert("사용 가능한 아이디입니다.");
                    // } else if (d == "no") {
                    //     alert("사용 불가능한 아이디입니다.");
                    // }
                    var id = $("#userid").val()

                    $(opener.document).find("#userid").val(id);
                    self.close();
                } else {
                    alert("사용 불가능한 아이디입니다.");
                }
            },error:function (e) {
                alert("error:" + e);
            }
        })
    })
});

function del(userid, mode) {

    if (mode == '관리자') {
        alert("관리자는 삭제할 수 없습니다.");
        return
    }
    /*$.ajax({
        method: "get",
        url: "memberDelete.jsp",
        data: {"userid":userid}
    }).done(function (result) {

        d = JSON.parse(result);
        alert(d)
        var htmlStr = ""
        $.each(d.jarr, function (key, val) {
            adminStr = (val.admin == 0) ? "일반회원" : "관리자";
            htmlStr += "<tr>";
            htmlStr += "<td>" + val.name + "</td>";
            htmlStr += "<td>" + val.userid + "</td>";
            htmlStr += "<td>" + val.phone + "</td>";
            htmlStr += "<td>" + val.email + "</td>";
            htmlStr += "<td>" + adminStr + "</td>";
            htmlStr += "<td>삭제</td>";
            htmlStr += "</tr>";
        });

        $("#tbody").html(htmlStr);
        $("#cnt").text(d.countObj.count);
    });*/

    $.getJSON("memberDelete.jsp", {"userid":userid}, function (data) {
        var htmlStr = ""
        $.each(data.jarr, function (key, val) {
            htmlStr += "<tr>";
            htmlStr += "<td>" + val.name + "</td>";
            htmlStr += "<td>" + val.userid + "</td>";
            htmlStr += "<td>" + val.phone + "</td>";
            htmlStr += "<td>" + val.email + "</td>";
            htmlStr += "<td>" + val.adminStr + "</td>";
            htmlStr += "<td><a href=javascript:del('" + val.userid + "','" + val.adminStr + "')>삭제</a></td>";
            /*htmlStr += "<td><a href=\"javascript:del('";
            htmlStr += val.userid;
            htmlStr += "', '";
            htmlStr += adminStr;
            htmlStr += "')\">삭제</a></td>";*/
            htmlStr += "</tr>";
        });

        $("tbody").html(htmlStr);
        $("#cnt").text(data.countObj.cnt);
    });
}