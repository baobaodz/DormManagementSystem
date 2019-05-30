<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>学生管理  | 宿舍管理信息系统</title>
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
					<h3 class="page-title" style="margin-bottom:10px;">学生管理</h3>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel" style="margin-bottom:10px;">
								<div class="panel-body">
									<p class="demo-button" style="margin-bottom:20px">
										<button type="button" class="btn btn-default" data-toggle="modal" data-target="#addBuilding"><i class="fa fa-plus-square"></i> 添加 </button>
										<button type="button" class="btn btn-primary modify-up" data-toggle="modal" data-target="#modifyBuilding"><i class="fa fa-edit"></i> 修改 </button>
										<button type="button" class="btn btn-info delete-up"><i class="fa fa-trash"></i> 删除 </button>
										<button type="button" class="btn btn-info refresh"><i class="fa fa-refresh"></i> 刷新 </button>
										<button type="button" class="btn btn-info "><i class="fa fa-refresh"></i> 分配宿舍 </button>
										<button type="button" class="btn btn-info "><i class="fa fa-refresh"></i> 缺寝/晚归填报</button>
										<button type="button" class="btn btn-info "><i class="fa fa-refresh"></i> 进出填报</button>
										<button type="button" class="btn btn-info "><i class="fa fa-refresh"></i> 来访登记</button>
									</p>
									<div class="input-group" style="float:left;margin-right:8px;">
										
										<select class="form-control building-id">
										
										</select>
										<input class="form-control dormitory-number" style="display:none" placeholder="" type="text">
									</div>
									<div class="input-group" style="float:left;margin-right:8px;">
										
										<select class="form-control sex-id">
											<option value="0">全部性别</option>
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
										<input class="form-control dormitory-number" style="display:none" placeholder="" type="text">
										<input class="form-control" id="myBuildingId" style="display:none" placeholder="" type="text">
									</div>										
									<div class="statustype" style="float:left;margin-right:8px;">
										<ul>
											<li>
												<label class="fancy-checkbox">
													<input type="checkbox" id="0" name="checkStatus"><span>未入住</span>
												</label>
											</li>
											<li>
												<label class="fancy-checkbox">
													<input type="checkbox" id="1" name="checkStatus"><span>已入住</span>
												</label>
											</li>
										</ul>
									</div>
									<p style="float:right;">
									<button type="button" class="btn btn-info filter-query"><i class="fa fa-search"></i> 查询</button>
									<button type="button" class="btn btn-info refresh" data-toggle="popover-x" data-target="#myPopover" data-placement="bottom bottom-right"><i class="fa fa-download"></i> 导出 </button>
									<button type="button" class="btn btn-info refresh"><i class="fa fa-print"></i> 打印 </button>
									</p>
									<div class="input-group" style="float:right;margin-right:8px;width:200px">
										<input type="text" value="" class="form-control search-key" placeholder="搜素">
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
												<th>学号</th>
												<th>姓名</th>
												<th>性别</th>
												<th>入学时间</th>
												<th>年级</th>
												<th>班级</th>
												<th>状态</th>
												<th>角色</th>
												<th>所在宿舍</th>
												
											</tr>
										</thead>
										<tbody class="studentlist">
											
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


    <script type="text/javascript">
	$(function(){
		var dormAdminID = sessionStorage.getItem("dormAdminID");
        var daPassword = sessionStorage.getItem("daPassword");
        if(dormAdminID==""||dormAdminID==null||dormAdminID==""||dormAdminID==null){
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
     					$("#myBuildingId").val(data.building.bid);
     					getBuildingId(data.building.bid);//进入先查询楼宇号
			     		
     				}
     			}
		
			});
        }
       
// 		queryStudent();
// 		function queryStudent(){
		
// 			$.ajax({
// 				url: "<%=request.getContextPath()%>/queryStudent",
//      			type: "post",
//      			dataType : "json",
//      			contentType: "application/json;charset=utf-8",
//      			data:JSON.stringify({}),
//      			success:function(data){
//      			 	for(var i =0; i<data.length; i++){
     			 		
