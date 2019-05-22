<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>用户登录 | 宿舍管理信息系统</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../../assets/css/main.css">
	<link rel="stylesheet" href="../../css/flat.css">

	
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../../assets/img/favicon.png">
	<!-- Javascript -->
	<script src="../../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../../assets/scripts/klorofil-common.js"></script>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box" style="margin: 80px auto;">
					<!-- LEFT START -->
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center"><img src="../../assets/img/logo-large.png" alt="Klorofil Logo"></div>
							</div>						
							<ul class="nav nav-pills nav-justified">
								<li class="active"><a href="#dormAdminLogin" data-toggle="tab">宿舍管理员登录</a></li>
								<li><a href="#studentLogin" data-toggle="tab">本校学生登录</a></li>
							</ul>
							<!-- TABCONTENT START-->
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="dormAdminLogin">

									<form class="form-auth-small" action="">
								
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"> </i>&nbsp;</span>
											<input class="form-control daid" placeholder="请输入工号" type="text">
										</div>
										<br>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-key"></i></span>
											<input class="form-control dapassword" placeholder="请输入密码" type="password">
										</div>
										<br>
										<div class="form-group clearfix">
											<label class="fancy-checkbox element-left">
												<input type="checkbox">
												<span>记住我</span>
											</label>
										</div>
									
										<button type="button" id="loginDormAdmin" class="btn btn-primary btn-lg btn-block" disabled="disabled">登录</button>
										<div class="bottom">
											<span class="helper-text"><i class="fa fa-lock"></i> <a href="#">忘记密码?</a></span>
										</div>
									</form>
								</div>
								
								<div class="tab-pane fade" id="studentLogin">
													
									<form class="form-auth-small" action="">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"> </i>&nbsp;</span>
											<input class="form-control sid" placeholder="请输入账号" type="text">
										</div>
										<br>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-key"></i></span>
											<input class="form-control spassword" placeholder="请输入密码" type="password">
										</div>
										<br>
										<div class="form-group clearfix">
											<label class="fancy-checkbox element-left">
												<input type="checkbox">
												<span>记住我</span>
											</label>
										</div>
										<button type="button" id="loginStudent" class="btn btn-primary btn-lg btn-block" disabled="disabled">登录</button>
										<div class="bottom">
											<span class="helper-text"><i class="fa fa-lock"></i> <a href="#">忘记密码?</a></span>
										</div>
									</form>
								</div>
										
							</div>	
						<!-- TABCONTENT END-->
						</div>							
						<!-- CONTENT END -->
					</div>
					<!-- LEFT END -->
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">学生宿舍管理系统</h1>
							<p>by baobaodz</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
</body>
    <script type="text/javascript">
	$(function(){
	

		$(".daid").change(function(){
			
			
			if($(this).val()!=null&&$(".dapassword").val()!=null){
			
				$("#loginDormAdmin").attr("disabled",false);
			}
		
		})
		$(".dapassword").change(function(){
			
			
			if($(this).val()!=null&&$(".daid").val()!=null){
				$("#loginDormAdmin").attr("disabled",false);
			}
		
		})

		
		$("#loginDormAdmin").click(function(){
		
			var daid = $(".daid").val();
			var dapassword = $(".dapassword").val();
        	$.ajax({
				url : "<%=request.getContextPath()%>/verifyUser",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"dormAdminID":daid,
     				"daPassword":dapassword
     			}),
     			success : function(data) {
     				alert(data);
     				if(data!="NOT FOUND"){
     					
     					sessionStorage.setItem("dormAdminID",data.daid);
        				sessionStorage.setItem("daPassword",data.dapassword);
     					window.location.href = "<%=request.getContextPath()%>/jsp/user/da/index.jsp";
     				}else{
     					alert("登录失败！账号或密码错误");
     				}
     				
     			},error:function(data){
     				
     				alert("请求失败");
     			}
		
			});			
		
		})

		$(".sid").change(function(){
			
			if($(this).val()!=null&&$(".spassword").val()!=null){
			
				$("#loginStudent").attr("disabled",false);
			}
		
		})
		$(".spassword").change(function(){
			
			if($(this).val()!=null&&$(".sid").val()!=null){
				$("#loginStudent").attr("disabled",false);
			}
		
		})
		$("#loginStudent").click(function(){
		
			var sid = $(".sid").val();
			var spassword = $(".spassword").val();
        	$.ajax({
				url : "<%=request.getContextPath()%>/verifyStudent",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"sid":sid,
     				"spassword":spassword
     			}),
     			success : function(data) {
     			
      				if(data!="NOT FOUND"){
     					
     					sessionStorage.setItem("sid",data.sid);
        				sessionStorage.setItem("spassword",data.spassword);
     					window.location.href = "<%=request.getContextPath()%>/jsp/user/stu/index.jsp";
     				}else{
     					alert("登录失败！账号或密码错误");
     				}
     				
     			},error:function(data){
     				
     				alert("请求失败");
     			}
		
			});			
		
		})        

    	$(".checkbox-control").click(function(){ 
        	$("input[type='checkbox']").each(function(){//反选 
            	if($(this).attr("checked")){ 
            	
               		$(this).prop("checked",""); 
            	}else{ 
                	$(this).prop("checked",true); 
            	} 
        	}) 
    	}) 		

		
		 	 
		 
	});

</script>
</html>