import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idealista/app/const/addColor.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offNamed('/startSplash');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AddColor.whiteColor,
        child: Image.asset("assets/images/logo.jpeg"),
      ),
    );
  }
}
