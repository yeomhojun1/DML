DROP TABLE "FOOD";
DROP TABLE "FOOD_API";
DROP TABLE "DIET";
DROP TABLE "DAY_DIET";
DROP TABLE "MEMBER_WEIGHT";
DROP TABLE "MEMBER_EX_SET";
DROP TABLE "CALENDAR";
DROP TABLE "EXERCISE";
DROP TABLE "BOARD";
DROP TABLE "NOTICE";
DROP TABLE "ADMIN";
DROP TABLE "MEMBER";
DROP TABLE "USERS";

select * from member;

CREATE TABLE "USERS" (
	"USERNAME"	VARCHAR(100)		NOT NULL,
	"PASSWORD"	VARCHAR(80)		NOT NULL,
	"USER_ENABLED"	number	DEFAULT 1	NOT NULL,
	"AUTHORITIES"	varchar(20)		NOT NULL
);

COMMENT ON COLUMN "USERS"."USER_ENABLED" IS '기본값: 1, 나머지: 0';


CREATE TABLE "MEMBER" (
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"MNAME"	VARCHAR2(50)		NOT NULL,
	"MBIRTHDAY"	NUMBER		NULL,
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
	"ADMIN_ID"	VARCHAR(100)		NOT NULL,
	"ADMIN_PWD"	VARCHAR2(20)		NOT NULL,
	"ADMIN_NAME"	VARCHAR(20)		NOT NULL,
	"ADMIN_EMAIL"	VARCHAR(50)		NOT NULL
);


CREATE TABLE "NOTICE" (
	"NOTICE_NUMBER"	NUMBER		NOT NULL,
	"ADMIN_ID"	VARCHAR(20)		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(100)		NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"NOTICE_VIEW"	NUMBER		NOT NULL,
	"NOTICE_DATE"	DATE		NOT NULL
);


CREATE TABLE "BOARD" (
	"COMMENT_NUM"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR(100)		NOT NULL,
	"BOARD_TITLE"	VARCHAR(200)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR(1000)		NULL,
	"BOARD_COUNT"	NUMBER		NOT NULL,
	"BOARD_DATE"	DATE		NOT NULL
);


CREATE TABLE "EXERCISE" (
	"ECODE"	NUMBER		NOT NULL,
	"EX_NAME"	VARCHAR2(100)		NOT NULL,
	"PART"	VARCHAR2(30)		NOT NULL,
	"EPOSE"	VARCHAR2(2000)		NOT NULL,
	"EPOSE_LINK"	VARCHAR2(1000)		NULL
);

COMMENT ON COLUMN "EXERCISE"."EPOSE_LINK" IS '유튜브 자세화면 보이게함';


CREATE TABLE "CALENDAR" (
	"CALENDARNO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"TITLE"	VARCHAR2(100)		NULL,
	"STARTDATE"	VARCHAR2(20)		NULL,
	"ENDDATE"	VARCHAR2(20)		NULL,
	"CONTENT"	VARCHAR2(200)		NULL
);

COMMENT ON COLUMN "CALENDAR"."CALENDARNO" IS '캘린더번호';
COMMENT ON COLUMN "CALENDAR"."TITLE" IS '제목';
COMMENT ON COLUMN "CALENDAR"."STARTDATE" IS '시작날짜';
COMMENT ON COLUMN "CALENDAR"."ENDDATE" IS '끝나는날짜';
COMMENT ON COLUMN "CALENDAR"."CONTENT" IS '내용';


CREATE TABLE "MEMBER_EX_SET" (
	"DAY_EX_SET"	VARCHAR2(70)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"ECODE"	NUMBER		NOT NULL,
	"CALENDARNO"	NUMBER		NOT NULL,
	"EX_NAME"	VARCHAR2(300)		NOT NULL,
	"EXERCISE_SET"	NUMBER		NOT NULL,
	"EXERCISE_NUMBER"	NUMBER		NOT NULL,
    "EXERCISE_WEIGHT"	NUMBER		NOT NULL

);

COMMENT ON COLUMN "MEMBER_EX_SET"."DAY_EX_SET" IS '날짜,아이디,운동코드조합';
COMMENT ON COLUMN "MEMBER_EX_SET"."CALENDARNO" IS '캘린더번호';


CREATE TABLE "MEMBER_WEIGHT" (
	"MEMBER_ID"	VARCHAR(100)		NOT NULL,
	"DATE"	DATE		NOT NULL,
	"WEIGHT"	NUMBER		NOT NULL,
	"MUSCLE_MASS"	NUMBER		NOT NULL,
	"BODY_FAT_PET"	NUMBER		NOT NULL
);


CREATE TABLE "DAY_DIET" (
	"DAY_DIET_CODE"	VARCHAR(20)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"CALENDARNO"	NUMBER		NOT NULL,
	"FEEDBACK"	VARCHAR(20)		NULL
);

COMMENT ON COLUMN "DAY_DIET"."DAY_DIET_CODE" IS 'FOOD_DATE+ID';
COMMENT ON COLUMN "DAY_DIET"."CALENDARNO" IS '캘린더번호';


