package kr.color.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.color.mapper.testMapper;

@Controller
public class testController {
	
	@Autowired
	testMapper mapper;
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}

}
