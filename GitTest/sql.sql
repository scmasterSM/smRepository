
/* Create Sequences */

CREATE SEQUENCE SEQ_ClipBoard_CIP_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ClipBoard_clip_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ClipBoard_clip_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DailyCityList_daily_city_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DailyCityList_daily_city_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DailyCityList_DCL_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DailySchedule_daily_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DailySchedule_daily_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DailySchedule_DAILY_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DetailedSchedule_detailed_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DetailedSchedule_detailed_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DetailedSchedule_DTL_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_LikedSchedule_liked_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_LikedSchedule_LIKED_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NEW_TABLE_reply_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reply_reply_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reply_REPLY_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Schedule_SCD_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Schedule_scheduleid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Schedule_schedule_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Schedule_schedule_index INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SharedUserList_SHARED_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_BGT_TB_BGT_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_CLIP_TB_CIP_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_CLIP_TB_CLIP_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_DAILY_CITY_TB_DCL_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_DAILY_SCD_TB_DAILY_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_DTL_SCD_TB_DTL_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_LIKED_TB_LIKED_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_REPLY_TB_REPLY_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_REVIEW_TB_REV_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_SCD_TB_SCD_SQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SM_SHARED_USER_TB_SHARED_SQ INCREMENT BY 1 START WITH 1;



/* Create Tables */

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


CREATE TABLE SM_CLIP_TB
(
	-- 사용자가 장소를 클립하면 저장되는 클립 정보의 아이디.
	-- 시퀀스를 이용하여 자동 증가
	CLIP_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 여행 장소 이름(경복궁, 용두암 등)
	ATTR_NM varchar2(30),
	-- 행사/축제 이름
	FEST_NM varchar2(30),
	-- 클립일
	CLIP_YMD date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (CLIP_SQ)
);


