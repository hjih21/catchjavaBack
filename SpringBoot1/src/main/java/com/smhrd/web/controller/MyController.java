package com.smhrd.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.web.entity.MsgMember;
import com.smhrd.web.entity.MsgMessage;
import com.smhrd.web.mapper.MsgMemberMapper;
import com.smhrd.web.mapper.MsgMessageMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	// DB를 연결해서 데이터를 조회, 생성하는 기능을 처리하는 컨트롤러

	// 데이터 확인하는 용도로 console 출력할 도구
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	// Spring Container가 해당하는 인터페이스 구현체를 직접 생성해서 주입
	private MsgMemberMapper mapper;
	@Autowired
	private MsgMessageMapper msgMapper;

	@PostMapping("/join")
	public String join(MsgMember mem, Model model) {// 모델. 스프링프레임워크 가져와야함
		// 1. 요청데이터 수집
		// -> 수집해야할 데이터 4가지네? -> 낱개로 수집하면 불편함!
		// -> 내가 해당하는 데이터를 하나로 표현할 수 있는 나만의 자료형 만들자!
		// -> MsMember 생성 -> 요청 데이터를 매개변수로 수집
		// MsMember라는 자료형으로 불러오는 것
		logger.info("수집한 데이터 확인 >> " + mem);
		// 2. DB에 연결해서 데이터 추가
		mapper.join(mem);
		// * request 영역에 회원가입한 id만 담아서 다음페이지로 넘겨주기
		model.addAttribute("email", mem.getEmail());
		
		// 3. 성공했을 때, 이동할 페이지 경로 잡아주기
		
		return "join_success";

	}
	
	// 로그인에 대한 작업 작성하기
	// 1. 들어온 요청을 판단할 수 있는 작업 수행
	// 2. 해당 요청에 따라 응답할 수 있는 작업 수행
	//	  - DB에 연결하여 회원의 정보가 있는지 없는지 확인 필요!
	// 3. 결과에 대한 화면이동은 "main"로!
	@PostMapping("/login")
	public String login(MsgMember mem, HttpSession session) {
		
		// 로그인의 기능은 DB에서 회원에 대한 정보가 체크 된다면
		// main 페이지로 이동시 해당 회원에 대한 정보를 담아서 이동할 수 있도록 한다.
		MsgMember member = mapper.login(mem);
		
		logger.info("로그인 된 회원의 정보 >> " + member.toString());
		
		// 모든 페이지 기능에서 활용할 수 있는 Session Scope영역 사용!
		session.setAttribute("member", member);
		return "main";
		
	}
	
	// GET 요청
	// 요청의 키워드 : logout
	// 결과 화면 : main
	// +) Session 영역에 저장된 member 데이터를 삭제!
	@GetMapping("/logout")
	public String logout(HttpSession session) { // 위에 세션이랑 공유하고 있음
		
		session.removeAttribute("member"); // 세션으로 저장해뒀기 때문에 기억하고 삭제가능
		
		return "main";
	}
	
	// 업데이트 기능을 위한 요청 진행하기
	// 1. 요청 Mapping
	@PostMapping("/update")
	public String update(MsgMember mem, HttpSession session) {
		MsgMember mem2 = (MsgMember) session.getAttribute("member");
		mem.setEmail(mem2.getEmail());
		
		mapper.update(mem);
		// 3. DB에 해당 데이터를 전달 -> update sql 실행!
		session.setAttribute("member", mem); // 그래서 이걸 해줌
		// 4. 결과 화면은 main으로 이동
		return "main"; // 바뀌기 전의 저장되어 있음(최신정보가 세선에 안 담겨있음)
	}
	
	@GetMapping("/showMember")
	public String showMember(Model model) {
		
		List<MsgMember> list = mapper.showMember();
		model.addAttribute("list", list);
		
		return "select";
	}
	
	
	
	@GetMapping("/delete") // email불러오고 email변수에 담겠음
	public String delete(@RequestParam("email") String email) {
 		
		mapper.delete(email);

		return "redirect:showMember";
	}
	
	@PostMapping("/send")
	public String send(MsgMessage mes) {
		
		msgMapper.send(mes);
		
		
		return "main";
	}
	
	 @GetMapping("/allMessage")
	   public String allMessage(@RequestParam("email") String email, Model model) {
	      List<MsgMessage> messages = msgMapper.allMessage(email);
	      model.addAttribute("messages", messages);
	      return "main";
	   }
}
