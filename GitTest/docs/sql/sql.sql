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