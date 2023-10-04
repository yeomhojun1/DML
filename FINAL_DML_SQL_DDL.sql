DROP TABLE "FOOD" cascade constraints;
DROP TABLE "FOOD_API" cascade constraints;
DROP TABLE "DIET";
DROP TABLE "MEMBER_WEIGHT";
DROP TABLE "MEMBER_EX_SET";
DROP TABLE "CALENDAR" cascade constraints;
DROP TABLE "EXERCISE";
DROP TABLE "REPLYBOARD";
DROP TABLE "BOARD";
DROP TABLE "NOTICE";
DROP TABLE "ADMIN";
DROP TABLE "MEMBER";
DROP TABLE "USERS";
DROP TABLE "CHICKENPRODUCT";
DROP TABLE "SUPLEMENT";
DROP TABLE "NUTRIENT";
DROP TABLE "PRODUCTTYPE";
DROP SEQUENCE board_no_seq;
DROP SEQUENCE REPLY_no_seq;
DROP SEQUENCE notice_no_seq;

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"BOARD_TITLE"	VARCHAR(200)		NOT NULL,
	"BOARD_CONTENT"	CLOB		NOT NULL,
	"BOARD_DATE"	TIMESTAMP	default sysdate	NOT NULL,
    "BOARD_COUNT" NUMBER NULL,
    "BSTEP" NUMBER default 0 NULL,
    "BLEVEL" NUMBER default 0 NULL
);
CREATE SEQUENCE board_no_seq 
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
CREATE TABLE "REPLYBOARD" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"REPLY_CONTENT"	CLOB		NOT NULL,
	"REPLY_DATE"	TIMESTAMP	default sysdate	NOT NULL,
    "BOARD_NO"	NUMBER		NOT NULL,
    "RREF" NUMBER DEFAULT 0 NULL,
    "RSTEP" NUMBER default 0 NULL,
    "RLEVEL" NUMBER default 0 NULL
);
CREATE SEQUENCE REPLY_no_seq 
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE TABLE "MEMBER" (
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"MNAME"	VARCHAR2(50)		NOT NULL,
	"MBIRTHDAY"	VARCHAR2(10)		NULL,
	"GENDER"	VARCHAR2(10)		NOT NULL,
	"HEIGHT"	NUMBER		NULL,
	"WEIGHT"	NUMBER		NULL,
	"SESSIONKEY"	VARCHAR2(63)		NULL,
	"SESSIONLIMIT"	VARCHAR2(63)		NULL,
	"GOOGLEID"	VARCHAR2(63)		NULL,
	"NAVERID"	VARCHAR2(63)		NULL,
	"KAKAOID"	VARCHAR2(63)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '이메일 형식';

COMMENT ON COLUMN "MEMBER"."MNAME" IS '이름';

COMMENT ON COLUMN "MEMBER"."MBIRTHDAY" IS 'YYYYMMDD';

COMMENT ON COLUMN "MEMBER"."GENDER" IS 'MAN, WOMAN';

COMMENT ON COLUMN "MEMBER"."HEIGHT" IS '키';

COMMENT ON COLUMN "MEMBER"."WEIGHT" IS '몸무게';

COMMENT ON COLUMN "MEMBER"."SESSIONKEY" IS '세션키';

COMMENT ON COLUMN "MEMBER"."SESSIONLIMIT" IS '세션시간';

COMMENT ON COLUMN "MEMBER"."GOOGLEID" IS '구글ID';

COMMENT ON COLUMN "MEMBER"."NAVERID" IS '네이버ID';

COMMENT ON COLUMN "MEMBER"."KAKAOID" IS '카카오ID';

CREATE TABLE "ADMIN" (
	"ADMIN_ID"	VARCHAR2(100)		NOT NULL,
	"ADMIN_PWD"	VARCHAR2(80)		NOT NULL,
	"ADMIN_NAME"	VARCHAR(50)		NOT NULL
);

CREATE TABLE "EXERCISE" (
	"ECODE"	NUMBER		NOT NULL,
	"EX_NAME"	VARCHAR2(200)		NOT NULL,
	"PART"	VARCHAR2(30)		NOT NULL,
	"EPOSE"	VARCHAR2(2000)		NOT NULL,
	"EPOSE_LINK"	CLOB		NULL
);

COMMENT ON COLUMN "EXERCISE"."EPOSE_LINK" IS '유튜브 자세화면 보이게함';

CREATE TABLE "FOOD" (
	"FOOD_CD"	VARCHAR(20)		NOT NULL,
	"MEAL_CODE"	VARCHAR(20)		NOT NULL,
	"FOOD_QUALITY"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "FOOD"."MEAL_CODE" IS 'DAY_DIET_KEY+FOOD_TIME';

CREATE TABLE "MEMBER_EX_SET" (
	"DAY_EX_SET"	VARCHAR2(200)		NOT NULL,
	"EXERCISE_DATE"	VARCHAR2(10)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"ECODE"	NUMBER		NOT NULL,
	"EX_NAME"	VARCHAR2(200)		NOT NULL,
	"EXERCISE_SET"	NUMBER		NOT NULL,
	"EXERCISE_NUMBER"	NUMBER		NOT NULL,
	"EXERCISE_WEIGHT"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MEMBER_EX_SET"."DAY_EX_SET" IS '날짜,아이디,운동코드조합';

COMMENT ON COLUMN "MEMBER_EX_SET"."EXERCISE_DATE" IS '날짜';

COMMENT ON COLUMN "MEMBER_EX_SET"."MEMBER_ID" IS '이메일 형식';

CREATE TABLE "FOOD_API" (
	"FOOD_CD"	VARCHAR(20)		NOT NULL,
	"FOOD_NAME"	VARCHAR(90)		NOT NULL,
	"CALORIE"	NUMBER		NULL,
	"CRABS"	NUMBER		NULL,
	"PROTEIN"	NUMBER		NULL,
	"FAT"	NUMBER		NULL
);

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
    "CATEGORY" VARCHAR(50) NOT NULL,
	"ADMIN_ID"	VARCHAR2(100)		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(100)		NOT NULL,
	"NOTICE_CONTENT"	CLOB		NOT NULL,
	"NOTICE_VIEW"	NUMBER		NOT NULL,
	"NOTICE_DATE"	TIMESTAMP default sysdate NOT NULL
);
CREATE SEQUENCE notice_No_seq
      INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE TABLE "USERS" (
	"USERNAME"	VARCHAR2(100)		NOT NULL,
	"PASSWORD"	VARCHAR2(80)		NOT NULL,
	"USER_ENABLED"	NUMBER	DEFAULT 1	NOT NULL,
	"AUTHORITIES"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "USERS"."USER_ENABLED" IS '기본값: 1, 나머지: 0';

-- 20230922 유청하 수정
CREATE TABLE "MEMBER_WEIGHT" (
	"WEIGHT_DATE"	VARCHAR2(8)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"WEIGHT"	NUMBER		NULL,
	"MUSCLE_MASS"	NUMBER		NULL,
	"BODY_FAT_PET"	NUMBER		NULL
);

COMMENT ON COLUMN "MEMBER_WEIGHT"."WEIGHT_DATE" IS 'YYYYMMDD';


CREATE TABLE "DIET" (
	"MEAL_CODE"	VARCHAR(20)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"FOOD_DATE"	VARCHAR2(30)		NOT NULL,
	"FOOD_TIME"	VARCHAR(20)		NOT NULL,
	"FEEDBACK"	VARCHAR2(2000)		NULL
);

COMMENT ON COLUMN "DIET"."MEAL_CODE" IS 'DAY_DIET_KEY+FOOD_TIME';

COMMENT ON COLUMN "DIET"."MEMBER_ID" IS '이메일 형식';

COMMENT ON COLUMN "DIET"."FOOD_TIME" IS '아침이면 A, 점심이면 B, 저녁이면 C, 아점이면 X, 점저면Y, 야식은 Z';

CREATE TABLE "CALENDAR" (
	"CALENDARNO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"STARTDATE"	VARCHAR2(20)		NOT NULL,
	"ENDDATE"	VARCHAR2(20)		NOT NULL,
	"CONTENT"	CLOB		NULL
);

COMMENT ON COLUMN "CALENDAR"."MEMBER_ID" IS '이메일 형식';

COMMENT ON COLUMN "CALENDAR"."TITLE" IS '제목';

COMMENT ON COLUMN "CALENDAR"."STARTDATE" IS '시작날짜';

COMMENT ON COLUMN "CALENDAR"."ENDDATE" IS '끝나는날짜';

COMMENT ON COLUMN "CALENDAR"."CONTENT" IS '내용';

CREATE TABLE "NUTRIENT" (
	"NUTRIENTID"	NUMBER(2)		NOT NULL,
	"NUTRIENT"	VARCHAR(90)		NOT NULL,
	"COMMENT"	VARCHAR(4000)		NULL,
	"INTAKE"	VARCHAR(90)		NULL,
	"WORKMANSHIP"	NUMBER(2)		NOT NULL
);

COMMENT ON COLUMN "NUTRIENT"."NUTRIENT" IS '영양소';

COMMENT ON COLUMN "NUTRIENT"."COMMENT" IS '코멘트';

COMMENT ON COLUMN "NUTRIENT"."INTAKE" IS '섭취방법';

COMMENT ON COLUMN "NUTRIENT"."WORKMANSHIP" IS '숙련도';

CREATE TABLE "PRODUCTTYPE" (
	"TYPE"	VARCHAR2(60)		NOT NULL,
	"STORAGE_METHOD"	VARCHAR2(4000)		NOT NULL
);

COMMENT ON COLUMN "PRODUCTTYPE"."TYPE" IS '상품등급';

COMMENT ON COLUMN "PRODUCTTYPE"."STORAGE_METHOD" IS '보관방법';

CREATE TABLE "CHICKENPRODUCT" (
	"CHICKENNO"	NUMBER(2)		NOT NULL,
	"LINK"	VARCHAR2(512)		NOT NULL,
	"PRODUCT_NAME"	VARCHAR2(20)		NOT NULL,
	"PRICE"	NUMBER(10)		NOT NULL,
	"TYPE"	VARCHAR2(60)		NOT NULL
);

COMMENT ON COLUMN "CHICKENPRODUCT"."CHICKENNO" IS '닭가슴살번호';

COMMENT ON COLUMN "CHICKENPRODUCT"."LINK" IS '링크';

COMMENT ON COLUMN "CHICKENPRODUCT"."PRODUCT_NAME" IS '상품명';

COMMENT ON COLUMN "CHICKENPRODUCT"."PRICE" IS '가격';

COMMENT ON COLUMN "CHICKENPRODUCT"."TYPE" IS '상품등급';

CREATE TABLE "SUPLEMENT" (
	"SUPLEMENTNO"	NUMBER(10)		NOT NULL,
	"SUPLEMENTNAME"	VARCHAR2(90)		NOT NULL,
	"LINK"	VARCHAR2(1000)		NULL,
	"NUTRIENTID"	NUMBER(2)		NOT NULL
);

COMMENT ON COLUMN "SUPLEMENT"."SUPLEMENTNO" IS '보충제번호';

COMMENT ON COLUMN "SUPLEMENT"."LINK" IS '링크';


ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);
ALTER TABLE "REPLYBOARD" ADD CONSTRAINT "PK_REPLYBOARD" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_ID"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"ADMIN_ID"
);

ALTER TABLE "EXERCISE" ADD CONSTRAINT "PK_EXERCISE" PRIMARY KEY (
	"ECODE",
	"EX_NAME"
);

ALTER TABLE "FOOD" ADD CONSTRAINT "PK_FOOD" PRIMARY KEY (
	"FOOD_CD",
	"MEAL_CODE"
);

ALTER TABLE "MEMBER_EX_SET" ADD CONSTRAINT "PK_MEMBER_EX_SET" PRIMARY KEY (
	"DAY_EX_SET"
);

ALTER TABLE "FOOD_API" ADD CONSTRAINT "PK_FOOD_API" PRIMARY KEY (
	"FOOD_CD"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NUMBER",
	"ADMIN_ID"
);

ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"USERNAME"
);


