package com.scmaster.gittest.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.scmaster.gittest.dao.ShareDAO;

public class webSocketHandler implements WebSocketHandler {

	private static Logger logger = LoggerFactory.getLogger(webSocketHandler.class);

	private ArrayList<HashMap<String, Object>> sessionList = new ArrayList<>();
	
	@Autowired
	ShareDAO dao;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info(session.getId() + "connection!");
		logger.info(session.getLocalAddress().getAddress().toString());
		logger.info(session.getRemoteAddress().getAddress().toString());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		logger.info(session.getId() + "closed! / status: " + status);
		WebSocketSession removeSession = null;
		for (HashMap<String, Object> hashMap : sessionList) {
			if (hashMap.get("session") == session) removeSession = session;
		}
		if(removeSession != null) sessionList.remove(removeSession);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		Gson gson = new Gson();

		String msg = (String) message.getPayload();
		logger.info(msg);
		Map<String, Object> msgMap = gson.fromJson(msg, Map.class);
		if((String) msgMap.get("loginId") != null) setSession((String) msgMap.get("loginId"), session);
		else{
			String searchId = (String) msgMap.get("searchId");
			HashMap<String, Object> map = new HashMap<>();
			map.put("searchId", searchId);
			Double d = (Double) msgMap.get("scd_sq");
			map.put("scd_sq", Integer.parseInt(String.valueOf(Math.round(d))));
			//저장하기 전에 먼저 있는지 없는지 확인해야함 
			int result = dao.addShareAuthority(map);
		}
		broadcast(msg);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable error) {
		/*System.out.println("Throwable1 : " + error.getLocalizedMessage());
		System.out.println("Throwable2 : " + error.fillInStackTrace());
		System.out.println("Throwable3 : " + error.getCause());
		System.out.println("Throwable4 : " + error.initCause(error));
*/
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	private void broadcast(String message) throws IOException {
		for (HashMap<String, Object> hashMap : sessionList) {
			WebSocketSession client = (WebSocketSession) hashMap.get("session");
			if (client.isOpen()) {
				client.sendMessage(new TextMessage(message));
			} // if
		} // for
	}

	public void setSession(String loginId, WebSocketSession session) {
		if (sessionList.size() != 0) {
			for (HashMap<String, Object> hashMap : sessionList) {
				if (hashMap.get("loginId").equals(loginId)) {
					hashMap.put("session", session);
				} else {
					HashMap<String, Object> newHashMap = new HashMap<>();
					newHashMap.put("loginId", loginId);
					newHashMap.put("session", session);
					sessionList.add(newHashMap);
				}
			} // for
		} else {
			HashMap<String, Object> newHashMap = new HashMap<>();
			newHashMap.put("loginId", loginId);
			newHashMap.put("session", session);
			sessionList.add(newHashMap);
		}
	}

}