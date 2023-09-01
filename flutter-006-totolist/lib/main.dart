import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:totolist/models/todo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //debug 제거하기
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  var todoList = [];
  // var todoList = [
  //   Todo(
  //       sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //       stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //       content: "오늘은 금요일 ㅎㅅㅎ",
  //       complete: false),
  //   Todo(
  //       sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //       stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //       content: "Flutter Project ♥ ",
  //       complete: false)
  // ];

  Todo getTodo(String content) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:ss:mm").format(DateTime.now()),
        content: content,
        complete: false,
      );

  Widget alertDialog(BuildContext context) => AlertDialog(
        actions: [
          TextField(
            // keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar =
                  SnackBar(content: Text("$value가 추가 되었다")); // 입력한 내용이 alert창에
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            decoration: const InputDecoration(
              hintText: "할일을 입력해주세요",
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    // State 클래스 내의 함수를 실행하여 결과를 가져온 후 todoList 를 만든다.
    // 이때 클래스 내의 함수를 호출하여 다른 변수를 만드는 경우
    // 이 코드는 bulid 함수 내부에서 실행 해야 한다.
    // List<Todo> todoList = [
    //   getTodo("flutter project"),
    //   getTodo("오늘은 금요일 >_<♥"),
    //   getTodo("뿌ㅡ잉")
    // ];

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("images/profile.jpg", fit: BoxFit.fill),
        title: const Text("나의 todoList - appbar"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => alertDialog(context),
                );
              },
              icon: const Icon(
                Icons.add_alarm,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            selectedColor: const Color.fromARGB(255, 29, 106, 173)
                .withOpacity(0.5), // 선택했을때
            splashColor: const Color.fromARGB(255, 180, 20, 30)
                .withOpacity(0.5), // 클릭했을때
            title: Dismissible(
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              key: Key(todoList[index].content),
              background: Container(
                color: Colors.red, // 옆으로 밀었을때
                child: const Text("삭제"),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todoList[index].sdate),
                        Text(todoList[index].stime)
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          todoList[index].content,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
