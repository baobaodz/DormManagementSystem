<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>后台|宿舍管理信息系统</title>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../../../assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../../assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../../assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="../../../assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../../../assets/css/main.css">

	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="../../../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../../../assets/img/favicon.png">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<jsp:include page="navbar.jsp"></jsp:include>
		<!-- LEFT SIDEBAR -->
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-body">

							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-download"></i></span>
										<p>
											<span class="number">1,252</span>
											<span class="title">Downloads</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-shopping-bag"></i></span>
										<p>
											<span class="number">203</span>
											<span class="title">Sales</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-eye"></i></span>
										<p>
											<span class="number">274,678</span>
											<span class="title">Visits</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-bar-chart"></i></span>
										<p>
											<span class="number">35%</span>
											<span class="title">Conversions</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END OVERVIEW -->
					<div class="row">
						<div class="col-md-12">
							<!-- RECENT PURCHASES -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title" id="userInfo">个人信息</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>

								</div>
								<div class="panel-body no-padding">
									<div class="col-md-9">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>工号</th>
												<th>姓名</th>
												<th>性别</th>
												<th>负责楼宇</th>
												<th>楼宇类型</th>
												<th>电话</th>
											</tr>
										</thead>

										<tbody class="dormadmin-info">
											
										</tbody>
										<thead>
											<tr>
												<th colspan="6">简介</th>
											</tr>
										</thead>

										<tbody class="">	
											<tr rowspan="3" style="height:100px;">
												<td colspan="6">
													<div class="dormadmin-introduction" contentEditable="true" style="height:90px;">
														
													</div>
												</td>
											</tr>																			
										</tbody>										
									</table>
									</div>
									<div class="col-md-3">
										<div class="panel-body" style="width:100%;height:320px;overflow:hidden;">
											<img class="userimage" src="" style="display:block;width:100%;height:240px;overflow:hidden;"/>
										
											<button type="button" class="btn btn-primary modify-up" data-toggle="modal" data-target="#modifyBuilding" style="margin:0 auto;"><i class="fa fa-edit"></i> 重传照片 </button>
										</div>
									</div>
									
								</div>
							</div>
							<!-- END RECENT PURCHASES -->
						</div>
					
					</div>
			
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017 <a href="#" target="_blank">Theme I Need</a>. All Rights Reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="../../../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../../../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../../../assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="../../../assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="../../../assets/scripts/klorofil-common.js"></script>
	<script src="../../../js/dormadmin/navbar.js"></script>
	<script>
	$(function() {
	
		var dormAdminID = sessionStorage.getItem("dormAdminID");
        var daPassword = sessionStorage.getItem("daPassword");
        if(dormAdminID==""||dormAdminID==null||dormAdminID==""||dormAdminID==null){
        	alert("您无权限，请先登录!!");
        	window.location.href = "<%=request.getContextPath()%>/jsp/no_access.jsp";
//             window.location.href = "<%=request.getContextPath()%>/jsp/user/user_login.jsp";
        }else{
            
            getDormAdmin(dormAdminID);//加载用户信息
            
        }	
        
        function getDormAdmin(dormAdminID){
        	$.ajax({
				url : "<%=request.getContextPath()%>/getDormAdmin",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"daid":dormAdminID
     			}),
     			success : function(data){
     			
     				if(data.length==0||data.dapassword!=daPassword){
     					alert("您无权限，请登录！");
     					window.location.href = "<%=request.getContextPath()%>/jsp/user/user_login.jsp";
     				}else{
     					sessionStorage.setItem("daPassword",data.dapassword);
     					$(".username").text(data.truename);
		     			$(".dormadmin-info").html("<tr><td>"+
							  data.daid+"</td><td>"+
			     			  data.truename+"</td><td>"+
			     			  data.sex+"</td><td><a href='DormitoryManagement.jsp'>"+
			     			  data.building.bname+"</a></td><td>"+
			     			  data.building.attribute+"</td><td>"+
			     			  data.workphone+"</td></tr>");
			     			
		     			$(".dormadmin-introduction").text(data.introduction);
		     			$(".userimage").attr("src","http://"+data.picture);
			     			 
     				}
     			}
		
			});
        }		
	

		
		$(".dormadmin-introduction").click(function(){
			
			var  introOld= $(this).text();
			judgeBlur(introOld);
		})		

		function judgeBlur(introOld){
		
			$(".dormadmin-introduction").blur(function(){
				
				var introNew = $(this).text();
				
				if(introOld==introNew){
					
					return false;
				
				}else{
					
					if(confirm("确认修改吗？")){
						modifyIntroduction(introNew);
					}else{
						return false;
					
					}
				}
    			
			});		
		}
		
		function modifyIntroduction(introNew){
		
       		$.ajax({
				url : "<%=request.getContextPath()%>/modifyIntroduction",
     			type: "post",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"introNew":introNew,
     				"dormAdminID" : dormAdminID
     			}),
     			success : function(data){
     			
     				alert("修改成功!");
     				
     				getDormAdmin(dormAdminID);
     				
     			}
		
			});			
		
		}


	});
	</script>
</body>

</html>
