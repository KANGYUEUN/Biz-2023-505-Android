import 'package:flutter/material.dart';
import 'package:navigator/models/user.dart';
import 'package:navigator/page/user_input.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원정보수정"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 My Page >_<"),
            ElevatedButton(
              onPressed: () async {
                var userDto = User(
                  username: "이몽룡",
                  password: "111111",
                  email: "fdf@dd.com",
                  nickname: "암행어사",
                  tel: "010-1111-1111",
                );
                var result = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInput(userDto: userDto),
                ));

                var resultStr = """
                  username = ${result.username},
                  password = ${result.password},
                  nickname = ${result.nickname},
                  """;
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(resultStr),
                  duration: const Duration(seconds: 3),
                ));
              },
              child: const Text("회원정보수정"),
            )
          ],
        ),
      ),
    );
  }
}
