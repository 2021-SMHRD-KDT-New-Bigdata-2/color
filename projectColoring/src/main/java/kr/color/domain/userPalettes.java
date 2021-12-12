package kr.color.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class userPalettes {
	private int palette_seq;
	private String palette_name;
	private String palette_color1;
	private String palette_color2;
	private String palette_color3;
	private String palette_color4;
	private String palette_color5;
	private String regdit_date;
	private int user_seq;
	
}
