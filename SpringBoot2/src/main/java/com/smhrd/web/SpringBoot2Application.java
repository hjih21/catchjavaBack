package com.smhrd.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// 어노테이션에 마우스 올려보면 뭐가 있는지 나와있음
// @SpringBootApplication : 해당 클래스의 위치를 기준으로, 하위에 있는 파일을 읽어
// Spring Boot의 설정을 자동적으로 진행하는 클래스!

// @ComponentScan : @Controller, @RestController, @Service, @Repository
// -> @SpringBootApplication에 자동으로 들어가 있음

@SpringBootApplication
public class SpringBoot2Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBoot2Application.class, args);
	}

}
