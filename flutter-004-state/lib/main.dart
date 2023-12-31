import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:start/main_app_bar.dart';
import 'package:start/models/student.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: "Flutter State",
        theme: ThemeData(primarySwatch: Colors.green),
        home: const HomePage());
  }
}

/// State 클래스를 관리하는 부모 클래스
/// State 를 생성(create)한다.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  /// => StartPage()
  /// StartPage class 의 생성자를 호출하여 StartPage 의 객체를 생성하여 return 하라 는 의미
  @override
  State<StatefulWidget> createState() => StartPage();
}

/// State Widget 에서는 StatefulWidget 과 관계를 명확하게 하기 위해
/// Generic(<HomePage>)를 연결해 준다.
class StartPage extends State<HomePage> {
  /// State 클래스 위젯에서 titles 배열 변수를 생성(선언과 초기화)
  /// 이 순간 titles 는 state 가 된다. (데이터가 언제든지 변화할 수 있다 변화된 내용은 반영되야한다.)
  /// state 는 화면 rendering, 동적인 활동을 감시 할 수 있는 ' 동적 변수 '
  final titles = [
    "Hello Korea",
    "하이루♥",
    "반갑다",
    "우리나라만세",
    "대한민국만세",
    "Republic Korea"
  ];

  final stuentList = [
    Student(stNum: "001", stName: "홍길동"),
    Student(stNum: "002", stName: "성춘향"),
    Student(stNum: "003", stName: "이몽룡"),
    Student(stNum: "004", stName: "임꺽정"),
    Student(stNum: "005", stName: "장보고"),
    Student(stNum: "006", stName: "장녹수"),
  ];

  /// 동적으로 변화되는 배열(List) 요소들을 화면에 출력하기 위해
  /// ListView.builder()  함수를 사용하여 각 요소를 디자인 한다.
  ListView appBarBody() => ListView.builder(
        itemCount: stuentList.length,
        itemBuilder: (context, index) {
          // callback 함수
          return ListTile(
            title: Material(
              child: InkWell(
                onTap: () {
                  var snackBar =
                      SnackBar(content: Text(stuentList[index].stName));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                highlightColor:
                    const Color.fromARGB(255, 189, 15, 15).withOpacity(0.5),
                splashColor:
                    const Color.fromARGB(255, 139, 241, 22).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(stuentList[index].stNum),
                      Text(stuentList[index].stName),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕ㅎㅅㅎ"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              var rnd = Random().nextDouble();

              /// flutter 의 State 클래스에서 기본으로 제공하는 함수
              /// state 로 선언된 변수의 값을 변경할때 사용하는 함수
              /// 이 함수 내의 본문에서 state 변수의 값(상태)를 변경하면
              /// 화면에 자동 rendering 된다.
              setState(() {
                titles.add(rnd.toString());
              });
            },
            icon: const Icon(Icons.add_box),
          )
        ],
      ), //mainAppBar(context),
      body: appBarBody(),
    );
  }
}
