import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕하세요"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("강유은"),
              accountEmail: const Text("yu1128eun@kakao.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "images/image_01.jpg",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const Text("ruru")
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text("전체 메일 보기"),
              leading: Icon(Icons.email),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("받은 메일함 "),
              leading: Icon(Icons.inbox),
            ),
            const ListTile(
              title: Text("페이스북"),
              leading: Icon(Icons.facebook),
            ),
            const ListTile(
              title: Text("트위터"),
              leading: Icon(Icons.abc),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.add),
          label: const Text("추가"),
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.red,
              ),
              textStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: 15,
                color: Colors.yellow,
              ))),
        ),
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.clear),
          label: const Text("지우기"),
        )
      ],
      body: const Center(
        child: Text(
          "나의스마트 어플",
          style: TextStyle(
            fontSize: 50,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
