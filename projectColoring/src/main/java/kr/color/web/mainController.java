package kr.color.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.color.domain.Palettes;
import kr.color.domain.userPalettes;
import kr.color.mapper.mainMapper;

@Controller
public class mainController {

	@Autowired
	mainMapper mapper;
	
	@RequestMapping("/")
	public String main(Model model) {
		List<Palettes> list = mapper.getMainList();
		model.addAttribute("list",list);
		return "main";
	}
	
	@RequestMapping("/paletteDetail.do")
	public String paletteDetail(int seq, Model model) {
		userPalettes vo = mapper.paletteDetail(seq);
		model.addAttribute("vo",vo);
		return "paletteDetail";
	}
}
