--유저테이블--
create table SM_USER_TB(
USER_ID VARCHAR2(20) primary key,
PASSWORD VARCHAR2(20) NOT NULL,
EMAIL VARCHAR2(30) NOT NULL,
USER_SEX VARCHAR2(1) NOT NULL,
REG_YMD DATE NOT NULL,
UPD_YMD DATE 
);

--일정 테이블--
create table SM_SCD_TB(
SCD_SQ number primary key,
USER_ID VARCHAR2(20) references SM_USER_TB,
SCD_TITLE VARCHAR2(20) NOT NULL,
SCD_DESC VARCHAR2(2000),
SCD_SEASON VARCHAR2(20) NOT NULL,
SCD_THEME VARCHAR2(20) NOT NULL,
PUBLIC_FL VARCHAR2(20) NOT NULL,
START_YMD DATE NOT NULL,
DAY_CNT number
);
--일차별 일정 테이블--
create table SM_DAILY_SCD_TB(
DAILY_SQ number primary key,
SCD_SQ number references SM_SCD_TB  on delete cascade,
DAILY_ORD number NOT NULL,
DAILY_YMD DATE NOT NULL 
);
--일차별 도시리스트 테이블--
create table SM_DAILY_CITY_TB(
DCL_SQ number primary key,
SCD_SQ number references SM_SCD_TB  on delete cascade,
DAILY_SQ number references SM_DAILY_SCD_TB  on delete cascade,
DAILY_ORD number NOT NULL, 
DAILY_CITY varchar2(20) 
);
--상세 일정 테이블--
create table SM_DTL_SCD_TB(
DTL_SQ number primary key,
SCD_SQ number references SM_SCD_TB  on delete cascade,
DAILY_SQ number references SM_DAILY_SCD_TB  on delete cascade,
DTL_ORD number NOT NULL, 
DTL_PLACE varchar2(30) NOT NULL, 
DTL_MEMO varchar2(2000)
);
--예산 테이블--
create table SM_BGT_TB(
BGT_SQ number primary key,
SCD_SQ number references SM_SCD_TB  on delete cascade,
DAILY_SQ number references SM_DAILY_SCD_TB  on delete cascade,
DTL_SQ number references SM_DAILY_CITY_TB  on delete cascade,
DTL_BUDGET varchar2(20) 
);
--일정 댓글 테이블--(유저아이디 추가함)
create table SM_REPLY_TB(
REPLY_SQ number primary key,
USER_ID VARCHAR2(20) references SM_USER_TB,
SCD_SQ number references SM_SCD_TB  on delete cascade,
REPLY_TXT varchar2(2000) not null,
INP_YMD date NOT NULL,
UPD_YMD date 
);
--일정 공유자 테이블--
create table SM_SHARED_USER_TB(
SHARED_SQ number primary key,
SCD_SQ number references SM_SCD_TB  on delete cascade,
USER_ID VARCHAR2(20) not null  
);
--좋아한 일정 테이블--
create table SM_LIKED_TB(
LIKED_SQ number primary key,
USER_ID VARCHAR2(20) references SM_USER_TB,
SCD_SQ number references SM_SCD_TB  on delete cascade
);
--클립보드 테이블--(ATTR_NM,FEST_NM API의 countid값)
create table SM_CLIP_TB(
CLIP_SQ number primary key,
USER_ID VARCHAR2(20) references SM_USER_TB,
ATTR_NM VARCHAR2(30), 
FEST_NM VARCHAR2(30),
CLIP_YMD date not null
);
--클립보드 테이블 변경--
create table SM_CLIP_TB(
CLIP_SQ number primary key,
USER_ID VARCHAR2(20) references SM_USER_TB,
CONTENT_ID VARCHAR2(30),
CONTENTTYPE_ID VARCHAR2(30),
CLIP_YMD date not null
);
--장소 리뷰 테이블--(PLACE_NM API의 countid값)
create TABLE SM_REVIEW_TB(
REV_SQ NUMBER NOT NULL,
USER_ID VARCHAR2(20) references SM_USER_TB,
PLACE_NM VARCHAR2(50) NOT NULL,
REV_TXT VARCHAR2(2000) NOT NULL, 
INP_YMD DATE DEFAULT SYSDATE,
UPD_YMD DATE DEFAULT SYSDATE
); 
------------------------------------------
create sequence REV_SQ_seq start with 1 increment by 1;
create sequence SCD_SQ_seq start with 1 increment by 1;
create sequence DAILY_SQ_seq start with 1 increment by 1;
create sequence DCL_SQ_seq start with 1 increment by 1;
create sequence BGT_SQ_seq start with 1 increment by 1;
create sequence REPLY_SQ_seq start with 1 increment by 1;
create sequence SHARED_SQ_seq start with 1 increment by 1;
create sequence LIKED_SQ_seq start with 1 increment by 1;
create sequence CLIP_SQ_seq start with 1 increment by 1;
------------------------------------------
SELECT * from SM_USER_TB;
SELECT * from SM_SCD_TB;
SELECT * from SM_DAILY_SCD_TB;
SELECT * from SM_DAILY_CITY_TB;
SELECT * from SM_DTL_SCD_TB;
SELECT * from SM_BGT_TB;
SELECT * from SM_REPLY_TB;
SELECT * from SM_SHARED_USER_TB;
SELECT * from SM_LIKED_TB;
SELECT * from SM_CLIP_TB;
SELECT * from SM_REVIEW_TB;
---------------------------------------------
drop table SM_USER_TB;
drop table SM_SCD_TB;
drop table SM_DAILY_SCD_TB;
drop table SM_DAILY_CITY_TB;
drop table SM_DTL_SCD_TB;
drop table SM_BGT_TB;
drop table SM_REPLY_TB;
drop table SM_SHARED_USER_TB;
drop table SM_LIKED_TB;
drop table SM_CLIP_TB;
drop table SM_REVIEW_TB;
commit;
-----------------------------------------------
drop sequence REV_SQ_seq;
drop sequence SCD_SQ_seq;
drop sequence DAILY_SQ_seq;
drop sequence DCL_SQ_seq;
drop sequence BGT_SQ_seq;
drop sequence REPLY_SQ_seq;
drop sequence SHARED_SQ_seq;
drop sequence LIKED_SQ_seq;
drop sequence CLIP_SQ_seq;
--------------------------------------------------
commit;

select	CLIP_SQ,
			USER_ID,
			CONTENT_ID,
			CONTENTTYPE_ID,
			CLIP_YMD
	from 	SM_CLIP_TB
	where 	USER_ID='1111'
	order by CLIP_SQ
drop table SM_REVIEW_TB;

select count(*)
		from SM_REVIEW_TB