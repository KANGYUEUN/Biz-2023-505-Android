import 'package:flutter/material.dart';
import 'package:navigator/models/user.dart';
import 'package:navigator/page/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("여기는 Home Page ♥ 입니다"),
          ElevatedButton(
            onPressed: () {
              var user = User(
                  username: "ruru",
                  password: "123412345",
                  email: "yu1128eun@kakao.com",
                  nickname: "루랑이",
                  tel: "010-2789-2547");
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                        name: "홍길동",
                        email: "kkangso1128@naver.com",
                        userDto: user,
                      )));
            },
            child: const Text("자세히 보기"),
          ),
        ],
      )),
    );
  }
}
