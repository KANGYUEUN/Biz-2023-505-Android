import 'package:firebase/modules/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0), // 여백
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  focusNode: _emailFocus, // controller 역할
                  validator: (value) => CheckValidate().emailCheck(
                    email: value!, // null safe
                    focusNode: _emailFocus,
                  ),
                  decoration: const InputDecoration(
                    hintText: "email 을 입력해 주세요",
                    helperText: "email 형식에 맞게 입력해주세요",
                  ),
                ),
                TextFormField(
                  focusNode: _passwordFocus,
                  validator: (value) => CheckValidate().passwordCheck(
                      password: value!, focusNode: _passwordFocus),
                  decoration: const InputDecoration(
                    hintText: "비밀번호",
                    helperText: "특수문자, 대소문자, 숫자 포함하여 8자리 이상",
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      _formKey.currentState?.validate();
                      var result = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: "yu1128eun@kakao.com",
                        password: "!Korea8080",
                      );
                    },
                    child: const Text("로그인"))
              ],
            ),
          )),
    );
  }
}
