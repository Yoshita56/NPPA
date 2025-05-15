package com.drugs.util;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
@Component
	public class SMSUtil {
		private static final String serviceUrl = "https://api.sewadwaar.rajasthan.gov.in/app/live/eSanchar/Prod/api/OBD/CreateSMS/Request";
		private static final String clientId = "1333556f-f594-44cb-bef7-6fb7f69f8d5e";
		private static final String uniqueId = "RMS_C_SMS";
		private static final String username = "RmscSms";
		private static final String password = "R#McS_09$Mso";
		
		public boolean sendMessage(String smsText, String language, List<String> mobileNo) {
			
			boolean results = true;
			try {
				
				
				Map<String, Object> jsonMap = new HashMap<String, Object>();
				jsonMap.put("UniqueID", uniqueId);
				jsonMap.put("serviceName", "SMS");
				jsonMap.put("language", language);
				jsonMap.put("message", smsText);
				jsonMap.put("mobileNo", mobileNo);

			    Gson gson = new GsonBuilder().create();
				String requestParams = gson.toJson(jsonMap); 
			
		        System.out.println("Params = " + requestParams);
				StringEntity params = new StringEntity(requestParams);		
			    HttpPost request = new HttpPost(serviceUrl + "?client_id=" + clientId);		    
			    request.addHeader("Content-Type", "application/json");
			    request.addHeader("username", username);
			    request.addHeader("password", password);
			    request.setEntity(params);
			
			    HttpClient httpclient = new DefaultHttpClient();
				HttpResponse response = httpclient.execute(request);
				byte[] responseBody = EntityUtils.toByteArray(response.getEntity());
				String result = new String(responseBody);
				System.out.println("Service Response : " + result);
				//return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return results;
		}
	}

