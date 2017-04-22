/* Drop tables and sequences*/
DROP TABLE SM_BGT_TB;
DROP TABLE SM_DTL_SCD_TB;
DROP TABLE SM_DAILY_CITY_TB;
DROP TABLE SM_DAILY_SCD_TB;
DROP TABLE SM_SHARED_USER_TB;
DROP TABLE SM_CLIP_TB;
DROP TABLE SM_REVIEW_TB;
DROP TABLE SM_REPLY_TB;
DROP TABLE SM_LIKED_TB;
DROP TABLE SM_SCD_TB;
DROP TABLE SM_USER_TB;

DROP SEQUENCE SM_BGT_TB_BGT_SQ;
DROP SEQUENCE SM_CLIP_TB_CLIP_SQ;
DROP SEQUENCE SM_DAILY_CITY_TB_DCL_SQ;
DROP SEQUENCE SM_DAILY_SCD_TB_DAILY_SQ;
DROP SEQUENCE SM_DTL_SCD_TB_DTL_SQ;
DROP SEQUENCE SM_LIKED_TB_LIKED_SQ;
DROP SEQUENCE SM_REPLY_TB_REPLY_SQ;
DROP SEQUENCE SM_REVIEW_TB_REV_SQ;
DROP SEQUENCE SM_SCD_TB_SCD_SQ;
DROP SEQUENCE SM_SHARED_USER_TB_SHARED_SQ;

/* Create Sequences */

CREATE SEQUENCE SM_BGT_TB_BGT_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_CLIP_TB_CLIP_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_DAILY_CITY_TB_DCL_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_DAILY_SCD_TB_DAILY_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_DTL_SCD_TB_DTL_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_LIKED_TB_LIKED_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_REPLY_TB_REPLY_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_REVIEW_TB_REV_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_SCD_TB_SCD_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SM_SHARED_USER_TB_SHARED_SQ INCREMENT BY 1 START WITH 1;


/* Create Tables */

CREATE TABLE SM_SHARED_USER_TB
(
	SHARED_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	PRIMARY KEY (SHARED_SQ)
);


CREATE TABLE SM_DAILY_CITY_TB
(
	DCL_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number,
	-- 일차 테이블의 pk
	-- 시퀀스를 이용하여 자동 증가
	DAILY_SQ number NOT NULL,
	CITY_ORD number NOT NULL,
	-- AREA_CODE
	AREA_CODE varchar2(20) NOT NULL,
	-- SIGUNGU_CODE
	SIGUNGU_CODE varchar2(20),
	CITY_NM varchar2(100),
	PRIMARY KEY (DCL_SQ)
);


CREATE TABLE SM_DAILY_SCD_TB
(
	-- 일차 테이블의 pk
	-- 시퀀스를 이용하여 자동 증가
	DAILY_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number NOT NULL,
	-- 여행의 일차 (1일차, 2일차...)
	-- 
	DAILY_ORD number NOT NULL,
	-- 여행 일자
	-- yyMMdd 형식
	DAILY_YMD date NOT NULL,
	PRIMARY KEY (DAILY_SQ)
);


CREATE TABLE SM_REPLY_TB
(
	-- 일정 댓글 테이블 인덱스
	-- 시퀀스 이용 자동증가
	-- 
	REPLY_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 일정에 대한 짧은 댓글
	REPLY_TXT varchar2(2000) NOT NULL,
	-- 댓글 최초 작성일
	INP_YMD date DEFAULT sysdate,
	-- 댓글 수정일
	UPD_YMD date,
	PRIMARY KEY (REPLY_SQ)
);


