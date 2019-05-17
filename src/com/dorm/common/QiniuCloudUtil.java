package com.dorm.common;

import java.io.File;
import java.io.IOException;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.Base64;
import com.qiniu.util.UrlSafeBase64;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;


public class QiniuCloudUtil {

	
	  //设置好账号的ACCESS_KEY和SECRET_KEY
	  private static String ACCESS_KEY = "L7bRFs7dxn2-QT_FS86p7QQMpHWlJNndz9qHHm-G"; //这两个登录七牛 账号里面可以找到
	  private static String SECRET_KEY = "3kvTtcS24duIs0y55ZasM9INyQicEDyuTSqDfEC8";

	  //要上传的空间
	  private static String bucketname = "baobaodz"; //对应要上传到七牛上 你的那个路径（自己建文件夹 注意设置公开）
	  //上传文件的路径
	  private static final String DOMAIN = "resource.baobaodz.com";
	  //密钥配置
	  private static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	  //创建上传对象
	  UploadManager uploadManager = new UploadManager();
	  
	  //简单上传，使用默认策略，只需要设置上传的空间名就可以了
	  public static String getUpToken(){
	      return auth.uploadToken(bucketname);
	  }
	  //普通上传
	  public void upload(String filePath, String fileName) throws IOException{
	    try {
	    	
	      //调用put方法上传
	      Response res = uploadManager.put(filePath, fileName, getUpToken());
	      //打印返回的信息
	      System.out.println(res.bodyString()); 
	      } catch (QiniuException e) {
	          Response r = e.response;
	          // 请求失败时打印的异常的信息
	          System.out.println(r.toString());
	          try {
	              //响应的文本信息
	            System.out.println(r.bodyString());
	          } catch (QiniuException e1) {
	              //ignore
	          }
	      }       
	  }

	    /**
	     * 上传方法2
	     * @param file 文件
	     * @param key 上传到七牛上的文件的名称  （同一个空间下，名称【key】是唯一的）
	     * @param bucketName 空间名称  （这里是为了获取上传凭证）
	     */
	    public void upload(File file, String key, String bucketName) {
	        try {
	            // 调用put方法上传
	            Response res = uploadManager.put(file, key, getUpToken());
	            // 打印返回的信息
	            System.out.println(res.bodyString());
	        } catch (QiniuException e) {
	            Response r = e.response;
	            // 请求失败时打印的异常的信息
	            System.out.println(r.toString());
	            try {
	                // 响应的文本信息
	                System.out.println(r.bodyString());
	            } catch (QiniuException qe) {
	                // ignore
	            }
	        }
	    }
	    //base64方式上传
	    public String put64image(byte[] bytes, String key) throws Exception{
	        String file64 = Base64.encodeToString(bytes, 0);
	        Integer len = bytes.length;
	        //华北空间使用 upload-z1.qiniu.com，华南空间使用 upload-z2.qiniu.com，北美空间使用 upload-na0.qiniu.com
	        String url = "http://upload.qiniu.com/putb64/" + len + "/key/"+ UrlSafeBase64.encodeToString(key);      
	 
	        RequestBody rb = RequestBody.create(null, file64);
	        System.out.println(rb);
	        Request request = new Request.Builder()
			        .url(url)
	                .addHeader("Content-Type", "application/octet-stream")
	                .addHeader("Authorization", "UpToken " + getUpToken())
	                .post(rb).build();
	        System.out.println(request.headers());
	        OkHttpClient client = new OkHttpClient();
	        com.squareup.okhttp.Response response = client.newCall(request).execute();
	        System.out.println(response);
	        
	        String imageurl = DOMAIN + "/"+key;
	        //如果不需要添加图片样式，使用以下方式
	        return imageurl;
	    }



	public QiniuCloudUtil() {
		// TODO Auto-generated constructor stub
	}

}
