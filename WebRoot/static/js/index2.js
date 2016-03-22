var effects = new Array("bounceIn","bounceInDown","bounceInLeft","bounceInRight","bounceInUp"); // 出现特效

$(document).ready(function(){
    $(".remove-meal").on("click", remove_user);
    $(".set-admin").on("click", set_admin);
    $(".set-user-status").on("click", set_user_status);
    
	spin_color();
});
function spin_color(){
    console.log("spin");
    $(".spin img").each(function(i){
        i = parseInt(Math.random()*6)+1;
        console.log("asdfasdf");
        path = "static/img/spin/"+i+".png";
        $(this).attr("src", path);
        $(this).addClass("animated");
        $(this).addClass("fadeInDownBig");

        console.log($(this));
  });
}

//激活，锁定用户
function set_user_status(){
    console.log("用户状态设置");
    var r_id = $(this).attr("pk");
    var status = $(this).attr("status");
    
    if(status==0)status=1;
    else status=0;
    console.log(r_id);
    t = $(this);  
    //return;
    $.ajax({
            type:"GET",
            url:"servlet/SetUserStatus",
            //提交的数据
            data:{id:r_id, status:status},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            success:function(data){
            if(data == "true")
            {
                bootbox.alert("<h1>设置成功</h1>", function() {
                	t.html("设置成功");
                	t.removeClass("btn-danger").addClass("btn-info");
                	console.log(t.parent().parent().html());
                	if(status==0){
                		t.parent().parent().removeClass("invalid-meal-list");
                	}else{
                		t.parent().parent().addClass("invalid-meal-list");
                	}
                    //t.addClass("slideOutUp").fadeOut(800);
                });
            }
            else{
            	bootbox.alert("<h1>设置失败</h1>", function() {
                    console.log("ok");
                });
            }
            }   ,
            error: function(){
            	bootbox.alert("<h1>请求失败</h1>", function() {
                    console.log("ok");
                });
            }
    });
}



//移除订单
function set_admin(){
    console.log("设置为管理员");
    var r_id = $(this).attr("pk");
    console.log(r_id);
    t = $(this);
    console.log(t.parent().children("a").html());
    
    //return;
    $.ajax({
            type:"GET",
            url:"servlet/SetAdmin",
            //提交的数据
            data:{id:r_id},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            success:function(data){
            if(data == "true")
            {
                bootbox.alert("<h1>设为管理员成功</h1>", function() {
                	t.parent().children("a").removeClass("col-md-6").addClass("col-md-12");
                    t.addClass("slideOutUp").fadeOut(800);
                });
            }
            else{
            	bootbox.alert("<h1>设置失败</h1>", function() {
                    console.log("ok");
                });
            }
            }   ,
            error: function(){
            	bootbox.alert("<h1>请求失败</h1>", function() {
                    console.log("ok");
                });
            }
    });
}


//移除订单
function remove_user(){
    console.log("删除用户");
    var r_id = $(this).attr("pk");
    console.log(r_id);
    t = $(this);
    t.removeClass("pulse");
    t.parent().addClass("slideOutUp").fadeOut(800);
    //return;
    $.ajax({
            type:"GET",
            url:"servlet/RemoveUser",
            //提交的数据
            data:{id:r_id},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            success:function(data){
            if(data == "true")
            {
                bootbox.alert("<h1>移除成功</h1>", function() {
                    console.log("ok");
                });
            }
            else{
            	bootbox.alert("<h1>移除失败</h1>", function() {
                    console.log("ok");
                });
            }
            }   ,
            error: function(){
            	bootbox.alert("<h1>请求失败</h1>", function() {
                    console.log("ok");
                });
            }
    });

}