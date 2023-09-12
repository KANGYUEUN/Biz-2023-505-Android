import 'package:flutter/material.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _formatTime(seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    // context.select((value) => null);
    // context.watch(); viewModel 통채로 구독
    // context.read(); viewModel 통채로 구독

    var strTimer = context.select<TimerViewModel, String>(
      (value) => _formatTime(value.timerDto.timer),
    );
    var timerRun = context.select<TimerViewModel, bool>(
      (value) => value.timerDto.timerRun,
    );

    var onPressed = context.select<TimerViewModel, Function()>(
      (value) => value.onPressed,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              strTimer,
              style: const TextStyle(fontSize: 50),
            ),
            IconButton(
                onPressed: onPressed,
                icon: timerRun
                    ? const Icon(Icons.stop_circle_outlined)
                    : const Icon(Icons.play_circle_fill))
          ],
        ),
      ),
    );
  }
}
