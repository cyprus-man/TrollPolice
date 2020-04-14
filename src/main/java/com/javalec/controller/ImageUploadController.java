package com.javalec.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUploadController {
	private static final Logger logger = LoggerFactory.getLogger(ImageUploadController.class);
	
	
	@RequestMapping(value = "imageUpload.do")
	@ResponseBody
	public void imageUpload(Model model, HttpServletRequest request, HttpServletResponse response, MultipartFile upload,HttpSession session)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();
		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();
		// 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
		String uploadPath =session.getServletContext().getRealPath("/resources/img/free_img/");
		
		//이미 존재하는 파일
		//리퀘스트  게시판 ID를 가져와서 ID + 파일명
		
		OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
		
		// 서버로 업로드
		out.write(bytes);
		// 클라이언트에 결과 표시
		String callback = request.getParameter("CKEditorFuncNum");
		// 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter = response.getWriter();
		String fileUrl = request.getContextPath() + "/resources/img/free_img/" + fileName;
		
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
				+ "','이미지가 업로드되었습니다.')" + "</script>");
		printWriter.flush();
		
	}
	

	@RequestMapping(value = "imageUpload.do/drag", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> imageUploadDrag
	(Model model, HttpServletRequest request, HttpServletResponse response,MultipartFile upload,HttpSession session){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");		
		System.out.println(this.getClass().getName());		
		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();
		Map<String,Object> json = new HashMap<String,Object>();

		try{
			// 파일을 바이트 배열로 변환
			byte[] bytes = upload.getBytes();
			// 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
			String uploadPath =  session.getServletContext().getRealPath("/resources/img/free_img/");
			OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
			String fileUrl = request.getContextPath() + "/resources/img/free_img/" + fileName;
			
			json.put("url",fileUrl);
			json.put("fileName",fileName);
			json.put("uploaded",1);
			
			// 서버로 업로드
			out.write(bytes);
		}catch(Exception e) {
			json.put("uploaded",0);
			json.put("error","{'message':'"+e.getMessage()+"'}");
		}
		System.out.println(json.toString());
		return json;
	}
	
	//랜덤 메서드
//	private String uploadFile(String originalName,byte[] fileData)throws Exception{
//		UUID uuid = UUID.randomUUID();
//		String savedName=uuid.toString()+"_"+originalName;
//		File target =new File(uploadPath,savedName);
//		FileCopyUtils.copy(fileData, target);
//		return savedName;
//	}
}
