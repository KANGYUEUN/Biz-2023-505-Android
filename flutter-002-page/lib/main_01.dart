import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "나의 App",
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/title_image.jpg",
              height: 250,
              width: 1000,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  /// < 컨데이너 위젯 >
  ///  Container : padding, margin을 부여하는 box
  ///  Expanded : 부모 box 를 가득 채우는 구조의 box
  ///  padding : padding 을 기본값으로 갖는 box

  /// Widget 변수 선언하기
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "안녕하세요",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "내 고양이 자랑",
                style: TextStyle(color: Color(0xFFAAAAAA)),
              )
            ],
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.red,
        ),
        const Text("50")
      ],
    ),
  );

  /// Widget 함수 선언하기
  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(20),

      child: const Text(
        "고양이가 세상을 지배"
        "지배한다 그날이온다 "
        "우리는 민족어쩌구"
        "우리는 민족어쩌구"
        "우리는 민족어쩌구",
        softWrap: true,
      ),
    );
  }

  Widget colMethod() {
    return const Column(
      children: [
        Text(
          "대한민국♥0♥",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        Text(
          "우리나라만세♥0♥",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        Text(
          ">_<♥",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ],
    );
  }
}
