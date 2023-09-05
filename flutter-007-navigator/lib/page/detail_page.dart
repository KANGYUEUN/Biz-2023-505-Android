import 'package:flutter/material.dart';
import 'package:navigator/models/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.userDto,
  });
  final String name;
  final String email;
  final User userDto;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자세히 보기"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("여기는 자세히 보기 Page ♥_<"),
          Text("이름 : ${widget.name}"),
          Text("이메일 : ${widget.email}"),
          Text("이름 : ${widget.userDto.username}"),
          Text("비밀번호 : ${widget.userDto.password}"),
          Text("닉네임 : ${widget.userDto.nickname}"),
          Text("전화번호 : ${widget.userDto.tel}"),
        ],
      )),
    );
  }
}
