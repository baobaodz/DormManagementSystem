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
						<li><a href="<%=request.getContextPath()%>/jsp/user/stu/index.jsp" class=""><i class="lnr lnr-home"></i> <span>系统设置</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/stu/DormitoryManagement.jsp" class=""><i class="lnr lnr-chart-bars"></i> <span>宿舍管理</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/stu/RepairManagement.jsp" class=""><i class="lnr lnr-cog"></i> <span>报修申请</span></a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/user/stu/DormStudentManagement.jsp" class=""><i class="lnr lnr-cog"></i> <span>晚归情况查询</span></a></li>
						
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->

</body>
</html>