CREATE TABLE "DIET" (
	"MEAL_CODE"	VARCHAR(20)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(100)		NOT NULL,
	"DAY_DIET_CODE"	VARCHAR(20)		NOT NULL,
	"FOOD_TIME"	VARCHAR(20)		NULL,
	"CALENDARNO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "DIET"."MEAL_CODE" IS 'DAY_DIET_KEY+FOOD_TIME';
COMMENT ON COLUMN "DIET"."DAY_DIET_CODE" IS 'FOOD_DATE+ID';
COMMENT ON COLUMN "DIET"."FOOD_TIME" IS '아침이면 A, 점심이면 B, 저녁이면 C, 아점이면 X, 점저면Y, 야식은 Z';
COMMENT ON COLUMN "DIET"."CALENDARNO" IS '캘린더번호';


CREATE TABLE "FOOD_API" (
	"FOOD_CD"	VARCHAR(20)		NOT NULL,
	"FOOD_NAME"	VARCHAR(20)		NOT NULL,
	"CALORIE"	NUMBER		NULL,
	"CRABS"	NUMBER		NULL,
	"PROTEIN"	NUMBER		NULL,
	"FAT"	NUMBER		NULL
);


CREATE TABLE "FOOD" (
	"FOOD_CD"	VARCHAR(20)		NOT NULL,
	"MEAL_CODE"	VARCHAR(100)		NOT NULL,
	"FOOD_QUALITY"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "FOOD"."MEAL_CODE" IS 'DAY_DIET_KEY+FOOD_TIME';


ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"USERNAME"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_ID"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"ADMIN_ID"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NUMBER",
	"ADMIN_ID"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"COMMENT_NUM"
);

ALTER TABLE "EXERCISE" ADD CONSTRAINT "PK_EXERCISE" PRIMARY KEY (
	"ECODE",
	"EX_NAME"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "PK_CALENDAR" PRIMARY KEY (
	"CALENDARNO",
	"MEMBER_ID"
);

ALTER TABLE "MEMBER_EX_SET" ADD CONSTRAINT "PK_MEMBER_EX_SET" PRIMARY KEY (
	"DAY_EX_SET"
);

ALTER TABLE "MEMBER_WEIGHT" ADD CONSTRAINT "PK_MEMBER_WEIGHT" PRIMARY KEY (
	"MEMBER_ID"
);

ALTER TABLE "DAY_DIET" ADD CONSTRAINT "PK_DAY_DIET" PRIMARY KEY (
	"DAY_DIET_CODE",
	"MEMBER_ID",
	"CALENDARNO"
);

ALTER TABLE "DIET" ADD CONSTRAINT "PK_DIET" PRIMARY KEY (
	"MEAL_CODE"
);

ALTER TABLE "FOOD" ADD CONSTRAINT "PK_FOOD" PRIMARY KEY (
	"FOOD_CD"
);

ALTER TABLE "FOOD_API" ADD CONSTRAINT "PK_FOOD_API" PRIMARY KEY (
	"FOOD_CD"
);


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

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_ADMIN_TO_NOTICE_1" FOREIGN KEY (
	"ADMIN_ID"
)
REFERENCES "ADMIN" (
	"ADMIN_ID"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
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

ALTER TABLE "MEMBER_EX_SET" ADD CONSTRAINT "FK_EXERCISE_TO_MEMBER_EX_SET_1" FOREIGN KEY (
	"ECODE",
    "EX_NAME"
)
REFERENCES "EXERCISE" (
	"ECODE",
    "EX_NAME"
);

ALTER TABLE "MEMBER_EX_SET" ADD CONSTRAINT "FK_CALENDAR_TO_MEMBER_EX_SET_1" FOREIGN KEY (
	"CALENDARNO",
    "MEMBER_ID"
)
REFERENCES "CALENDAR" (
	"CALENDARNO",
    "MEMBER_ID"
);

ALTER TABLE "MEMBER_WEIGHT" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_WEIGHT_1" FOREIGN KEY (
	"MEMBER_ID"
)

REFERENCES "MEMBER" (
	"MEMBER_ID"
);

ALTER TABLE "DAY_DIET" ADD CONSTRAINT "FK_CALENDAR_TO_DAY_DIET_1" FOREIGN KEY (
	"MEMBER_ID",
    "CALENDARNO"
)
REFERENCES "CALENDAR" (
	"MEMBER_ID",
    "CALENDARNO"
);

ALTER TABLE "DIET" ADD CONSTRAINT "FK_DAY_DIET_TO_DIET_1" FOREIGN KEY (
	"DAY_DIET_CODE",
	"MEMBER_ID",
	"CALENDARNO"
)
REFERENCES "DAY_DIET" (
	"DAY_DIET_CODE",
	"MEMBER_ID",
	"CALENDARNO"
);

ALTER TABLE "FOOD" ADD CONSTRAINT "FK_DIET_TO_FOOD_1" FOREIGN KEY (
	"MEAL_CODE"
)
REFERENCES "DIET" (
	"MEAL_CODE"
);

ALTER TABLE "FOOD" ADD CONSTRAINT "FK_FOOD_API_TO_FOOD_1" FOREIGN KEY (
	"FOOD_CD"
)
REFERENCES "FOOD_API" (
	"FOOD_CD"
);

----------insert 문
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


--member_ex_set
insert into CALENDAR values (20230904, 'test1', '캘린더1', '230913', '230913', '캘린더내용1');
insert into member_ex_set values ('230904test110001', 'test1', 10001, 230904, '덤벨 리스트 컬', 5, 10, 35);
insert into CALENDAR values (20230917, 'test1', '캘린더7', '20230917', '20230917', '캘린더내용7');
insert into CALENDAR values (20230918, 'test1', '캘린더8', '20230918', '20230918', '캘린더내용8');
select * from CALENDAR;

commit;