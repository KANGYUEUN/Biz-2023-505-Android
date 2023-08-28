# Biz-2023-505-Android

- Android project
- @since 2023-08-28

## Flutter 설치

- 설치파일 다운로드 : `flutter.dev` 에서 get start 접속 `flutter*.zip` 다운로드
- `c:\dev` 폴더에 파일 이동후 압축 풀기
- 압축폴더에서 `flutter` 폴더를 `c:\dev` 폴더로 이동
- windows 고급설정보기 에서 환경변수 path 항목에 `c:\dev\flutter\bin` 폴더 추가하기

## flutter extention 설치 하기

- vsCode 의 확장 plugin 설치 : flutter 검색하여 3개 설치

## flutter project 생성

```bash
flutter create --org=com.ruru hello

flutter create --org=com.ruru flutter-000-hello-01
```

## 프로젝트 명명 주의

- 만약 다음과 같이 프로젝트 이름을 생성하면 base-package 가 `com.ruru.flutter-000-hello-01` 처럼 생성이 되어버린다
- 프로젝트 이름은 짧은 값으로 한 후 프로젝트 폴더 이름을 변경 해 주는 것이 파일 관리에 유리하다

- 프로젝트 이름은 가급적 소문자로 작성한다.

## flutter 개발 환경 설정 : 사용준비, 기존의 다른 도구들과 연결하기

- flutter 에게 컴퓨터 안의 여러 도구들을 연결 시키라는 명령어

```bash
flutter doctor

```

- 실행후 android toolchain 경고가 나오면 다음을 실행한다

```bash
flutter doctor --android-licenses

```
