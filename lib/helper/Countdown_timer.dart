import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({super.key});

  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  initState() {
    _startCountdown();
  }

  Timer? _timer;
  int _remainingSeconds;

  _CountdownTimerPageState({int startSeconds = 1000000})
      : _remainingSeconds = startSeconds;

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingSeconds <= 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _test() {
    var diffseconds = _remainingSeconds;

    var seconds = diffseconds % 60;
    var minute = diffseconds ~/ 60 % 60;
    var hour = diffseconds ~/ 60 ~/ 60 % 24;
    var day = diffseconds ~/ 60 ~/ 60 ~/ 24;

    return ('$hour:$minute:$seconds');
  }

  @override
  Widget build(BuildContext context) {
    return Text(_test(),
        style: TextStyle(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold));
  }
}
