var effects = new Array("bounceIn","bounceInDown","bounceInLeft","bounceInRight","bounceInUp"); // 出现特效

var imageMenuData = [
[{
    text: "车主",
    data: [[{
        text: "登录",
        func: function() {
            window.location.href="owner_login.jsp";
        }},{
            text: "注册",
            func: function() {
                window.location.href="owner_register.jsp";
            }
    }]]
}, {
    text: "车辆",
     data: [[{
        text: "添加",
        func: function() {
            window.location.href="edit_car.jsp";
        }
    }]]
}, {
    text: "其它",
    data: [[{
        text: "所有车辆",
        func: function() {
           window.location.href="index3.jsp";
        }
    }
    ]]
}],
[{
    text: "刷新",
    func: function() {
        location.reload() ;
    }
}]
];




$(document).ready(function(){
	build();
	$("body").smartMenu(imageMenuData, {
		name: "body"
		});
});

function build() {
	
	 $.ajax({
         type:"GET",
         url:"servlet/GetAllCars",
         //返回数据的格式
         datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
         success:function(data){
        	 console.log(data);
        	 data=  $.parseJSON(data);
        	 console.log(data.length);
        	 
        	 var cells=4,
             rows=data.length,//列数
             i, j, row,
             columns = [],
             jsondata = [];
        	 
        	 columns=[{"field":"field0","title":"编号"},{"field":"field1","title":"车名"}, {"field":"field2", "title":"车主"},{"field":"field3", "title":"操作"}];
        	 for (i = 0; i < rows; i++) {
        	        row = {};
        	        row['field0']="<span style='color:red'>"+data[i].id+"<span>";
        	        row['field1']="<span style='color:green'>"+data[i].name+"<span>";
        	        row['field2']="<a href='owner_cars.jsp?id="+data[i].ownerId+"'>点击查看</a>";
        	        row['field3']="<a style='color:blue' href='servlet/RemoveCar?id="+data[i].id+"'>删除</a>&nbsp;<a style='color:blue' href='edit_car.jsp?id="+data[i].id+"'>编辑</a>";
        	        jsondata.push(row);
        	    }
        	 console.log(jsondata);
        	 $('#table').bootstrapTable('destroy').bootstrapTable({
        	        columns: columns,
        	        data: jsondata
        	    });
         }   ,
         error: function(){
         	bootbox.alert("<h1>请求失败</h1>", function() {
                 console.log("ok");
             });
         }
 });
}

function idFormatter(value) {
    return value + 100;
}