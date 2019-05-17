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

	
	  //���ú��˺ŵ�ACCESS_KEY��SECRET_KEY
	  private static String ACCESS_KEY = "L7bRFs7dxn2-QT_FS86p7QQMpHWlJNndz9qHHm-G"; //��������¼��ţ �˺���������ҵ�
	  private static String SECRET_KEY = "3kvTtcS24duIs0y55ZasM9INyQicEDyuTSqDfEC8";

	  //Ҫ�ϴ��Ŀռ�
	  private static String bucketname = "baobaodz"; //��ӦҪ�ϴ�����ţ�� ����Ǹ�·�����Լ����ļ��� ע�����ù�����
	  //�ϴ��ļ���·��
	  private static final String DOMAIN = "resource.baobaodz.com";
	  //��Կ����
	  private static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	  //�����ϴ�����
	  UploadManager uploadManager = new UploadManager();
	  
	  //���ϴ���ʹ��Ĭ�ϲ��ԣ�ֻ��Ҫ�����ϴ��Ŀռ����Ϳ�����
	  public static String getUpToken(){
	      return auth.uploadToken(bucketname);
	  }
	  //��ͨ�ϴ�
	  public void upload(String filePath, String fileName) throws IOException{
	    try {
	    	
	      //����put�����ϴ�
	      Response res = uploadManager.put(filePath, fileName, getUpToken());
	      //��ӡ���ص���Ϣ
	      System.out.println(res.bodyString()); 
	      } catch (QiniuException e) {
	          Response r = e.response;
	          // ����ʧ��ʱ��ӡ���쳣����Ϣ
	          System.out.println(r.toString());
	          try {
	              //��Ӧ���ı���Ϣ
	            System.out.println(r.bodyString());
	          } catch (QiniuException e1) {
	              //ignore
	          }
	      }       
	  }

	    /**
	     * �ϴ�����2
	     * @param file �ļ�
	     * @param key �ϴ�����ţ�ϵ��ļ�������  ��ͬһ���ռ��£����ơ�key����Ψһ�ģ�
	     * @param bucketName �ռ�����  ��������Ϊ�˻�ȡ�ϴ�ƾ֤��
	     */
	    public void upload(File file, String key, String bucketName) {
	        try {
	            // ����put�����ϴ�
	            Response res = uploadManager.put(file, key, getUpToken());
	            // ��ӡ���ص���Ϣ
	            System.out.println(res.bodyString());
	        } catch (QiniuException e) {
	            Response r = e.response;
	            // ����ʧ��ʱ��ӡ���쳣����Ϣ
	            System.out.println(r.toString());
	            try {
	                // ��Ӧ���ı���Ϣ
	                System.out.println(r.bodyString());
	            } catch (QiniuException qe) {
	                // ignore
	            }
	        }
	    }
	    //base64��ʽ�ϴ�
	    public String put64image(byte[] bytes, String key) throws Exception{
	        String file64 = Base64.encodeToString(bytes, 0);
	        Integer len = bytes.length;
	        //�����ռ�ʹ�� upload-z1.qiniu.com�����Ͽռ�ʹ�� upload-z2.qiniu.com�������ռ�ʹ�� upload-na0.qiniu.com
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
	        //�������Ҫ���ͼƬ��ʽ��ʹ�����·�ʽ
	        return imageurl;
	    }



	public QiniuCloudUtil() {
		// TODO Auto-generated constructor stub
	}

}
