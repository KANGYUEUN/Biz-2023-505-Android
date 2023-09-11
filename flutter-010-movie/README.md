# Naver OpenAPI 를 활용한 영화정보 어플 만들기 (2023-09-11)

- OpenAPI 를 사용하기 위한 Dependency 도구 설치

```bash
flutter pub add http flutter_html
flutter pub add http
flutter pub flutter_html
```

## 프로젝트 패키지 이름 변경하기

- 프로젝트를 생성할때 기본 패키지를 잘 만들어야 한다
- 잘 못 만들면 앱스토어와 구글플레이 스토어에 배포 할 숭 없다.
- 패키지는 기존으 다른 어플과 완전히 다른 값으로 설정해야한다.
- 패키지는 회사의 인터넷 홈페이지 주소와 연동하여 설정한다.
- 프로젝트를 만들 당시에 패키지를 잘못 지정하거나, 지정하지 않았을경우 개발도중에 패키지명을 변경해여할 필요가 있다.

- 이때 사용하는 도구 : `flutter pub add change_app_package_name`
- 변경 : `flutter pub run change_app_package_name:main com.ruru.movie`

## OpenAPI 를 사용하기 위한 Android 설정 변경

- `\android\src\main\kotlin` 폴더의 `MainActivity.kt` 파일의 패키지명이 잘 설정 되었는가 확인하기
- `\android\src\main\AndroidMainfast.xml` 파일 패키지명 설정 확인

- AndroidMainfast.xml 파일에서 다음 항목을 찾는다
- mainfest 와 `application` 사이에 다음 코드를 추가하기

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <queries>
        <package android:name ="com.ruru.movie"/>

    </queries>


    <application

```

- 어플에서 인터넷을 통하여 외부 API를 사용하기 위한 권한을 부여하기