ALTER TABLE "MEMBER_WEIGHT" ADD CONSTRAINT "PK_MEMBER_WEIGHT" PRIMARY KEY (
	"WEIGHT_DATE",
	"MEMBER_ID"
);

ALTER TABLE "DIET" ADD CONSTRAINT "PK_DIET" PRIMARY KEY (
	"MEAL_CODE"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "PK_CALENDAR" PRIMARY KEY (
	"CALENDARNO"
);

ALTER TABLE "NUTRIENT" ADD CONSTRAINT "PK_NUTRIENT" PRIMARY KEY (
	"NUTRIENTID"
);

ALTER TABLE "PRODUCTTYPE" ADD CONSTRAINT "PK_PRODUCTTYPE" PRIMARY KEY (
	"TYPE"
);

ALTER TABLE "CHICKENPRODUCT" ADD CONSTRAINT "PK_CHICKENPRODUCT" PRIMARY KEY (
	"CHICKENNO"
);

ALTER TABLE "SUPLEMENT" ADD CONSTRAINT "PK_SUPLEMENT" PRIMARY KEY (
	"SUPLEMENNO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "REPLYBOARD" ADD CONSTRAINT "FK_BOARD_TO_REPLYBOARD_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
)
ON DELETE CASCADE;

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_USERS_TO_MEMBER_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "USERS" (
	"USERNAME"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "FK_USERS_TO_ADMIN_1" FOREIGN KEY (
	"ADMIN_ID"
)
REFERENCES "USERS" (
	"USERNAME"
);

ALTER TABLE "FOOD" ADD CONSTRAINT "FK_FOOD_API_TO_FOOD_1" FOREIGN KEY (
	"FOOD_CD"
)
REFERENCES "FOOD_API" (
	"FOOD_CD"
);

ALTER TABLE "FOOD" ADD CONSTRAINT "FK_DIET_TO_FOOD_1" FOREIGN KEY (
	"MEAL_CODE"
)
REFERENCES "DIET" (
	"MEAL_CODE"
);

ALTER TABLE "MEMBER_EX_SET" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_EX_SET_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "MEMBER_EX_SET" ADD CONSTRAINT "FK_EXERCISE_TO_MEMBER_EX_SET_1" FOREIGN KEY (
	"ECODE",
    "EX_NAME"
)
REFERENCES "EXERCISE" (
	"ECODE",
    "EX_NAME"
);


ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_ADMIN_TO_NOTICE_1" FOREIGN KEY (
	"ADMIN_ID"
)
REFERENCES "ADMIN" (
	"ADMIN_ID"
);


ALTER TABLE "MEMBER_WEIGHT" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_WEIGHT_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "DIET" ADD CONSTRAINT "FK_MEMBER_TO_DIET_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "FK_MEMBER_TO_CALENDAR_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "CHICKENPRODUCT" ADD CONSTRAINT "FK_PRODUCT_TO_CHICKEN_1" FOREIGN KEY (
	"TYPE"
)
REFERENCES "PRODUCTTYPE" (
	"TYPE"
);

ALTER TABLE "SUPLEMENT" ADD CONSTRAINT "FK_NUTRIENT_TO_SUPLEMENT_1" FOREIGN KEY (
	"NUTRIENTID"
)
REFERENCES "NUTRIENT" (
	"NUTRIENTID"
);

----------insert 문
--$ 떄문에 입력창 뜰떄 
set define off;
--팔운동
insert into exercise   values(10001,'덤벨 리스트 컬','팔',' 1.팔뚝을 벤치에 기대고 손바닥이 위쪽을 향하도록 덤벨을 잡습니다. <br>2.손목을 반원 모양으로 천천히 위쪽으로 구부립니다. <br>3.시작 위치로 돌아가서 반복하세요.' ,'<iframe width="480" height="480" src="https://www.youtube.com/embed/S-ynXc4M-mY" title="Simplified: Wrist Curl Quick #Howto" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10002, '바벨 리스트 컬','팔',' 1.뒤집힌(언더핸드) 그립으로 직선 바를 잡습니다.  <br>2.플랫 벤치 옆에 무릎을 꿇고 손목을 벤치 바로 옆에 두고 팔뚝을 벤치 위에 놓습니다.  <br>3.바벨을 손목이 펴질 때까지 아래로 당기십시오. <br>4.손목이 완전히 구부러질 때까지 바벨을 컬링합니다. <br>5.통제된 방식으로 낮추고 반복하십시오.','<iframe width="853" height="480" src="https://www.youtube.com/embed/si9MtuEcCc4" title="barbell wristcurl male front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10003,'케틀벨 손목 확장', '팔' ,' 1.양손에 케틀벨을 들고 골반 앞에 똑바로 서서 팔뚝이 안쪽을 향하도록 합니다.  <br>2.손목이 완전히 펴질 때까지 손목을 위쪽으로 구부립니다.  <br>3.시작 위치로 낮추고 반복하세요.', '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/eMv3q7r9n9A" title="kettlebell male wrist extension front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10004,'밴드 베이지안 컬' ,'팔' , ' 1.낮은 앵커 포인트에 밴드를 부착합니다. 손바닥을 똑바로 앞으로 향하게 하십시오.  <br>2.팔뚝이 수축하는 느낌이 들 때까지 팔꿈치를 구부립니다. 그런 다음 팔꿈치를 완전히 펴십시오.' , '<iframe width="853" height="480" src="https://www.youtube.com/embed/N0FjItpFQVA" title="band male hammercurl front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10005, '덤벨 손목 확장' , '팔' , ' 1.오버핸드 그립으로 두 개의 덤벨을 잡고 팔뚝을 무릎 위에 올려 놓습니다.  <br>2.손목을 완전히 구부린 다음 손목을 펴십시오. ' , '<iframe width="853" height="480" src="https://www.youtube.com/embed/lyMpCIUE6ms" title="Simplified: Dumbbell Wrist Extension Quick #howto" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10006, '케이블 리스트 컬' , '팔', ' 1.핸들 부착물을 사용하십시오. 케이블은 기기 바닥까지 끝까지 설치되어야 합니다.  <br>2.케이블 머신에서 멀어지도록 하세요. 더 나은 지지 기반을 확보할 수 있도록 자세를 비틀어 보세요.  <br>3.손바닥이 위를 향하게 하고 팔꿈치를 90° 각도로 시작하세요. 손목을 구부리고 펴십시오. ', '<iframe width="853" height="480"  src="https://www.youtube.com/embed/-XngJ2mrcLQ" title="cable male wristcurl side" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10007 , '바벨 비하인드 더 백 리스트 컬', '팔' , ' 1.똑바로 서서 손과 발을 어깨 너비로 벌리고 회내 그립을 사용하여 바벨을 뒤로 잡습니다.  <br>2.천천히 반원을 그리듯 손목을 위쪽으로 구부립니다.  <br>3.동작의 정점에서 바벨을 잡고 천천히 바벨을 다시 시작 위치로 내립니다.', '<iframe  width="853" height="480" src="https://www.youtube.com/embed/NzS4PPIhVvY" title="Barbell Wrist Curls Front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10008, '케틀벨 테이트 프레스' , '팔', ' 1.등을 대고 눕습니다. 팔을 곧게 펴고 손바닥이 몸 반대쪽을 향하게 하여 가슴 위로 케틀벨을 잡습니다.  <br>2.팔을 구부려 케틀벨을 운동하는 팔의 반대쪽 어깨 상단까지 닿게 합니다.  <br>3.시작 위치로 돌아가서 반복하세요.' , '<iframe width="853" height="480"  src="https://www.youtube.com/embed/ADSscOmWwmY" title="kettlebell male tatepress front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10009,'케이블 푸시 다운' , '팔' , ' 1. 어깨와 팔꿈치의 각도는 수직으로 고정하고 팔꿈치는 고정합니다.  <br>2. 가동범위는 전완근이 평행이 되도록 만들어주시면 됩니다.  <br>3. 팔꿈치를 최대한 다 펴서 수축을 하게 합니다.  <br>4. 이완시 무게의 저항을 느끼며 템포에 맞게 이완 자세로 돌아와주시면 됩니다.' , '<iframe width="853" height="480" src="https://www.youtube.com/embed/_eb4RdNXS8Y" title="How to do Cable Push Downs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(10010, '딥스' , '팔', '  1. 평행봉을 두 손으로 단단히 쥐어 잡는다. 상체는 앞으로 약간 숙이고 숨을 들이쉬면서 천천히 몸을 내린다.  <br>2.가슴 운동의 효과를 가지고 있는 딥스라면 위의 딥스 자세를 정확하게 익히는 것이 적합하지만, 삼두근 운동의 효과를 보고 싶을 경우 팔꿈치의 각도를 90도로 제한하도록 한다.' , '<iframe width="853" height="480" src="https://www.youtube.com/embed/e0f2WOY6jQY" title="Front Dips" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');

-- 등운동
insert into exercise   values(20001 , '풀업' ,'등' ,'1 .팔과 어깨를 완전히 펴고 오버핸드 그립으로 바를 잡습니다.  <br>2.턱이 바 위에 올 때까지 몸을 위로 당깁니다.  <br>3.몸을 다시 시작 위치로 내립니다.' , '<iframe width="853" height="480"  src="https://www.youtube.com/embed/0h4-Zba_Pkk" title="Pull Up Front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20002, '커틀벨 숄더 익스텐션', '등', ' 1.발을 어깨 너비로 벌리고 서서 엉덩이를 최대한 편안하게 구부립니다. 안정성을 위해 반대쪽 손을 같은 쪽 허벅지에 놓습니다. <br>2.한 손에는 케틀벨을 들고 똑바로 무장한 채 바닥을 향하게 합니다. <br>3.팔을 곧게 펴고 케틀벨을 뒤로 최대한 편안하게 휘두르세요. <br>4.시작 위치로 돌아가서 반복하세요.' , '<iframe width="853" height="480"  src="https://www.youtube.com/embed/jtFC5E0GCdQ" title="kettlebell male shoulderextension front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20003, '바벨 벤트 오버 로우' , '등', ' 1 .어깨 너비로 회내 또는 회외 그립으로 바벨을 잡습니다.2 .등을 편평하게 유지하면서 엉덩이를 앞으로 구부립니다.  <br>3. 체중을 상복부쪽으로 당깁니다. 4 .통제된 방식으로 무게를 낮추고 반복하십시오.' , '<iframe width="470" height="835"  src="https://www.youtube.com/embed/wWYKY-GL9FQ" title="벤트 오버 바벨 로우(Bent Over Barbell Row) 헬린이를 위한 20초 포인트 영상" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20004, '덤벨 레니게이드 로우중급', '등', ' 1.양손에 덤벨을 들고 플랭크 자세로 시작하세요. 발은 어깨 너비로 벌려야 하며 손은 손바닥이 서로 마주보게 하여 덤벨 위에 놓아야 합니다. <br>2.이 시작 위치에서 하나의 덤벨을 가슴쪽으로 로우하고 팔꿈치를 몸에 가깝게 유지하고 코어를 움직입니다. <br>3.천천히 덤벨을 다시 시작 위치로 내리고 반대쪽도 반복합니다. <br>4.동작 내내 몸을 곧게 유지하고 엉덩이를 수평으로 유지하세요.','<iframe width="1280" height="720"  src="https://www.youtube.com/embed/KuyfwQcLiuU" title="덤벨 레니게이드 로우" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20005, '케이블 풀오버' ,'등', ' 1.케이블은 기계 상단까지 배치되어야 합니다.  <br>2.엉덩이가 약간 앞으로 기울어진 위치로 다시 밀어 넣으세요.  <br>3.팔꿈치가 아닌 어깨로 동작을 시작하세요. 아래쪽 허벅지를 통해 부착물을 당기려고 한다고 상상해 보세요.' , '<iframe width="1280" height="720"  src="https://www.youtube.com/embed/F8b9LUfrmSs" title="cable male pullover side" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20006, '바벨 랜드마인 로우중급 ' ,'등' ,' 1. 바벨을 놓고 발을 어깨 너비로 벌리고 바벨을 바라보고 서세요.  <br>2.중립 그립으로 바벨 끝을 잡고 팔을 곧게 펴고 어깨를 편안하게 유지합니다.  <br>3.엉덩이와 무릎을 구부려 몸통이 바닥과 거의 평행이 될 때까지 낮추세요.  <br>4.바벨을 가슴쪽으로 당기면서 무게를 올리면서 견갑골을 함께 조이십시오. ' ,'<iframe width="1280" height="720"  src="https://www.youtube.com/embed/gjaOVmUzZ5Y" title="Landmine Press 랜드마인 프레스 / Landmine Row 랜드마인 로우" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20007, '덤벨 숄더 익스텐션' ,'등', ' 1. 발을 어깨너비로 벌리고 양손에 덤벨을 들고 시작하세요.  <br>2.손바닥이 앞을 향하고 팔꿈치가 약간 구부러진 상태에서 덤벨을 옆으로 가져옵니다.  <br>3.동작 내내 코어에 힘을 주고 등을 곧게 펴십시오.' , '<iframe width="470" height="835"  src="https://www.youtube.com/embed/hcp5tnX89N0" title="어깨운동 덤벨숄더프레스 기본자세" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20008,'데드 리프트' , '등' , ' 1.무릎을 펴주면서, 바가 허벅지를 지날 때 엉덩이를 당겨서 허리를 펴준다.   <br>2.마지막 과정에서는 가슴을 내밀며 견갑골을 뒤로 살짝 빼준다. 3모든 과정에서 바는 항상 몸에 최대한 가까이 붙인다.  <br>4.다시 천천히 올릴 때와 같은 자세로 바를 바닥에 내려놓는다. <br>5.먼저 엉덩이를 뒤로 빼주면서, 바가 허벅지를 지날 때 쯤 무릎을 구부려준다.' , ' <iframe width="470" height="835" src="https://www.youtube.com/embed/GsG7Isc_db0" title="루마니안 데드리프트 (헬스 입문자를 위한 20초 포인트 영상)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20009, '랫풀 다운', '등' , ' 1. 기구에 앉아 바를 어깨보다 넓게 잡는다  <br>2.가슴을 펴줌과 동시에 견겹골을 모아주면서 바를 쇄골로 당긴다.' , '<iframe width="470" height="835"  src="https://www.youtube.com/embed/NqNwl1q41Kk" title="&quot;렛 풀 다운&quot; (Lat Pull Down) 자세 꿀팁 헬린이가 꼭 봐야할 숏츠!" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(20010, '시티드 케이블 로우' , '등' ,'  1. 다리를 펴서 발판에 댈수 있도록 길게 뻗어서 의자에 앉고 적당한 간격을 두고 발을 발판에 대준다.  <br>2.복부쪽 하단 위치쯤으로 케이블을 당긴다.' , '<iframe width="470" height="835" src="https://www.youtube.com/embed/Mdn2eVMRS_4" title="케이블 시티드 로우 (Cable Seated Row) 영상 20초 핵심 포인트" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' );

--어깨 운동
insert into exercise   values(30001, '케이블 오버헤드 프레스' , '어깨' , ' 1. 장비 바닥에 케이블이 설정된 핸들 부착물을 사용하십시오. 등을 편평하게 유지하면서 똑바로 서십시오. 시작 위치는 손바닥이 앞을 향하게 합니다.  <br>2.팔꿈치와 어깨를 모두 사용하여 웨이트를 머리 위로 직접 누르십시오.' , '<iframe width="1280" height="720"  src="https://www.youtube.com/embed/xuJnzODpzng" title="cable male ohp front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30002, '케틀벨 롱 레버 래터럴 레이즈' , '어깨' , ' 1. 발을 어깨 너비로 벌리고 서서 한 손으로 케틀벨을 잡고 옆으로 눕습니다.  <br>2.팔을 쭉 편 상태에서 케틀벨을 몸에서 머리 높이까지 위아래로 휘두르며 케틀벨을 단단히 잡고 손에서 위치가 바뀌지 않도록 합니다.  <br>3.시작 위치로 돌아가서 반복하세요.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/8y3iz93y9u0" title="kettlebell male longleverlateralraise front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30003, '케틀벨 싱글 암 리어 델트 플라이' , '어깨' , ' 1. 두 발을 어깨 너비로 벌리고 서서 양손으로 허벅지 앞에 케틀벨을 잡습니다.  <br>2.엉덩이를 앞으로 구부려 케틀벨을 바닥으로 가져가는 동시에 무릎을 살짝 구부려 등을 곧게 유지합니다.  <br>3.한 팔을 뒤로 가져와 이 팔을 등에 얹습니다. 다른 팔로 케틀벨을 바닥에 가깝게 팔 길이만큼 잡습니다.  <br>4.케틀벨을 몸 옆쪽으로 휘두른 다음 중앙으로 돌아옵니다. 반복합니다.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/tnlr_-FLqsQ" title="kettlebell male sareardeltfly front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30004, '높은 파이크 어깨 으쓱' , '어깨' , ' 1. 벤치나 의자 같은 물건을 사용하여 발을 높이세요.  <br>2.팔꿈치를 고정한 상태에서 천천히 몸(견갑골)을 내립니다(이것이 핵심입니다).  <br>3.천천히 몸을 일으켜 시작 자세로 돌아옵니다.' , '<iframe  width="1280" height="720"  src="https://www.youtube.com/embed/cCAJ4yTOUok" title="bodyweight male pikeshrug front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30005,'케이블 리어 델트 플라이' , '어깨' , ' 1. 핸들 부착물을 사용하거나 부착물을 전혀 사용하지 마십시오. 케이블은 위쪽으로 설정되어야 합니다.  <br>2.작업용 암의 반대쪽에서 나오는 케이블을 사용하여 몇 걸음 떨어진 곳으로 걸어가십시오 . <br>3.거기에서 어깨는 수평으로 외전 및 내전되어야 하며, 팔꿈치는 고정된 위치에 있어야 합니다.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/aF62FpXWqBc" title="cable male reardeltfly side" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30006, '밴드 풀 어파트' , '어깨' , ' 1.어깨 너비 그립으로 밴드를 잡습니다. 팔을 바로 앞으로 향하게 하세요.  <br>2.밴드가 가슴에 닿을 때까지 견갑골과 어깨 관절을 끌어당깁니다.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/6N8PLufuOAo" title="band male pullapart front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30007,'푸쉬 프레스' , '어깨' , ' 1.양손에 덤벨을 들고 오버핸드 그립으로 약 15~30도 높이의 경사 벤치에 눕습니다.  <br>2.팔꿈치를 구부린 채 팔을 어깨 높이까지 올리고 동작이 끝나면 잠시 멈춥니다.  <br>3.천천히 팔을 다시 시작 위치로 내립니다.', '<iframe width="363" height="645" src="https://www.youtube.com/embed/1HhMAvo9zTg" title="사이드 레터럴 레이즈! 승모근 개입 없는 자세 완벽 정리!" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30008, '밴드 페이스 풀' , '어깨' , ' 1.밴드를 눈높이에 고정하세요. 밴드가 팽팽해질 때까지 몇 걸음 떨어져 있습니다.  <br>2. 양손으로 오버핸드 그립을 사용합니다. 밴드를 콧대까지 당겨 팔꿈치를 바깥쪽으로 벌리세요.' ,'<iframe width="1280" height="720" src="https://www.youtube.com/embed/g1gJrtw8wAM" title="band male facepull front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30009, '높은 파이크 프레스' , '어깨' , ' 1.벤치나 물건을 사용하여 발을 높이세요.  <br>2. 팔꿈치를 구부려 머리를 바닥쪽으로 내립니다.  <br>3. 손을 밀고 시작 파이크 위치로 돌아갑니다.  <br>4.반복하세요.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/xxWbfDg9oS0" title="bodyweight male pikepushup front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(30010, '시티드 바벨 숄더 프레스' , '어깨', ' 1. 벤치에 앉아 허리신전을 시켜주고 요추의 안정화를 위해 복압을 잡아 코어를 유지해줍니다.  <br>2.그립의 너비는 팔꿈치가 수직이 되게 잡아줍니다.  <br>3. 움직임은 발꿈치가 견봉(어깨선)보다 아래에서 지가해서 자신의 손 한 뼘 정도로 위아래 움직여줍니다.  <br>4. 덤벨 or 바벨 선택적으로 중량을 선택해 진행해줍니다.', '<iframe width="470" height="835" src="https://www.youtube.com/embed/hrbjzJzCJx4" title="시티드 바벨 숄더 프레스 (헬스 입문자를 위한 20초 포인트 영상)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');


--가슴 운동
insert into exercise   values(40001, '바벨 벤치 프레스' , '가슴' , ' 1.발을 바닥에 대고 벤치에 평평하게 눕습니다. 팔을 곧게 펴서 바를 푼다.  <br>2. 바를 가슴 중앙까지 내립니다.  <br>3. 팔꿈치가 잠길 때까지 바를 올리십시오.' , '<iframe width="470" height="835" src="https://www.youtube.com/embed/nt9ghRd-Otg" title="1분 만에 알아보는 벤치프레스 자세!" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(40002,'케틀벨 워크오버 푸쉬업', '가슴' , ' 1.발을 넓게 벌리고 한 손으로 케틀벨을 얹은 프레스 업 자세에서 시작하여 몸을 곧게 유지하면서 가슴을 땅쪽으로 낮추고 시작 위치로 돌아오는 풀 프레스 업을 완료합니다.  <br>2.케틀벨 위에서 손을 바꿔 손을 원래 어깨 아래 케틀벨 위에 놓고 또 다른 프레스 업을 완료합니다.  <br>3.반복합니다.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/foV98ufteFM" title="kettlebell male walkover pushup front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(40003,'바벨 라센 벤치 프레스' , '가슴' , '  1.다리를 올린 상태에서 벤치 프레스 자세로 시작하세요. 무릎을 약간 구부린 상태로 유지하십시오.  <br>2.바를 풀고 담당자를 시작하십시오.  <br>3.바를 몸통으로 가져와 흉곽을 두드린 후 천장을 다시 누르십시오.' , '<iframe width="470" height="835" src="https://www.youtube.com/embed/M_5CQOjjN3s" title="라슨 프레스(Larsen Press), 벤치프레스 변형" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(40004, '비트루비안 벤치 프레스' , '가슴' , ' 1.평평한 벤치에 눕습니다.  <br>2.팔꿈치를 살짝 구부리고 핸들을 천장 쪽으로 누릅니다.' , '');
insert into exercise   values(40005, '케틀벨 체스트 프레스(싱글)' , '가슴' , ' 1.무릎을 구부리고 발을 바닥에 단단히 고정한 채 바닥에 누워서 양손으로 케틀벨을 가슴에 잡습니다.  <br>2.팔을 완전히 펴고 팔꿈치가 고정될 때까지 케틀벨을 들어 올리세요.  <br>3. 케틀벨을 시작 위치로 낮추고 반복하세요.' ,'<iframe width="1280" height="720" src="https://www.youtube.com/embed/15CIJwGNVjU" title="kettlebell male chest press front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(40006,'케틀벨 싱글 암 체스트 플라이' , '가슴' ,' 1.무릎을 구부리고 발을 바닥에 단단히 고정한 채 바닥에 눕고, 팔은 몸 옆에 둡니다.  <br>2.한 손에 케틀벨을 잡고 팔꿈치를 약간 구부린 채 팔을 완전히 뻗은 상태에서 팔뚝이 위쪽을 향하게 한 상태에서 케틀벨을 가슴 위로 들어 올리세요.  <br>3.케틀벨을 시작 위치로 낮추고 반복하세요.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/bmEIpJjogLg" title="kettlebell male SA chest fly front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(40007, '케틀벨 싱글 암 프레스' ,'가슴' , ' 1.무릎을 구부리고 발을 바닥에 단단히 고정한 채 바닥에 누워 한쪽 팔을 몸 옆에 놓습니다.  <br>2.다른 팔을 사용하여 케틀벨을 어깨 바로 위쪽으로 팔 길이만큼 잡습니다.  <br>3.팔 윗부분부터 팔꿈치까지 바닥에 닿을 때까지 팔을 내립니다.  <br>4.시작 위치로 돌아갑니다.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/OaqpmVrrz8E" title="kettlebell male sa chest press front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(40008,'밴드 싱글 암 펙 플라이', '가슴' , ' 1.어깨 높이 정도의 앵커 지점에 밴드를 부착합니다. 밴드가 팽팽해질 때까지 몇 걸음 떨어져 있습니다.  <br>2.어깨 관절을 펴고 가슴 근육이 수축되는 느낌이 들 때까지 팔을 몸 위로 가져옵니다.' ,'<iframe width="1280" height="720" src="https://www.youtube.com/embed/6jlYWHPw6_0" title="band male chestfly front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' );
insert into exercise   values(40009,'밴드 싱글 암 체스트 프레스' , '가슴' , ' 1.어깨 높이 정도의 앵커 지점에 밴드를 부착합니다. 밴드가 팽팽해질 때까지 몇 걸음 떨어져 있습니다.  <br>2.팔이 완전히 펴질 때까지 어깨 관절과 팔꿈치를 몸 전체로 펴십시오.' ,'<iframe width="1280" height="720" src="https://www.youtube.com/embed/TRbS_324avU" title="band male chestpress front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(40010,'푸쉬업' , '가슴' , ' 1.손은 어깨 바로 아래 바닥에 단단히 놓으십시오.  <br>2.허리를 펴서 몸 전체가 일직선이 되도록 하고 천천히 몸을 낮춥니다.  <br>3.견갑골을 앞뒤로 당기고 팔꿈치를 몸에 가깝게 유지합니다.  <br>4.숨을 내쉬면서 시작 위치로 돌아갑니다.' , '<iframe width="470" height="835" src="https://www.youtube.com/embed/hYMe9tkCs24" title="20초만에 본전 뽑는 푸쉬업 꿀팁" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');

--하체
insert into exercise   values(50001 , '바벨 스티프 레그 데드리프트' , '하체' , ' 1.발을 어깨 너비만큼 벌리고 정강이에 바벨을 들고 서세요.  <br>2.엉덩이를 앞으로 구부리고 무릎을 최대한 펴십시오.  <br>3.바벨을 잡고 등을 곧게 유지하면서 엉덩이를 펴세요.  <br>4.선 자세에서 통제된 방식으로 체중을 내립니다. <br>5. 이동성에 따라 무게를 바닥으로 낮추거나 바닥에 닿기 전에 내릴 수 있습니다.' , '<iframe width="470" height="835" src="https://www.youtube.com/embed/ejcVS2ouYY8" title="덤벨 스티프 데드리프트 (헬스 입문자를 위한 20초 영상)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50002 , '케틀벨 데드리프트(싱글)' , '하체' , ' 1.두 발을 어깨 너비로 벌리고 서서 양손으로 허벅지 앞에 케틀벨을 잡습니다.  <br>2.엉덩이를 앞으로 구부려 케틀벨을 바닥으로 가져가는 동시에 무릎을 살짝 구부려 등을 곧게 유지합니다.  <br>3.선 자세로 돌아가서 반복하세요.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/Cenw3VFlmWc" title="kettlebell male deadlift front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50003 , '케틀벨 스윙' , '하체' , ' 1.어깨 너비보다 약간 넓게 발을 벌리고 서서 다리 사이에 케틀벨을 잡고 무릎을 약간 구부립니다.  <br>2.등을 곧게 펴고 케틀벨이 가슴과 수평이 될 때까지 케틀벨을 위쪽으로 휘두른 후 조심스럽게 내립니다.  <br>3.반복합니다.' ,'<iframe width="1280" height="720" src="https://www.youtube.com/embed/VdgDAbEnNLg" title="kettlebell male kb swing front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50004, '굿모닝 엑서사이즈' , '하체' , ' 1.무릎을 약간 구부린 채 발을 어깨 너비보다 조금 더 벌리고 서세요. 머리 뒤쪽에 손을 대십시오.  <br>2.등을 곧게 펴고 엉덩이를 회전시켜 어깨가 바닥을 향해 내려가도록 하세요. 가슴이 바닥과 평행할 때 멈추세요.' , '<iframe width="470" height="835" src="https://www.youtube.com/embed/gQ4FSIx6Oac" title="✅굿모닝 킬포 아직 모른다면? ✅20초PT쌤🔥 굿모닝 엑서사이즈 꿀팁 알려드려요 #굿모닝운동 #바벨굿모닝 #굿모닝엑서사이즈 #운동꿀팁 #애플힙 #뒤태운동 #뒤태미인 #햄스트링" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50005 , '케틀벨 스태거드 데드리프트(싱글)', '하체' , ' 1.발을 어깨 너비로 벌리고 서서 한 발을 뒤로 옮깁니다. 허벅지 앞에서 케틀벨을 양손으로 잡습니다.  <br>2.무릎을 살짝 구부리고 등을 곧게 유지하면서 엉덩이를 앞으로 구부려 케틀벨을 바닥에 닿게 합니다. <br>3.똑바로 선 자세로 돌아가서 반복하세요.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/sjeoL90gh-A" title="kettlebell male staggereddeadlift front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50006, '케이블 풀스루' , '하체' , ' 1.이 운동은 로프 부착이 가장 효과적이지만 무엇이든 할 수 있습니다. 부착물은 기계 바닥에 설치해야 합니다. <br>2.케이블 머신을 바라보지 않고 케이블 자체를 걸치고 부착물을 잡습니다. 몇 걸음만 걸어가세요. <br>3.등을 편평하게 유지하고 무릎을 대부분 펴면서 엉덩이를 부러뜨립니다. <br>4.다시 선 자세로 돌아올 때까지 엉덩이를 앞으로 밀어냅니다.' ,'<iframe width="1280" height="720" src="https://www.youtube.com/embed/XkbWQxxop24" title="cable male pullthrough side" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' );
insert into exercise   values(50007, '케이블 햄스트링 컬' , '하체' , ' 1.케이블이 장비 바닥까지 끝까지 연결된 발목 부착 장치를 사용하십시오. <br>2.똑바로 서거나 약간 앞으로 구부려 보십시오.  <br>3.무릎을 구부리고 발목을 뒤로 똑바로 당깁니다.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/UYagDx37xbA" title="cable male hamstringcurl side" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50008, '바벨 하이바 굿모닝' , '하체' , ' 1.바를 트랩 위에 놓습니다. 바가 경추를 파고 들지 않도록 패드가 필요할 수 있습니다. <br>2.엉덩이를 똑바로 뒤로 밀어보세요. 무릎은 거의 펴진 상태를 유지해야 합니다(부드러운 무릎을 생각해 보세요). 또한 반드시 <br>3.햄스트링이 스트레칭되는 듯한 느낌이 드는지 찾아보세요. 늘어나는 느낌은 척추를 둥글게 하지 않고 가동 범위의 끝에 가까워졌을 가능성이 있음을 의미합니다. <br>4.스트레칭이 느껴지면 서 있는 자세가 될 때까지 엉덩이를 앞으로 밀어냅니다.' , '<iframe width="1280" height="720" src="https://www.youtube.com/embed/5jFBLa6jYdM" title="male bb front highbargm" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50009, '리베이트' , '하체' , '  1.네 발로 엎드려 어깨 아래에 손을, 엉덩이 아래에 무릎을 위치시킵니다. <br>2.한쪽 다리를 뒤로 젖히고 둔근을 조입니다. <br>3.무릎을 구부리고 다리를 낮추면서 천천히 시작 위치로 돌아갑니다. <br>4.다리를 전환하세요. 반복합니다.' ,'<iframe width="1280" height="720" src="https://www.youtube.com/embed/qUMeeIxJLwU" title="bodyweight male glutekickback front" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');
insert into exercise   values(50010, '바벨 스쿼트' , '하체' , ' 1.발을 어깨너비로 벌리고 서세요. 등의 자연스러운 아치를 유지하고 견갑골을 조이고 가슴을 들어 올리십시오.  <br>2. 바를 어깨 너머로 잡고 등 위쪽으로 받치세요. 다리를 곧게 펴서 바를 풀고 한 발 뒤로 물러서십시오.  <br>3. 엉덩이가 무릎 아래에 올 때까지 등의 형태를 바꾸지 않고 무게를 낮추면서 무릎을 구부립니다.  <br>4. 바를 다시 시작 위치로 올리고, 다리로 들어올린 후 숨을 내쉬세요.' , '<iframe width="470" height="835" src="https://www.youtube.com/embed/ziV66bpMDtg" title="바벨 스쿼트(Barbell Squat) 헬린이를 위한 20초 포인트 영상" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>');




--select * from member_ex_set order by day_ex_set desc;
--select board_No, BOARD_TITLE from board order by board_No desc;

INSERT INTO BOARD VALUES (board_no_seq.NEXTVAL,'ghwnswkd123@naver.com', '연습용 게시판 제목', '연습용 게시판 내용@@','20230921', 0, '연습용 댓글', 1,0);
INSERT INTO BOARD VALUES (board_no_seq.NEXTVAL,'ghwnswkd123@naver.com', '연습용 게시판 제목2', '연습용 게시판 내용@@','20230921', 0, '연습용 댓글', 1,0);
--select board_no , member_id,Board_title,board_content,TO_CHAR(board_date,'YYYY-MM-DD'),board_Count,bref,bstep,bleveL from board order by board_No desc;

INSERT INTO NOTICE VALUES (notice_no_seq.NEXTVAL, '운동', '공지사항 제목','공지사항 내용물', '77@77.77','20231004',0);


 --영양소(초보자)
insert into nutrient VALUES (1,'단백질','','','1');
insert into nutrient VALUES (2,'탄수화물','','','1');
insert into nutrient VALUES (3,'종합비타민','','','1');
insert into nutrient VALUES (4,'유산균(프로바이오틱스)','','','1');
insert into nutrient VALUES (5,'섬유질','','','1');
insert into nutrient VALUES (6,'글루타민','','','1');
--영양소(숙련자)
insert into nutrient VALUES (7,'카페인(집중력, 유산소 능력 증가)','','','2');
insert into nutrient VALUES (8,'크레아틴(웨이트 능력 증가)','','','2');
insert into nutrient VALUES (9,'베타알라닌(웨이트 능력 증가)','','','2');
insert into nutrient VALUES (10,'Nitrate(중강도 운동능력 증가)','','','2');
insert into nutrient VALUES (11,'Sodium Bicarbonate(웨이트 능력 증가)','','','2');
insert into nutrient VALUES (12,'스포츠 드링크(에너지, 수분공급)','','','2');
--보충제
 --단백질1
INSERT INTO suplement VALUES (1,'옵티멈 골드 스탠다드 웨이(WPI+WPC)','https://kr.iherb.com/pr/optimum-nutrition-gold-standard-100-whey-double-rich-chocolate-5-lbs-2-27-kg/27509',1 );
INSERT INTO suplement VALUES (2,'Allmax 웨이프로틴 (WPC+WPI)','https://kr.iherb.com/pr/allmax-classic-allwhey-100-whey-protein-chocolate-5-lbs-2-27-kg/69100',1);
INSERT INTO suplement VALUES (3,'옵티멈 골드스탠다드 웨이(WPI+WPC)','https://www.coupang.com/vp/products/6424463926?itemId=13837679944&vendorItemId=3180840444&src=1139000&spec=10799999&addtag=400&ctag=6424463926&lptag=AF7910856&itime=20230922123020&pageType=PRODUCT&pageValue=6424463926&wPcid=11963655808335908086931&wRef=&wTime=20230922123020&redirect=landing&traceid=V0-181-0204c0f24c9440c6&mcid=098574f67ca042f6852c2b3f4e3ba6cf&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',1);
INSERT INTO suplement VALUES (4,'컴뱃 100%(WPI+WPC)','https://www.coupang.com/vp/products/6731349444?itemId=3071491018&vendorItemId=4041827021&src=1139000&spec=10799999&addtag=400&ctag=6731349444&lptag=AF7910856&itime=20230922123035&pageType=PRODUCT&pageValue=6731349444&wPcid=11963655808335908086931&wRef=&wTime=20230922123035&redirect=landing&traceid=V0-181-c7a4d267bbb9b282&mcid=d09a38ad8feb4baa8fe3d0da00302706&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',1);
INSERT INTO suplement VALUES (5,'임팩트 웨이프로틴(WPC)','https://www.myprotein.co.kr/sports-nutrition/impact-whey-protein/10530943.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=22450_1695353900_98159a33c55eef4aeec877afc66890cd',1);
INSERT INTO suplement VALUES (6,'임팩트 웨이 아이솔레이트(WPI)','https://www.myprotein.co.kr/sports-nutrition/impact-whey-isolate/10530911.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=22450_1695353957_b63ea060631ee056b946229878262519',1);
INSERT INTO suplement VALUES (7,'신타6(WPC+WPI), 맛 위주 제품)','https://www.coupang.com/vp/products/6573830453?itemId=99053681&vendorItemId=3180840758&src=1139000&spec=10799999&addtag=400&ctag=6573830453&lptag=AF7910856&itime=20230922123939&pageType=PRODUCT&pageValue=6573830453&wPcid=11963655808335908086931&wRef=&wTime=20230922123939&redirect=landing&traceid=V0-181-b7758b3c4e64c943&mcid=5f991a1c8a0145e0aa4e9dacf222dd9e&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',1);
INSERT INTO suplement VALUES (8,'EVL Stacked','https://www.coupang.com/vp/products/6422282284?itemId=18367904981&vendorItemId=85511488783&src=1139000&spec=10799999&addtag=400&ctag=6422282284&lptag=AF7910856&itime=20230922124014&pageType=PRODUCT&pageValue=6422282284&wPcid=11963655808335908086931&wRef=&wTime=20230922124014&redirect=landing&traceid=V0-181-1b841015494d2887&mcid=ed430fbf3c7e4454b66cbc1d5c891fb1&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',1);
INSERT INTO suplement VALUES (9,'EVL 100% Whey','https://www.coupang.com/vp/products/6422282333?itemId=13823103047&vendorItemId=81073326157&src=1139000&spec=10799999&addtag=400&ctag=6422282333&lptag=AF7910856&itime=20230922124139&pageType=PRODUCT&pageValue=6422282333&wPcid=11963655808335908086931&wRef=&wTime=20230922124139&redirect=landing&traceid=V0-181-64380bec0ffd71ad&mcid=d9e8c01ad82b497289131ac9d8aa892b&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',1);
----탄수화물2
INSERT INTO suplement VALUES(10,'청년곡물 귀리가루 3kg 17,300원','https://www.coupang.com/vp/products/171730878?vendorItemId=4242511760&src=1139000&spec=10799999&addtag=400&ctag=171730878&lptag=AF7910856&itime=20230922124604&pageType=PRODUCT&pageValue=171730878&wPcid=11963655808335908086931&wRef=&wTime=20230922124604&redirect=landing&traceid=V0-181-d9af9bf788a73fe3&mcid=118420b281fa4567ac1560e9ce4aa8cf&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',2);
INSERT INTO suplement VALUES(11,'인스턴트 오트 ','https://www.myprotein.co.kr/sports-nutrition/100-instant-oats/10529296.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695359474_3cd5329c2471289f7585f789db8cbdee',2);
--종합비타민3
INSERT INTO suplement VALUES(12,'투퍼데이 캡슐','https://kr.iherb.com/pr/life-extension-two-per-day-multivitamin-60-capsules/86456',3);
INSERT INTO suplement VALUES(13,'투퍼데이 태블릿','https://kr.iherb.com/pr/life-extension-two-per-day-multivitamin-120-tablets/86454',3);
INSERT INTO suplement VALUES(14,'알파맨','https://www.myprotein.co.kr/sports-nutrition/alpha-men-multivitamin-tablets/10530421.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695359652_f9ecb193c996d168a2ec8ee8e994feca',3);
INSERT INTO suplement VALUES(15,'Thorne Research 종합비타민','https://kr.iherb.com/pr/thorne-basic-nutrients-2-day-60-capsules/85476',3);
INSERT INTO suplement VALUES(16,'쏜리서치 종합비타민','https://www.coupang.com/vp/products/433053?itemId=1180358&vendorItemId=3191206506&src=1139000&spec=10799999&addtag=400&ctag=433053&lptag=AF7910856&itime=20230922141638&pageType=PRODUCT&pageValue=433053&wPcid=11963655808335908086931&wRef=&wTime=20230922141638&redirect=landing&traceid=V0-181-51da413cc001c268&mcid=700d3ed719374b249426162963d1b779&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=',3);
INSERT INTO suplement VALUES(17,'얼라이브','https://www.coupang.com/vp/products/1152619585?itemId=2127383548&vendorItemId=70125946615&src=1139000&spec=10799999&addtag=400&ctag=1152619585&lptag=AF7910856&itime=20230922141715&pageType=PRODUCT&pageValue=1152619585&wPcid=11963655808335908086931&wRef=&wTime=20230922141715&redirect=landing&traceid=V0-181-b565f5bf26622b78&mcid=e09f8d203e7943c9bd837437b1140173&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',3);
--유산균(프로바이오틱스)4
INSERT INTO suplement VALUES(18,'캘리포니아골드 50억','https://kr.iherb.com/pr/california-gold-nutrition-lactobif-5-probiotics-5-billion-cfu-60-veggie-capsules/64006',4);
INSERT INTO suplement VALUES(19,'자로우 50억','https://kr.iherb.com/pr/jarrow-formulas-jarro-dophilus-eps-5-billion-120-veggie-caps/7006',4);
INSERT INTO suplement VALUES(20,'자로우 50억','https://www.coupang.com/vp/products/416189?itemId=277809413&vendorItemId=3179568952&src=1139000&spec=10799999&addtag=400&ctag=416189&lptag=AF7910856&itime=20230922142014&pageType=PRODUCT&pageValue=416189&wPcid=11963655808335908086931&wRef=&wTime=20230922142014&redirect=landing&traceid=V0-181-0a308c213d5fd665&mcid=289de57f9ab345fcb4bf114197b17372&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',4);
INSERT INTO suplement VALUES(21,'프로바이오틱스 150억','https://www.myprotein.co.kr/sports-nutrition/daily-probiotic/11897338.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695360053_e4969aad974503a8e1acff0a8d73ef89',4);
INSERT INTO suplement VALUES(22,'자로우 도필러스 (쿠팡, 국내 로켓배송)','https://www.coupang.com/vp/products/1528879?itemId=6662522&vendorItemId=3464692298&src=1139000&spec=10799999&addtag=400&ctag=1528879&lptag=AF7910856&itime=20230922142132&pageType=PRODUCT&pageValue=1528879&wPcid=11963655808335908086931&wRef=&wTime=20230922142132&redirect=landing&traceid=V0-181-8f3e5441fa09d7bc&mcid=f22c4b2f2f1b43c18b26fd311ea8817e&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',4);
--섬유질 5
INSERT INTO suplement VALUES(23,'이눌린','https://www.coupang.com/vp/products/30606?itemId=73304&vendorItemId=3086191674&src=1139000&spec=10799999&addtag=400&ctag=30606&lptag=AF7910856&itime=20230922142249&pageType=PRODUCT&pageValue=30606&wPcid=11963655808335908086931&wRef=&wTime=20230922142249&redirect=landing&traceid=V0-181-399055c646def9eb&mcid=02d5fc9fee5a4f4397ebe54fbf32e085&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',5);
INSERT INTO suplement VALUES(24,'복함섬유질','https://www.coupang.com/vp/products/420194?itemId=1103903&vendorItemId=3181031489&src=1139000&spec=10799999&addtag=400&ctag=420194&lptag=AF7910856&itime=20230922142409&pageType=PRODUCT&pageValue=420194&wPcid=11963655808335908086931&wRef=&wTime=20230922142409&redirect=landing&traceid=V0-181-bf07ab4af31ca34a&mcid=beb8b05e8f1945cb87fba040bbd706f8&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',5);
INSERT INTO suplement VALUES(25,'이눌린 순수분말','https://kr.iherb.com/pr/now-foods-certified-organic-inulin-prebiotic-pure-powder-8-oz-227-g/1100',5);
INSERT INTO suplement VALUES(26,'복함섬유질','https://kr.iherb.com/pr/jarrow-formulas-gentle-fibers-soluble-insoluble-fibers-powder-16-5-oz-468-g-discontinued-item/201',5);
INSERT INTO suplement VALUES(27,'이눌린 올리고당','https://www.myprotein.co.kr/sports-nutrition/100-inulin-powder/10530732.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695360364_6dc2c45eb9bac17640c4e92dd4bf2539',5);
--글루타민 6
INSERT INTO suplement VALUES(28,'글루타민 분말','https://kr.iherb.com/pr/california-gold-nutrition-l-glutamine-powder-ajipure-gluten-free-16-oz-454-g/71027',6);
INSERT INTO suplement VALUES(29,'글루타민 파우더 비건','https://www.coupang.com/vp/products/209304?itemId=2075029&vendorItemId=3088278048&src=1139000&spec=10799999&addtag=400&ctag=209304&lptag=AF7910856&itime=20230922142857&pageType=PRODUCT&pageValue=209304&wPcid=11963655808335908086931&wRef=&wTime=20230922142857&redirect=landing&traceid=V0-181-ad2bddec3da0a155&mcid=1c7398b7713542eeaa1c724c3a51682b&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',6);
INSERT INTO suplement VALUES(30,'글루타민 아미노산','https://www.myprotein.co.kr/sports-nutrition/l-glutamine-powder/10636931.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695360582_c13184395cf72b973883c4d46be9750a',6);
--카페인 7
INSERT INTO suplement VALUES(31,'GAT 카페인','https://kr.iherb.com/pr/gat-caffeine-metabolism-and-performance-100-tablets/71057',7);
INSERT INTO suplement VALUES(32,'Teacrine(느린 카페인)','https://www.coupang.com/vp/products/1221155033?itemId=2212003672&vendorItemId=70209793289&src=1139000&spec=10799999&addtag=400&ctag=1221155033&lptag=AF7910856&itime=20230922164111&pageType=PRODUCT&pageValue=1221155033&wPcid=11963655808335908086931&wRef=&wTime=20230922164111&redirect=landing&traceid=V0-181-1161d76a4f328d36&mcid=508b0122b9554dafae80c57f543cd481&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',7);
INSERT INTO suplement VALUES(33,'퓨어 카페인 200mg','https://www.myprotein.co.kr/sports-nutrition/pure-caffeine-tablets/10529801.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695368519_67d73fd2ec4c6053881c65ccfd7e2164',7);
--Sodium Bicarbonate(웨이트 능력 증가) 8
INSERT INTO suplement VALUES(34,'식소다','https://www.coupang.com/vp/products/101204658?itemId=308663781&vendorItemId=3760493721&src=1139000&spec=10799999&addtag=400&ctag=101204658&lptag=AF7910856&itime=20230922163331&pageType=PRODUCT&pageValue=101204658&wPcid=11963655808335908086931&wRef=&wTime=20230922163331&redirect=landing&traceid=V0-181-e359d2cc6ce43267&mcid=dbce41bceb094fe3b25b4340da5b0519&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',8);
--크레아틴(웨이트 능력 증가) 9
INSERT INTO suplement VALUES(35,'크레아틴(크레아퓨어)(추천제품)','https://www.myprotein.co.kr/sports-nutrition/creapure-creatine-powder/10529740.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695368605_f2f8c8c6d7095d04f51b00b4985db269',9);
INSERT INTO suplement VALUES(36,'크레아틴 Now food','https://www.coupang.com/vp/products/65092914?itemId=219966955&vendorItemId=3531348859&src=1139000&spec=10799999&addtag=400&ctag=65092914&lptag=AF7910856&itime=20230922164418&pageType=PRODUCT&pageValue=65092914&wPcid=11963655808335908086931&wRef=&wTime=20230922164418&redirect=landing&traceid=V0-181-d98d37a352dc2b27&mcid=58f1ab482e604cdfa00d80d95e92a434&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',9);
INSERT INTO suplement VALUES(37,'크레아틴 (AllMAX)','https://www.coupang.com/vp/products/211526931?vendorItemId=4503588269&src=1139000&spec=10799999&addtag=400&ctag=211526931&lptag=AF7910856&itime=20230922164445&pageType=PRODUCT&pageValue=211526931&wPcid=11963655808335908086931&wRef=&wTime=20230922164445&redirect=landing&traceid=V0-181-4b91612774083229&mcid=e6ac8e4a8f8948ed8490b4558e89391d&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',9);
--스포츠 드링크(에너지, 수분공급) 10
INSERT INTO suplement VALUES(38,'게토레이 1.5L 12개','https://www.coupang.com/vp/products/1650278?itemId=10099465&vendorItemId=3017121689&src=1139000&spec=10799999&addtag=400&ctag=1650278&lptag=AF7910856&itime=20230922164618&pageType=PRODUCT&pageValue=1650278&wPcid=11963655808335908086931&wRef=&wTime=20230922164618&redirect=landing&traceid=V0-181-146e6bf32c3f5ab0&mcid=362a702418044e5a934650616863aa91&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',10);
INSERT INTO suplement VALUES(39,'파워에이드 1.5L 12개','https://www.coupang.com/vp/products/1650248?itemId=5795123&vendorItemId=4043017735&src=1139000&spec=10799999&addtag=400&ctag=1650248&lptag=AF7910856&itime=20230922164653&pageType=PRODUCT&pageValue=1650248&wPcid=11963655808335908086931&wRef=&wTime=20230922164653&redirect=landing&traceid=V0-181-bce033d202011ec7&mcid=e2be9225ae9b4780982e4f01253525e8&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',10);
INSERT INTO suplement VALUES(40,'포카리스웨트 1.5L 12개','https://www.coupang.com/vp/products/1650776?itemId=999007&vendorItemId=3058671369&src=1139000&spec=10799999&addtag=400&ctag=1650776&lptag=AF7910856&itime=20230922164731&pageType=PRODUCT&pageValue=1650776&wPcid=11963655808335908086931&wRef=&wTime=20230922164731&redirect=landing&traceid=V0-181-2aac9d07526c5b55&mcid=07ffdbf271114518a8d60d213c79634c&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',10);
INSERT INTO suplement VALUES(41,'게토레이 파우더','https://www.coupang.com/vp/products/8043221?itemId=35188995&vendorItemId=4041819023&src=1139000&spec=10799999&addtag=400&ctag=8043221&lptag=AF7910856&itime=20230922164808&pageType=PRODUCT&pageValue=8043221&wPcid=11963655808335908086931&wRef=&wTime=20230922164808&redirect=landing&traceid=V0-181-8b23744133557f7e&mcid=1fee1761d309435aa5953550fb796c77&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',10);
INSERT INTO suplement VALUES(42,'게토레이 파우더 (대용량)','https://www.coupang.com/vp/products/1130600938?itemId=2098414197&vendorItemId=70097293127&src=1139000&spec=10799999&addtag=400&ctag=1130600938&lptag=AF7910856&itime=20230922164841&pageType=PRODUCT&pageValue=1130600938&wPcid=11963655808335908086931&wRef=&wTime=20230922164841&redirect=landing&traceid=V0-181-e5882885e665f0af&mcid=70e3c226bc66458ab40dd5dcd750d75e&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=',10);
--Nitrate(중강도 운동능력 증가) 11
INSERT INTO suplement VALUES(43,'Pump Mode 무맛','https://kr.iherb.com/pr/evlution-nutrition-pumpmode-non-stimulant-pump-accelerator-unflavored-4-44-oz-126-g/77320',11);
INSERT INTO suplement VALUES(44,'Pump Mode 포도맛','https://kr.iherb.com/pr/evlution-nutrition-pumpmode-non-stimulant-pump-accelerator-unflavored-4-44-oz-126-g/77320',11);
INSERT INTO suplement VALUES(45,'Pump Mode 무맛','https://www.coupang.com/vp/products/205187039?itemId=604042936&vendorItemId=4583172659&src=1139000&spec=10799999&addtag=400&ctag=205187039&lptag=AF7910856&itime=20230922170731&pageType=PRODUCT&pageValue=205187039&wPcid=11963655808335908086931&wRef=&wTime=20230922170731&redirect=landing&traceid=V0-181-4f399f8277677306&mcid=2c1f807261214a67a6e1ba2023be6394&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',11);
INSERT INTO suplement VALUES(46,'Pump Mode 블루라츠','https://www.coupang.com/vp/products/205187038?itemId=604042923&vendorItemId=4583172612&src=1139000&spec=10799999&addtag=400&ctag=205187038&lptag=AF7910856&itime=20230922170816&pageType=PRODUCT&pageValue=205187038&wPcid=11963655808335908086931&wRef=&wTime=20230922170816&redirect=landing&traceid=V0-181-a335862c21f87e50&mcid=80033af9087b43c5a237ec310766ea7b&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',11);
--베타알라닌(웨이트 능력 증가) 12
INSERT INTO suplement VALUES(47,'Now Foods 베타알라닌','https://kr.iherb.com/pr/now-foods-sports-beta-alanine-pure-powder-17-6-oz-500-g/10940',12);
INSERT INTO suplement VALUES(48,'프리마포스 베타알라닌','https://www.coupang.com/vp/products/1346776?itemId=5812375&vendorItemId=3259563401&src=1139000&spec=10799999&addtag=400&ctag=1346776&lptag=AF7910856&itime=20230922171706&pageType=PRODUCT&pageValue=1346776&wPcid=11963655808335908086931&wRef=&wTime=20230922171706&redirect=landing&traceid=V0-181-3345fb09a110b97f&mcid=247e1e222924407b86a2fb4b9eadcc60&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',12);
INSERT INTO suplement VALUES(49,'베타알라닌','https://www.myprotein.co.kr/sports-nutrition/beta-alanine-powder/10529809.html?autocomplete=productsuggestion&affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1695370664_9a16509ff2d755cd942f8278d480f92b',12);
INSERT INTO suplement VALUES(50,'Now 베타알라닌','https://www.coupang.com/vp/products/25110?itemId=63565&vendorItemId=3085691672&src=1139000&spec=10799999&addtag=400&ctag=25110&lptag=AF7910856&itime=20230922171831&pageType=PRODUCT&pageValue=25110&wPcid=11963655808335908086931&wRef=&wTime=20230922171831&redirect=landing&traceid=V0-181-4241ba6182004d6e&mcid=a99286919d7943989ab71a07936242dc&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=',12);

SELECT * FROM NUTRIENT;
COMMIT;
 
 
  
commit;

---
-- MEMBER_WEIGHT INSERT 시작
insert into MEMBER_WEIGHT (WEIGHT_DATE, MEMBER_ID, WEIGHT, MUSCLE_MASS, BODY_FAT_PET) values ('230904', 'ch@dml.com', 77, 36, 25);
insert into MEMBER_WEIGHT (WEIGHT_DATE, MEMBER_ID, WEIGHT, MUSCLE_MASS, BODY_FAT_PET) values ('230904', 'ch@dml.com', '230905', 77, 37, 27);
insert into MEMBER_WEIGHT (WEIGHT_DATE, MEMBER_ID, WEIGHT_DATE, WEIGHT, MUSCLE_MASS, BODY_FAT_PET) values ('230904', 'ch@dml.com', '230906', 77, 38, 29);
insert into member_weight (WEIGHT_DATE, MEMBER_ID, WEIGHT_DATE, WEIGHT, MUSCLE_MASS, BODY_FAT_PET) values ('230904', 'ch@dml.com', '230907', 77, 40, 30);
-- 체중입력
insert into MEMBER_WEIGHT (WEIGHT_DATE, MEMBER_ID, WEIGHT) values 
    ( '230908', 'ch@dml.com', 77);
-- 오류 발생시
update MEMBER_WEIGHT SET WEIGHT = 77
    where WEIGHT_DATE='230908' and  MEMBER_ID =  'ch@dml.com';
-- 근골격입력
insert into MEMBER_WEIGHT (WEIGHT_DATE, MEMBER_ID, MUSCLE_MASS, BODY_FAT_PET) values 
    ('230908', 'ch@dml.com', 42, 29);
-- 오류발생시
update MEMBER_WEIGHT set MUSCLE_MASS =42, BODY_FAT_PET = 29
    where WEIGHT_DATE = '230908' and MEMBER_ID = 'ch@dml.com';
commit;
desc MEMBER_WEIGHT;
--select * from MEMBER_WEIGHT;
-- 날짜클릭시 selectOne
select * from MEMBER_WEIGHT where MEMBER_ID = 'ch@dml.com' and WEIGHT_DATE = '230908';

-- member_weight 끝

--insert 끝
set define on;


select board_no_seq.nextval from dual;

CREATE SEQUENCE board_no_seq 
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

commit;
select * from replyboard;
	select * from replyboard where board_no=1 and rref=4 order by reply_no desc;
