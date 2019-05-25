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
	<link rel="stylesheet" href="../../../assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../../assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../../assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../../../assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="../../../assets/css/demo.css">
	<link rel="stylesheet" href="../../../css/flat.css">
	<link rel="stylesheet" href="../../../css/bootoast.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="../../../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../../../assets/img/favicon.png">
</head>

	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<jsp:include page="navbar.jsp"></jsp:include>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
        <jsp:include page="sidebar.jsp"></jsp:include>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title" style="margin-bottom:10px;">报修申请</h3>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel" style="margin-bottom:10px">
								<div class="panel-body">
									<p class="demo-button">
										<button type="button" class="btn btn-default new" data-toggle="modal" data-target="#addRepairApplication"><i class="fa fa-plus-square"></i> 添加 </button>
										<button type="button" class="btn btn-primary modify-up" data-toggle="modal" data-target="#modifyDormAdmin"><i class="fa fa-edit"></i> 修改 </button>
										<button type="button" class="btn btn-info delete-up"><i class="fa fa-trash"></i> 删除 </button>
										<button type="button" class="btn btn-info refresh"><i class="fa fa-refresh"></i> 刷新 </button>
									</p>
								</div>
								<!-- 模态框（Modal） -->
								<div class="modal fade" id="addRepairApplication" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">报修申请  / 添加</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<ul id="addTab" class="nav nav-tabs nav-pills nav-justified">
													<li class="active">
														<a href="#add-info" data-toggle="tab">基本信息</a>
													</li>
													<li><a href="#add-image" data-toggle="tab">图片上传</a></li>
												</ul>
												<div id="myTabContent" class="tab-content">
													<div class="tab-pane fade in active" id="add-info">
														<form role="form" style="padding:8px;">
															<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-user"></i>&nbsp; 故障类型</span>
																<select class="form-control rtype">
																	<option value="1">桌椅床</option>
																	<option value="2">风扇空调</option>
																	<option value="3">门窗锁</option>
																	<option value="4">卫生工具</option>
																	<option value="5">电路网络</option>
																	<option value="6">其它类型</option>
																</select>																
															</div>
															<br>
															<input type="hidden" class="form-control reporter" placeholder="reporter" type="text">
															<input type="hidden" class="form-control building-dormitory" placeholder="building-dormitory" type="text">
															<textarea class="form-control rcause" placeholder="故障说明" rows="4"></textarea>
												 			<input type="hidden" class="form-control handlestatus" placeholder="handlestatus" type="text" />
														</form>		
													
														<div class="modal-footer">
															<button type="button" class="btn btn-default close-down" data-dismiss="modal">取消</button>
															<button type="button" class="btn btn-primary" id="next">下一步</button>			
														</div>														
													</div>
												<div class="tab-pane fade" id="add-image">
												 		<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-image"></i>&nbsp; 照片</span>
																<input type="file" id="inputfile" class="form-control rpicture">
																 
												 		</div>													
														<div class="modal-body">
															<div class="image-preview" style="width:450px;height:350px;background-color:pink">
																<img src="" style="width:510px;height:350px;display:block;overflow:hidden"/>
															</div>

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
								
								<!-- 图片预览模态框（Modal） -->
								<div class="modal fade" id="hoverImage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<!--内容 -->
											<div class="modal-body">
												<div class="image-hoverPreview" style="width:450px;height:350px;background-color:pink">
													<img src="" style="width:510px;height:350px;display:block;overflow:hidden"/>
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
												<h4 class="modal-title" id="myModalLabel">宿舍管理员管理  / 修改</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<ul id="modifyTab" class="nav nav-tabs nav-pills nav-justified">
													<li class="active">
														<a href="#modify-info" data-toggle="tab">基础信息</a>
													</li>
													<li><a href="#modify-distribution" data-toggle="tab">楼宇分配</a></li>
												</ul>
												<div id="myTabContent" class="tab-content">
													<div class="tab-pane fade in active" id="modify-info">
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
															<textarea class="form-control introduction" placeholder="introduction" rows="4"></textarea>
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
												 			<input type="hidden" class="hideworkstate" name="state" />
														</form>		
													
														<div class="modal-footer">
															<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
															<button type="button" class="btn btn-primary modify-next">下一步</button>			
														</div>														
													</div>
												<div class="tab-pane fade" id="modify-distribution">
													
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
																<tbody class="building-list">
											
																</tbody>
															</table>				
														</div>	
														<div class="modal-footer">
															<button type="button" class="btn btn-default close-down" data-dismiss="modal">取消</button>
															<button type="button" class="btn btn-primary modify-previous" >上一步</button>			
															<button type="button" class="btn btn-primary" id="confirm">确认</button>			
														</div>	
												</div>
											</div>
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
												<th>宿舍</th>
												<th>类型</th>
												<th>故障说明</th>
												<th>图片</th>
												<th>申请时间</th>
												<th>申请人</th>
												<th>处理状态</th>
												<th>处理建议</th>
												<th>处理人</th>
												<th>处理时间</th>
												<th>操作</th>
												
											</tr>
										</thead>
										<tbody class="repairlist">
											
										</tbody>
									</table>
									<div class="no-data">
										<img src="http://resource.baobaodz.com/DMS/common/no_data.svg" style="width:30%;display:block;margin: 0 auto;">
										<div class="text-center">还没有记录哦</div>
									</div>
								</div>
							</div>
							<!-- END TABLE HOVER -->
						</div>
					</div>
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
	<script src="../../../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../../../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../../../assets/scripts/klorofil-common.js"></script>
	<script src="../../../js/student/navbar.js"></script>
	<script src="../../../js/bootoast.js"></script>


    <script type="text/javascript">
	$(function(){
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
     					$(".building-dormitory").val(data.dormitory.building_id+"-"+data.dormitory.dno);
     					$(".reporter").val(data.sname);
     					var budno = $(".building-dormitory").val();
			     		getRepairApplication(budno);
     				}
     			}
		
			});
        }		
	
        
        //查询所有的管理员
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
			     			  data[i].building.bname+"</td><td>"+
			     			  data[i].workstate+"</td><td>"+
			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyDormAdmin'>修改</button>"+
			     			  "<button type='button' class='more'>详情</button></td></tr>");
			     			  	
				 	}
					clickModifyDormAdmin();
					clickMoreInfo();				 	
				 	
				 }	
		 	});
		}
		
			
		clickRefreshRepair();  	//刷新
		clickDeleteRepair();		//删除
		clicknewDormAdmin();		//新建
		clickcloseModel();			//取消
		
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

			     			$(".building-list").append("<tr><td>"+
																		
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
        				
					bootoast({
    					message: "请选择一个",
    					type: "warning",
    					position: "bottom-left",
    					timeout: 2,
					});
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
		//点击删除按钮，可批量删除
		function clickDeleteRepair(){
		
			$(".delete-up").click(function(){
			
				var i=0,checbox = $("input[name='choose']");
				checbox.each(function(){//反选 
                	if($(this).prop("checked")) i++;
        		}) 
        		if(i==0||i>1){
        		
        			bootoast({message: "请选择一个",type: "warning",position: "bottom-left",timeout: 2});
        			return false;
        		}
        		checbox.each(function(e){
            	
                	if($(this).prop("checked")){
                		var rid = $(this).parent().parent().parent().find("td").eq(1).text();
                		var handleStatus = $(this).parent().parent().parent().find("td").eq(8).text();
                		deleteRepairApplication(rid,handleStatus);	
                	}
            	
        		})
        		
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

					queryDistrBuiding(data);//显示待分配楼宇
     			}
     			
			});	
		}
		
		//获取上传图片的base64路径
		var imagebase64 = null;
		$("#inputfile").change(function(e) {

			//判断图片格式
		 	var obj = document.getElementById("inputfile");	   
		 	var fileName=obj.value;  
		 	var suffixIndex=fileName.lastIndexOf(".");  
		 	var suffix=fileName.substring(suffixIndex+1).toUpperCase();  
		 	if(suffix!="BMP"&&suffix!="JPG"&&suffix!="JPEG"&&suffix!="PNG"&&suffix!="GIF"){  
    			bootoast({message: "请上传图片（格式BMP、JPG、JPEG、PNG、GIF等）!",type: "warning",position: "bottom-left",timeout: 2});
				$("#inputfile").empty();
				return false;
		 	}else{
	       		console.info(e.target.files[0]);//图片文件
       		
        		var dom =$("input[id='inputfile']")[0];
        		console.log(e.target.value);//这个也是文件的路径和上面的dom.value是一样的
        		var reader = new FileReader();
        		reader.onload = (function (file) {
            		return function (e) {
               			console.info(this.result); 
               			alert(this.result);//这个就是base64的数据了
               			imagebase64 = this.result;
               			$(".image-preview img").attr("src",imagebase64);
            		};
        		})(e.target.files[0]);
        		reader.readAsDataURL(e.target.files[0]);	 	
		 	
		 	}

		});	
		function isChecked(e){
			var i=0;
			e.each(function(){
            	
            	if(e.prop("checked")) {i++;}
        		if(i==0||i>1){
        			alert("请选择一个");
        			return false;
        		}
			})		
		
		
		}
		
		//点击保存，提交新建请求
		$("#save").click(function(){
		
			var rtype =$(".rtype").val();
			var rcause =$(".rcause").val();
			var rpicture = imagebase64;
			$(".handlestatus").val("1");
			var handlestatus = $(".handlestatus").val();
			var reporter =$(".reporter").val();
			var reporttime = new Date();
			var budno = $(".building-dormitory").val();

			$.ajax({
				url: "<%=request.getContextPath()%>/saveRepairApplication",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"rtype": rtype,
     				"rcause": rcause,
     				"rpicture": rpicture,
     				"reporter": reporter,
     				"handlestatus": handlestatus,
     				"budno":budno
     			}),
     			success:function(data){
     			
     				alert("新增成功");
	
					bootoast({message: "新增成功！",type: "success",position: "bottom-left",timeout: 2});
     				$("#addRepairApplication").modal("hide");
					getRepairApplication(budno);			 
     			}
			
			});	
		})
		
		function getRepairApplication(budno){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/getRepairApplication",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"budno":budno
     			}),
     			success:function(data){
     			
     			if(data.length==0){
     				return true;
     			}else{
     				
     				$(".repairlist").empty();
     				$(".no-data").empty();
     			 	for(var i =0; i<data.length; i++){
						data[i].handleadvice = data[i].handleadvice==null?"":data[i].handleadvice;
						data[i].handler = data[i].handler==null?"":data[i].handler;
						data[i].handletime = data[i].handletime==null?"":data[i].handletime;
			     		$(".repairlist").append("<tr><td><label class='fancy-checkbox'><input type='checkbox' name='choose'><span></span></label></td><td style='display:none'>"+
			     			  data[i].rid+"</td><td>"+
			     			  data[i].budno+"</td><td>"+
			     			  getRepairTypeName(data[i].rtype)+"</td><td>"+
			     			  data[i].rcause+"</td><td class='image-hover'><i class='fa fa-eye'></i><span style='display:none'>"+
			     			  data[i].rpicture+"</span></td><td>"+
			     			  data[i].reporttime+"</td><td>"+
			     			  data[i].reporter+"</td><td>"+
			     			  getRepairHandleStatusName(data[i].handlestatus)+"</td><td>"+
			     			  data[i].handleadvice+"</td><td>"+
			     			  data[i].handler+"</td><td>"+
			     			  data[i].handletime+"</td><td>"+
			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyDormAdmin'>修改</button>"+
			     			  "</td></tr>");
			     			  	
				 	}
					clickModifyDormAdmin();
					clickMoreInfo();
					hoverImageEye();				 	
				 	
				 }
				}	
		 	});			
		}
		
		function hoverImageEye(){
			$(".repairlist tr .image-hover").on("mouseenter", function() {
				var imageSrc = $(this).find("span").text();
				$("#hoverImage img").attr("src","http://"+imageSrc);
				$("#hoverImage").modal();
			});
		}

		//通过枚举类型来定义，不需要从后台获取，缺点就是非动态
		function getRepairTypeName(typeId){
			var RepairTypeID = {
				桌椅床:1,
				风扇空调:2,
				门窗锁:3,
				卫生工具:4,
				电路网络:5,
				其他:6
			}
							
			for(var cat in RepairTypeID){
				if(typeId==RepairTypeID[cat]){
					return cat;
				}
			}
						
		}
		function getRepairHandleStatusName(statusId){
			var RepairHandleStatusID = {
				未处理:1,
				处理中:2,
				处理完成:0
			}
							
			for(var cat in RepairHandleStatusID){
				if(statusId==RepairHandleStatusID[cat]){
					return cat;
				}
			}
						
		}
		
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
    	//关闭模态框后清除building
		function clickcloseModel(){
			$(".close-down").click(function(){
				$(".building-list").empty();
			
			})
		}
		function deleteRepairApplication(rid,handleStatus){
				
				if(handleStatus!="未处理"){
					bootoast({message: "该申请已被处理，无法删除！",type: "warning",position: "bottom-left",timeout: 2});
					return false;
				}else{
					if(confirm("确定删除吗？")){
					
						$.ajax({
							url: "<%=request.getContextPath()%>/deleteRepairApplication",
     						type: "post",
     						dataType : "json",
     						contentType: "application/json;charset=utf-8",
     						data:JSON.stringify({
     							"rid": rid
     						}),
     						success:function(data){
     						
				 				window.location.href = "<%=request.getContextPath()%>/jsp/user/stu/RepairApplication.jsp";
								bootoast({message: "删除成功！",type: "success",position: "bottom-left",timeout: 2});

							}
						});
					}else{
						return false;
					}
				}

		 }
		//点击确认按钮，提交修改
		$("#confirm").click(function(){
		
		
			var daid =$("#modifyDormAdmin .daid").val();
			alert(daid);
			var dapassword =$("#modifyDormAdmin .dapassword").val();
			var truename =$("#modifyDormAdmin .truename").val();
			var sex =$("#modifyDormAdmin .sex").val();
			var workphone =$("#modifyDormAdmin .workphone").val();
			var introduction =$("#modifyDormAdmin .introduction").val();
			
			var checkedBox = $("input[name='chooseDistr']:checked");
			
			var checkBox = $(".distr-checkbox");
			var building_id = "";
       		checkBox.each(function(e){
            	
                	if($(this).children().prop("checked")){
                		building_id = $(this).attr("id");
                	}
            	
        		})
			alert("building_id:"+building_id);
			$.ajax({
				url: "<%=request.getContextPath()%>/modifyDormAdmin",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"daid": daid,
     				"dapassword": dapassword,
     				"truename": truename,
     				"sex": sex,
     				"workphone": workphone,
     				"introduction": introduction,
     				"building_id": building_id
     			}),
     			success:function(data){
     			
     				alert("修改成功");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/admin/DormAdminManagement.jsp";
     			}
			
			});	
		})	
		function clickRefreshRepair(){
		
			$(".refresh").click(function(){
		
				$(".repairlist").empty();
				var budno = $(".building-dormitory").val();
			    getRepairApplication(budno);
			}) 
		}
		
		  $("#sidebar-nav .nav").find("li").eq(0).removeClass();
		  $("#next").click(function(){
		  
		  		$("#addTab li:eq(1) a").tab("show");
		  		$("#modifyTab li:eq(1) a").tab("show");
		  })
		  $("#previous").click(function(){
		  
		  		$("#addTab li:eq(0) a").tab("show");
		  		$("#modifyTab li:eq(0) a").tab("show");
		  		
		  })
		  $(".modify-next").click(function(){
		  
		  		$("#modifyTab li:eq(1) a").tab("show");
		  })
		  $(".modify-previous").click(function(){
		  
		  		$("#modifyTab li:eq(0) a").tab("show");
		  		
		  })
		  
		  
	});
	//页面全部加载完后执行
</script>
</body>

</html>
