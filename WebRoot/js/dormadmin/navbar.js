function getRootPath_web() {

	var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPath = curWwwPath.substring(0, pos);

    if(pathName.indexOf("DMS")!=-1){
    	//获取带"/"的项目名，如：/MyBlog
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPath+projectName);
     }else{
        return localhostPath;
     }
}
var rootPath = getRootPath_web();

		var dormAdminID = sessionStorage.getItem("dormAdminID");
		$(".pwd-new").change(function(){
			
			  	var passwordNew =$(this).val();
    			if (passwordNew == null || passwordNew.length < 7) {
    				
    				$(".pwd-msg").text("新密码必须不少于8位！");
        			return false;
    			}
    			var reg1 = new RegExp(/^[0-9A-Za-z]+$/);
    			
    			if (!reg1.test(passwordNew)) {
    				$(".pwd-msg").text("新密码不能包含特殊符号！");
        			return false;
    			}
    			var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
    			if (reg.test(passwordNew)) {
    				$(".pwd-msg").text("");
        			return true;
    			} else {
    				$(".pwd-msg").text("新密码必须包含数字字母！");
        			return false;
    			}
		
		})
		$(".pwd-confirm").change(function(){
			
			  	var passwordConfirm =$(this).val();
    			if (passwordConfirm != $(".pwd-new").val()) {
    				
    				$(".pwd-msg").text("确认密码与新密码不一致");
        			return false;
    			}else{
    			
    				$(".pwd-msg").text("");
    				return true;
    			}
		})
		//关闭或取消模态框后清除密码
		function clickcloseModel(){
			$(".close-down").click(function(){
				$(".pwd-new，.pwd-confirm,.pwd-msg").empty();
			
			})
		}

		$("#confirmPwd").click(function(){
			
			var newPwd = $(".pwd-new").val();
			var confirmPwd = $(".pwd-confirm").val();
			if(newPwd!=confirmPwd){
				
				return false;
			}else{
	       		$.ajax({
					url : rootPath+"/modifyDormAdminPwd",
	     			type: "post",
	     			contentType: "application/json;charset=utf-8",
	     			data:JSON.stringify({
	     				"dormAdminID":dormAdminID,
	     				"newPwd":newPwd
	     			}),
	     			success : function(data){
	     			
	     				alert("修改成功，请重新登录！");
	     				window.location.href = rootPath+"/jsp/user/user_login.jsp";
	     				
	     			}
			
				});					
			}
		})
		$("#logOut").click(function(){
			if(confirm("确认注销吗？")){
				sessionStorage.setItem("dormAdminID", "");
				sessionStorage.setItem("daPassword", "");
     			window.location.href = rootPath+"/jsp/user/user_login.jsp";
			}
			
		})
		