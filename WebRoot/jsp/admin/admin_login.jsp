<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台|登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- CSS Libs -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

</head>
<body class="flat-blue login-page">
	<div class="container">
        <div class="login-box">
            <div>
                <div class="login-form row">
                    <div class="col-sm-12 text-center login-header">
                        <i class="login-logo fa fa-connectdevelop fa-5x"></i>
                        <h4 class="login-title">Flat Admin V2</h4>
                    </div>
                    <div class="col-sm-12">
                        <div class="login-body">
                            <div class="progress hidden" id="login-progress">
                                <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                    Log In...
                                </div>
                            </div>
                            <form>
                                <div class="control">
                                    <input type="text" class="form-control" name="aname" value="" />
                                </div>
                                <div class="control">
                                    <input type="password" class="form-control" name="apassword" value="" />
                                </div>
                                
                            </form>
                            <div class="login-button text-center">
                                    <input type="submit" class="btn btn-primary" value="Login">
                                    <p style="color:red;margin-top:.8em;"></p>
                            </div>
                        </div>
                        <div class="login-footer">
                            <span class="text-right"><a href="#" class="color-white">Forgot password?</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">
		$(function(){
	
			$(".btn-primary").click(function(){
				var aname = $("input[type='text']").val();
				var apassword = $("input[type='password']").val();
				$.ajax({
					url : "<%=request.getContextPath()%>/login",
     				type: "post",
     				dataType : "json",
     				contentType: "application/json;charset=utf-8",
     				data:JSON.stringify({
     					"aname":aname,
     					"apassword":apassword
     				}),
     				success:function(data){
     					sessionStorage.setItem("name", aname);
     					sessionStorage.setItem("password", apassword);
     					window.location.href = "<%=request.getContextPath()%>/jsp/admin/admin_index.jsp";
     				},
     				error:function(data){
     				
     					$(".login-button p").text("用户名或密码错误！");
     					return false;
     				}
		
				});
			})
		});
// 		window.onload = function(){
		
//             var aname = sessionStorage.getItem("name");
//             var apassword = sessionStorage.getItem("password");
//             if(aname!=""&&aname!=null&&apassword!=""&&apassword!=null){
// 				$.ajax({
// 					url : "<%=request.getContextPath()%>/login",
//      				type: "post",
//      				dataType : "json",
//      				contentType: "application/json;charset=utf-8",
//      				data:JSON.stringify({
//      					"aname":aname,
//      					"apassword":apassword
//      				}),
//     				success:function(data){
     				
//      					window.location.href = "<%=request.getContextPath()%>/jsp/admin/admin_main.jsp";
//      				}
// 				});
//             }            		
		
// 		}
</script>
</body>
</html>