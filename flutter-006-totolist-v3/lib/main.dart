import 'package:flutter/material.dart';
import 'package:totolist/modules/todo_Main.dart';

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
