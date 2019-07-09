$(document).ready(function(){
    $("#Code").blur(function(){
        $.ajax({
            type:"GET",
            async:true,
            url: "/user/checkCodeExists.action",
            data:{"userCode":$(this).val()},
            dataType:"json",
            success:function(data){
               // alert("data:"+JSON.stringify(data));
                if(data.result=="exists"){
                    $("#spnuserCode").html('该用户名已经存在').css("color","red");
                }else{
                    $("#spnuserCode").html('该用户名可以使用').css("color","green");
                }
            }
        });
    });
    $("#Password2").blur(function () {
        $.ajax({
            type:"GET",
            async:true,
            url: "/user/checkPassword.action",
            data:{"userPassword2":$(this).val(),"userPassword":$("#Password2").val()},
            dataType:"json",
            success:function(data){
                 //alert("data:"+JSON.stringify(data));
                if(data.result=="noeq"){
                    $("#userPasswordspan").html("两次密码输入不一致，请重新输入！").css("color","red");
                }else{
                    $("#userPasswordspan").html('两次输入密码一致').css("color","green");
                }
            }
        });
    })

});