package kr.color.web;

import lombok.Data;

@Data
public class OauthToken {
	private String access_token;
	private String token_type;
	private String refresh_token;
	private int expires_in;
	private String scope;
	private int refresh_token_expires_in;
	
	// 이 json 데이터를 한 번에 처리하기 힘드니까 담아줄게
	// KakaoLoginController로
}