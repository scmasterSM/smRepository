package com.scmaster.gittest.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.internal.LinkedTreeMap;
import com.scmaster.gittest.dao.ScheduleDAO;
import com.scmaster.gittest.dao.ShareDAO;

public class webSocketHandler extends TextWebSocketHandler {

	private static Logger logger = LoggerFactory.getLogger(webSocketHandler.class);

	private final List<WebSocketSession> connectedUsers;

	@Autowired
	private ShareDAO shareDao;


	public webSocketHandler() {
		this.logger.info("create WebSocketHandler Instance!");
		connectedUsers = new CopyOnWriteArrayList<>();
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		System.out.println(status);
		try {
			super.afterConnectionClosed(session, status);
		} catch (Exception e) {
			System.out.println("afterConnectionClosed : ");
			e.printStackTrace();
		}

		this.logger.info("remove session!");
		connectedUsers.remove(session);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		try {
			super.afterConnectionEstablished(session);
		} catch (Exception e) {
			System.out.println("afterConnectionEstablished : ");
			e.printStackTrace();
		}
		logger.info(session.getId() + " 번 소켓의 remoteAddress : " + session.getRemoteAddress().toString());
		connectedUsers.add(session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) {
		Gson gson = new Gson();
		String msg = (String) message.getPayload();
		Map<String, Object> msgMap = gson.fromJson(msg, Map.class);
		System.out.println(msgMap.get("doWhat"));
		
		switch ((String) msgMap.get("doWhat")) {
		
		case "sortable" :
			int daily_ord = changeDailyOrd(msgMap);
			broadcast(session, "sortable", daily_ord);
			break;

		case "add_day":
			broadcast(session, "add_day", "add_day");
			break;

		case "ordclick":
			broadcast(session, "ordclick", msgMap.get("data"));
			break;

		case "delete_place":
			delete_place(msgMap, session);
			break;

		case "add_place":
			daily_ord = changeDailyOrd(msgMap);
			broadcast(session, "add_place", daily_ord);
			break;

		case "update_bgt":
			broadcast(session, "update_bgt", "update_bgt");
			break;

		case "closeAlt":
			broadcast(session, "closeAlt", "closeAlt");
			break;

		case "delete_day":
			broadcast(session, "delete_day", "delete_day");
			break;

		case "webSocketlogIn":
			webSocketlogIn(msgMap, session);
			break;
			
		case "update_scd":
			broadcast(session, "update_scd", msgMap.get("data"));
			break;
			
		case "chat" :
			broadcast(session, "chat", msgMap.get("data"));
			break;
		}

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable error) {
		System.out.println("error msg");
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	private void broadcast(WebSocketSession session, String doWhat, Object obj) {
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		map.put("doWhat", doWhat);
		map.put("data", obj);
		String message = gson.toJson(map);
		for (WebSocketSession webSocketSession : connectedUsers) {
			if (webSocketSession.isOpen())
				try {
					webSocketSession.sendMessage(new TextMessage(message));
				} catch (IOException e) {
					System.out.println("broadcast : ");
					e.printStackTrace();
				}
		} // for
	}

	public Object convertObj(Map<String, Object> msgMap, Object castObj) {
		Gson gson = new Gson();
		Object obj = (Object) msgMap.get("data");
		String str = obj.toString();
		Object realObj = null;
		if (castObj instanceof Integer) {
			HashMap<String, Object> map = gson.fromJson(str, HashMap.class);
			Object[] objs = map.keySet().toArray();
			realObj = doubleToInt((Double) map.get(objs[0]));
		} else {
			try {
				realObj = gson.fromJson(str, castObj.getClass());
			} catch (JsonSyntaxException e) {
				LinkedTreeMap<String, Object> lmap = (LinkedTreeMap<String, Object>) msgMap.get("data");
				realObj = lmap;
			}
		}
		return realObj;
	}

	public int doubleToInt(Double d) {
		return Integer.parseInt(String.valueOf(Math.round(d)));
	}

	public void webSocketlogIn(Map<String, Object> msgMap, WebSocketSession session) {
		HashMap<String, Object> map = new HashMap<>();
		map = (HashMap<String, Object>) convertObj(msgMap, map);
		String userId = (String) map.get("loginId");
		int scd_sq = doubleToInt((Double) map.get("scd_sq"));
		String inform = scd_sq + " 의 일정에 " + userId + "님이 로그인 하셨습니다.";
		logger.info(inform);
		broadcast(session, "loginSuccess", userId + " 님이 입장하셨습니다.");
		//broadcast(session, "chat", userId + " 님이 입장하셨습니다.");
	}

	public void delete_place(Map<String, Object> msgMap, WebSocketSession session) {
		Object o = msgMap.get("data");
		int day = 0;
		if (o instanceof Double)
			day = doubleToInt((Double) o);
		else if (o instanceof String)
			day = Integer.parseInt((String) o);
		broadcast(session, "delete_place", day);
	}

	/*public void add_place(Map<String, Object> msgMap, WebSocketSession session) {
		Object o = msgMap.get("data");
		int dtl_sq = 0;
		if (o instanceof String)
			dtl_sq = Integer.parseInt((String) o);
		else if (o instanceof Double)
			dtl_sq = doubleToInt((Double) o);
		int daily_sq = shareDao.get_Daily_Scd(dtl_sq).getDaily_sq();
		int daily_ord = shareDao.get_daily_ord(daily_sq);
		broadcast(session, "add_place", daily_ord);
	}*/
	
	public int changeDailyOrd(Map<String, Object> msgMap){
		Object o = msgMap.get("data");
		int dtl_sq = 0;
		if (o instanceof String)
			dtl_sq = Integer.parseInt((String) o);
		else if (o instanceof Double)
			dtl_sq = doubleToInt((Double) o);
		int daily_sq = shareDao.get_Daily_Scd(dtl_sq).getDaily_sq();
		int daily_ord = shareDao.get_daily_ord(daily_sq);
		return daily_ord;
	}
}