# 공공데이터 광주 BIS 정보 openAPI

- openAPI 활용을 위한 dependencies 설치

```bash
flutter pub add http
flutter pub add provider
flutter pub add xml2json
flutter pub add flutter_dotenv
```

## dotEnv 를 이용한 설정데이터 보호하기

- 프로젝트 root/assets/.env 파일 생성하기
- .gitignore 파일에 `*.env` 등록하기
- push 해서 파일이 올라가지 않았는지 확인하기

- `dotEnv`는 JS, NodeJS, React 등에서 환경설정값이나 비밀번호등을 보호 하기 위하여 사용하는 도구였다.
- 프로젝트에 .env.\*로 시작되는 파일을 생성하고, 이 파일에 여러 정보를 저장해 두고 프로젝트에서 공용으로 사용할수 있게 하는 도구이다.

- `.env` 파일에 설정값 등록하는 방법 : `변수=값` 형식이다. key-Value 형식
- 이 프로젝트에서는 공공데이터 openAPI Service 키를 이 파일에 등록해야만 정상적인 프로젝트가 실행된다.
