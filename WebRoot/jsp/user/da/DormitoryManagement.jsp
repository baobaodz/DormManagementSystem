<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>楼宇管理  | 宿舍管理信息系统</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="../../../assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../../assets/vendor/font-awesome/css/font-awesome.min.css">
<!-- 	<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/5.8.2/css/fontawesome.min.css"> -->
	<link rel="stylesheet" href="../../../assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="../../../assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="../../../assets/css/demo.css">
	<link rel="stylesheet" href="../../../css/flat.css">
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
					<h3 class="page-title" style="margin-bottom:10px;">宿舍管理</h3>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel" style="margin-bottom:10px;">
								<div class="panel-body">
									<p class="demo-button">
										<button type="button" class="btn btn-default" data-toggle="modal" data-target="#addBuilding"><i class="fa fa-plus-square"></i> 添加 </button>
										<button type="button" class="btn btn-primary modify-up" data-toggle="modal" data-target="#modifyBuilding"><i class="fa fa-edit"></i> 修改 </button>
										<button type="button" class="btn btn-info distribution" data-toggle="modal" data-target="#distributeStudent"><i class="fa fa-random"></i> 分配 </button>
										<button type="button" class="btn btn-info refresh"><i class="fa fa-refresh"></i> 刷新 </button>
									</p>
									<div class="input-group">
										
										<select class="form-control building-id">
										
										</select>
										<input class="form-control dormitory-number" style="display:none" placeholder="" type="text">
