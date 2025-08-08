package com.smhrd.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.web.entity.MsgMember;
import com.smhrd.web.mapper.MsgMemberMapper;

@RestController
public class MyRestController {

	// 동기 방식의 요청처리 -> 일반 Controller 작업
	// 비동기 방식의 요청처리 -> 비동기 전용 RestController 작업
	
	@Autowired
	private MsgMemberMapper mapper;
	
	@GetMapping("/checkEmail")
	public String checkEmail(@RequestParam("inputEmail") String email) {
		MsgMember result = mapper.selectByEmail(email);
		
		if(result == null) {
			// email 검색시 확인되는 회원이 없다! => null 값이다!
			// => 회원가입에 사용이 가능한 email!
			return "true";
		}else {
			// 이미 사용중에 있는 email 이다!
			return "false";
		}
	}
	
}
