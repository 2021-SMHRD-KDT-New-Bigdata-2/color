package kr.color.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import kr.color.mapper.testMapper;

	@RestController
	public class TestAjaxController {
		
		@Autowired
		testMapper mapper;
		
		
	
}
