import 'package:flutter/material.dart';

void main(List<String> args) {
  const text = NewWidget();
  runApp(const Center(
    child: text,
  ));
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "반갑습니다",
      style: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(255, 0, 0, 1),
      ),
      textDirection: TextDirection.ltr,
    );
  }
}