//      			 		data[i].character = data[i].character==null?"":data[i].character;
// 			     		$(".studentlist").append("<tr><td><label class='fancy-checkbox'><input type='checkbox' name='choose'><span></span></label></td><td>"+
// 							  data[i].sid+"</td><td>"+
// 			     			  data[i].sname+"</td><td>"+
// 			     			  data[i].gender+"</td><td>"+
// 			     			  new Date(data[i].admission).toLocaleDateString()+"</td><td>"+
// 			     			  data[i].sgrade+"</td><td>"+
// 			     			  data[i].sclass+"</td><td>"+
// 			     			  data[i].status+"</td><td>"+
// 			     			  data[i].character+"</td><td>"+
// 			     			  data[i].dormitory.building_id+"-"+data[i].dormitory.dno+"</td><td>"+
// 			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyBuilding'>修改</button>"+
// 			     			  "<button type='button' class='more'>详情</button></td></tr>");
			     			  	
// 				 	}
// 					clickModifyBuilding();
// 					clickMoreInfo();				 	
				 	
// 				 }	
// 		 	});		

// 		}
		//进入先查询楼宇号
		function getBuildingId(bid){
		
			alert(bid);
			$.ajax({
				url: "<%=request.getContextPath()%>/getBuildingId",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     			
     				$(".building-id").append("<option value='0'>全部</option>");
     			 	for(var i =0; i<data.length; i++){
			     		$(".building-id").append("<option value='"+data[i]+"'>学生宿舍 "+data[i]+" 栋</option>");
			     			  	
				 	}
				 	alert("bid:"+bid);
				 	$(".building-id")[0].selectedIndex = bid;//设置默认楼号为管理员所负责楼号
				 	$("input[name='checkStatus']").attr("checked",true);
				 	$(".current-page").val("1");
				 	getQueryParamterThenDo();//查询各参数值并执行
				 	
				 	getDormitoryNumber(bid);
				 	
				 }			
			})
		
		}
		//查询个参数值并执行
		function getQueryParamterThenDo(){
			var bid = $(".building-id").val();
			var sexId = $(".sex-id").val();
			var checkedStatusId = "";
        	$("input[name='checkStatus']").each(function(e){
            	
                if($(this).prop("checked")){
                	var statusId = $(this).attr("id");
                	checkedStatusId +="," + statusId;
                }
            	
        	})
        	var queryKey = $(".search-key").val();
        		
        	getApplicationNumber(bid,sexId,checkedStatusId,queryKey);		
		}	
		//查询在过滤条件下的申请总数		
		function getApplicationNumber(bid,typeId,startTime,endTime,checkedStatusId){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/getApplicationNumber",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"bid" : bid,
     				"typeId" : typeId,
     				"startTime" : startTime,
     				"endTime" : endTime,
     				"checkedStatusId" : checkedStatusId
     			}),
     			success:function(data){
     			
 			 		var totalSize = data;//每栋楼报修申请总数
				 	var currentPage = $(".current-page").val();
				 	var pageSize = $(".page-size").val();
				 	totalPage = Math.ceil(totalSize/pageSize);
					if(currentPage <= 0){currentPage = 1};
					if(currentPage > totalPage){currentPage = totalPage};	
					$(".current-page").val(currentPage);
					$(".total-size").text(totalPage);
					
				 	queryRepairApplication(bid,typeId,startTime,endTime,checkedStatusId,currentPage,pageSize);//分页查询
				 }	
		 	});			
		}	
		//查询并分页
		function queryRepairApplication(bid,typeId,startTime,endTime,checkedStatusId,currentPage,pageSize){
			$.ajax({
				url: "<%=request.getContextPath()%>/queryRepairApplication",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"bid": bid,
     				"typeId": typeId,
     				"startTime": startTime,
     				"endTime": endTime,
     				"checkedStatusId": checkedStatusId,
     				"currentPage": currentPage,
     				"pageSize": pageSize
     			}),
     			success:function(data){
     			
     				if(data.length!=0){
						$(".repair-list").empty();
     					$(".no-data").css("display","none");
     					$(".page-leaf").css("display","block");
     			 		for(var i =0; i<data.length; i++){
							data[i].handleadvice = data[i].handleadvice==null?"":data[i].handleadvice;
							data[i].handler = data[i].handler==null?"":data[i].handler;
							data[i].handletime = data[i].handletime==null?"":data[i].handletime;
			     			$(".repair-list").append("<tr><td style='display:none'>"+
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
			     			  	"<button type='button' class='handle-right' data-toggle='modal' data-target='#handleRepairApplication'>处理</button>"+
			     			  	"</td></tr>");
			     		}
			     		clickImageEye();
			     		clickHandleRepair();
			     		
			     	
			     		
			     	}else{
			     		$(".repair-list").empty();
			     		$(".no-data").css("display","block");
			     		$(".page-leaf").css("display","none");
			     	}
			     }
		 	});	
		
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
		
		
		var src = null;
		
		$("#excelFile").change(function(e) {
			//判断图片格式
		 	var obj = document.getElementById("excelFile");	   
		 	var fileName=obj.value; 
		 	alert(fileName);
		 	var suffixIndex=fileName.lastIndexOf(".");  
		 	var suffix=fileName.substring(suffixIndex+1).toUpperCase();  
		 	if(suffix!="EXECL"&&suffix!="XLSX"&&suffix!="CSV"&&suffix!="XLS"){  
		    	alert( "请上传excel"); 
				$("#excelFile").attr("value","");
		 	};

		});	
		$("#upload").click(function(){
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/uploadDormStudent",
				data : new FormData($("#uploadForm")[0]),
				processData : false,
				contentType : false,
				success:function(result){
					alert("上传成功！");
					window.location.href = "<%=request.getContextPath()%>/jsp/admin/BuildingManagement.jsp";
				} 	
			});
		});
	
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
			     		$(".studentlist").append("<tr><td><label class='fancy-checkbox'><input type='checkbox' name='choose'><span></span></label></td><td>"+
							  data[i].sid+"</td><td>"+
			     			  data[i].sname+"</td><td>"+
			     			  data[i].gender+"</td><td>"+
			     			  data[i].admission+"</td><td>"+
			     			  data[i].sgrade+"</td><td>"+
			     			  data[i].sclass+"</td><td>"+
			     			  data[i].status+"</td><td>"+
			     			  data[i].character+"</td><td>"+
			     			  data[i].dormitory_id+"</td><td>"+
			     			  "<button type='button' class='modify-right' data-toggle='modal' data-target='#modifyBuilding'>修改</button>"+
			     			  "<button type='button' class='more'>详情</button></td></tr>");
			     			  	
				 	}
					clickModifyBuilding();
					clickMoreInfo();				 	
				 	
				 }	
		 	});
		}
		

		clickRefreshBuilding();
		clickDeleteBuilding();
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
                		var bid = $(this).parent().parent().parent().find("td").eq(1).text();
                		showBuilding(bid);
                	}
            	
        		})	
        						
			})
        	$(".modify-right").click(function(){ 
        	
 				//获取点击当前按钮所在行的第一列值，即楼宇编号
				//var aid = $(this).parent().parent().children("td:first-Child").text();
				//var aid = $(this).parents().children("td").eq(0).text();       	
        		var bid = $(this).parent().parent().find("td").eq(1).text();
        		showBuilding(bid);
        		
        	})
		}
		function clickDeleteBuilding(){
		
			$(".delete-up").click(function(){
			
				var i=0,checbox = $("input[name='choose']");
				checbox.each(function(){//反选 
            	
                	if($(this).prop("checked")){
                		i++;
                	}
        		}) 
        		if(i==0){
        			alert("请选择一个");
        			return false;
        		}
        		checbox.each(function(){//反选 
            	
                	if($(this).prop("checked")){
                		var bid = $(this).parent().parent().parent().find("td").eq(1).text();
                		deleteBuilding(bid);
                	}
            	
        		})	
			})
		}
 
		//模态框显示选定楼宇
		function showBuilding(bid){
		
			$.ajax({
				url: "<%=request.getContextPath()%>/getBuilding",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"bid": bid
     			}),
     			success:function(data){
     			
					$("#modifyBuilding .bid").val(bid);
					$("#modifyBuilding .bname").val(data.bname);
					$("#modifyBuilding .attribute").val(data.attribute);
					$("#modifyBuilding .location").val(data.location);
					$("#modifyBuilding .description").val(data.description);
					$("#modifyBuilding .imageinfo").val(data.imageinfo);     			
					$("#modifyBuilding .managernumber").val(data.managernumber);     			
				 
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

		function deleteBuilding(bid){
		
				if(confirm("确认删除学生宿舍"+bid+"栋吗？")){
					
					$.ajax({
						url: "<%=request.getContextPath()%>/deleteBuilding",
     					type: "post",
     					dataType : "json",
     					contentType: "application/json;charset=utf-8",
     					data:JSON.stringify({
     						"bid": bid
     					}),
     					success:function(data){
     						alert("删除成功！");
							$(".buildinglist").empty();
							queryAllBuilding();
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
	}	
</script>
</body>

</html>
