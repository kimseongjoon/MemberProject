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
});*/
