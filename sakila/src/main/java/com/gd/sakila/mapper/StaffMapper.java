package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Staff;

@Mapper //Mapper.xml에 있는 동일한 이름의 메서드를 오버라이딩 한다.디펜던시인덱션.
public interface StaffMapper {
	Staff selectStaffByLogin(Staff staff);
}
