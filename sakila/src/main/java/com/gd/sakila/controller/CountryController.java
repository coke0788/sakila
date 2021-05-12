package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CountryService;
import com.gd.sakila.vo.Country;

@Controller //객체가 자동으로 만들어짐.
@Transactional //메소드 예외가 발생하면 메소드 전체를 rollback 시키는 기능을 담고 있음.
public class CountryController {
	@Autowired //(=Spring이 만든 new 연산자로 만들어진 객체를 대입)
	private CountryService countryService;
	@GetMapping("/countryList") //=WepServlet
	 //Model = request.setAttribute()와 동일한 기능을 수행.
	//@RequestParam~~ = request.getParameter("currentPage")와 동일한 기능을 수행 defaultValue = 값이 넘어오지 않으면 작성한 값으로 설정한다.
	
	public String countryList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		Map<String, Object> map = countryService.getCountryList(currentPage, rowPerPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		return "countryList"; //countryList.jsp로 forward
	}
}
