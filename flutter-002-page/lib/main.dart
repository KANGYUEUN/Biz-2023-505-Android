import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

/// 스마트폰 어플을 만들기 위해서 가장 바깥쪽의 박스를 설정하기
/// MaterialApp() 위젯을 통해 설정한다.
/// MaterialApp은 home 이라는 named parameter를 가지고
/// 이 home 매개 변수에 어떤 위젯을 부착하여 화면을 그리도록 한다.
/// MaterialApp 은 스마트 기기에서 어플이 시작되도록 context 를 구현하는 위젯 도구이다.
/// 실제로 이 위젯이 하는 일은 화면에 무엇인가 나타내는 것이 아니다.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// 여기에서 부터 화면에 무엇인가 나타내는 코드가 시작된다.
// Homepage 는 Startpage를 실행시킨다.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => StartPage();
}

class StartPage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("여기는 실제 페이지이다."),
    );
  }
}
