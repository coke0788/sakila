package com.gd.sakila.service;

import java.io.File;
import java.util.UUID;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.vo.Boardfile;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardfileService {
	@Autowired BoardfileMapper boardfileMapper;
	public int removeBoardfileOne(Boardfile boardfile) {
		log.debug("===============파일 개별 삭제 시 boardfile : "+boardfile);
		//1. 물리적 파일 삭제
		File temp = new File("");
		String path = temp.getAbsolutePath();
		File file = new File(path + "\\src\\main\\webapp\\resource\\" + boardfile.getBoardfileName());
		if(file.exists()) {
			log.debug("============file이 존재합니다.");
			file.delete();
		}
		//2. db 데이터 삭제
		int row = boardfileMapper.deleteBoardfileOne(boardfile.getBoardfileId());
		log.debug("=================파일 개별 삭제 시 row 값 :"+row);
		return row;
	}
	
	public int addBoardfile(MultipartFile multipartFile, int boardId) {
		//1) 물리적 파일 저장
		File temp = new File("");
		//프로젝트 경로
		String path = temp.getAbsolutePath();
		//확장자
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		String ext = multipartFile.getOriginalFilename().substring(p);
		//파일 이름(확장자 제외)
		String prename = UUID.randomUUID().toString().replace("-", ""); //중복되지 않는 랜덤이름을. -는 공백으로 변경해서.
		File file = new File(path+"\\src\\main\\webapp\\resource\\"+prename+ext);
		log.debug("===============파일 이름:"+prename+ext);
		//멀티파트파일에 있는 파일을 위의 파일에 넣어준다.
		try {
			multipartFile.transferTo(file);
		} catch(Exception e) {
			throw new RuntimeException();
		}
		
		//2) db에 저장
		Boardfile boardfile = new Boardfile();
		boardfile.setBoardId(boardId);
		boardfile.setBoardfileName(prename+ext);
		boardfile.setBoardfileSize(multipartFile.getSize());
		boardfile.setBoardfileType(multipartFile.getContentType());
	
		int row = boardfileMapper.insertBoardfile(boardfile);
		log.debug("==============파일 추가 시 file :"+boardfile);
		log.debug("==============파일 추가 시 row 값 :"+row);
		return row;
	}
}
