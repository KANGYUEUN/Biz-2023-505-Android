import 'package:flutter/material.dart';
import 'package:navigator/page/email_page.dart';
import 'package:navigator/page/home_page.dart';
import 'package:navigator/page/my_page.dart';

Widget mainDrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("ruru"),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              )
            ],
            accountName: Text("ruru"),
            accountEmail: Text("yu1128eun@kakao.com"),
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            leading: const Icon(Icons.home, color: Colors.blue),
            onTap: () {
              debugPrint("Home 메뉴가 클릭됨");

              /// 스마트 기기에서 현재화면을 다른 화면으로 전환하기
              /// web, pc app에서는 단순한 수행이나
              /// 스마트 기기에서는 화면 하나 하나가 context 이다 (데이터 메모리 덩어리 )
              /// 화면 전환시 context를 잘 관리 해야한다
              // const HomePage();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          const Divider(
            height: 0.2,
            color: Colors.blue,
          ),
          ListTile(
            title: const Text(
              "Mypage",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            leading: const Icon(Icons.supervised_user_circle),
            onTap: () => Navigator.of(context).pushNamed("/mypage"),
          ),
          const Divider(
            height: 0.2,
            color: Colors.blue,
          ),
          ListTile(
            title: const Text(
              "email",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            leading: const Icon(Icons.email, color: Colors.blue),
            onTap: () {
              Navigator.of(context).pushNamed(
                "/email",
                arguments: {
                  "email": "yu1128eun@kako.com",
                  "password": "12345",
                },
              );
            },
          ),
          const Divider(
            height: 0.2,
            color: Colors.blue,
          ),
        ],
      ),
    );
