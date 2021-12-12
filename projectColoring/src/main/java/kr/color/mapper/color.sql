-- 문자열 유사도 출력 --
select *,jaro_winkler_similarity('lavender',txt_content) as jws from inputtext order by jws desc limit 15

-- 셀렉트 랜덤 정렬 --
select * from inputtext order by rand() limit 15

-- 문자열 유사도 정렬 --
select * from inputtext order by jaro_winkler_similarity('lavender',txt_content) desc limit 15

-- 메인 페이지 랜덤 팔레트 16개 가져오기 --
select p.palette_seq, t.txt_seq, p.palette_color1, p.palette_color2, p.palette_color3, p.palette_color4, p.palette_color5, p.regdit_date, p.user_seq from inputtext t, palettes p where t.txt_seq = p.txt_seq order by rand() limit 16

-- 팔레트 텍스트 입력 셀렉트 (텍스트와 유사도 포함) --
select t.txt_content, jaro_winkler_similarity('lavender',t.txt_content), p.palette_seq, t.txt_seq, p.palette_color1, p.palette_color2, p.palette_color3, p.palette_color4, p.palette_color5, p.regdit_date, p.user_seq from inputtext t, palettes p where t.txt_seq = p.txt_seq order by jaro_winkler_similarity('lavender',t.txt_content) desc limit 16

-- 팔레트 텍스트 입력 셀렉트 --
select p.palette_seq, t.txt_seq, p.palette_color1, p.palette_color2, p.palette_color3, p.palette_color4, p.palette_color5, p.regdit_date, p.user_seq from inputtext t, palettes p where t.txt_seq = p.txt_seq order by jaro_winkler_similarity('lavender',t.txt_content) desc limit 10

use color;
show tables;
select * from palettes;

show databases

use color;
select * from userPalettes;