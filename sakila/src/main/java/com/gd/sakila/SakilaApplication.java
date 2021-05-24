package com.gd.sakila;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@ServletComponentScan //스프링 거(애노테이션이)가 아니라서 이걸(서블릿거 애노테이션) 찾아달라고 요청을 해야 함.
@SpringBootApplication // @ComponentScan("com.gd.sakila")도 포함되어 있음. 만약에 해당 범위를 벗어나면 저 안에 경로를 추가로 적어줘야 함. 
@EnableScheduling //이것도 스프링거 아니라서 찾아달라고(스케쥴 애노테이션) 요청. 
public class SakilaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}
	
}
