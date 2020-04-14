package com.javalec.service.liveChat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;


public class HttpSessionConfigurator extends Configurator {
	
	@Override
	public void modifyHandshake(ServerEndpointConfig sec,HandshakeRequest request, HandshakeResponse response) {
		HttpSession session = (HttpSession) request.getHttpSession();
		ServletContext context = session.getServletContext();
		
		System.out.println(request.getRequestURI().getPath());
		sec.getUserProperties().put(HttpSession.class.getName(), session);
	}
	
}
