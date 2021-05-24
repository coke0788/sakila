package com.gd.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.controller.HomeController;
import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.BoardForm;
import com.gd.sakila.vo.Boardfile;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import jdk.internal.org.jline.utils.Log;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired BoardfileMapper boardfileMapper;
	@Autowired CommentMapper commentMapper;
	
	//게시글 수정
	public int modifyBoard(Board board){
		log.debug("=========수정 Board : " + board.toString());
		return boardMapper.updateBoard(board);
	}
	
	//게시글 삭제
	public int removeBoard(Board board) {
		log.debug("======= 삭제 Board :"+ board.toString());
		// 1) 게시글 삭제
		int boardRow = boardMapper.deleteBoard(board);
		log.debug("======= 삭제 BoardRow :"+boardRow);
		if(boardRow == 0) {
			return 0;
		}
		// 2) 댓글 삭제
		int commentRow = commentMapper.deleteCommentByBoardId(board.getBoardId());
		log.debug("======= 댓글삭제 BoardRow :"+ commentRow);
		
		// 3) 저장되어있는 물리적 파일 삭제(경로 안에 있는거)
		List<Boardfile> list = boardfileMapper.selectBoardfileByBoardId(board.getBoardId());
		if(list != null) {
			for(Boardfile f : list) {
				File temp = new File(""); //temp라는 빈 파일을 프로젝트 폴더에 만듦.
				String path = temp.getAbsolutePath(); //이 파일이 어디에 저장 되어 있는지 경로를 알 수 있다.
				File file = new File(path+"\\src\\main\\webapp\\resource\\"+f.getBoardfileName());
				file.delete();
			}
		}
		
		// 4) 파일 삭제(테이블 행 삭제)
		int boardfileRow = boardfileMapper.deleteBoardfileByBoardId(board.getBoardId());
		log.debug("======= 파일삭제 BoardRow :"+ boardfileRow);
		
		return boardRow;
	}
	//게시글 추가
	public void addBoard(BoardForm boardForm) {
		// boardForm을 board, boardfile로 변경해야함. boardform에 board와 boardfile이 들어있어서.
		log.debug("======= 등록 BoardForm :"+boardForm.toString());
		Board board = boardForm.getBoard();
		boardMapper.insertBoard(board);
		log.debug("======= 등록 Board :"+board.toString());
		List<MultipartFile> list = boardForm.getBoardfile();
		// 파일 첨부 코드 
		if(list != null) { //list(파일 리스트 왜 리스트냐면 여러개를 등록할 수도 있으니까)가 널이 아니라면! 널이면 필요 없음 위에서 그냥 끝남.
			for(MultipartFile f : list) {
				Boardfile boardfile= new Boardfile();
				//필요한 변수들 선언
				String originalFilename = f.getOriginalFilename();
				int p = originalFilename.lastIndexOf(".");
				String ext = originalFilename.substring(p).toLowerCase(); // p를 기준으로 자르고 소문자로 바꾼다.
				String prename = UUID.randomUUID().toString().replace("-", "");
				String filename = prename+ext;
				//boardfile 생성자 선언했고 입력된 값들 가져와서 저장하기
				boardfile.setBoardId(board.getBoardId());
				boardfile.setBoardfileName(filename);
				boardfile.setBoardfileSize(f.getSize());
				boardfile.setBoardfileType(f.getContentType());
				boardfileMapper.insertBoardfile(boardfile); //boardfile mapper 호출
				log.debug("=============등록 boardfile:"+boardfile);
				// 로컬에 파일 저장
				try {
					File temp = new File(""); //temp라는 빈 파일을 프로젝트 폴더에 만듦.
					String path = temp.getAbsolutePath(); //이 파일이 어디에 저장 되어 있는지 경로를 알 수 있다.
					f.transferTo(new File(path+"\\src\\main\\webapp\\resource\\"+filename)); //괄호 안에 있는 파일을 가져온다.
				} catch (Exception e) {
					throw new RuntimeException();
				}
			}
		}
		
	}
	
	public Map<String, Object> getBoardOne(int boardId) {
		log.debug("======= Board리스트 boardId :"+boardId);
		// 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		log.debug("======= map : "+boardMap);
		//boardfile 목록
		List<Boardfile> boardfileList = boardfileMapper.selectBoardfileByBoardId(boardId);
		log.debug("========== 파일 목록 :" + boardfileList);
		//댓글 리스트
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("========= 댓글 목록 크기 : "+commentList.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardMap", boardMap);
		map.put("commentList", commentList);
		map.put("boardfileList", boardfileList);
		return map;
	}
	
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		int boardTotal = boardMapper.selectBoardTotal(searchWord); //searchword가 필요
		int lastPage = boardTotal/rowPerPage;
		if(boardTotal%rowPerPage!=0) {
			lastPage += 1;
		}
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug("=======Page"+page);
		
		List<Board> boardList = boardMapper.selectBoardList(page); //page가 필요
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardTotal", boardTotal);
		map.put("boardList", boardList);
		map.put("lastPage", lastPage);
		log.debug("=======map"+map);
		return map;
	}
}
