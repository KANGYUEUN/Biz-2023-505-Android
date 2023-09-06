# Flutter firebase 연동 프로젝트

- `auth(인증)`, `fireStore(DBMS)`, `real Database(DBMS)` 등을 연동하여 프로젝트를 구현 할 수 있다.
- 다른 프로젝트(react)에서는 Hostring 등도 사용 할 수있다.

## firebase-auth

- `firebase`를 통하여 `email` 방식의 회원가입과 로그인 구현 가능
- `google login` 등 `oAuth2(인증 Token 방식)` 방식의 인증을 구현 할 수 있다.

## DBMS 연동 : fireStore, real Database

- `NoSQL` 방식으로 Data CRUD 를 구현 할 수 있다.
- 1:1 방식의 채팅도 구현 할 수 있다.
- Message 전달 구현 가능.

## Flutter 와 firebase 를 연동하기 위하여 사전 도구 설치

- Cli 도구 설치 : `npm install -g firebase-tools@latest`
- @latest : update
- 설치 확인 : `firebase --version`

## firebase 프로젝트 생성하기

- `firebase.google.com` 사이트에서 new project 생성
- 생성된 프로젝트에 앱 추가 : fluter 앱 추가(제일오른쪽)
- firebase-cli 명령 실행하여 프로젝트 구성하기

- vsCode 에서 윈도우cmd 창열기 : `flutterfire`명령은 윈도우 com 창에서만 실행
- 새로 생성한 프로젝트로 폴더이동 : ` cd flutter-008-firebase`

- 프로젝트 폴더에서 confing 실행 : flutterfire configure --project=flutter-my-app-bbc77

- 명령 실행후 경고가 뜨면 시스템 path 에 경로 등록한다.
  C:\Users\KMS505233\AppData\Local\Pub\Cache\bin (현재 이폴더를 path 에 경로 등록 한다.)

- cmd 창에서 명령 실행 한 후 적용할 대상 선택

## project 에 depandecy 설치하기

- console 화면세어 firebase plugin 설치하기
- 화면 상단에서 andriod 선택하고 절차대로 진행

```bash
firebase login
flutter pub add firebase_core
flutter pub add firebase_auth
```

- dependency 를 정상으로 설치 했는데 app 실행에 문제가 발생할 수 있다
- 이 경우는 dependency 버전이 서로 맞지 않아서 생기는 문제이다.
- 이때는 다음 명령으로 clean 을 실행

```bash
flutter pub upgrade outdated package
flutter clean
flutter pub get
```
