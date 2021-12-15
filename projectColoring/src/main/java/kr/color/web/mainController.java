package kr.color.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.color.domain.InputText;
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
		List<InputText> PList = mapper.getPaletteName();
		model.addAttribute("list", list);
		model.addAttribute("PList", PList);
		return "main";
	}

	// 팔레트 상세정보 표현
	@RequestMapping("/paletteDetail.do")
	public String paletteDetail(int seq, Model model) {
		userPalettes vo = mapper.paletteDetail(seq);
		model.addAttribute("vo", vo);
		return "paletteDetail";
	}

	// 랜덤팔레트 상세정보 표현
	@RequestMapping("/paletteDetailRandom.do")
	public String paletteDetailRandom(int seq, String name, Model model) {
		Palettes voTmp = mapper.paletteDetailRandom(seq);
		userPalettes vo = new userPalettes(voTmp.getPalette_seq(), name, voTmp.getPalette_color1(),
				voTmp.getPalette_color2(), voTmp.getPalette_color3(), voTmp.getPalette_color4(),
				voTmp.getPalette_color5(), voTmp.getRegdit_date(), voTmp.getUser_seq());
		model.addAttribute("vo", vo);
		return "paletteDetailRandom";
	}

}
