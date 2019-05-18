<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>后台|宿舍管理信息系统</title>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!--     <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css"> -->
<!--     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"> -->
	
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../../../assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../../assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../../assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="../../../assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../../../assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="../../../assets/css/demo.css">
	<!-- Javascript -->
	<script src="../../../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../../../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../../../assets/scripts/klorofil-common.js"></script>
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
	<script>
	$(function() {
	
		var dormAdminID = sessionStorage.getItem("dormAdminID");
        var daPassword = sessionStorage.getItem("daPassword");
        if(dormAdminID==""||dormAdminID==null||dormAdminID==""||dormAdminID==null){
        	alert("您无权限，请先登录");
            window.location.href = "<%=request.getContextPath()%>/jsp/user/user_login.jsp";
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
			     			  data.sex+"</td><td>"+
			     			  data.building.bname+"</td><td>"+
			     			  data.building.attribute+"</td><td>"+
			     			  data.workphone+"</td></tr>");
			     			
		     			$(".dormadmin-introduction").text(data.introduction);
		     			$(".userimage").attr("src","http://"+data.picture);
			     			 
     				}
     			}
		
			});
        }		
	
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
			alert(newPwd);
       		$.ajax({
				url : "<%=request.getContextPath()%>/modifyPwd",
     			type: "post",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"dormAdminID":dormAdminID,
     				"newPwd":newPwd
     			}),
     			success : function(data){
     			
     				alert("修改成功，请重新登录！");
     				window.location.href = "<%=request.getContextPath()%>/jsp/user/user_login.jsp";
     				
     			}
		
			});			
			
		})
		$("#logOut").click(function(){
			if(confirm("确认注销吗？")){
				sessionStorage.setItem("dormAdminID", "");
				sessionStorage.setItem("daPassword", "");
     			window.location.href = "<%=request.getContextPath()%>/jsp/user/user_login.jsp";
			}
			
		})
		
		
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
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};


		

	});
	</script>
</body>

</html>
