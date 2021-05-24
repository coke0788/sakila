package com.gd.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component //?
public class SakilaScheduler {
	@Autowired CustomerService customerService;
	
	@Scheduled(cron = "0 17 11 24 * *") //초, 분, 시, 일, 월, 년.  0 0 0 1 * * = 매달 1일 0시마다 메서드 실행 
	public void modifyCustomerActive() {
		customerService.modifyCustomerActiveByScheduler();
		log.debug("==================고객 비활성화 조건 스케줄러 실행");
	}
}