CREATE TABLE SM_SCD_TB
(
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 계획하는 여행 일정의 제목
	SCD_TITLE varchar2(20) NOT NULL,
	-- 여행 일정에 관련된 간단한 설명
	-- 
	SCD_DESC varchar2(2000),
	-- 여행을 가는 계절
	-- in(spring, summer, fall, winter)
	SCD_SEASON varchar2(20) NOT NULL,
	-- 여행의 테마
	-- check in(가족여행, 나홀로여행, 커플여행, 우정여행, 비즈니스여행)
	SCD_THEME varchar2(20) NOT NULL,
	-- 일정 공개여부 설정
	-- 공개: to_public
	-- 비공개: shared_user_only
	PUBLIC_FL varchar2(20) DEFAULT 'public' NOT NULL,
	-- 여행 출발일
	-- yyMMdd형식
	-- 
	START_YMD date NOT NULL,
	-- 총 여행 일수
	DAY_CNT number DEFAULT 1 NOT NULL,
	PRIMARY KEY (SCD_SQ)
);


CREATE TABLE SM_USER_TB
(
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 사용자 비밀번호
	PASSWORD varchar2(20) NOT NULL,
	-- 사용자 이메일
	EMAIL varchar2(30) NOT NULL,
	-- 사용자 성별(M/F)
	USER_SEX varchar2(1) NOT NULL,
	-- 가입일
	REG_YMD date DEFAULT sysdate,
	-- 수정일
	UPD_YMD date,
	PRIMARY KEY (USER_ID)
);


CREATE TABLE SM_BGT_TB
(
	-- 예산테이블 시퀀스
	BGT_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number,
	-- 일차 테이블의 pk
	-- 시퀀스를 이용하여 자동 증가
	DAILY_SQ number,
	-- 상세일정 아이디
	-- 시퀀스 이용 자동 증가
	DTL_SQ number NOT NULL,
	-- 해당 여행지에서의 예산 계획
	DTL_BUDGET varchar2(20),
	PRIMARY KEY (BGT_SQ)
);


CREATE TABLE SM_LIKED_TB
(
	-- 좋아한 일정 테이블 인덱스
	-- 시퀀스 이용하여 자동 증가
	LIKED_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number NOT NULL,
	PRIMARY KEY (LIKED_SQ)
);


CREATE TABLE SM_CLIP_TB
(
	-- 사용자가 장소를 클립하면 저장되는 클립 정보의 아이디.
	-- 시퀀스를 이용하여 자동 증가
	CLIP_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 여행 장소 ID(경복궁, 용두암 등)
	CONTENT_ID varchar2(20) NOT NULL,
	CONTENT_TYPE_ID varchar2(20) NOT NULL,
	-- 클립일
	CLIP_YMD date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (CLIP_SQ)
);


CREATE TABLE SM_DTL_SCD_TB
(
	-- 상세일정 아이디
	-- 시퀀스 이용 자동 증가
	DTL_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number,
	-- 일차 테이블의 pk
	-- 시퀀스를 이용하여 자동 증가
	DAILY_SQ number NOT NULL,
	-- 해당 일자의 관광지 여행 순서
	DTL_ORD number NOT NULL,
	-- 일차별 일정에 추가한 여행지
	DTL_CONTENT_ID varchar2(20) NOT NULL,
	-- 해당 여행지에 관련하여 사용자가 작성한 메모
	DTL_MEMO varchar2(2000),
	PLACE_NM varchar2(100),
	DTL_IMAGE varchar2(100),
	AREA_CODE varchar2(20),
	SIGUNGU_CODE varchar2(20),
	CITY_NM varchar2(100),
	MAP_X varchar2(30),
	MAP_Y varchar2(30),
	PRIMARY KEY (DTL_SQ)
);


CREATE TABLE SM_REVIEW_TB
(
	-- 리뷰테이블 시퀀스
	REV_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 장소 ID
	CONTENT_ID varchar2(20) NOT NULL,
	-- 리뷰 내용
	REV_TXT varchar2(2000) NOT NULL,
	-- 리뷰 최초 등록일
	INP_YMD date DEFAULT sysdate,
	-- 리뷰 수정일
	UPD_YMD date,
	PRIMARY KEY (REV_SQ)
);



/* Create Foreign Keys */

