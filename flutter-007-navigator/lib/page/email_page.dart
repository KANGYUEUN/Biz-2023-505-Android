import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<StatefulWidget> createState() => _EmailPage();
}

class _EmailPage extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    /// ModalRoute 객체로 부터 설정값(setting) 을 gatter 하고
    /// 설정값들 중에서 arguments 값을 getter하여 args 에 Map type으로
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("여기는 email page"),
          Text("여기는 ${args["email"]}"),
          Text("password ${args["password"]}"),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed("/mypage"),
            child: const Text("MyPage"),
          ),
        ],
      )),
    );
  }
}