<!-- 									<button type="button" class="btn btn-info"><i class="fa fa-refresh"></i> 请选择</button> -->
									</div>									
								</div>
								<!-- 模态框（Modal） -->
								<div class="modal fade" id="addBuilding" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">楼宇管理  / 添加楼宇</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
											
												<form role="form" style="padding:8px;">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-building">&nbsp;</i> 宿舍楼号</span>
														<input class="form-control bid" placeholder="bid" type="text">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-flag">&nbsp;</i> 楼宇名称</span>
														<input class="form-control bname" placeholder="bname" type="text">
														
													</div>
													<br>
													
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-venus-mars">&nbsp;</i>楼宇类别</span>
														<select class="form-control attribute">
															<option value="男生宿舍楼">男生宿舍楼</option>
															<option value="女生宿舍楼">女生宿舍楼</option>
															<option value="混合宿舍楼">混合宿舍楼</option>
														</select>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-map-marker">&nbsp;</i>&nbsp; 楼宇位置</span>
														<input class="form-control location" placeholder="location" type="text">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-user">&nbsp;</i> 宿管人数</span>
														<select class="form-control managernumber">
															<option value="2">2人</option>
															<option value="3">3人</option>
															<option value="4">4人</option>
														</select>
													</div>
													<br>
																								
													<textarea class="form-control description" placeholder="description" rows="4"></textarea>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-image">&nbsp;</i> 图片描述</span>
														<input class="form-control imageinfo" placeholder="imageinfo" type="text">
													</div>
													<br>	
												</form>	
											</div>											
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary" id="save">保存</button>			
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								
								<!-- 修改楼宇模态框（Modal） -->
								<div class="modal fade" id="modifyBuilding" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="modifyModalLabel">楼宇管理  / 修改楼宇</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<form role="form" style="padding:8px;">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-building">&nbsp;</i> 宿舍楼号</span>
														<input class="form-control bid" placeholder="bid" type="text">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-flag">&nbsp;</i> 楼宇名称</span>
														<input class="form-control bname" placeholder="bname" type="text">
														
													</div>
													<br>
													
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-venus-mars">&nbsp;</i>楼宇类别</span>
														<select class="form-control attribute">
															<option value="男生宿舍楼">男生宿舍楼</option>
															<option value="女生宿舍楼">女生宿舍楼</option>
															<option value="混合宿舍楼">混合宿舍楼</option>
														</select>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-map-marker">&nbsp;</i>&nbsp; 楼宇位置</span>
														<input class="form-control location" placeholder="location" type="text">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-user">&nbsp;</i> 宿管人数</span>
														<select class="form-control managernumber">
															<option value="2">2人</option>
															<option value="3">3人</option>
															<option value="4">4人</option>
														</select>
													</div>
													<br>
																								
													<textarea class="form-control description" placeholder="description" rows="4"></textarea>
													<br>
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-image">&nbsp;</i> 图片描述</span>
														<input class="form-control imageinfo" placeholder="imageinfo" type="text">
														
													</div>
													<br>	
												</form>	
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary" id="confirm">确定</button>			
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								<!-- 分配学生模态框（Modal） -->
								<div class="modal fade" id="distributeStudent" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="modifyModalLabel">宿舍管理  / 分配学生</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<div id="panel-scrolling-demo" class="panel" >
													
													<div class="panel-body" style="height:300px;">
														<div><table class="table table-hover">
															<thead>
																<tr>
																
																	<th>学号</th>
																	<th>姓名</th>
																	<th>性别</th>
																	<th>班级</th>
																	<th>年级</th>
																	<th>状态</th>
																	<th>选择</th>
																</tr>
															</thead>
															<tbody class="studentlist">
															
															</tbody>
														<p></table>
														</div>
													
													</div>
												</div>
												<p class="text-danger msg"></p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary" id="updateDistr">确定</button>			
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								
								<!-- 查看学生模态框（Modal） -->
								<div class="modal fade" id="showOccupiedStudent" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h4 class="modal-title" id="modifyModalLabel">查看学生</h4>
											</div>
											<!--内容 -->
											<div class="modal-body">
												<div id="panel" class="panel" >
													
													<div class="panel-body">
														<div><table class="table table-hover occupied-table">
															<thead>
																<tr>
																
																	<th>学号</th>
																	<th>姓名</th>
																	<th>性别</th>
																	<th>班级</th>
																	<th>年级</th>
																</tr>
															</thead>
															<tbody class="occupiedlist">
															
															</tbody>
														<p></table>
														</div>
													
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								
								<!--宿舍列表 -->
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
												<th style="display:none;">宿舍ID</th>
												<th>宿舍号</th>
												<th>性质</th>
												<th>容量</th>
												<th>已入住</th>
												<th>所属楼宇</th>
												<th>操作</th>
												
											</tr>
										</thead>
										<tbody class="dormitorylist">
											
										</tbody>
									</table>
								</div>
							</div>
							<!-- END TABLE HOVER -->
						
						<div style="width: 100%;height:30px;text-align:right;padding-right: 15px;" >
							<span>共</span><span class="total-size">8</span><span>页&nbsp;</span>
							<span>每页
								<select class="page-size">
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
								</select>条
							</span>&nbsp;
							<button class="page-button"><span class="page-previous"><i class="fa fa-caret-left"></i>&nbsp;</span></button>
							<span>第<input class="current-page" type="number" style="width:36px;height:23px"></span>
							<span>/</span><span class="total-size"></span><span>页&nbsp;</span>
							<button class="page-button"><span class="page-next"><i class="fa fa-caret-right">&nbsp;</i></span></button>
						</div>
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
	<script src="../../../js/dormadmin/navbar.js"></script>

    <script type="text/javascript">
    
	$(function(){
		var dormAdminID = sessionStorage.getItem("dormAdminID");
        var daPassword = sessionStorage.getItem("daPassword");
        if(dormAdminID==""||dormAdminID==null||dormAdminID==""||dormAdminID==null){
        	alert("您无权限，请先登录!");
            window.location.href = "<%=request.getContextPath()%>/jsp/no_access.jsp";
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
     					window.location.href = "<%=request.getContextPath()%>/jsp/no_access.jsp";
     				}else{
     				
     					sessionStorage.setItem("daPassword",data.dapassword);
     					$(".username").text(data.truename);
     					getBuildingId(data.building.bid);//进入先查询楼宇号
			     		
     				}
     			}
		
			});
        }		        		
        
		queryDormitory();
		
		
		function getBuildingId(bid){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/getBuildingId",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     			
     			 	for(var i =0; i<data.length; i++){
			     		$(".building-id").append("<option value='"+data[i]+"'>学生宿舍 "+data[i]+" 栋</option>");
			     		  	
				 	}
				 	
				 	$(".building-id")[0].selectedIndex = bid-1;//设置默认楼号为管理员所负责楼号
				 	$(".current-page").val("1");
				 	
				 	getDormitoryNumber(bid);//查询总宿舍数
				 	
				 	
				 }			
			})
		
		}
		function getDormitoryNumber(bid){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/getDormitoryNumber",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"bid" : bid
     			}),
     			success:function(data){
     			
 			 		var totalSize = data;//每栋楼宿舍总数
				 	var currentPage = $(".current-page").val();
				 	var pageSize = $(".page-size").val();
				 	totalPage = Math.ceil(totalSize/pageSize);
				 	
					if(currentPage <= 0){currentPage = 1};
					if(currentPage > totalPage){currentPage = totalPage};	
					$(".current-page").val(currentPage);
					$(".total-size").text(totalPage);
					
// 					alert(bid+currentPage+pageSize);
				 	queryDormitoryByBuilding(bid,currentPage,pageSize);//分页查询
				 	
				 	
				 }	
		 	});			
		}
		conditionChange();
		function conditionChange(){
		
			$(".building-id,.current-page,.page-size").change(function(){
		
				var bid = $(".building-id").val();
				
				getDormitoryNumber(bid);
			})	
		
		}

		function queryDormitoryByBuilding(bid,currentPage,pageSize){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/queryDormitoryByBuilding",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"bid": bid,
     				"currentPage": currentPage,
     				"pageSize": pageSize
     			}),
     			success:function(data){
     			
     				$(".dormitorylist").empty();
     			 	for(var i =0; i<data.length; i++){
     		
			     		$(".dormitorylist").append("<tr><td><label class='fancy-checkbox'><input type='checkbox' name='choose'><span></span></label></td><td style='display:none'>"+
							  data[i].did+"</td><td>"+
							  data[i].dno+"</td><td>"+
			     			  data[i].category+"</td><td>"+
			     			  data[i].capacity+"</td><td><span style='display:none;'>"+
			     			  data[i].occupied+"</span></td><td>"+
			     			  data[i].building_id+"</td><td>"+
			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyBuilding'>修改</button>"+
			     			  "<button type='button' class='more'>详情</button></td></tr>");
			     			  	
				 	}
				 	showOccupiedImage(data);
					clickModifyBuilding();
					clickMoreInfo();
					clickOccupiedStudent(); //点击入住人数单元格弹窗显示具体信息				 	
				 	
				 }	
		 	});			
		
		}
		function showOccupiedImage(data){
		
			for(var i =0; i<data.length; i++){
					
     			 	for(var j=0;j<data[i].occupied;j++){
     			 			if(data[i].category.substr(0,1)=="女"){
     			 			
     			 				$(".dormitorylist").find("tr").eq(i).find("td").eq(5).append("<i class='fa fa-female' style='color:pink;font-size:17px;'>&nbsp;</i>");
     			 			}else{
     			 			
     			 				$(".dormitorylist").find("tr").eq(i).find("td").eq(5).append("<i class='fa fa-male' style='color:skyblue;font-size:17px;'>&nbsp;</i>");
     			 			
     			 			}
     			 			
     			 	}
     			 	for(var j=0;j<data[i].capacity-data[i].occupied;j++){
     			 		if(data[i].category.substr(0,1)=="女"){
     			 			$(".dormitorylist").find("tr").eq(i).find("td").eq(5).append("<i class='fa fa-female' style='color:#ebebeb;font-size:17px;'>&nbsp;</i>");
     			 		}else{
     			 		
     			 			$(".dormitorylist").find("tr").eq(i).find("td").eq(5).append("<i class='fa fa-male' style='color:#ebebeb;font-size:17px;'>&nbsp;</i>");
     			 		}
     			 	}
			}
		
		}
		$(".page-previous,.page-next").click(function(){
		
			var currentPage = $(".current-page").val();
			var totalPage = $(".total-size").text();
			if($(this).attr("class").indexOf("previous")>=0&&currentPage>1){
				
				currentPage-=1;
				
			}else if($(this).attr("class").indexOf("next")>=0&&parseInt(currentPage)<parseInt(totalPage)){
				currentPage = parseInt(currentPage) + 1;
			}else{
				$(".page-button").attr("disabled","disabled");
				return false;
			}
			$(".current-page").empty().val(currentPage);
			var bid = $(".building-id").val();
			getDormitoryNumber(bid);
		
		})
		function queryDormitory(){
			var isDistr = "1";
			$.ajax({
				url: "<%=request.getContextPath()%>/queryDormitory",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     			
     			
     			 	for(var i =0; i<data.length; i++){
			     		$(".dormitorylist").append("<tr><td><label class='fancy-checkbox'><input type='checkbox' name='choose'><span></span></label></td><td>"+
							  data[i].dno+"</td><td>"+
			     			  data[i].category+"</td><td>"+
			     			  data[i].capacity+"</td><td>"+
			     			  data[i].occupied+"</td><td>"+
			     			  data[i].building_id+"</td><td>"+
			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyBuilding'>修改</button>"+
			     			  "<button type='button' class='more'>详情</button></td></tr>");
			     			  	
				 	}
				 	
					clickModifyBuilding();
					clickMoreInfo();				 	
				 	
				 }	
		 	});
		}
		
		
		clickRefreshBuilding();
		clickDistribution();	//点击分配按钮
		
		//点击修改按钮时弹出模态框
		function clickModifyBuilding(){
		
			$(".modify-up").click(function(){
			
				var i=0,checbox = $("input[name='choose']");
				checbox.each(function(){//反选 
            	
                	if($(this).prop("checked")){
                		i++;
                	}
        		}) 
        		if(i==0||i>1){
        			alert("请选择一个");
        			return false;
        		}
        		checbox.each(function(){//反选 
            	
                	if($(this).prop("checked")){
                		var did = $(this).parent().parent().parent().find("td").eq(1).text();
                		alert("did:"+did);
                		showBuilding(did);
                	}
            	
        		})	
        						
			})
        	$(".modify-right").click(function(){ 
        	
        		var bid = $(this).parent().parent().find("td").eq(1).text();
        		showBuilding(bid);
        		
        	})
		}
		
		
		function clickDistribution(){
		
			$(".distribution").click(function(){
			
				var i=0,checbox = $("input[name='choose']");
				checbox.each(function(){//反选 
            	
                	if($(this).prop("checked")){
                		i++;
                	}
        		}) 
        		if(i==0||i>1){
        			alert("请选择一个");
        			return false;
        		}
        		checbox.each(function(){
            	
                	if($(this).prop("checked")){
                		var did = $(this).parent().parent().parent().find("td").eq(1).text();
                		var gender = $(this).parent().parent().parent().find("td").eq(3).text().substr(0,1);
                		showDistrStudent(gender);
                	}
            	
        		})	
			})
		}
 
		//模态框显示选定楼宇
		function showDistrStudent(gender){
		
			
			$.ajax({
				url: "<%=request.getContextPath()%>/getDistrStudent",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"gender": gender
     			}),
     			success:function(data){
     				$(".studentlist").empty();
     				for(var i =0; i<data.length; i++){
     					$(".studentlist").append("<tr><td>"+
							data[i].sid+"</td><td>"+
			     			data[i].sname+"</td><td>"+
			     			data[i].gender+"</td><td>"+
			     			data[i].sclass+"</td><td>"+
			     			data[i].sgrade+"</td><td>"+
			     			data[i].status+"</td><td>"+
			     			"<label class='fancy-checkbox'><input type='checkbox' name='chooseDistr'><span></span></label></td></tr>");
			     	}		  	    			
				 
     			}
			
			});			
		}
				
		function clickOccupiedStudent(){
			$(".dormitorylist").find("td").click(function(){
				var row = Number($(this).prevAll().length)+1; 
				if(row==6){
					var did = $(this).parent().find("td").eq(1).text();
					var occupied = $(this).parent().find("td").eq(5).find("span").text();
					if(occupied==0){
						$(".occupiedlist").html("<tr><td colspan='5'><img class='no-data'src='http://resource.baobaodz.com/DMS/common/no_data.svg'/></td></tr>");
						$(".no-data").css({"display":"block","margin":"0 auto","width":"230px"});
					}else{
						$(".occupiedlist").empty();
						getOccupiedByDormitory(did);
					}
					$("#showOccupiedStudent").modal();
				}
				
				
			})
		
		}
		function getOccupiedByDormitory(did){
			$.ajax({
				url: "<%=request.getContextPath()%>/getOccupiedByDorm",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"did": did
     			}),
     			success:function(data){
     			
     				for(var i =0; i<data.length; i++){
     					$(".occupiedlist").append("<tr><td>"+
							data[i].sid+"</td><td>"+
			     			data[i].sname+"</td><td>"+
			     			data[i].gender+"</td><td>"+
			     			data[i].sclass+"</td><td>"+
			     			data[i].sgrade+"</td></tr>");
			     			
			     	}		  	    			
				 
     			}
			
			});					
			
		
		}
		//点击保存，提交新建请求
		$("#save").click(function(){
		
			var bid =$(".bid").val();
			var bname =$(".bname").val();
			var attribute =$(".attribute").val();
			var location =$(".location").val();
			var description =$(".description").val();
			var imageinfo =$(".imageinfo").val();
			var managernumber =$(".managernumber").val();
			
			alert(bid+bname+attribute+location+description+imageinfo+managernumber);
			$.ajax({
				url: "<%=request.getContextPath()%>/saveBuilding",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"bid": bid,
     				"bname": bname,
     				"attribute": attribute,
     				"location": location,
     				"description": description,
     				"imageinfo": imageinfo,
     				"managernumber":managernumber
     			}),
     			success:function(data){
     			
     				alert("新增楼宇成功");
     				saveDormitory(bid,attribute);
				 	window.location.href = "<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp";
				 
     			}
			
			});
		})
		//点击保存，提交新建请求
		$("#updateDistr").click(function(){
		
			var i=0,checkbox = $("input[name='chooseDistr']");
			checkbox.each(function(){
            	
               if($(this).prop("checked")){
                	i++;
               }
        	}) 
        	var checkedDormitory = $("input[name='choose']:checked");
        	var tds = checkedDormitory.parent().parent().parent().find("td");
        	var checkedDid = tds.eq(1).text();
        	var capacity = tds.eq(4).text();
        	var occupied = tds.eq(5).find("span").text();
        	
        	var reminder = capacity - occupied;
        	alert(reminder);
        	if(i==0){
        		
        		$(".msg").text("您还没选择！");
        		return false;
        	}else if(i>reminder){
        		$(".msg").text("超过宿舍容量！");
        	}else{
        	
        		var checkedSid = "";
        		checkbox.each(function(e){
            	
                	if($(this).prop("checked")){
                		var sid = $(this).parent().parent().parent().find("td").eq(0).text();
                		checkedSid +="," + sid;
                		updateDistr(checkedSid,checkedDid);
                	}
            	
        		})
        	}
        })		
		
		function updateDistr(checkedSid,checkedDid){
			
			$.ajax({
				url: "<%=request.getContextPath()%>/updateDistr",
     			type: "post",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"checkedSid": checkedSid,
     				"checkedDid": checkedDid
     			}),
     			success:function(data){
     			
     				alert("分配成功!");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/user/da/DormitoryManagement.jsp";
				 
     			}
			
			});
		}
				
		
		//点击保存，提交新建请求
		$(".newDormitory").click(function(){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/saveDormitory",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"category": "男",
     				"building_id": 1
     			}),
     			success:function(data){
     			
     				alert("新增宿舍成功");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp";
				 
     			}
			
			});
		})
		function saveDormitory(bid,attribute){
		
			var category = attribute.substr(0,1)+"寝";
			alert(category+bid);
			$.ajax({
				url: "<%=request.getContextPath()%>/saveDormitory",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"category": category,
     				"building_id": bid
     			}),
     			success:function(data){
     			
     				alert("新增宿舍成功");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp";
				 
     			}, error:function(jqXHR, textStatus, errorThrown) {
 					alert(jqXHR.status);//404
 					alert(jqXHR.readyState);//4
 					alert(jqXHR.responseText);//4
 					alert(jqXHR.statusText);//4
 					alert(textStatus);//error
   				}
     			
			
			});			
			
		}
		//点击详情按钮跳转到BuildingInfo页面
		function clickMoreInfo(){
		
			$(".more").click(function(){ 
			
				var bid = $(this).parent().parent().find("td").eq(1).text();
				window.location.href = "<%=request.getContextPath()%>/jsp/BuildingInfo.jsp?bid="+bid;
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

// 		function deleteBuilding(bid){
		
// 				if(confirm("确认删除学生宿舍"+bid+"栋吗？")){
					
// 					$.ajax({
// 						url: "<%=request.getContextPath()%>/deleteBuilding",
//      					type: "post",
//      					dataType : "json",
//      					contentType: "application/json;charset=utf-8",
//      					data:JSON.stringify({
//      						"bid": bid
//      					}),
//      					success:function(data){
//      						alert("删除成功！");
// 							$(".buildinglist").empty();
// 							queryAllBuilding();
// 						}
// 					});
// 				}else{
// 					return false;
// 				}
				
// 		 }
		//点击确认按钮，提交修改
		$("#confirm").click(function(){
			var bid =$("#modifyBuilding .bid").val();
			var bname =$("#modifyBuilding .bname").val();
			var attribute =$("#modifyBuilding .attribute").val();
			var location =$("#modifyBuilding .location").val();
			var description =$("#modifyBuilding .description").val();
			var imageinfo =$("#modifyBuilding .imageinfo").val();
			var managernumber =$("#modifyBuilding .managernumber").val();
			
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
     				"description": description,
     				"imageinfo": imageinfo,
     				"managernumber":managernumber
     			}),
     			success:function(data){
     			
     				alert("修改成功");
				 	window.location.href = "<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp";
     			}
			
			});	
		})	
		function clickRefreshBuilding(){
		
			$(".refresh").click(function(){
		
				$(".buildinglist").empty();
				queryAllBuilding();
			}) 
		}
		

		  $("#sidebar-nav .nav").find("li").eq(0).removeClass();
		  
		  
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
    	$(".panel-scrolling-demo .slimScrollDiv").css("height","300px");
    	$(".panel-scrolling-demo .slimScrollDiv .panel-body").css("height","300px");
	}	
</script>
</body>

</html>
