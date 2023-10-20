# Daily Muscle Life(DML)
## 팀 프로젝트
- 팀장 : 염호준
- 팀원 : 유수현, 손범규, 유청하, 전범준
#
## Contents
1. 프로젝트 소개
2. 설계의 주안점
3. 개발환경
4. 프로젝트 기능구현
5. 주요기능
6. Document
#
## 프로젝트 소개
- 운동을 할 때 아무것도 모르는 초보자인 경우 어떤 운동을 어떻게 진행해야하는지 잘 모르는 경우가 많은데
  이를 위해 체중 관리 / 식단 관리 / 운동 도우미 / 제품 추천 같이 운동에 필요한 구성을 1개의 웹사이트에 모아 운동을 좀 더 원활하게 진행할 수 있도록 구성하기 위함
#
## 설계의 주안점
- 실용성 : 배포 시 실제로 사용가능하고 연습에 도움이 될 수 있도록 구성
- API 사용 경험 : 실제로 배포되고 있는 API를 사용함으로서 API연동에 대한 이해도를 높힘
- 협업 : 팀 프로젝트를 통해 상호간의 의견 제시 및 화합을 통해 원활한 팀 프로젝트가 진행 될 수 있도록 구성
#
## 개발환경
|Category|Detail|
|--------|------|
|FrontEnd|HTML5, CSS, JavaScript, JQuery, Bootstrap|
|BackEnd|Java(JDK 11.0.2), Spring Framework(5.3.19)|
|OS|Windows 10|
|IDE|SpringToolSuite3, VSCode, SQL Developer|
|Server|Tomcat 9.0|
|CI|Github|
|DateBase|Oracle(21c)|
|API|Kakao API, Google API, Naver API, Calendar API, 식단 API, KakaoMaps API|
|Library|AspectJ 1.9.19, ojdbc8 23.2.0.0, commons-lang3 3.8.1, slf4j 1.6.6, mybatis 3.5.9, spring-session 2.3.3.RELEASE, log4j 1.2.15, mybatis-spring 2.0.6, json-simple 1.1.1, inject 1.0.0, lombok 1.18.28, jjwt 0.11.2, Servlet API 4.0.1, spring-security 5.7.5, jackson 2.14.2, JSP API 2.1, gson 2.8.9, JSTL 1.2, scribejava 8.3.1, DBCP 1.4, spring-social-google 1.0.0.RELEASE|
#
## 프로젝트 기능구현
|담당자|내용|
|------|----|
|**팀장 염호준**|총괄 인원 관리, 팀 스케쥴 관리, UI설계 ppt 제작, 내 운동 리스트, 운동 추가 페이지 및 기능 구현, <br>캘린더에 내 운동 리스트 모달 출력 기능 구현|
|팀원 유수현|발표 ppt 제작, 시퀀스 다이어그램 제작, Spring 기본 구성 설정, 소셜 로그인 API 연동(네이버, 구글, 카카오), <br>로그인, 회원가입, 아이디 찾기, 비밀번호 찾기, 마이페이지, Admin 페이지 페이지 및 기능 구현, <br>인터셉터를 이용하여 페이지 접근 제한 기능 구현|
|팀원 손범규|풀캘린더 API 연동, 제품 추천, 캘린더 페이지 제작 및 기능 구현, 캘린더 모달 출력 기능 구현|
|팀원 유청하|카카오 지도 API 연동, 체중 관리, 체조성 기록, 주변 헬스장 찾기 페이지 제작 및 기능 구현|
|팀원 전범준|ERD 다이어그램 제작, 식단 API 연동, 식단 관리 페이지 및 기능 구현, 캘린더에 식단 리스트 모달 출력 기능 구현|
#
## 주요기능
- 체중 관리 / 식단 관리 / 체조성 기록 / 주변 헬스장 찾기
- 내 운동 리스트 / 운동 추가 / 제품 추천
- 공지사항 / 질문/답변
- 캘린더
#
## 주요기능
[발표자료](https://docs.google.com/presentation/d/1aFiRfCkb3Yd7xzLqmzZPHlQKbqLlj_A8/edit#slide=id.g27f8e26b356_16_20)
