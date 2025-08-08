package com.smhrd.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

// 1. 해당하는 클래스파일이 환경설정을 의미하는 파일이다를 가리키는 annotation
// -> 1개 이상의 스프링컨테이너에 적재되어야하는 Bean(객체) 메소드를 가지고 있는 파일임을 명시
@Configuration
// 2. 웹 소켓 기능을 활성화하기 위해서 추가하는 annotation
// -> 해당하는 클래스 파일이 1개 이상의 웹소켓핸들러에 대한 정의를 가지고 있음을 명시
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{
	
	// 웹소켓 핸들러를 웹소켓 저장공간(==registry)에 등록할 수 있는 메소드
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		// 레지스트리 공간에 나만의 핸들러를 등록
		// 매개변수 첫번째 -> @Bean 달려있는 메소드를 호출해서 객체 등록
		// 매개변수 두번째 -> 해당 핸들러가 어떤 요청 url일 때 동작시키게 할건지 요청 url 지정
		registry.addHandler(webSocketHandler(), "/mywebsocket");
		
	}
	// Bean은 컨테이너인데 스프링에서 원래 해줬던걸 버전으로 못해주서 우리가 직접 해줌
	// 스프링컨테이너에 개발자가 직접적으로 적재하고 싶은 클래스파일이 있을 때
	// 사용하는 annotation
	@Bean
	public WebSocketHandler webSocketHandler() {
		return new WebSocketHandler();
	}
	
}
