<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>宿舍管理员管理  | 宿舍管理信息系统</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../../assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../../assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="../../assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../../assets/img/favicon.png">
</head>

	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
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
				<div class="navbar-btn navbar-btn-right">
					<a class="btn btn-success update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
				</div>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/user.png" class="img-circle" alt="Avatar"> <span>Samuel</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<!-- <li>
							<a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li> -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
        <jsp:include page="common/sidebar.jsp"></jsp:include>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">宿舍管理员管理</h3>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel">
								<div class="panel-body">
									<p class="demo-button">
										<button type="button" class="btn btn-default new" data-toggle="modal" data-target="#addDormAdmin"><i class="fa fa-plus-square"></i> 添加 </button>
										<button type="button" class="btn btn-primary modify-up" data-toggle="modal" data-target="#modifyDormAdmin"><i class="fa fa-edit"></i> 修改 </button>
										<button type="button" class="btn btn-info delete-up"><i class="fa fa-trash"></i> 删除 </button>
										<button type="button" class="btn btn-info refresh"><i class="fa fa-refresh"></i> 刷新 </button>
										<button type="button" class="btn btn-info refresh"><i class="fa fa-refresh"></i> 分配 </button>
										<button type="button" class="btn btn-primary" disabled="disabled"><i class="fa fa-refresh fa-spin"></i> Refreshing...</button>
									</p>
								</div>
								<!-- 模态框（Modal） -->
								<div class="modal fade" id="addDormAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">宿舍管理员管理  / 添加管理员</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<ul id="myTab" class="nav nav-tabs nav-pills nav-justified">
													<li class="active">
														<a href="#info" data-toggle="tab">基础信息</a>
													</li>
													<li><a href="#distribution" data-toggle="tab">楼宇分配</a></li>
												</ul>
												<div id="myTabContent" class="tab-content">
													<div class="tab-pane fade in active" id="info">
														<form role="form" style="padding:8px;">
															<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-user"></i>&nbsp; 工号</span>
																<input class="form-control daid" placeholder="username" type="text">
															</div>
															<br>
															<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-key"></i> 密码</span>
																<input class="form-control dapassword" placeholder="password" type="text">
															</div>
															<br>
															<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-id-badge"></i>&nbsp;&nbsp;姓名</span>
																<input class="form-control truename" placeholder="truename" type="text">
															</div>
															<br>
															<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-phone"></i>&nbsp; 电话</span>
																<input class="form-control workphone" placeholder="workphone" type="text">
															</div>
															<input type="text" class="form-control role" placeholder="" style="display:none" value="dorm_admin">
															<br>												
															<textarea class="form-control description" placeholder="description" rows="4"></textarea>
															<br>	
															<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-venus-mars"></i>&nbsp; 性别</span>
																<label class="fancy-radio" style="float:left;margin:7px;">
																	<input name="gender" value="男" type="radio" class="sex" checked>
																	<span><i></i>男</span>
																</label>
													
																<label class="fancy-radio" style="float:left;margin: 7px;">
																	<input name="gender" value="女" type="radio" class="sex">
																	<span><i></i>女</span>
																</label>
													
												 			</div>
												 			<br>
												 			<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-image"></i>&nbsp; 照片</span>
																<input type="file" id="inputfile" class="form-control picture">
																 
												 			</div>	
												 			<input type="hidden" class="hideworkstate" name="state" />
														</form>		
													
														<div class="modal-footer">
															<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
															<button type="button" class="btn btn-primary" id="next">下一步</button>			
														</div>														
													</div>
												<div class="tab-pane fade" id="distribution">
													
														<div class="modal-body">
															<span>注意：男性管理员不能分配到女生宿舍</span>
															<br>
															<table class="table table-hover">
																<thead class="distr-building">
																	<tr>
																		<th>楼号</th>
																		<th>名称</th>
																		<th>性质</th>
																		<th>已分配/总数</th>
																		<th>选择</th>
																		
																	</tr>
																</thead>
																<tbody class="Buildinglist">
											
																</tbody>
															</table>				
														</div>	
														<div class="modal-footer">
															<button type="button" class="btn btn-default close-down" data-dismiss="modal">取消</button>
															<button type="button" class="btn btn-primary" id="previous">上一步</button>			
															<button type="button" class="btn btn-primary" id="save">保存</button>			
														</div>	
												</div>
											</div>
											</div>

										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								<!-- 模态框（Modal） -->
								<div class="modal fade" id="modifyDormAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">宿舍管理员管理  / 修改管理员信息</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
											<form role="form" style="padding:8px;">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user"></i>&nbsp; 工号</span>
													<input class="form-control daid" placeholder="username" type="text">
												</div>
												<br>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-key"></i> 密码</span>
													<input class="form-control dapassword" placeholder="password" type="text">
												</div>
												<br>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-id-badge"></i>&nbsp;&nbsp;姓名</span>
													<input class="form-control truename" placeholder="truename" type="text">
												</div>
												<br>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-phone"></i>&nbsp; 电话</span>
													<input class="form-control workphone" placeholder="workphone" type="text">
												</div>
												<input type="text" class="form-control role" placeholder="" style="display:none">
												<br>												
												<textarea class="form-control introduction" placeholder="introduction" rows="4"></textarea>
												<br>	
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-venus-mars"></i>&nbsp; 性别</span>
													<label class="fancy-radio" style="float:left;margin:7px;">
															<input name="gender" value="男" type="radio" class="gender">
															<span><i></i>男</span>
														</label>
													
														<label class="fancy-radio" style="float:left;margin: 7px;">
															<input name="gender" value="女" type="radio" class="gender">
															<span><i></i>女</span>
														</label>
													
												 </div>
												 <br>
												 <div class="input-group">
													<span class="input-group-addon"><i class="fa fa-image"></i>&nbsp; 照片</span>
													<input type="file" id="inputfile" class="form-control picture">
												 </div>	
												 
												 <input type="hidden" class="hideworkstate" name="state" />
											</form>		
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary" id="save">保存</button>			
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								
								
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>
													<label class="fancy-checkbox checkbox-control">
														<input type="checkbox" name="ifAll">
														<span></span>
													</label>
												</th>
												<th>工号</th>
												<th>姓名</th>
												<th>性别</th>
												<th>电话</th>
												<th>介绍</th>
												<th>负责楼宇</th>
												<th>状态</th>
												<th>操作</th>
												
											</tr>
										</thead>
										<tbody class="dormadminlist">
											
										</tbody>
									</table>
								</div>
							</div>
							<!-- END TABLE HOVER -->
						</div>
					</div>>
					<div class="row">
						<div class="col-md-4">
							<!-- PANEL DEFAULT -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Panel Default</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<p>Objectively network visionary methodologies via best-of-breed users. Phosfluorescently initiate go forward leadership skills before an expanded array of infomediaries. Monotonectally incubate web-enabled communities rather than process-centric.</p>
								</div>
							</div>
							<!-- END PANEL DEFAULT -->
						</div>
						<div class="col-md-4">
							<!-- PANEL NO CONTROLS -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Panel No Right Controls</h3>
								</div>
								<div class="panel-body">
									<p>Objectively network visionary methodologies via best-of-breed users. Phosfluorescently initiate go forward leadership skills before an expanded array of infomediaries. Monotonectally incubate web-enabled communities rather than process-centric.</p>
								</div>
							</div>
							<!-- END PANEL NO CONTROLS -->
						</div>
						<div class="col-md-4">
							<!-- PANEL WITH FOOTER -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Panel With Footer</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<p>Objectively network visionary methodologies via best-of-breed users. Phosfluorescently initiate go forward leadership skills before an expanded array.</p>
								</div>
								<div class="panel-footer">
									<h5>Panel Footer</h5>
								</div>
							</div>
							<!-- END PANEL WITH FOOTER -->
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<!-- PANEL SCROLLING -->
							<div id="panel-scrolling-demo" class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Panel Scrolling</h3>
								</div>
								<div class="panel-body">
									<p>Objectively network visionary methodologies via best-of-breed users. Phosfluorescently initiate go forward leadership skills before an expanded array of infomediaries. Monotonectally incubate web-enabled communities rather than process-centric.</p>
									<p>Objectively network visionary methodologies via best-of-breed users. Phosfluorescently initiate go forward leadership skills before an expanded array of infomediaries. Monotonectally incubate web-enabled communities rather than process-centric.</p>
									<p>Objectively network visionary methodologies via best-of-breed users. Phosfluorescently initiate go forward leadership skills before an expanded array of infomediaries. Monotonectally incubate web-enabled communities rather than process-centric.</p>
								</div>
							</div>
							<!-- END PANEL SCROLLING -->
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
	<script src="../../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../../assets/scripts/klorofil-common.js"></script>


    <script type="text/javascript">
	$(function(){
		var aname = sessionStorage.getItem("name");
        var apassword = sessionStorage.getItem("password");
        if(aname==""||aname==null||apassword==""||apassword==null){
            window.location.href = "<%=request.getContextPath()%>/jsp/admin/admin_login.jsp";
        }else{
            		
        	$.ajax({
				url : "<%=request.getContextPath()%>/login",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"aname":aname,
     				"apassword":apassword
     			}),
     			error:function(data){
     				window.location.href = "<%=request.getContextPath()%>/jsp/admin/admin_login.jsp";
     			}
		
			});
        }	
        
		queryAllDormAdmin();
		
		function queryAllDormAdmin(){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/queryDormAdmin",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     			
     			
     			 	for(var i =0; i<data.length; i++){


			     		$(".dormadminlist").append("<tr><td><label class='fancy-checkbox'><input type='checkbox' name='choose'><span></span></label></td><td>"+
							  data[i].daid+"</td><td>"+
			     			  data[i].truename+"</td><td>"+
			     			  data[i].sex+"</td><td>"+
			     			  data[i].workphone+"</td><td>"+
			     			  data[i].introduction+"</td><td>"+
			     			  data[i].building.bid+"</td><td>"+
			     			  data[i].workstate+"</td><td>"+
			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyDormAdmin'>修改</button>"+
			     			  "<button type='button' class='more'>详情</button></td></tr>");
			     			  	
				 	}
					clickModifyDormAdmin();
					clickMoreInfo();				 	
				 	
				 }	
		 	});
		}
		

		clickRefreshDormAdmin();
		clickDeleteDormAdmin();
		clicknewDormAdmin();
		clickcloseModel();
		
		//点击新建按钮在模态框中显示待分配楼宇
		function clicknewDormAdmin(){
			$(".new").click(function(){
				var isDistr = "0";
				$.ajax({
					url: "<%=request.getContextPath()%>/queryBuilding",
     				type: "post",
     				dataType : "json",
     				contentType: "application/json;charset=utf-8",
     				data:JSON.stringify({
     					isDistr:"0"
     				}),
     				success:function(data){
     			
     			 		for(var i =0; i<data.length; i++){

			     			$(".distr-building").append("<tr><td>"+
																		
							  	data[i].bid+"</td><td>"+
			     			  	data[i].bname+"</td><td>"+
			     			  	data[i].attribute+"</td><td>"+
			     			  	data[i].existing+"<span>/"+data[i].managernumber+"</span></td>"+
			     			  	"<td><label class='fancy-checkbox'><input type='checkbox' name='choose'><span></span></label></td></tr>");
			     			  	
				 		}
				 		
				 	}	
		 		});	
		
		
			})

		}
		
		//点击修改按钮时弹出模态框
		function clickModifyDormAdmin(){
		
			$(".modify-up").click(function(){
			
				var i=0,checbox = $("input[name='choose']");
				checbox.each(function(){//反选 
                	if($(this).prop("checked")) {i++;}
        		}) 
        		if(i==0||i>1){
        			alert("请选择一个");
        			return false;
        		}
        		checbox.each(function(){ 
            	
                	if($(this).prop("checked")){
                		var daid = $(this).parent().parent().parent().find("td").eq(1).text();
                		showDormAdmin(daid);
                	}
            	
        		})	
        						
			})
        	$(".modify-right").click(function(){ 
        	
        		var daid = $(this).parent().parent().find("td").eq(1).text();
        		showDormAdmin(daid);
        		
        	})
		}
		function clickDeleteDormAdmin(){
		
			$(".delete-up").click(function(){
			
				var i=0,checbox = $("input[name='choose']");
				checbox.each(function(){//反选 
                	if($(this).prop("checked")) i++;
        		}) 
        		if(i==0){
        			alert("请选择一个");
        			return false;
        		}
        		var checkedId = "";
        		checbox.each(function(e){//反选 
            	
                	if($(this).prop("checked")){
                		var daid = $(this).parent().parent().parent().find("td").eq(1).text();
                		checkedId +="," + daid;
                	}
            	
        		})
        		deleteDormAdmin(checkedId);	
			})
		}
 
		//模态框显示选定楼宇
		function showDormAdmin(daid){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/getDormAdmin",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"daid": daid
     			}),
     			success:function(data){
     			
					$("#modifyDormAdmin .daid").val(daid);
					$("#modifyDormAdmin .dapassword").val(data.dapassword);
					$("#modifyDormAdmin .truename").val(data.truename);
					$("input:radio[name='gender']").each(function(){
						if($(this).val()==data.sex) $(this).prop("checked",true);
					})
					$("#modifyDormAdmin .workphone").val(data.workphone);
					$("#modifyDormAdmin .introduction").val(data.introduction);     			
     			}
			});			
		}
		//获取上传图片的base64路径
		var src = null;
		$("#inputfile").change(function(e) {

			//判断图片格式
		 	var obj = document.getElementById("inputfile");	   
		 	var fileName=obj.value;  
		 	var suffixIndex=fileName.lastIndexOf(".");  
		 	var suffix=fileName.substring(suffixIndex+1).toUpperCase();  
		 	if(suffix!="BMP"&&suffix!="JPG"&&suffix!="JPEG"&&suffix!="PNG"&&suffix!="GIF"){  
		    	alert( "请上传图片（格式BMP、JPG、JPEG、PNG、GIF等）!"); 
				$("#inputfile").attr("value","");
		 	}  
       		console.info(e.target.files[0]);//图片文件
       		
        	var dom =$("input[id='inputfile']")[0];
        	console.log(e.target.value);//这个也是文件的路径和上面的dom.value是一样的
        	var reader = new FileReader();
        	reader.onload = (function (file) {
            	return function (e) {
               	console.info(this.result); 
               	alert(this.result);//这个就是base64的数据了
               	src = this.result;
            	};
        	})(e.target.files[0]);
        	reader.readAsDataURL(e.target.files[0]);

		});	
		
		//点击保存，提交新建请求
		$("#save").click(function(){
			var daid =$(".daid").val();
			var dapassword =$(".dapassword").val();
			var role =$(".role").val();
			var truename =$(".truename").val();
			var sex=$("input:radio[name='gender']:checked").val();
			var workphone =$(".workphone").val();
			$(".hideworkstate").val("在职");
			var workstate = $(".hideworkstate").val();
			var introduction =$(".description").val();
			alert("第二个第二个第二个:"+src);
			var building_id = 1;
			
			var i=0,checbox = $("input[name='choose']");
			checbox.each(function(){
            	
            	if($(this).prop("checked")) {i++;}
        		if(i==0||i>1){
        			alert("请选择一个");
        			return false;
        		}
        		checbox.each(function(){ 
            	
                	if($(this).prop("checked")){
                		building_id = $(this).parent().parent().parent().find("td").eq(0).text();
                		alert(building_id);
                		
                	}
        		})	
			})
		alert(daid+dapassword+role+truename+sex+workphone+introduction+building_id);

			$.ajax({
				url: "<%=request.getContextPath()%>/saveDormAdmin",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"daid": daid,
     				"dapassword": dapassword,
     				"role": role,
     				"truename": truename,
     				"sex": sex,
     				"workphone": workphone,
     				"workstate": workstate,
     				"introduction": introduction,
     				"picture": src,
     				"building_id":building_id
     			}),
     			success:function(data){
     			
     				alert("新增成功");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/admin/DormAdminManagement.jsp";
				 
     			}
			
			});	
		})
		
		//点击详情按钮跳转到DormAdmin页面
		function clickMoreInfo(){
		
			$(".more").click(function(){ 
			
				var daid = $(this).parent().parent().find("td").eq(1).text();
				window.location.href = "<%=request.getContextPath()%>/jsp/DormAdminInfo.jsp?daid="+daid;
				
			 });
		}
		
		//复选框全选、反选
    	$("input[name='ifAll']").click(function(){ 
    		
    		if($(this).prop("checked")){
    		
    			$("input[name='choose']").each(function(){//反选 
            	
                	$(this).prop("checked",true); 
            	
        		}) 
    			
    		}else{
    			
    			$("input[name='choose']").each(function(){//反选 
            	
                	$(this).prop("checked",false); 
            		
        		})     		
    		}
    	}) 	
		function clickcloseModel(){
			$(".close,.close-down").click(function(){
				$(".distr-building").removeClass();
			
			
			})
		}
		function deleteDormAdmin(checkedId){
		
				if(confirm("确定删除吗？")){
					
					$.ajax({
						url: "<%=request.getContextPath()%>/deleteDormAdmin",
     					type: "post",
     					dataType : "json",
     					contentType: "application/json;charset=utf-8",
     					data:JSON.stringify({
     						"checkedId": checkedId
     					}),
     					success:function(data){
     						alert("删除成功！");
				 			window.location.href = "<%=request.getContextPath()%>/jsp/admin/DormAdminManagement.jsp";

						}
					});
				}else{
					return false;
				}
				
		 }
		//点击确认按钮，提交修改
		$("#confirm").click(function(){
			var bid =$("#modifyBuilding .bid").val();
			var bname =$("#modifyBuilding .bname").val();
			var attribute =$("#modifyBuilding .attribute").val();
			var location =$("#modifyBuilding .location").val();
			var introduction =$("#modifyBuilding .description").val();
			var imageinfo =$("#modifyBuilding .imageinfo").val();
			
			alert(bid+bname+attribute+location+description+imageinfo);
			$.ajax({
				url: "<%=request.getContextPath()%>/modifyBuilding",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"bid": bid,
     				"bname": bname,
     				"attribute": attribute,
     				"location": location,
     				"introduction": introduction,
     				"imageinfo": imageinfo
     			}),
     			success:function(data){
     			
     				alert("修改成功");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp";
     			}
			
			});	
		})	
		function clickRefreshDormAdmin(){
		
			$(".refresh").click(function(){
		
				$(".dormadminlist").empty();
				queryAllDormAdmin();
			}) 
		}
		
		  $("#sidebar-nav .nav").find("li").eq(0).removeClass();
		  $("#next").click(function(){
		  
		  		$("#myTab li:eq(1) a").tab("show");
		  })
		  $("#previous").click(function(){
		  
		  		$("#myTab li:eq(0) a").tab("show");
		  		
		  })
		  
		  
	});
	//页面全部加载完后执行
	window.onload = function(){
    	$(".buildinglist tr").click(function(){
    		
    		var isChecked = $(this).find("input[type='checkbox']").prop("checked");
    		if(isChecked){
    			$(this).find("input[type='checkbox']").prop("checked",false);
    		
    		}else{
    			$(this).find("input[type='checkbox']").prop("checked",true);
    		}
    		
    	
    	})
	}	
</script>
</body>

</html>
