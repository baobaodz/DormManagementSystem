<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="<%=request.getContextPath()%>/jsp/user/da/index.jsp" class=""><i class="lnr lnr-home"></i> <span>系统设置</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/da/DormitoryManagement.jsp" class=""><i class="lnr lnr-chart-bars"></i> <span>宿舍管理</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/da/DormStudentManagement.jsp" class=""><i class="lnr lnr-cog"></i> <span>学生管理</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/da/DormStudentManagement.jsp" class=""><i class="lnr lnr-cog"></i> <span>缺寝管理</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/da/DormStudentManagement.jsp" class=""><i class="lnr lnr-cog"></i> <span>报修管理</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/da/DormStudentManagement.jsp" class=""><i class="lnr lnr-cog"></i> <span>进出管理</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/da/AuthorityManagement.jsp" class=""><i class="lnr lnr-alarm"></i> <span>权限管理</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Pages</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="page-profile.html" class="">Profile</a></li>
									<li><a href="page-login.html" class="">Login</a></li>
									<li><a href="page-lockscreen.html" class="">Lockscreen</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->

</body>
</html>