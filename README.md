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

## flutter project 를 github 에서 clone 했을때

- 프로젝트 코드, 파일에서 import 코드에 오류가 발생한다.
- github 에 프로젝트를 push 하면 필요한 dependencies 도구들이 생략되어 push된다.
- clone 을 실행한 후 dependencies 들을 다시 다운로드 해야 한다.

```bash
flutter pub get
```

## flutter update

- flutter, dart 도구가 update 되는 경우 자주 발생
- 현재사용중인 프로젝트의 flutter dart 도구를 업데이트 하면 기존의 플젝이 작동 안됨
- 따라서 신중하게 update 할 필요가 있다..

- update 절차
- 기존의 dependencies 를 최신 버전으로 업데이트 : `flutter pub upgrade outdated`
- 프로젝트 clean 과 재설정 : `flutter clean`, `flutter pub get`
- flutter 도구 자체를 업데이트 : `flutter upgrade` 실행하나 업데이트 과정에서 문제 발생 하여 업데이트가 안되는 경우가 있다
- 강제 업데이트 : `flutter upgrade --force`
