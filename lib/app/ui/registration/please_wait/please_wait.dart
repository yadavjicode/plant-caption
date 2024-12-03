import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/constant/app_color.dart';

import '../../../widget/font_constant.dart';
import '../../../util/size.dart';

class PleaseWait extends StatefulWidget {
  const PleaseWait({super.key});

  @override
  State<PleaseWait> createState() => _PleaseWaitState();
}

class _PleaseWaitState extends State<PleaseWait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthPercentage(8),
            vertical: SizeConfig.heightPercentage(5)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please wait for approval to verify your account",
                textAlign: TextAlign.center,
                style: FontConstant.styleBold(
                    fontSize: 18, color: AppColor.blackColor),
              ),
              SizedBox(
                height: SizeConfig.heightPercentage(3),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GestureDetector(
                  onTap: () => {
                    // Get.offAndToNamed("/dashboard")
                    // Get.offAndToNamed("/otpScreen",arguments: {"phoneno":"9971253602"})
                    },
                  child: Image.asset(
                    "assets/images/warning.png",
                    height: SizeConfig.heightPercentage(25),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
