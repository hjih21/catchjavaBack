package com.smhrd.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
	
	@GetMapping("/")
	public String goMain() {// 파일의 이름을 돌려줘야하니까 String
		return "main";
	}
	
}

