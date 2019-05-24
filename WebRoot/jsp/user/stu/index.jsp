<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>学生|宿舍管理信息系统</title>
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
												<th>学号</th>
												<th>姓名</th>
												<th>性别</th>
												<th>入学时间</th>
												<th>年级</th>
												<th>班级</th>
												<th>宿舍</th>
												<th>职位</th>
											</tr>
										</thead>

										<tbody class="student-info">
											
										</tbody>
										<thead>
											<tr>
												<th colspan="6">介绍</th>
											</tr>
										</thead>

										<tbody class="">	
											<tr rowspan="3" style="height:100px;">
												<td colspan="6">
													<div class="student-introduction" contentEditable="true" style="height:90px;">
														
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
	<script src="../../../js/student/navbar.js"></script>
	<script>
	$(function() {
	
		var sid = sessionStorage.getItem("sid");
        var spassword = sessionStorage.getItem("spassword");
        if(sid==""||sid==null||spassword==""||spassword==null){
        	alert("您无权限，请先登录!!");
        	window.location.href = "<%=request.getContextPath()%>/jsp/no_access.jsp";
        }else{
            
            getStudent(sid);//加载用户信息
            
        }	
        
        function getStudent(sid){
        	$.ajax({
				url : "<%=request.getContextPath()%>/getStudent",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"sid":sid
     			}),
     			success : function(data){
     				
     				if(data.length==0||data.spassword!=spassword){
     					alert("您无权限，请登录！");
     					window.location.href = "<%=request.getContextPath()%>/jsp/user/user_login.jsp";
     				}else{
     					sessionStorage.setItem("spassword",data.spassword);
     					$(".username").text(data.sname);
     					data.character = data.character==null?"室员":data.character;
		     			$(".student-info").html("<tr><td>"+
							  data.sid+"</td><td>"+
			     			  data.sname+"</td><td>"+
			     			  data.gender+"</td><td>"+
			     			  new Date(data.admission).toLocaleDateString()+"</td><td>"+
			     			  data.sgrade+"</td><td>"+
			     			  data.sclass+"</td><td>"+
			     			  data.dormitory.building_id+"-"+data.dormitory.dno+"</td><td>"+
			     			  data.character+"</td></tr>");
			     			
		     			$(".student-introduction").text(data.introduction);
		     			$(".userimage").attr("src","http://"+data.picture);
			     			 
     				}
     			}
		
			});
        }		
	

		
		$(".student-introduction").click(function(){
			
			var  introOld= $(this).text();
			judgeBlur(introOld);
		})		

		function judgeBlur(introOld){
		
			$(".student-introduction").blur(function(){
				
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
