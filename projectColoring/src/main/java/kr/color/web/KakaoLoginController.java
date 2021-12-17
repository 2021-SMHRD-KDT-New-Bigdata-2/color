package kr.color.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.color.domain.UserInfo;
import kr.color.mapper.userMapper;

@Controller
public class KakaoLoginController {
	
	@Autowired
	userMapper mapper;
	
	@GetMapping(value = "kakao/login", produces = "application/json; charset=utf8")
	public String kakaoLogin(String code, HttpSession session) { // Data 리턴 해주는 컨트롤러 함수
		
		// POST 방식으로 key=value 카카오 쪽으로 데이터 요청
		// a type은 무조건 get 방식
		// 이때 필요한 라이브러리 - RestTemplate - 이전에는 HttpsURLConnection 이용..
		
		RestTemplate rt = new RestTemplate();
		// http 헤더 만들기
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		// http body데이터를 담아줄  object 만들기 ( multivalueMap)
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		// 여기에 하나씩 붙인다.
		// add할때 변수화 시켜서 하는 게 나음..
		params.add("grant_type", "authorization_code");
		params.add("client_id", "9b454e2d908098fe6dce2388f31113db");
		params.add("redirect_uri", "http://localhost:8081/web/kakao/login");
		params.add("code", code);
		
		// HttpHeader와 HttpBody를 하나의 object에 담기 
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
				new HttpEntity<>(params, headers);
		// kakaoTokenRequest -> params(request해야하는 정보 / headers 담고 있는 entity가 된다.)
		// 아래의 exchange 함수가 HttpEntity를 받아야 한다.
		
		//실제로 http 요청하기 - Post방식으로 - 그리고 response변수의 응답을 받음
		ResponseEntity<String> response = rt.exchange(
					"https://kauth.kakao.com/oauth/token",
					HttpMethod.POST,
					kakaoTokenRequest,
					String.class
				);
		
		// json 처리 해주는 곳. Gson, Json Simple, ObjectMapper 중 ObjectMapper 사용
		ObjectMapper objectMapper = new ObjectMapper();
		OauthToken oauthToken = null;
		
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OauthToken.class);
		} catch (JsonMappingException e) { // 오류에 대한 try-catch문
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 액세스 토큰 :"+oauthToken.getAccess_token());
		
		// accessToken을 이용해서 사용자 정보 받아오기
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpHeader와 HttpBody를 하나의 object에 담기 
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = 
				new HttpEntity<>(headers2);
		// kakaoTokenRequest -> params(request해야하는 정보 / headers 담고 있는 entity가 된다.)
		// 아래의 exchange 함수가 HttpEntity를 받아야 한다.
		
		//실제로 http 요청하기 - Post방식으로 - 그리고 response변수의 응답을 받음
		ResponseEntity<String> response2 = rt2.exchange(
					"https://kapi.kakao.com/v2/user/me",
					HttpMethod.POST,
					kakaoProfileRequest,
					String.class
				);
		System.out.println(response2.getBody());
		
		// object 집어넣기 ( KakaoProfile )
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) { // 오류에 대한 try-catch문
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		// 카카오로부터 받는 정보
		System.out.println("카카오 아이디 :"+kakaoProfile.getId());
		System.out.println("카카오 이메일 :"+kakaoProfile.getKakao_account().getEmail());
		
		// 우리 사이트에 카카오 정보로 회원가입시키기 (아이디는 뭐.. 앞 4자리만 빼고 coloring붙이든지..? -> 내꺼로 예를 들면, username: coloring2031 / 비밀번호 1234 -> ID, 전화번호 -> 직접 입력 창. 
		
		System.out.println("컬러링 유저네임 :"+"coloring"+kakaoProfile.getId().toString().substring(0,4));	// 변수에 저장
		System.out.println("컬러링 비밀번호 :"+"password"+kakaoProfile.getId().toString().substring(6));		// 변수에 저장
		System.out.println("컬러링 email :"+kakaoProfile.getKakao_account().getEmail());					// 변수에 저장
		
		// 우리 사이트에 가입시키는 정보
		UserInfo kakaoUser = new UserInfo();
		System.out.println(kakaoUser);
		
		kakaoUser.setUser_id("coloring"+kakaoProfile.getId().toString().substring(0,4));
		
		// 카카오로 이미 가입(=로그인)한 적이 있는지 없는지 확인해서 처리
		UserInfo kakaoUserCheck = mapper.checkId(kakaoUser);
		System.out.println(kakaoUserCheck);
		System.out.println(kakaoUser.getUser_id());
		System.out.println("1111111111111111111111");
		
		
		// 없으면 가입시키기 ( null이면 로그인(가입)한 적 없다 )
		if (kakaoUserCheck == null) {
			System.out.println("기존회원이 아니므로 자동으로 가입을 진행합니다.");
			kakaoUser.setUser_id("coloring"+kakaoProfile.getId().toString().substring(0,4));
			System.out.println(kakaoUser.getUser_id());
			kakaoUser.setUser_pwd("password"+kakaoProfile.getId().toString().substring(6));
			System.out.println(kakaoUser.getUser_pwd());
			kakaoUser.setUser_name(kakaoProfile.getProperties().getNickname());
			System.out.println(kakaoUser.getUser_name());
			kakaoUser.setUser_email(kakaoProfile.getKakao_account().getEmail());
			System.out.println(kakaoUser.getUser_email());
			kakaoUser.setUser_phone("카카오회원입니다");
			System.out.println(kakaoUser.getUser_phone());
			
			mapper.kakaoUserjoin(kakaoUser);
			
			mapper.login(kakaoUser);
			UserInfo userVO=mapper.login(kakaoUser);
			System.out.println(userVO);
			if(userVO!=null) {
				session.setAttribute("userVO", userVO);
				return "redirect:/";
			}else {
				return "redirect:/";
			}
		}
		// 있으면 로그인시키기
		else {
			System.out.println("22222222222222222222222");
			UserInfo userVO=mapper.login(kakaoUserCheck);
			System.out.println(kakaoUser);
				if(userVO!=null) {
					session.setAttribute("userVO", userVO);
					return "redirect:/";
				}else {
					return "redirect:/";
				}
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "kakao/logout")
	public String Kakaologout(HttpSession session) throws Exception {
		System.out.println("로그아웃 좀 해보자");
		
		// 세션 삭제
		session.invalidate();
		
		return "redirect:/";
	}	

}