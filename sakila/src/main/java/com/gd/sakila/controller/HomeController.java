package com.gd.sakila.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	//Logger log = LoggerFactory.getLogger(this.getClass()); //getLogger(클래스타입)  this.getClass 본인의 클래스를 매개변수로 호출한다.
	@GetMapping({"/","/home","/index"})
	public String home() {
		log.debug("test");
		return "home";
	}
}
