import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/const/addColor.dart';
import 'package:idealista/app/const/font_constant.dart';
import 'package:idealista/app/util/size.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AddColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => {Get.offAndToNamed("/login")},
                child: Container(
                    padding: EdgeInsets.all(SizeConfig.widthPercentage(3)),
                    alignment: Alignment.centerLeft,
                    child: const Icon(Icons.arrow_back)),
              ),
              Container(
                decoration: const BoxDecoration(color: AddColor.primaryColor),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthPercentage(5),
                    vertical: SizeConfig.heightPercentage(3)),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Please Complete all the steps to activate your account",
                      style: FontConstant.styleMedium(
                          fontSize: 15, color: AddColor.whiteColor),
                    )),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AddColor.whiteColor, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthPercentage(3),
                          vertical: SizeConfig.heightPercentage(1)),
                      child: const Icon(
                        Icons.person_sharp,
                        color: AddColor.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              pageContainer("Profile Info", "profileInfo"),
              pageContainer("Aadhaar Detail", "bankDetail"),
              pageContainer("Bank Detail", "aadhaarDetail")
            ],
          ),
        ),
      ),
    );
  }

  Widget pageContainer(String value, String move) {
    return GestureDetector(
      onTap: () => {Get.offAndToNamed("/${move}")},
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.widthPercentage(3.5),
            right: SizeConfig.widthPercentage(3.5),
            top: SizeConfig.heightPercentage(2.5)),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthPercentage(3.5),
            vertical: SizeConfig.heightPercentage(3)),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Expanded(
                child: Text(
              value,
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AddColor.blackColor),
            )),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
