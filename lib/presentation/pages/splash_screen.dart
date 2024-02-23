import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, "/auth");
      },
    );

    return const Scaffold(
      body: Center(
          child: Icon(
        Icons.bus_alert_outlined,
        size: 60,
      )),
    );
  }
}
