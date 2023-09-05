import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:totolist/models/todo.dart';
import 'package:totolist/service/todo_service.dart';

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
        stime: DateFormat("HH:mm:ss").format(DateTime.now()),
        content: content,
        complete: false,
      );

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
                onPressed: () async {
                  var todo = getTodo(todoContent);
                  await TodoService().insert(todo);
                  setState(() {
                    // 입력이 완료된 후 키보드 자동으로 감춰지기
                    FocusScope.of(context).unfocus();
                    todoContent = "";
                  });
                  inputController.clear();
                },
                icon: const Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder(
            future: TodoService().selectAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return todoListView(
                  snapshot: snapshot,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    semanticsLabel: "데이터가 없습니다",
                  ),
                );
              }
            },
          )),
    );
  }

  Widget todoListView({required AsyncSnapshot<List<Todo>> snapshot}) {
    var todoList = snapshot.data!;
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
            confirmDismiss: (direction) => onConfirmHandler(
              direction,
              todoList[index],
            ),
            onDismissed: (direction) async {
              // 완료설정
              if (direction == DismissDirection.startToEnd) {
                var todo = todoList[index];
                todo.complete = !todo.complete;
                await TodoService().update(todo);
                setState(() {});
                // 삭제하기
              } else if (direction == DismissDirection.endToStart) {
                var content = todoList[index].content;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$content 를 삭제 하였습니다."),
                ));

                // DB PK 값을 delete 에게 직접 전달하기
                await TodoService().delete(todoList[index].id ?? 0);
                setState(() {});
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

  Future<bool?> onConfirmHandler(direction, Todo todo) {
    if (direction == DismissDirection.startToEnd) {
      return completeConfirm(todo);
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
            onPressed: () async {
              Navigator.of(context).pop(true); // 버튼 선택시 화면 닫기
              await Future.delayed(const Duration(seconds: 1));
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

  Future<bool?> completeConfirm(Todo todo) {
    var yesNo = todo.complete ? "완료처리를 취소 할까요?" : "완료처리를 할까요?";
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
