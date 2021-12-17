package kr.color.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.color.domain.UserInfo;
import kr.color.domain.userPalettes;

@Mapper
public interface userMapper {
	public void register(UserInfo vo);
	public UserInfo login(UserInfo vo);
	public UserInfo checkId(UserInfo vo);
	
	@Insert("insert into userInfo(user_id,user_pwd,user_name,user_email,user_phone,admin_yn) values(#{user_id},#{user_pwd},#{user_name},#{user_email},#{user_phone},'N')")
	public void kakaoUserjoin(UserInfo vo);
}
