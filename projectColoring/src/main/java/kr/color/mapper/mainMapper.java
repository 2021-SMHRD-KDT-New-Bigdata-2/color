package kr.color.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.color.domain.InputText;
import kr.color.domain.Palettes;
import kr.color.domain.userPalettes;

@Mapper
public interface mainMapper {
	public List<Palettes> getMainList();
	public List<Palettes> genPalette(String inputText);
	public List<userPalettes> getMyPalettes(int user_seq);
	public void deleteMyPalette(int seq);
	public void insertMyPalettes(userPalettes vo);
	public userPalettes paletteDetail(int seq);
	public List<InputText> getPaletteName();
	public List<userPalettes> checkPaletteName(String name);
	public void deleteMyPaletteToName(String name);
	public Palettes paletteDetailRandom(int seq);
	public void DeleteAll(); // 줄 값도 받을 값도 없어서 void
}
