package com.smhrd.web.config;

import java.io.IOException;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

// @ServerEndPoint("/mywebsocket") 
// --> 해당 Springboot 버전에서는 annotation 동작 x -> 직접 지정 필요
public class WebSocketHandler extends TextWebSocketHandler {

   private Logger logger = LoggerFactory.getLogger(getClass());
   // 해당하는 채팅방에 접속한 사용자들의 정보를 관리하는 자료구조 생성
   // static -> 접속한 사용자의 정보를 가장 먼저 로드해서 모든 파일과 공유
   // final -> 해당하는 정보를 저장하는 주소값 변경을 방지
   // <String, WebSocketSession>
   // -> String : 접속한 사용자의 session id값
   // -> WebSocketSession : 접속한 사용자의 session 정보 자체를 저장
   private static final HashMap<String, WebSocketSession> CLIENTS = new HashMap<>();


   // 1. 웹소켓이 열렸을 때, (누군가 웹소켓에 접속했을 때) 실행되는 메소드
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      logger.info("웹 소켓 연결 성공 >> " + session);
      // 접속한 사용자의 정보를 저장
      CLIENTS.put(session.getId(), session);
      // 접속한 사용자에게 채팅방 접속 성공에 대한 메세지를 하나 전송
      session.sendMessage(new TextMessage("채팅방 접속 성공"));
      
   }

   // 2. 웹 소켓을 사용해서, text 형식의 메시지를 받았을 때 실행되는 메소드
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	   // 해당하는 메세지를 보낸 사용자를 제외한, 나머지 사용자에게 메세지 전송
	   String id = session.getId();
	   // hashmap 안에 들어있는 데이터 key - value
	   // entrySet() : key - value를 한쌍으로 묶은 set(집합)구조로 변환
	   // forEach() : 자료구조 안에 들어있는 데이터를 각각 하나식 꺼내서 args 공간에 담아주는 것
	   CLIENTS.entrySet().forEach(args -> {
		   if(!id.equals(args.getKey())) {
			   try {
				args.getValue().sendMessage(message);
			   } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			   }
		   }
	   });
   
   }
   
   // 3. 웹소켓이 닫혔을 때, 실행되는 메소드
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	   	// 채팅방에 접속한 사용자 정보를 관리하는 자료구조에서 해당하는 사용자를 삭제
	   CLIENTS.remove(session.getId());
   }

}
