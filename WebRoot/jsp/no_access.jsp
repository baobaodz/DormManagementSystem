<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Lockscreen | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../assets/css/main.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
</head>

<body style="background:white">
	<!-- WRAPPER -->
	<div id="wrapper" >
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix" style="-webkit-box-shadow:none">
					<div class="content">
						<h1 class="sr-only">Klorofil - Free Bootstrap dashboard</h1>
						<div class="user text-center">
							<img src="http://resource.baobaodz.com/DMS/common/no_access.svg" style="width:90%;">
							<h4><a href="<%=request.getContextPath()%>/jsp/user/user_login.jsp">您无权访问，请先登录</a></h5>
							<h4>将在<span id="num">5</span>秒后返回登录页面</h5>
						</div>
					</div>
				</div>						
			</div>
			
		</div>
	</div>
	<!-- END WRAPPER -->
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){
		  function jump(count) {   
                window.setTimeout(function(){   
                    count--;   
                    if(count > 0) {   
                        $("#num").text(count);   
                        jump(count);   
                    } else {   
                        location.href="<%=request.getContextPath()%>/jsp/user/user_login.jsp";   
                    }   
                }, 1000);   
            }  
       	jump(5);
	
	})
	
     </script>
</body>
</html>