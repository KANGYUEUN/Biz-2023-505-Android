import 'package:flutter/material.dart';

void main(List<String> args) {
  const text = Text(
    "반갑습니다",
    style: TextStyle(
      fontSize: 30,
      color: Color.fromRGBO(255, 0, 0, 1),
    ),
    textDirection: TextDirection.ltr,
  );
  runApp(const Center(
    child: text,
  ));
}
