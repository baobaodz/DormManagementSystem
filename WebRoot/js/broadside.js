function getRootPath_web() {

	var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPath = curWwwPath.substring(0, pos);

    if(pathName.indexOf("MyBlog")!=-1){
    	//获取带"/"的项目名，如：/MyBlog
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPath+projectName);
     }else{
        return localhostPath;
     }
}
var rootPath = getRootPath_web();
//加载站点信息
function loadSiteInfo(){
	
	$.ajax({
		url : rootPath+"/querySiteInfo",
     	type: "post",
     	dataType : "json",
     	contentType: "application/json;charset=utf-8",
     	data:JSON.stringify({}),
     	success:function(data){
     		var mybloginfo = $(".mybloginfo");
     		mybloginfo.find("dd").eq(0).text(data.ARTICLENUM);
     		mybloginfo.find("dd").eq(1).text(data.LIKENUM);
     		mybloginfo.find("dd").eq(2).text(data.VIEWNUM);
     		mybloginfo.find("dd").eq(3).text(data.MESSNUM);
		}
	})
		
}
function loadMostViewCount(){
	$.ajax({
		url: rootPath+"/orderByViewCount",
     	type: "post",
     	dataType : "json",
     	contentType: "application/json;charset=utf-8",
     	data:JSON.stringify({}),
     	success:function(data){
     		for(var i=0;i<data.length;i++){
     			 $(".mymostview ul").append("<li style='margin: 4px 0px;'><span>"+(i+1)+"</span><a href='"+rootPath+"/jsp/details.jsp?aid="+data[i].aid+"'>"+data[i].title+"</a></li>");
			  }
     	}
	});
}
//加载文章归档
function loadArchives(){
	$.ajax({
		url: rootPath+"/queryArchivesGroupByMonth",
     	type: "post",
     	dataType : "json",
     	contentType: "application/json;charset=utf-8",
     	data:JSON.stringify({}),
     	success:function(data){
     		for(var i=0;i<data.length;i++){
     			 $(".myarchives ul").append("<li><span><a href='"+rootPath+"/jsp/archives.jsp?ym="+data[i].YM+"'>"+data[i].YM.substr(0,4)+"年"+data[i].YM.substr(5)+"月</a></span><span>"+data[i].COUNT+"篇</span></li>");
			  }
     	}
	});
}
