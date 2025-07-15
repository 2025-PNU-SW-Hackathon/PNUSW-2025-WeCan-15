# WeCam 프로젝트 소개

## 1. 프로젝트 개요

### 1.1. 개발 배경 및 필요성

현재 대학생 자치조직(학생회) 운영은 여전히 **비효율적인 메신저 중심 체계**에 머물러 있으며,  
업무 인수인계, 공지사항 전달, 일정 관리 등에서 **전용 플랫폼이 부재**한 상황입니다.

WeCam은 단순한 협업툴이 아니라  
**"대학생활에 필수적인 플랫폼"**으로서  
학생회 운영 효율화와 학생과의 소통 강화를 통해  
**투명한 조직 운영과 지속 가능한 구조**를 지원합니다.

---

### 1.2. 개발 목표 및 주요 내용

* **목표**  
  → 학생회 중심의 **체계적인 대학 플랫폼 구축**

* **주요 기능**
  * 학생회 조직별 워크스페이스 제공
  * 일정 및 업무 관리 기능
  * 인수인계 기능 내장
  * 공지사항 공유 (학생회 ↔ 일반 학생)
  * 자동 채팅방 생성 및 알림 기능
  * 학생 개별 참여 기능 (캘린더/공지/설문)

---

### 1.3. 주요 설계 요소

* **조직 구조**  
  → 총학생회 → 단과대학 학생회 → 학과 학생회  
    (계층형 워크스페이스 구성)

* **가입 및 승인**
  * 학생회는 승인 후 워크스페이스 생성
  * 일반 학생은 학교/학과 선택 후 가입

* **핵심 기능**
  * 일정 관리 (캘린더 기반)
  * 업무 인수인계 게시판
  * 공지사항/설문 기능
  * 실시간 알림 및 채팅

---

### 1.4. 기존 서비스 대비 차별성

* **학생회 중심 설계** (기존 협업툴과 차별화)
* **학교 조직 체계 자동 구성**
* **학생 대상 공지/채팅 연동**
* **학생회 교체 시 인수인계 기능 내장**
* **학생 개인 사용자에게도 유용한 캠퍼스 플랫폼 지향**

---

### 1.5. 사회적 가치 및 기대효과

* 학내 **커뮤니티 활성화**
* 학생회의 **투명한 운영 문화** 조성
* **업무 자동화**로 학생회 운영 부담 경감
* 일반 학생의 **참여 확대** (공지, 알림, 설문)
* 장기적으로 **대학생 필수 앱**으로 자리매김

---

## 2. 상세 설계

### 2.1. 시스템 구성도

(시각화된 구성도 삽입 예정)

---

### 2.2. 사용 기술 스택

| 구분       | 기술 스택                   | 버전            |
| -------- | ----------------------- | ------------- |
| Frontend | Next.js (React 기반)      | 14.x          |
| Frontend | Tailwind CSS            | 3.x           |
| Backend  | Spring Boot             | 3.2.x         |
| Backend  | Java                    | 21 (Corretto) |
| Database | MySQL (AWS RDS)         | 8.x           |
| Infra    | AWS EC2                 | -             |
| Infra    | Docker / Docker Compose | 최신          |
| CI/CD    | GitHub Actions          | -             |

---

## 3. 개발 결과

### 3.1. 전체 시스템 흐름도

(시각화 흐름도 삽입 예정)

---

### 3.2. 기능 설명

#### 로그인

* 이메일/비밀번호 입력
* 유효성 검사 후 로그인 가능
* 성공 시 대시보드 이동
* 실패 시 에러 메시지 표시

#### 워크스페이스 생성

* 학생회 승인 프로세스 포함  
  (초대코드 기반 자동 승인 / 수동 승인)
* 계층형 조직 구조 자동 구성

#### 일정 관리

* 일정 추가 시 알림 자동 발송
* 캘린더 뷰 제공

#### 공지사항

* 학생회 → 일반 학생 공지 기능
* 열람 여부 확인 가능

#### 업무 인수인계

* 게시판 형태로 운영
* 이전 학생회 기수와 연동

#### 채팅

* 조직별 자동 채팅방 생성
* 실시간 메시지 전송 및 알림

---

### 3.3. 기능 명세서

> [Notion/Google Docs/스프레드시트 링크 예정]

---

### 3.4. 디렉토리 구조

📁 domain-common
공통 도메인 엔티티 및 enum 관리 모듈

src/main/java/org/example/model

affiliation: 소속 인증 관련 엔티티 (AffiliationCertification, AffiliationFile 등)

common: BaseTimeEntity 등 공통 엔티티 상속 구조

council: 학생회, 부서, 멤버, 권한 정책 엔티티

enums: 시스템 전반에서 사용하는 열거형 모음 (권한, 상태, 분류 등)

invitation: 초대 코드 및 기록 엔티티

organization: 조직 및 조직 생성 요청 관련 엔티티

todo: 할일(Todo) 관련 엔티티

user: 유저 정보, 가입 이력, 개인정보 등

📁 wecam-backend
일반 사용자 + 클라이언트용 API 서버

src/main/java/org/example/wecambackend

WecamBackendApplication.java: 백엔드 메인 실행 클래스

common: 예외 처리, 응답 포맷, 컨텍스트 관리 등 공통 유틸

config: Spring Security, JWT, Redis, OpenAPI 등 설정

controller: API 엔드포인트 컨트롤러

admin: 관리자 페이지용 API

client: 일반 사용자(학생)용 API

publicinfo: 공개 API (학교/조직 조회 등)

dto: 요청/응답 DTO

repos: JPA Repository

service: 서비스 로직 계층

util: 유틸 클래스 (현재 유저 정보, 암호화 등)

📁 wecamadminbackend
관리자 페이지 전용 백엔드 서버 (Spring + Thymeleaf 기반)

src/main/java/org/example/wecamadminbackend

WecamadminbackendApplication.java: 관리자 백엔드 메인 실행 클래스

controller: 관리자 뷰 라우터 (dashboard, organization, login)

dto: 관리자 뷰에서 사용하는 DTO

entity: 관리자용 유저 엔티티 (ex. AdminUser)

repos: 관리자 전용 JPA Repository

service: 관리자 기능 구현 로직 (조직 승인 등)

util: 암호화, 패스워드 해싱 유틸리티
---

## 4. 설치 및 사용 방법

### 설치

* Docker / Docker Compose 설치
* Node.js / npm 설치

### 실행 방법

#### Backend

bash
./gradlew build
java -jar build/libs/wecam-backend.jar


#### Frontend

bash
npm install
npm start


#### Docker Compose (전체 실행 시)

bash
docker-compose up --build


---

## 5. 소개 및 시연 영상

---

## 6. 팀 소개

| 이름  | 역할          | 연락처             |
| --- | ----------- | --------------- |
| 김예슬 | 팀장 / 백엔드 개발 | yesul0718@pusan.ac.kr |
| 김동인 | 백엔드 개발 | |
| 문진서 | 프론트엔드 개발   |                 |
| 김나림 | 프론트엔드 개발    |                 |
| 김예원 | 디자이너        |                 |
| 김대욱 | AI 서비스 연동   |                 |
| 박장현 | 기획   |                 |

---

## 7. 해커톤 참여 후기
