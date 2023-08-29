/// flutter 프로젝트를 열였는데 import 에서 오류가 발생한 경우
/// 프로젝트 폴더에서 flutter pub get 실행하기
import 'package:flutter/material.dart'; // 기본적으로 제공되는 도구 (화면자동화)

/// dart project 시작점
void main(List<String> args) {
  runApp(const MyApp());
}

// flutter 로 생성한 app 의 시작점
// StatelessWidget : state 가 없는 widget
// StatefulWidget : state를 변경할수 있는것
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // context : 멀티테스킹에 중요
  // 빌드패턴 팩토리
  @override
  Widget build(BuildContext context) {
    // MaterialApp() : 구글에서 제안하는 표준화면 기본 구조 (생성자함수)
    return MaterialApp(
      title: "반갑습니다",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StartPage(),
    );
  }
}

/// State 를 사용하여 화면에 지속적인 변화를 주기위한 시작점
/// StatefulWidget 의 State 위젯을 생성, 컨드롤 하는 위젯
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override

  /// _StatePage 클래스의 생성자를 호출하여 객체를 생성하는 코드
  State<StartPage> createState() => _StartPage();
}

/// StartPage(StatefullWidget) 가 생성하고 컨트롤할 State
/// 클래스 이름에 UnderScore(_)를 붙이면 이 클래스는 private 성질을 갖는다.
/// 현재 버전의 dart 에서는 UnderScore()를 사용하지 말라고 권장한다.
/// flutter State 클래스에는 통상 _를 통해 StatefulWidget 이름과 같이 만든다.
class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 첫 App"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("♥"),
            Text("♥"),
            Text("♥"),
            Text("♥"),
            Text("♥"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.email),
      ),
    );
  }
}
