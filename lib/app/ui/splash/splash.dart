import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/util/size.dart';

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
      Get.offAndToNamed('/startSplash');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/logo.png",
              width: SizeConfig.widthPercentage(80),
            ),
          ),
        ],
      ),
    );
  }
}
