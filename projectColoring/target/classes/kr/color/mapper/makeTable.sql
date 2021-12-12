use color;
INSERT INTO userPalettes (palette_name, palette_color1, palette_color2, palette_color3, palette_color4, palette_color5, `regdit_date`, user_seq) 
VALUES ('a beach on the sun', '#e75e70', '#f2e9e4', '#f2a176', '#f0c96e','#e2e76f', NOW(), 1);
INSERT INTO userPalettes (palette_name, palette_color1, palette_color2, palette_color3, palette_color4, palette_color5, `regdit_date`, user_seq)
VALUES ('a better pink', '#580035', '#972757', '#eb0081', '#f24b90','#fb81b0', NOW(), 1);
INSERT INTO userPalettes (palette_name, palette_color1, palette_color2, palette_color3, palette_color4, palette_color5, `regdit_date`, user_seq)
VALUES ('a bit of fluff', '#efd4a7', '#fff8a0', '#e3de9c', '#bfc5b9','#c089b1', NOW(), 1);
INSERT INTO userPalettes (palette_name, palette_color1, palette_color2, palette_color3, palette_color4, palette_color5, `regdit_date`, user_seq)
VALUES ('a boring grey winter', '#dfe4dd', '#04090d', '#191c21', '#bab4a4','#e7e7cb', NOW(), 1);
INSERT INTO userPalettes (palette_name, palette_color1, palette_color2, palette_color3, palette_color4, palette_color5, `regdit_date`, user_seq)
VALUES ('a childs daydreams', '#fbfecf', '#a8eff5', '#f2d3ff', '#e6a0c5','#efccc8', NOW(), 1);


select * from userInfo where user_id='userId01' and user_pwd='1234'

delete from userInfo where user_id='userId05'
use color;
select * from userPalettes;
-- userPalettes 생성 --
use color;
CREATE TABLE userPalettes
(
    `palette_seq`      INT UNSIGNED    NOT NULL    AUTO_INCREMENT,
    `palette_name`     VARCHAR(20)     NOT NULL,
    `palette_color1`     VARCHAR(20)     NOT NULL, 
    `palette_color2`     VARCHAR(20)     NOT NULL, 
    `palette_color3`     VARCHAR(20)     NOT NULL, 
    `palette_color4`     VARCHAR(20)     NOT NULL, 
    `palette_color5`     VARCHAR(20)      NOT NULL,
	`regdit_date`	DATETIME	NOT NULL	DEFAULT NOW(),
    `user_seq`       VARCHAR(1)      NOT NULL, 
     PRIMARY KEY (`palette_seq`)
);

use color;
select * from userInfo;
insert into
	    colorMap(color_seq,color_name,color_hex,color_description,color_user_seq)
	    values(#{color_seq},#{color_name},#{color_hex},#{color_description},#{color_user_seq})