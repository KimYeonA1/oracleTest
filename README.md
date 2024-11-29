# Readme에서 사용되는 언어 Mark Down 구조이다.
# 1.헤더
# 제목1 h1 
## 제목2 h1
### 제목3 h1
#### 제목4 h1
##### 제목5 h1
###### 제목6 h1
# 2. 줄바꿈
줄 바꾸기를 할 때는 (enter 2번)

해야한다


두 번을 엔터를 안 치면 다음줄에 있는 글자가 바로 옆으로 붙는다. <br> 생각해
옆으로 바로 붙는다!
# 3. 인덱싱(순서있는 목록)
1. 기존에 작성
2. 하는 방법
3. 동일합니다.
   1. 하위메뉴(번호를 붙힌 후 스페이스바)
   2. 두번째메뉴
   3. 동일합니다
# 3. 인덱싱(순서없는 목록)  
* 아이템1
* 아이템2
* 아이템3
  * 하위 아이템1
  * 하위 아이템2
# 4. 구문선
___
***
# 5. 코드블록
```
public static void main(String[] args){
  System.out.println("코드처럼 보이기 하기")
}
```

# 하이퍼링크(Hyperlink)
kh홈페이지 <https://khacademy.co.kr/>

# 이미지
첫 번째 방법: ![프로젝트 이미지]()  이미지 폴더에 저장
![프로젝트이미지](https://github.com/KimYeonA1/oracleTest/blob/dev/Image/miniproject_pic01.png)
___
두 번째 방법: <img src="https://github.com/KimYeonA1/oracleTest/blob/dev/Image/miniproject_pic01.png" width = "100px" height = "100px">

# 인용상자
> 인용문을 사용하고 싶을 때
> 인용문을 두번 째 사용

# 강조기능
*강조문장입니다.*
_강조문장입니다._
**두 번 강조 문장입니다.**
__두 번 강조 문장입니다.__
___
중간에 글자도 **강조** 됩니다

# 테이블
헤더1 | 헤더2
------|------
메뉴 | 불고기
메뉴2 | 떡복이

# 체크박스
- [X] 체크박스
- [ ] 체크박스
- [X] 체크박스
- [ ] 체크박스
- [ ] 체크박스

# 탈출문자
\*\*강조문자가아님\*\*

**진짜강조문자**

# 이모지 아이콘
🙂   :black_heart:

# SpringBoot-Project-MEGABOX
스프링 부트 + JSP 파싱_영화 예매 사이트


## 🖥️ 프로젝트 소개
MEGA BOX를 참고하여 만든 영화 예매 사이트입니다.
<br>

## 🕰️ 개발 기간
* 22.04.26일 - 22.05.24일

### 🧑‍🤝‍🧑 맴버구성
 - 팀장  : 이윤재 - 영화 예매, 영화 업로드, Database Script 제작, 통합 및 형상관리
 - 팀원1 : 채현우 - 로그인, 회원가입, ID찾기, PW찾기, 마이 페이지,메인 페이지, 통합 및 형상관리, PPT제작, 발표
 - 팀원2 : 이종원 - 메인 페이지, 메인 CSS
 - 팀원3 : 전성덕 - 1대1 문의 게시판(CRUD), 공지사항 게시판(CRUD)
 - 팀원4 : 김창훈 - 1대1 문의 게시판(CRUD), 공지사항 게시판(CRUD)
 - 팀원5 : 김성재 - 로그인, 회원가입, ID찾기, PW찾기

### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- **IDE** : STS 3.9
- **Framework** : Springboot(2.x)
- **Database** : Oracle DB(11xe)
- **ORM** : Mybatis

## 📌 주요 기능
#### 로그인 - <a href="https://github.com/chaehyuenwoo/SpringBoot-Project-MEGABOX/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(Login)" >상세보기 - WIKI 이동</a>
- DB값 검증
- ID찾기, PW찾기
- 로그인 시 쿠키(Cookie) 및 세션(Session) 생성
#### 회원가입 - <a href="https://github.com/chaehyuenwoo/SpringBoot-Project-MEGABOX/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(Member)" >상세보기 - WIKI 이동</a>
- 주소 API 연동
- ID 중복 체크
#### 마이 페이지 - <a href="https://github.com/chaehyuenwoo/SpringBoot-Project-MEGABOX/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(Member)" >상세보기 - WIKI 이동</a>
- 주소 API 연동
- 회원정보 변경

#### 영화 예매 - <a href="https://github.com/chaehyuenwoo/SpringBoot-Project-MEGABOX/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EC%98%81%ED%99%94-%EC%98%88%EB%A7%A4)" >상세보기 - WIKI 이동</a>
- 영화 선택(날짜 지정)
- 영화관 선택(대분류/소분류 선택) 및 시간 선택
- 좌석 선택
- 결제 페이지
- 예매 완료
#### 메인 페이지 - <a href="https://github.com/chaehyuenwoo/SpringBoot-Project-MEGABOX/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EB%A9%94%EC%9D%B8-Page)" >상세보기 - WIKI 이동</a>
- YouTube API 연동
- 메인 포스터(영화) 이미지 슬라이드(CSS)
#### 1대1문의 및 공지사항 - <a href="" >상세보기 - WIKI 이동</a> 
- 글 작성, 읽기, 수정, 삭제(CRUD)

#### 관리자 페이지 
- 영화관 추가(대분류, 소분류)
- 영화 추가(상영시간 및 상영관 설정)


















   
