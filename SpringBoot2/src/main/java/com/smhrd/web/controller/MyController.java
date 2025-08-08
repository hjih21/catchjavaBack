package com.smhrd.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.web.entity.Msgboard;
import com.smhrd.web.mapper.MsgboardMapper;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class MyController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired // 외부에 있는 mapper를 자동으로 주입!
	private MsgboardMapper mapper;
	
	@GetMapping("/")
	public String boardMain(Model model) {
		
		// mapper 사용하기!
		List<Msgboard> allBoard = mapper.allBoard();
		model.addAttribute("allBoard", allBoard);
		
		return "boardMain";
	}
	
	@GetMapping("/goWrite")
	public String goWrite() {
		
		return "boardWrite";
	}
	
	@PostMapping("/insert")
	public String insert(Msgboard board, @RequestParam("uploadFile") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException {
			
		String savePath= request.getServletContext().getRealPath("/save");
		logger.info("savePath 경로 >>" + savePath);
		
		String originalFilename = file.getOriginalFilename();
		// 파일의 종복이름을 방지하기 위한 기능 - UUID
		// ex) agshsdftdf_img1 / fjsgfysdgw_img1
		String saveName = UUID.randomUUID().toString() + "_" + originalFilename;
		
		File targetFile = new File(savePath, saveName);
		file.transferTo(targetFile);
		
		// form태그를 통해 수집된 데이터들 중 아직 수집되지 않은 파일의 이름을 set해주는 기능!
		board.setFilename(saveName);
		
		// mapper에 insert를 위한 데이터 전달!
		mapper.insert(board);	
		
		
		return "redirect:/";
	}
	// "redirect:/" => 페이지로 결과값을 이동하는 것이 아니라
	// 다시 요청값을 연결해서 해당 요청에 대한 결과 페이지를 연결하는것!
	
	@GetMapping("/detail")
	public String detail(@RequestParam("idx") int idx, Model model) {
		
		Msgboard board = mapper.detail(idx);
		model.addAttribute("board", board);
		
		
		return "boardDetail";
	}
	
}
