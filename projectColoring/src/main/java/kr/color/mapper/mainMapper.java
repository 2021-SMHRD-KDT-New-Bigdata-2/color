package kr.color.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.color.domain.Palettes;
import kr.color.domain.userPalettes;

@Mapper
public interface mainMapper {
	public List<Palettes> getMainList();
	public List<Palettes> genPalette(String txt_translated);
	public List<userPalettes> getMyPalettes(int user_seq);
	public void deleteMyPalette(int seq);
	public void insertMyPalettes(userPalettes vo);
}
