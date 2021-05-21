package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.service.BoardfileService;
import com.gd.sakila.vo.Boardfile;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class BoardfileController {
	@Autowired BoardfileService boardfileService;
	
	@GetMapping("/removeBoardfile")
	public String removeBoardfile (Boardfile boardfile) {
		//staff라면 누구나 삭제가 가능한 이슈가 있음. 글쓴이만 삭제할 수 있어야 함.
		boardfileService.removeBoardfileOne(boardfile);
		log.debug("===========개별 삭제 boardfile 값 :"+boardfile);
		return "redirect:/admin/getBoardOne?boardId="+ boardfile.getBoardId();
	}
	
	@GetMapping("/addBoardfile")
	public String addBoardfile (Model model, @RequestParam(value="boardId", required=true) int boardId) {
		model.addAttribute("boardId", boardId);
		log.debug("================상세페이지에서 파일추가 boardId"+boardId);
		return "addBoardfile";
	}
	@PostMapping("/addBoardfile")
	//파일 하나르 받을 때는 그냥 멀티파트를 매개변수로 받으면 된다.
	public String addBoardfile (MultipartFile multipartFile, @RequestParam(value="boardId", required=true) int boardId) {
		log.debug("================상세페이지에서 파일추가 file"+multipartFile);
		log.debug("================상세페이지에서 파일추가 boardId"+boardId);
		boardfileService.addBoardfile(multipartFile, boardId);
		return "redirect:/admin/getBoardOne?boardId="+boardId;
	}
}
