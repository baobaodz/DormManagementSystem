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
										<button type="button" class="btn btn-primary modify-up" data-toggle="modal"><i class="fa fa-edit"></i> 修改 </button>
										<button type="button" class="btn btn-info delete-up"><i class="fa fa-trash"></i> 删除 </button>
										<button type="button" class="btn btn-info refresh"><i class="fa fa-refresh"></i> 刷新 </button>
									</p>
								</div>
								<!-- 新增模态框（Modal） -->
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
												<div class="image-hoverPreview" style="width:565px;height:350px;">
													<img src="" style="width:565px;height:350px;display:block;overflow:hidden"/>
												</div>
											</div>

										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								
								
								<!-- 修改模态框（Modal） -->
								<div class="modal fade" id="modifyRepairApplication" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">报修申请  / 修改</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<ul id="modifyTab" class="nav nav-tabs nav-pills nav-justified">
													<li class="active">
														<a href="#modify-info" data-toggle="tab">基本信息</a>
													</li>
													<li><a href="#modify-image" data-toggle="tab">图片上传</a></li>
												</ul>
												<div id="myTabContent" class="tab-content">
													<div class="tab-pane fade in active" id="modify-info">
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
															<button type="button" class="btn btn-primary" id="modifyNext">下一步</button>			
														</div>														
													</div>
												<div class="tab-pane fade" id="modify-image">
												 		<div class="input-group">
																<span class="input-group-addon"><i class="fa fa-image"></i>&nbsp; 照片</span>
																<input type="file" id="modifyInputfile" class="form-control rpicture">
																 
												 		</div>													
														<div class="modal-body">
															<div class="image-preview" style="width:510px;height:350px;background-color:pink">
																<img src="" style="width:510px;height:350px;display:block;overflow:hidden"/>
															</div>

														</div>	
														<div class="modal-footer">
															<button type="button" class="btn btn-default close-down" data-dismiss="modal">取消</button>
															<button type="button" class="btn btn-primary" id="modifyPrevious">上一步</button>			
															<button type="button" class="btn btn-primary" id="confirm">保存</button>			
														</div>	
												</div>
											</div>
											</div>

										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								
								<!-- 是否处理完毕模态框（Modal） -->
								<div class="modal fade" id="handleDone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">报修申请  / 处理反馈</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<div id="myTabContent" class="tab-content">
													<span class="text-danger">对于正在处理的报修记录不能修改，但可以反馈报修进度</span>
													<br>
													<label class="fancy-checkbox">
														<input type="checkbox" name="isResolved"><span>故障已解决</span>
													</label>
													<p class="text-danger msg"></p>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
														<button type="button" class="btn btn-primary confirm">确认</button>			
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
	
		clickRefreshRepair();  	//刷新
		clickDeleteRepair();		//删除
		clickcloseModel();			//取消
		
		
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
			     			  data[i].budno+"</td><td class="+data[i].rtype+">"+
			     			  getRepairTypeName(data[i].rtype)+"</td><td>"+
			     			  data[i].rcause+"</td><td class='image-hover'><i class='fa fa-eye'></i><span style='display:none'>"+
			     			  data[i].rpicture+"</span></td><td>"+
			     			  data[i].reporttime+"</td><td>"+
			     			  data[i].reporter+"</td><td>"+
			     			  getRepairHandleStatusName(data[i].handlestatus)+"</td><td>"+
			     			  data[i].handleadvice+"</td><td>"+
			     			  data[i].handler+"</td><td>"+
			     			  data[i].handletime+"</td><td>"+
			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyRepairApplication'>修改</button>"+
			     			  "</td></tr>");
			     			  	
				 	}
					clickModifyRepairApplication();
					clickImageEye();				 	
				 	
				 }
				}	
		 	});			
		}		
		
		//点击修改按钮时弹出模态框
		function clickModifyRepairApplication(){
		
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
                		var tds = $(this).parent().parent().parent().find("td");
                		var handleStatusName = tds.eq(8).text();
                		alert(handleStatusName);
                		if(handleStatusName!="未处理"){
                			alert("不能修改！");
                			$("#handleDone").modal("show");
                			
                		}else{
                		
                			$("#modifyRepairApplication").modal("show");
                			var rid = tds.eq(1).text();
                			var rtypeId = tds.eq(3).prop("class");
                			var rcause = tds.eq(4).text();
                			var rpicture = tds.eq(5).find("span").text();
	                		$("#modifyRepairApplication .rtype").val(rtypeId);
	                		$("#modifyRepairApplication .rcause").text(rcause);
                			$("#modifyRepairApplication .image-preview img").attr("src","http://"+rpicture);
                		}
                	}
            	
        		})	
        						
			})
        	$(".modify-right").click(function(){ 
        	
        		var tds = $(this).parent().parent().parent().find("td");
                var rid = tds.eq(1).text();
                var rtypeId = tds.eq(3).prop("class");
                var rcause = tds.eq(4).text();
                var rpicture = tds.eq(5).find("span").text();
                $("#modifyRepairApplication .rtype").val(rtypeId);
                $("#modifyRepairApplication .rcause").text(rcause);
                $("#modifyRepairApplication .image-preview img").attr("src","http://"+rpicture);
        		
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
 
		//获取上传图片的base64路径
		var imagebase64 = null;
		$("#inputfile").change(function(e) {

			//判断图片格式
		 	var obj = document.getElementById("inputfile");	   
		 	var fileName=obj.value;  //文件的路径
		 	var suffixIndex=fileName.lastIndexOf(".");  
		 	var suffix=fileName.substring(suffixIndex+1).toUpperCase();  
		 	if(suffix!="BMP"&&suffix!="JPG"&&suffix!="JPEG"&&suffix!="PNG"&&suffix!="GIF"){  
    			bootoast({message: "请上传图片（格式BMP、JPG、JPEG、PNG、GIF等）!",type: "warning",position: "bottom-left",timeout: 2});
				$("#inputfile").empty();
				return false;
		 	}else{
        		var reader = new FileReader();
        		reader.onload = (function (file) {
            		return function (e) {
               			imagebase64 = this.result;//base64的数据
               			$(".image-preview img").attr("src",imagebase64);
            		};
        		})(e.target.files[0]);
        		reader.readAsDataURL(e.target.files[0]);	 	
		 	
		 	}

		});	
		
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
     			
					bootoast({message: "新增成功！",type: "success",position: "bottom-left",timeout: 2});
     				$("#addRepairApplication").modal("hide");
					getRepairApplication(budno);			 
     			}
			
			});	
		})


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
		 
		 
		//获取上传图片的base64路径
		var modifyImagebase64 = null;
		$("#modifyInputfile").change(function(e) {

			//判断图片格式
		 	var obj = document.getElementById("modifyInputfile");	   
		 	var fileName=obj.value;  //文件的路径
		 	var suffixIndex=fileName.lastIndexOf(".");  
		 	var suffix=fileName.substring(suffixIndex+1).toUpperCase();  
		 	if(suffix!="BMP"&&suffix!="JPG"&&suffix!="JPEG"&&suffix!="PNG"&&suffix!="GIF"){  
    			bootoast({message: "请上传图片（格式BMP、JPG、JPEG、PNG、GIF等）!",type: "warning",position: "bottom-left",timeout: 2});
				$("#modifyInputfile").empty();
				return false;
		 	}else{
        		var reader = new FileReader();
        		reader.onload = (function (file) {
            		return function (e) {
               			modifyImagebase64 = this.result;//base64的数据
               			$(".image-preview img").attr("src",modifyImagebase64);
            		};
        		})(e.target.files[0]);
        		reader.readAsDataURL(e.target.files[0]);	 	
		 	
		 	}

		});			 
		//点击确认按钮，提交修改
		$("#confirm").click(function(){
		
			var rid = $("input[name='choose']:checked").parent().parent().parent().find("td").eq(1).text();
			alert(rid);
			var rtype =$("#modifyRepairApplication .rtype").val();
			var rcause =$("#modifyRepairApplication .rcause").val();
			
			var rpicture = modifyImagebase64;
			
			alert("rtype:"+rtype);
			alert("rcause:"+rcause);
			alert("rpicture:"+rpicture);
			$.ajax({
				url: "<%=request.getContextPath()%>/modifyRepairApplication",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"rid": rid,
     				"rtype": rtype,
     				"rcause": rcause,
     				"rpicture": rpicture
     			}),
     			success:function(data){
     			
     				alert("修改成功");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/user/stu/RepairApplication.jsp";
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
		//关闭模态框后清除building
		function clickcloseModel(){
			$(".close-down").click(function(){
				$(".modify-image").empty();
			
			})
		}
		function clickImageEye(){
			$(".repairlist tr .image-hover").click(function(){
			
				var imageSrc = $(this).find("span").text();
				$("#hoverImage img").attr("src","http://"+imageSrc);
				$("#hoverImage").modal();
			
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
		  $("#modifyNext").click(function(){
		  
		  		$("#modifyTab li:eq(1) a").tab("show");
		  })
		  $("#modifyPrevious").click(function(){
		  
		  		$("#modifyTab li:eq(0) a").tab("show");
		  		
		  })
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
				  
		  
	});
	//页面全部加载完后执行
</script>
</body>

</html>
