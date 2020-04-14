package com.javalec.rest;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;

public class HttpRequestManager {
	//private static HttpsURLConnection conn;//bean to make singleton
	private static final String API_KEY =
			"RGAPI-306656af-bbc2-414c-be90-45aeee97f210";
	
	public static void addHeaders(HttpURLConnection conn) {
		
		conn.addRequestProperty("Origin","https://developer.riotgames.com");
		
	    conn.addRequestProperty("Accept-Charset",
	    		"application/x-www-form-urlencoded; charset=UTF-8");
	    
	    conn.addRequestProperty("X-Riot-Token",API_KEY);
	    
	    conn.addRequestProperty( "Accept-Language",
	    		"ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
	    
	    conn.addRequestProperty("User-Agent", 
	    		"Mozilla/5.0 (Windows NT 6.1; Win64; x64) "
	    		+ "AppleWebKit/537.36 (KHTML, like Gecko) "
	    		+ "Chrome/80.0.3987.106 Safari/537.36");
	}
	
	public static void close(HttpURLConnection conn,InputStreamReader inputStreamReader)
	{
		try {
			if(conn!=null)conn.disconnect();
			if(inputStreamReader!=null) inputStreamReader.close();
		}catch(IOException e)
		{
			e.printStackTrace();
		}
	}
}
