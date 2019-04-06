<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="<%=request.getContextPath()%>/jsp/admin_main.jsp">
                                <div class="icon fa fa-paper-plane"></div>
                                <div class="title">baobaodz的个人博客</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            

                            <li>
                                <a href="<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp">
                                    <span class="icon fas fa-edit"></span><span class="title">系统管理</span>
                                </a>
          
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp">
                                    <span class="icon fas fa-edit"></span><span class="title">宿舍楼管理</span>
                                </a>
          
                            </li>
                            <li>
                                <a href="">
                                    <span class="icon fas fa-pen-nib"></span><span class="title">宿舍管理员管理</span>
                                </a>
                            </li>                            
                            <li>
                                <a href="">
                                    <span class="icon fas fa-pen-nib"></span><span class="title">学生管理</span>
                                </a>
                            </li>
                            <li>
                                <a href="http://changyan.kuaizhan.com/overview" target="blank">
                                    <span class="icon fas fa-comments"></span><span class="title">查看评论</span>
                                </a>
          
                            </li>
                           
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-example">
                                    <span class="icon fas fa-map-signs"></span><span class="title">酷站</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="https://portal.qiniu.com" target="blank">七牛云</a>
                                            </li>

                                            <li><a href="https://tool.lu/" target="blank">在线工具 - 程序员的工具箱</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                            
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
</body>
</html>