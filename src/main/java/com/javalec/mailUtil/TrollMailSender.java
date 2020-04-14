package com.javalec.mailUtil;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class TrollMailSender {
	
	private static final String setfrom = "trollpolicetest@gmail.com";
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendRandomChar(String title,String email,String content){
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
