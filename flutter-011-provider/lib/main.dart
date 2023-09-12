import 'package:flutter/material.dart';
import 'package:mview/pages/home_page.dart';
import 'package:mview/pages/settings_page.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TimerViewModel(),
        )
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/pomodors.jpg"),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(children: const [
            HomePage(),
            SettingsPage(),
          ]),
        ),
      ),
    );
  }
}
