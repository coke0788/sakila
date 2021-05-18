package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

//MVC모델에서 컨트롤러. servelet 역할. Service에서 연산한 값들을 호출하고, view로 보내주고. view에서 보내준 값도 저장하고.
@Slf4j
@Controller
@Transactional
@RequestMapping("/admin") // ~~Mapping 적혀있는 애들 앞에 /admin을 추가한다 --> 필터로 지나가는 것들 모두 일괄적으로 관리하도록
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("/modifyBoard")
	public String modifyBoard(Model model, @RequestParam(value="boardId", required=true) int boardId) {
		//select(insert form)
		log.debug("=======수정 boardId:"+boardId);
		Map<String, Object> map = boardService.getBoardOne(boardId);
		model.addAttribute("boardMap", map.get("boardMap"));
		return "modifyBoard";
	}
	@PostMapping("/modifyBoard")
	public String modifyBoard(Board board) {
		log.debug("========수정 board:"+board.toString());
		//update
		int row = boardService.modifyBoard(board);
		log.debug("======수정 row :"+row);
		return "redirect:/admin/getBoardOne?boardId="+board.getBoardId();
	}
	@GetMapping("/removeBoard") 
	public String removeBoard(Model model, @RequestParam(value="boardId", required=true) int boardId) {
		log.debug("====삭제 boardId:"+boardId);
		model.addAttribute("boardId", boardId); //forwarding 하면 매개변수도 넘어가기 때문에 포워딩 쪽에서 requestParam으로 받아올 수 있음, 하지만 model에 저장해서 가져올 수도 있음.
		return "removeBoard";
	}
	@PostMapping("/removeBoard")
	public String removeBoard(Board board) {
		int row = boardService.removeBoard(board);
		log.debug("=====삭제 board:"+board.toString());
		if(row==0) {
			return "redirect:/admin/getBoardOne?boardId="+board.getBoardId();
		} 
		return "redirect:/admin/getBoardList";
	}
	@GetMapping("/addBoard") //Get은 서블릿의 Get이고 Post는 서블릿의 Post 역할을 함.
	public String addBoard() {
		return "addBoard";
	}
	@PostMapping("/addBoard")
	public String addBoard(Board board) { //input에서 입력한 것들을 Board 타입으로 전부 묶어서 가져올 것이다. 대신, form의 이름과 vo의 이름을 통일시켜야함. = 커맨드객체
		boardService.addBoard(board);
		System.out.println("======입력 board값 :"+board);
		return "redirect: /admin/getBoardList"; //getBoardList만 적으면 forwarding 되므로, redirect:/ 을 붙여서 sendRedirect 시킨다.
		//추가로! reirect: 뒤에 / 만 적는 이유는 properties에서 request.contextPath를 그렇게 설정했기 때문.
	}
	@GetMapping("/getBoardOne") //@Servelet이랑 비슷한 역할.
	//required는 꼭 받아와야하는지(true), 안 받아와도 되는지(false)를 확인? 함
	public String getBoardOne(Model model, @RequestParam(value="boardId", required=true) int boardId) {
		Map<String, Object> map = boardService.getBoardOne(boardId);
		log.debug("================댓글리스트랑 보드map : "+map);
		model.addAttribute("commentList", map.get("commentList")); //request.setAttribute와 비슷한 역할.
		model.addAttribute("boardMap", map.get("boardMap"));
		return "getBoardOne"; //return 값은 뷰. request.getdispather.forward 전부를 통틀어서 간단하게 얘 혼자 다 하고 있는거임.
	}
	@GetMapping("/getBoardList")
	public String getBoardList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage, @RequestParam(value="searchWord", required = false) String searchWord) {
		System.out.println("currentPage"+currentPage);
		System.out.println("rowPerPage"+rowPerPage);
		System.out.println("searchWord"+searchWord);
		
		Map<String, Object> map = boardService.getBoardList(currentPage, rowPerPage, searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));
		System.out.println("========map:"+map);
		return "getBoardList";
	}
}