ALTER TABLE SM_DAILY_CITY_TB
	ADD FOREIGN KEY (DAILY_SQ)
	REFERENCES SM_DAILY_SCD_TB (DAILY_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_DTL_SCD_TB
	ADD FOREIGN KEY (DAILY_SQ)
	REFERENCES SM_DAILY_SCD_TB (DAILY_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_DAILY_CITY_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_DTL_SCD_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_DAILY_SCD_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_SHARED_USER_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_REPLY_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_REPLY_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
	ON DELETE CASCADE
;


ALTER TABLE SM_LIKED_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_SCD_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
	ON DELETE CASCADE
;


ALTER TABLE SM_CLIP_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
	ON DELETE CASCADE
;


ALTER TABLE SM_REVIEW_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
	ON DELETE CASCADE
;


ALTER TABLE SM_LIKED_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
	ON DELETE CASCADE
;


ALTER TABLE SM_BGT_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_BGT_TB
	ADD FOREIGN KEY (DTL_SQ)
	REFERENCES SM_DTL_SCD_TB (DTL_SQ)
	ON DELETE CASCADE
;


ALTER TABLE SM_BGT_TB
	ADD FOREIGN KEY (DAILY_SQ)
	REFERENCES SM_DAILY_SCD_TB (DAILY_SQ)
	ON DELETE CASCADE
;


INSERT INTO SM_USER_TB values(
	'1', '123123', 'sean@gmail.com', 'M', sysdate, null
);

/*도시 테이블*/
CREATE TABLE SM_CITY_TB(areaCode varchar2(20) not null,
sigungu_code varchar2(20),
city_nm varchar2(100),
city_name_en varchar2(100),
lat number,
lng number,
is_state number,
pic_address varchar2(100));

INSERT INTO SM_CITY_TB VALUES('1','','서울','Seoul',37.566535,126.9779692, 0,'./resources/image/main_city/city_seoul.jpg');
INSERT INTO SM_CITY_TB VALUES('6','','부산','Busan', 35.1795543, 129.0756416,0,'./resources/image/main_city/city_busan.jpg');
INSERT INTO SM_CITY_TB VALUES('39','','제주도','Jeju',33.4890113,126.4983023,0,'./resources/image/main_city/city_jeju.jpg');
INSERT INTO SM_CITY_TB VALUES('2','','인천','Incheon',37.4562557,126.7052062,0,'./resources/image/05_city/incheon770.jpg');
INSERT INTO SM_CITY_TB VALUES('3','','대전','Daejeon',36.3504119,127.3845475,0,'./resources/image/05_city/dj.png');
INSERT INTO SM_CITY_TB VALUES('4','','대구','Daegu',35.8714354,128.601445,0,'./resources/image/05_city/dg.png');
INSERT INTO SM_CITY_TB VALUES('5','','광주','Gwangju',35.1595454,126.8526012,0,'./resources/image/05_city/gwangju.png');
INSERT INTO SM_CITY_TB VALUES('7','','울산','Ulsan',35.5383773,129.3113596,0,'./resources/image/05_city/ulsan.png');
INSERT INTO SM_CITY_TB VALUES('8','','세종시','Sejong',36.4800984,127.2890354,0,'./resources/image/05_city/sejong.png');
INSERT INTO SM_CITY_TB VALUES('31','','경기도','Gyeonggi-do',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('32','','강원도','Gangwon-do',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('33','','충청북도','Chungcheongbuk-do',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('34','','충청남도','Chungcheongnam-do',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('35','','경상북도','Gyeongsangbuk-do',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('36','','경상남도','Gyeongsangnam-do',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('37','','전라북도','Jeollabuk-do',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('38','','전라남도','Jeollanam-do',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');


/* 경기도 */

INSERT INTO SM_CITY_TB VALUES('31','1','가평군','Gapyeong-gun',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','2','고양시','Goyang-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','3','과천시','Gwacheon-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','4','광명시','Gwangmyeong-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','5','광주시','Gwangju-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','6','구리시','Guri-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','7','군포시','Gunpo-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','8','김포시','Gimpo-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','9','남양주시','Namyangju-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','10','동두천시','Dongducheon-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','11','부천시','Bucheon-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','12','성남시','Seongnam-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','13','수원시','Suwon-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','14','시흥시','Siheung-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','15','안산시','Ansan-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','16','안성시','Anseong-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','17','안양시','Anyang-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','18','양주시','Yangju-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','19','양평군','Yangpyeong-gun',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','20','여주시','Yeoju-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','21','연천군','Yeoncheon-gun',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','22','오산시','Osan-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','23','용인시','Yongin-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','24','의왕시','Uiwang-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','25','의정부시','Uijeongbu-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','26','이천시','Icheon-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','27','파주시','Paju-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','28','평택시','Pyeongtaek-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','29','포천시','Pocheon-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');
INSERT INTO SM_CITY_TB VALUES('31','30','하남시','Hanam-si',37.41379999999999,127.5183,1,'./resources/image/05_city/ggd.png');

/* 강원도 */

INSERT INTO SM_CITY_TB VALUES('32','1','강릉시','Gangneung-si',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','2','고성군','Goseong-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','3','동해시','Donghae-si',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','4','삼척시','Samcheok-si',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','5','속초시','Sokcho-si',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','6','양구군','Yanggu-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','7','양양군','Yangyang-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','8','영월군','Yeongwol-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','9','원주시','Wonju-si',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','10','인제군','Inje-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','11','정선군','Jeongseon-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','12','철원군','Cheorwon-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','13','춘천시','Chuncheon-si',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','14','태백시','Taebaek-si',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','15','평창군','Pyeongchang-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','16','홍천군','Hongcheon-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','17','화천군','Hwacheon-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');
INSERT INTO SM_CITY_TB VALUES('32','18','횡성군','Hoengseong-gun',37.8228,128.1555,1,'./resources/image/main_city/city_kwd.jpg');

/*충청북도*/
INSERT INTO SM_CITY_TB VALUES('33','1','괴산군','Goesan-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','2','단양군','Danyang-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','3','보은군','Boeun-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','4','영동군','Yeongdong-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','5','옥천군','Okcheon-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','6','음성군','Eumseong-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','7','제천시','Jecheon-si',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','8','진천군','Jincheon-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','9','청원군','Cheongwon-gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','10','청주시','Cheongju-si',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','11','충주시','Chungju-si',36.8,127.7,1,'./resources/image/05_city/chchbd.png');
INSERT INTO SM_CITY_TB VALUES('33','12','증평군','Jeungpyeong-Gun',36.8,127.7,1,'./resources/image/05_city/chchbd.png');

/*충청남도*/

INSERT INTO SM_CITY_TB VALUES('34','1','공주시','Gongju-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','2','금산군','Geumsan-gun',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','3','논산시','Nonsan-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','4','당진시','Dangjin-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','5','보령시','Boryeong-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','6','부여군','Buyeo-gun',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','7','서산시','Seosan-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','8','서천군','Seocheon-gun',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','9','아산시','Asan-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','10','예산군','Yesan-gun',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','11','천안시','Cheonan-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','12','청양군','Cheongyang-gun',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','13','태안군','Taean-gun',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','14','홍성군','Hongseong-gun',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');
INSERT INTO SM_CITY_TB VALUES('34','15','계룡시','Gyeryong-si',36.5184,126.8,1,'./resources/image/05_city/chchnd.png');

/*경상북도*/

INSERT INTO SM_CITY_TB VALUES('35','1','경산시','Gyeongsan-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','2','경주시','Gyungju-si',36.4919,128.8889,1,'./resources/image/main_city/city_kj.jpg');
INSERT INTO SM_CITY_TB VALUES('35','3','고령군','Goryeong-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','4','구미시','Gumi-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','5','군위군','Gunwi-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','6','김천시','Gimcheon-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','7','문경시','Mungyeong-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','8','봉화군','Bonghwa-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','9','상주시','Sangju-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','10','성주군','Seongju-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','11','안동시','Andong-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','12','영덕군','Andong-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','13','영양군','Yeongyang-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','14','영주시','Yeongju-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','15','영천시','Yeongcheon-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','16','예천군','Yecheon-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','17','울릉군','Ulleung-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','18','울진군','Uljin-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','19','의성군','Euiseong-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','20','청도군','Cheongdo-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','21','청송군','Cheongsong-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','22','칠곡군','Chilgok-gun',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');
INSERT INTO SM_CITY_TB VALUES('35','23','포항시','Pohang-si',36.4919,128.8889,1,'./resources/image/05_city/gsbd.png');

/*경상남도, 3고성군 확인필요 , 진해시 확인필요 */

INSERT INTO SM_CITY_TB VALUES('36','1','거제시','Geoje-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','2','거창군','Geochang-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','3','고성군','Goseong-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png'); 
INSERT INTO SM_CITY_TB VALUES('36','4','김해시','Gimhae-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','5','남해군','Namhae-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','6','마산시','Masan-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','7','밀양시',' Miryang-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','8','사천시','Sacheon-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','9','산청군','Sancheong-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','10','양산시','Yangsan-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','12','의령군',' Euiryeong-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','13','진주시','Jinju-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','14','진해시','Jinhae-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');   
INSERT INTO SM_CITY_TB VALUES('36','15','창녕군','Changnyeong-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','16','창원시','Changwon-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','17','통영시','Tongyeong-si',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','18','하동군','Hadong-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','19','함안군','Haman-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','20','함양군','Hamyang-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');
INSERT INTO SM_CITY_TB VALUES('36','21','합천군','Hapcheon-gun',35.4606,128.2132,1,'./resources/image/05_city/gsnd.png');

/*전라북도*/

INSERT INTO SM_CITY_TB VALUES('37','1','고창군','Gochang-gun',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','2','군산시','Gunsan-si',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','3','김제시','Gimje-si',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','4','남원시','Namwon-si',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','5','무주군','Muju-gun',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','6','부안군','Buan-gun',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','7','순창군','Sunchang-gun',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','8','완주군','Wanju-gun',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','9','익산시','Iksan-si',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','10','임실군','Imsil-gun',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','11','장수군','Jangsu-gun',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','12', '전주시','Jeonju',35.71750000000001,127.153,1,'./resources/image/main_city/city_junju.jpg'); 
INSERT INTO SM_CITY_TB VALUES('37','13','정읍시','Jeongeup-si',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');
INSERT INTO SM_CITY_TB VALUES('37','14','진안군','Jeongeup-si',35.71750000000001,127.153,1,'./resources/image/05_city/jrbd.png');

/*전라남도*/

INSERT INTO SM_CITY_TB VALUES('38','1','강진군','Gangjin-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','2','고흥군','Goheung-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','3','곡성군','Gokseong-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','4','광양시','Gwangyang-si',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','5','구례군','Gurye-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','6','나주시','Naju-si',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','7','담양군','Damyang-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');  
INSERT INTO SM_CITY_TB VALUES('38','8','목포시','Mokpo-si',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');     
INSERT INTO SM_CITY_TB VALUES('38','9','무안군','Muan-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','10','보성군','Boseong-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');  
INSERT INTO SM_CITY_TB VALUES('38','11','순천시','Suncheon-si',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');   
INSERT INTO SM_CITY_TB VALUES('38','12','신안군','Sinan-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','13','여수시','Yeosu-si',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','16','영광군','Yeonggwang-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','17','영암군','Yeongam-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','18','완도군','Wando-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','19','장성군','Jangseong-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','20','장흥군','Jangheung-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','21','진도군','Jindo-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','22','함평군','Hampyeong-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','23','해남군','Haenam-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
INSERT INTO SM_CITY_TB VALUES('38','24','화순군','Hwasun-gun',34.8679,126.991,1,'./resources/image/05_city/jrnd.png');
