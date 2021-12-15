package kr.color.web;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.color.domain.Palettes;
import kr.color.domain.userPalettes;
import kr.color.mapper.mainMapper;

@RestController
public class AjaxController {

	@Autowired
	mainMapper mapper;

	// 팔레트 생성하기
	@RequestMapping("/genPalette.do")
	public List<Palettes> genPalette(String inputText) {
		System.out.println("입력 받은 값 : " + inputText);
		List<Palettes> palettes = mapper.genPalette(inputText);
		Collections.shuffle(palettes);
		return palettes;
	}

	// 내정보에 저장한 팔레트 불러오기
	@RequestMapping("/getMyPalettes.do")
	public List<userPalettes> main(int user_seq) {
		List<userPalettes> list = mapper.getMyPalettes(user_seq);
		return list;
	}

	// 내정보에 저장한 팔레트 삭제하기
	@GetMapping("deleteMyPalette.do")
	public void deleteMyPalette(int seq) {
		mapper.deleteMyPalette(seq);
	}

	// 내정보에 팔레트 저장하기
	@PostMapping("/insertMyPalettes.do")
	public String insertMyPalettes(userPalettes vo) {
		String name = vo.getPalette_name();
		List<userPalettes> check = mapper.checkPaletteName(name);
		if (check.size() == 0) {
			mapper.insertMyPalettes(vo);
		} else if (check.size() != 0) {
			mapper.deleteMyPaletteToName(name);
		}
		return "ok";
	}
	

}
