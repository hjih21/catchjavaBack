package com.smhrd.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {
	
	@GetMapping("/joinBnt")
	public String join() {
		return "join";
	}
	
	
}
