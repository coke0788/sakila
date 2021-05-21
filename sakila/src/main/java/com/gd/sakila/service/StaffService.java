package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Staff;
import com.gd.sakila.vo.StaffList;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class StaffService {
	@Autowired StaffMapper staffMapper; //@Autowired 없으면 널포인트 익셉션 발생함. 생성자 만들어주는거임.
	public Staff login(Staff staff) {
		log.debug("=========staff service 값 : "+staff);
		return staffMapper.selectStaffByLogin(staff);
	}
	//검색어 기능만 사용할 것 같아서 검색어만 변수로 받을것임.
	public List<StaffList> getStaffList(String searchWord){
		//mapper의 목록 쿼리 실행한거 값들을 리스트로 저장.
		List<StaffList> list = staffMapper.selectStaffList(searchWord);
		log.debug("===========직원 목록 list : "+list);
		return list;
	}
}
