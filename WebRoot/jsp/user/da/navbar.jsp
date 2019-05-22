<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../../../assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../.././assets/css/main.css">
	<link rel="stylesheet" href="../../../css/flat.css">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" >
			<div class="brand">
				<a href="index.jsp"><img src="../../../assets/img/logo-middle.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" value="" class="form-control" placeholder="Search dashboard...">
						<span class="input-group-btn"><button type="button" class="btn btn-primary">Go</button></span>
					</div>
				</form>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
								<i class="lnr lnr-alarm"></i>
								<span class="badge bg-danger">5</span>
							</a>
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a></li>
								<li><a href="#" class="more">See all notifications</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="../../../assets/img/user.png" class="img-circle" alt="Avatar"> <span class="username">DormAdmin</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="<%=request.getContextPath()%>/jsp/user/da/index.jsp#userInfo"><i class="lnr lnr-user"></i> <span>个人信息</span></a></li>
								<li data-toggle="modal" data-target="#modifyPassWord"><a href="#"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
								<li id="logOut"><a href="#"><i class="lnr lnr-exit"></i> <span>注销</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
	</nav>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="modifyPassWord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close close-down" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改密码</h4>
				</div>
			<!--内容 -->
				<div class="modal-body">
					<form role="form" style="padding:8px;">
						<p class="text-info">新密码不能少于6位且必须包含字母数字特殊符号</p>
						<div class="input-group">
							<span class="input-group-addon"> &nbsp;新&nbsp;&nbsp;密&nbsp;&nbsp;码</span>
							<input class="form-control pwd-new" placeholder="" type="password">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon"> 确认密码</span>
							<input class="form-control pwd-confirm" placeholder="" type="password">
						</div>
						<br>
						<span class="text-danger pwd-msg"></span>
					</form>	
				</div>											
				<div class="modal-footer">
					<button type="button" class="btn btn-default close-down" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="confirmPwd">确认</button>			
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->	
	<!-- END NAVBAR -->
</body>
</html>