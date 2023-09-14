# Naver 도서검색 openAPI 프로젝트

- naver 에서 제공하는 API를 통해 도서검색 실행
- dependency : `flutter pub add http`

## 하이퍼 링크 설정

- html 에서는 a atag 를 사용하여 간편하게 하이퍼 링크를 설정 할 수있다.
- flutter 에서는 하이퍼 링크를 설정하는 것이 다소 까다롭다
- 하이퍼 링크를 클릭(tab) 했을때 내장 browser 를 연결하는 코드를 작성
- 가장 보편적으로 사용하는 dependency : `flutter pub add url_launcher` 설치하기