CREATE TABLE SM_DAILY_CITY_TB
(
	DCL_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number,
	-- 일차 테이블의 pk
	-- 시퀀스를 이용하여 자동 증가
	DAILY_SQ number NOT NULL,
	DAILY_ORD number NOT NULL,
	-- 해당 여행 일차에 여행하는 도시
	DAILY_CITY varchar2(20) NOT NULL,
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
	DTL_PLACE varchar2(30) NOT NULL,
	-- 해당 여행지에 관련하여 사용자가 작성한 메모
	DTL_MEMO varchar2(2000),
	PRIMARY KEY (DTL_SQ)
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


CREATE TABLE SM_REPLY_TB
(
	-- 일정 댓글 테이블 인덱스
	-- 시퀀스 이용 자동증가
	-- 
	REPLY_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number NOT NULL,
	-- 일정에 대한 짧은 댓글
	REPLY_TXT varchar2(2000) NOT NULL,
	-- 댓글 최초 작성일
	INP_YMD date NOT NULL,
	-- 댓글 수정일
	UPD_YMD date,
	PRIMARY KEY (REPLY_SQ)
);


CREATE TABLE SM_REVIEW_TB
(
	-- 리뷰테이블 시퀀스
	REV_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	-- 장소 이름
	PLACE_NM varchar2(20) NOT NULL,
	-- 리뷰 내용
	REV_TXT varchar2(2000) NOT NULL,
	-- 리뷰 최초 등록일
	INP_YMD date NOT NULL,
	-- 리뷰 수정일
	UPD_YMD date,
	PRIMARY KEY (REV_SQ)
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


CREATE TABLE SM_SHARED_USER_TB
(
	SHARED_SQ number NOT NULL,
	-- 일정 아이디, 시퀀스를 이용하여 자동 증가
	SCD_SQ number NOT NULL,
	-- 사용자 아이디
	USER_ID varchar2(20) NOT NULL,
	PRIMARY KEY (SHARED_SQ)
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
	REG_YMD date NOT NULL,
	-- 수정일
	UPD_YMD date,
	PRIMARY KEY (USER_ID)
);



/* Create Foreign Keys */

ALTER TABLE SM_DAILY_CITY_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_DAILY_SCD_TB (DAILY_SQ)
;


ALTER TABLE SM_DAILY_CITY_TB
	ADD FOREIGN KEY (DAILY_SQ)
	REFERENCES SM_DAILY_SCD_TB (DAILY_SQ)
;


ALTER TABLE SM_DTL_SCD_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_DAILY_SCD_TB (DAILY_SQ)
;


ALTER TABLE SM_DTL_SCD_TB
	ADD FOREIGN KEY (DAILY_SQ)
	REFERENCES SM_DAILY_SCD_TB (DAILY_SQ)
;


ALTER TABLE SM_BGT_TB
	ADD FOREIGN KEY (DAILY_SQ)
	REFERENCES SM_DTL_SCD_TB (DTL_SQ)
;


ALTER TABLE SM_BGT_TB
	ADD FOREIGN KEY (DTL_SQ)
	REFERENCES SM_DTL_SCD_TB (DTL_SQ)
;


ALTER TABLE SM_BGT_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_DTL_SCD_TB (DTL_SQ)
;


ALTER TABLE SM_DAILY_SCD_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
;


ALTER TABLE SM_LIKED_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
;


ALTER TABLE SM_REPLY_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
;


ALTER TABLE SM_SHARED_USER_TB
	ADD FOREIGN KEY (SCD_SQ)
	REFERENCES SM_SCD_TB (SCD_SQ)
;


ALTER TABLE SM_CLIP_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
;


ALTER TABLE SM_LIKED_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
;


ALTER TABLE SM_REVIEW_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
;


ALTER TABLE SM_SCD_TB
	ADD FOREIGN KEY (USER_ID)
	REFERENCES SM_USER_TB (USER_ID)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_ClipBoard_CIP_SQ BEFORE INSERT ON ClipBoard
FOR EACH ROW
BEGIN
	SELECT SEQ_ClipBoard_CIP_SQ.nextval
	INTO :new.CIP_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ClipBoard_clip_id BEFORE INSERT ON ClipBoard
FOR EACH ROW
BEGIN
	SELECT SEQ_ClipBoard_clip_id.nextval
	INTO :new.clip_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ClipBoard_clip_index BEFORE INSERT ON ClipBoard
FOR EACH ROW
BEGIN
	SELECT SEQ_ClipBoard_clip_index.nextval
	INTO :new.clip_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DailyCityList_daily_city_id BEFORE INSERT ON DailyCityList
FOR EACH ROW
BEGIN
	SELECT SEQ_DailyCityList_daily_city_id.nextval
	INTO :new.daily_city_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DailyCityList_daily_city_index BEFORE INSERT ON DailyCityList
FOR EACH ROW
BEGIN
	SELECT SEQ_DailyCityList_daily_city_index.nextval
	INTO :new.daily_city_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DailyCityList_DCL_SQ BEFORE INSERT ON DailyCityList
FOR EACH ROW
BEGIN
	SELECT SEQ_DailyCityList_DCL_SQ.nextval
	INTO :new.DCL_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DailySchedule_daily_id BEFORE INSERT ON DailySchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_DailySchedule_daily_id.nextval
	INTO :new.daily_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DailySchedule_daily_index BEFORE INSERT ON DailySchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_DailySchedule_daily_index.nextval
	INTO :new.daily_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DailySchedule_DAILY_SQ BEFORE INSERT ON DailySchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_DailySchedule_DAILY_SQ.nextval
	INTO :new.DAILY_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DetailedSchedule_detailed_id BEFORE INSERT ON DetailedSchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_DetailedSchedule_detailed_id.nextval
	INTO :new.detailed_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DetailedSchedule_detailed_index BEFORE INSERT ON DetailedSchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_DetailedSchedule_detailed_index.nextval
	INTO :new.detailed_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_DetailedSchedule_DTL_SQ BEFORE INSERT ON DetailedSchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_DetailedSchedule_DTL_SQ.nextval
	INTO :new.DTL_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_LikedSchedule_liked_index BEFORE INSERT ON LikedSchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_LikedSchedule_liked_index.nextval
	INTO :new.liked_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_LikedSchedule_LIKED_SQ BEFORE INSERT ON LikedSchedule
FOR EACH ROW
BEGIN
	SELECT SEQ_LikedSchedule_LIKED_SQ.nextval
	INTO :new.LIKED_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_NEW_TABLE_reply_index BEFORE INSERT ON NEW_TABLE
FOR EACH ROW
BEGIN
	SELECT SEQ_NEW_TABLE_reply_index.nextval
	INTO :new.reply_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reply_reply_index BEFORE INSERT ON Reply
FOR EACH ROW
BEGIN
	SELECT SEQ_Reply_reply_index.nextval
	INTO :new.reply_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reply_REPLY_SQ BEFORE INSERT ON Reply
FOR EACH ROW
BEGIN
	SELECT SEQ_Reply_REPLY_SQ.nextval
	INTO :new.REPLY_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Schedule_SCD_SQ BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
	SELECT SEQ_Schedule_SCD_SQ.nextval
	INTO :new.SCD_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Schedule_scheduleid BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
	SELECT SEQ_Schedule_scheduleid.nextval
	INTO :new.scheduleid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Schedule_schedule_id BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
	SELECT SEQ_Schedule_schedule_id.nextval
	INTO :new.schedule_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Schedule_schedule_index BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
	SELECT SEQ_Schedule_schedule_index.nextval
	INTO :new.schedule_index
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SharedUserList_SHARED_SQ BEFORE INSERT ON SharedUserList
FOR EACH ROW
BEGIN
	SELECT SEQ_SharedUserList_SHARED_SQ.nextval
	INTO :new.SHARED_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_BGT_TB_BGT_SQ BEFORE INSERT ON SM_BGT_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_BGT_TB_BGT_SQ.nextval
	INTO :new.BGT_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_CLIP_TB_CIP_SQ BEFORE INSERT ON SM_CLIP_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_CLIP_TB_CIP_SQ.nextval
	INTO :new.CIP_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_CLIP_TB_CLIP_SQ BEFORE INSERT ON SM_CLIP_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_CLIP_TB_CLIP_SQ.nextval
	INTO :new.CLIP_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_DAILY_CITY_TB_DCL_SQ BEFORE INSERT ON SM_DAILY_CITY_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_DAILY_CITY_TB_DCL_SQ.nextval
	INTO :new.DCL_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_DAILY_SCD_TB_DAILY_SQ BEFORE INSERT ON SM_DAILY_SCD_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_DAILY_SCD_TB_DAILY_SQ.nextval
	INTO :new.DAILY_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_DTL_SCD_TB_DTL_SQ BEFORE INSERT ON SM_DTL_SCD_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_DTL_SCD_TB_DTL_SQ.nextval
	INTO :new.DTL_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_LIKED_TB_LIKED_SQ BEFORE INSERT ON SM_LIKED_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_LIKED_TB_LIKED_SQ.nextval
	INTO :new.LIKED_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_REPLY_TB_REPLY_SQ BEFORE INSERT ON SM_REPLY_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_REPLY_TB_REPLY_SQ.nextval
	INTO :new.REPLY_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_REVIEW_TB_REV_SQ BEFORE INSERT ON SM_REVIEW_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_REVIEW_TB_REV_SQ.nextval
	INTO :new.REV_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_SCD_TB_SCD_SQ BEFORE INSERT ON SM_SCD_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_SCD_TB_SCD_SQ.nextval
	INTO :new.SCD_SQ
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SM_SHARED_USER_TB_SHARED_SQ BEFORE INSERT ON SM_SHARED_USER_TB
FOR EACH ROW
BEGIN
	SELECT SEQ_SM_SHARED_USER_TB_SHARED_SQ.nextval
	INTO :new.SHARED_SQ
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN SM_BGT_TB.BGT_SQ IS '예산테이블 시퀀스';
COMMENT ON COLUMN SM_BGT_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_BGT_TB.DAILY_SQ IS '일차 테이블의 pk
시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_BGT_TB.DTL_SQ IS '상세일정 아이디
시퀀스 이용 자동 증가';
COMMENT ON COLUMN SM_BGT_TB.DTL_BUDGET IS '해당 여행지에서의 예산 계획';
COMMENT ON COLUMN SM_CLIP_TB.CLIP_SQ IS '사용자가 장소를 클립하면 저장되는 클립 정보의 아이디.
시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_CLIP_TB.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN SM_CLIP_TB.ATTR_NM IS '여행 장소 이름(경복궁, 용두암 등)';
COMMENT ON COLUMN SM_CLIP_TB.FEST_NM IS '행사/축제 이름';
COMMENT ON COLUMN SM_CLIP_TB.CLIP_YMD IS '클립일';
COMMENT ON COLUMN SM_DAILY_CITY_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_DAILY_CITY_TB.DAILY_SQ IS '일차 테이블의 pk
시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_DAILY_CITY_TB.DAILY_CITY IS '해당 여행 일차에 여행하는 도시';
COMMENT ON COLUMN SM_DAILY_SCD_TB.DAILY_SQ IS '일차 테이블의 pk
시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_DAILY_SCD_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_DAILY_SCD_TB.DAILY_ORD IS '여행의 일차 (1일차, 2일차...)
';
COMMENT ON COLUMN SM_DAILY_SCD_TB.DAILY_YMD IS '여행 일자
yyMMdd 형식';
COMMENT ON COLUMN SM_DTL_SCD_TB.DTL_SQ IS '상세일정 아이디
시퀀스 이용 자동 증가';
COMMENT ON COLUMN SM_DTL_SCD_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_DTL_SCD_TB.DAILY_SQ IS '일차 테이블의 pk
시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_DTL_SCD_TB.DTL_ORD IS '해당 일자의 관광지 여행 순서';
COMMENT ON COLUMN SM_DTL_SCD_TB.DTL_PLACE IS '일차별 일정에 추가한 여행지';
COMMENT ON COLUMN SM_DTL_SCD_TB.DTL_MEMO IS '해당 여행지에 관련하여 사용자가 작성한 메모';
COMMENT ON COLUMN SM_LIKED_TB.LIKED_SQ IS '좋아한 일정 테이블 인덱스
시퀀스 이용하여 자동 증가';
COMMENT ON COLUMN SM_LIKED_TB.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN SM_LIKED_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_REPLY_TB.REPLY_SQ IS '일정 댓글 테이블 인덱스
시퀀스 이용 자동증가
';
COMMENT ON COLUMN SM_REPLY_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_REPLY_TB.REPLY_TXT IS '일정에 대한 짧은 댓글';
COMMENT ON COLUMN SM_REPLY_TB.INP_YMD IS '댓글 최초 작성일';
COMMENT ON COLUMN SM_REPLY_TB.UPD_YMD IS '댓글 수정일';
COMMENT ON COLUMN SM_REVIEW_TB.REV_SQ IS '리뷰테이블 시퀀스';
COMMENT ON COLUMN SM_REVIEW_TB.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN SM_REVIEW_TB.PLACE_NM IS '장소 이름';
COMMENT ON COLUMN SM_REVIEW_TB.REV_TXT IS '리뷰 내용';
COMMENT ON COLUMN SM_REVIEW_TB.INP_YMD IS '리뷰 최초 등록일';
COMMENT ON COLUMN SM_REVIEW_TB.UPD_YMD IS '리뷰 수정일';
COMMENT ON COLUMN SM_SCD_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_SCD_TB.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN SM_SCD_TB.SCD_TITLE IS '계획하는 여행 일정의 제목';
COMMENT ON COLUMN SM_SCD_TB.SCD_DESC IS '여행 일정에 관련된 간단한 설명
';
COMMENT ON COLUMN SM_SCD_TB.SCD_SEASON IS '여행을 가는 계절
in(spring, summer, fall, winter)';
COMMENT ON COLUMN SM_SCD_TB.SCD_THEME IS '여행의 테마
check in(가족여행, 나홀로여행, 커플여행, 우정여행, 비즈니스여행)';
COMMENT ON COLUMN SM_SCD_TB.PUBLIC_FL IS '일정 공개여부 설정
공개: to_public
비공개: shared_user_only';
COMMENT ON COLUMN SM_SCD_TB.START_YMD IS '여행 출발일
yyMMdd형식
';
COMMENT ON COLUMN SM_SCD_TB.DAY_CNT IS '총 여행 일수';
COMMENT ON COLUMN SM_SHARED_USER_TB.SCD_SQ IS '일정 아이디, 시퀀스를 이용하여 자동 증가';
COMMENT ON COLUMN SM_SHARED_USER_TB.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN SM_USER_TB.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN SM_USER_TB.PASSWORD IS '사용자 비밀번호';
COMMENT ON COLUMN SM_USER_TB.EMAIL IS '사용자 이메일';
COMMENT ON COLUMN SM_USER_TB.USER_SEX IS '사용자 성별(M/F)';
COMMENT ON COLUMN SM_USER_TB.REG_YMD IS '가입일';
COMMENT ON COLUMN SM_USER_TB.UPD_YMD IS '수정일';



