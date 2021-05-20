package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Staff;

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
}
