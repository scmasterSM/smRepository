package com.scmaster.gittest.websocket;

import java.io.IOException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {

   private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

   private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
         
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      logger.info(session.getId() + " 님이 입장하셨습니다.");
      sessionList.add(session);
      broadcast(session.getId() + " 님이 입장하셨습니다.");
   }

   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String id = session.getId();
      String playload = message.getPayload();
      logger.info("handleTextMessage - [ " + id + " ] : " + playload);
      broadcast("[ " + id + " ] : " + playload);
   }

   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      super.afterConnectionClosed(session, status);
      sessionList.remove(session);
      broadcast(session.getId()+" 님이 퇴장하셨습니다.");
   }

   private void broadcast(String message) throws IOException {
      for (WebSocketSession client : sessionList) {
         System.out.println("client : " + client.getId());
         if (client.isOpen()) {
            System.out.println(message);
            client.sendMessage(new TextMessage(message));
         }
      }
   }

}