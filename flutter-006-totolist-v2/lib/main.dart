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
  /// < **Controller >
  /// flutter 대부분의 Widget 에는 위젯 Controller 라는 객체가 있다
  /// HTML의 ID 속성에 해당하는 객체이다
  var inputController = TextEditingController();
  var todoContent = "";
  var todoList = [];

  Todo getTodo(String content) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:ss:mm").format(DateTime.now()),
        content: content,
        complete: false,
      );

  ///  < Scaffold >
  /// 처음 화면의 layout 을 꾸밀때 사용하는 Widget
  /// appBar, body, bottomSheet 가 있는데
  /// appbar 는 화면의 머릿글에 해당하는 부분
  /// body 는 본문(중앙)에 해당하는 부분
  /// bottomSheet 는 화면의 footer(꼬릿글)에 해당
  ///
  /// body : 보통 데이터를 표현하는 부분, 여긴 Scroll 이 일어나는 부분
  /// appbar, bottomSheet : body 가 변화되더라도 Scroll이 되지않는 고정부분
  /// bottomSheet : 입력화면에서 소프트 키보드가 나타 나면 키보드 위에 표현
  @override
  Widget build(BuildContext context) {
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
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  // TextField 에 ID(controller) 설정하기
                  controller: inputController,
                  onChanged: (value) => setState(() {
                    todoContent = value;
                  }),
                  decoration: InputDecoration(
                    prefix: const SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => inputController.clear(),
                      icon: const Icon(Icons.clear),
                    ),
                    hintText: "할일을 입력하세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  var todo = getTodo(todoContent);
                  setState(() {
                    todoList.add(todo);
                    todoContent = "";
                    inputController.clear();
                  });
                },
                icon: const Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), child: todoListView()),
    );
  }

  /// ListView return type 을 Widget 으로 변경하기
  /// 모든 Widget 은 가장 상위 클래스인 Widget 을 상속 받고 있기 때문에
  /// 모든 Widget 의 return type 은 Widget 으로 설정 하여도 된다.
  Widget todoListView() {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          // onTap: () {},
          selectedColor:
              const Color.fromARGB(255, 29, 106, 173).withOpacity(0.5), // 선택했을때
          splashColor:
              const Color.fromARGB(255, 180, 20, 30).withOpacity(0.5), // 클릭했을때
          title: Dismissible(
            /// Key(todoList[index].content),
            /// 만약 todoList 데이터가 없는 경우 null exception이 발생 할 수 있기 때문에
            /// Key의 값이 null 이 된다.
            /// flutter 에서 제공하는  UUID 인
            /// UniqueKey()사용
            key: UniqueKey(),
            background: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.save,
                size: 36,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete,
                size: 36,
                color: Colors.white,
              ),
            ),

            /// 사라지기 전의 event
            /// event 핸들러에서 Future.value(true)를 return  하면
            /// 스와이프 행위가 진행되고 false 를 return 하면
            confirmDismiss: (direction) => onConfirmHandler(direction, index),

            /// confirmDismiss 에서 true 가 return 되었을때 할일
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  todoList[index].complete = true;
                });
              } else if (direction == DismissDirection.endToStart) {
                setState(() {
                  todoList.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${todoList[index].content} 를 삭제 하였습니다."),
                ));
              }
            },
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            todoList[index].content,
                            style: todoList[index].complete
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 172, 176, 179))
                                : const TextStyle(
                                    fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> onConfirmHandler(direction, index) {
    if (direction == DismissDirection.startToEnd) {
      return completeConfirm(index);
    } else if (direction == DismissDirection.endToStart) {
      return deleteConfirm();
    }

    /// Future
    /// 화면에 state 에 의해 변화를 감지하는 객체
    /// value  값을 false 로 만들어 return
    return Future.value(false);
  }

  Future<bool?> deleteConfirm() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("삭제 할까요?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true); // 버튼 선택시 화면 닫기
            },
            child: const Text("예"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니요"),
          )
        ],
      ),
    );
  }

  Future<bool?> completeConfirm(index) {
    var yesNo = todoList[index].complete ? "완료처리를 취소 할까요?" : "완료처리를 할까요?";
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(yesNo),
        actions: [
          ElevatedButton(
            onPressed: () {
              /// Navigator.of(context).pop(true);
              /// showDialog 가 return 하는 값
              Navigator.of(context).pop(true);
            },
            child: const Text("예"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니요"),
          )
        ],
      ),
    );
  }

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
}
