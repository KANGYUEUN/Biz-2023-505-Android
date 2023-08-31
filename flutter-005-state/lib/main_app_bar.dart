import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text(
        "안녕하세요 AppBar",
      ),
      centerTitle: true, // appBar text 가 중앙에 위치
      elevation: 0.0, // 아래에 그림자 생긱게 하기
      actions: [
        IconButton(
          onPressed: () {
            const snackBar = SnackBar(content: Text("안녕하세요"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.person),
        )
      ],
    );
