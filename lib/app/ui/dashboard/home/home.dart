import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/ui/dashboard/dashboard.dart';
import 'package:idealista/app/util/size.dart';
import 'package:idealista/app/widget/font_constant.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isOn = true;
  void toggleStatusBarColor(bool value) {
    setState(() {
      isOn = value;
      // SystemChrome.setSystemUIOverlayStyle(
      //   SystemUiOverlayStyle(
      //     statusBarColor: isOn ? Colors.blue : Colors.red, // ON: Blue, OFF: Red
      //     statusBarIconBrightness: isOn ? Brightness.light : Brightness.dark,
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor, // Set the desired color
        statusBarIconBrightness: Brightness.light, // Light or dark icons
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              color: AppColor.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      children: [
                        Text(
                          isOn ? " ON DUTY" : "OFF DUTY",
                          style: FontConstant.styleMedium(
                              fontSize: 13, color: AppColor.blackColor),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: Switch(
                              inactiveTrackColor: Colors.red.shade200,
                              value: isOn,
                              onChanged: toggleStatusBarColor,
                              activeColor: AppColor
                                  .primaryColor, // Color of the switch when ON
                              inactiveThumbColor: AppColor.darkRed),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.alarm,
                    size: 30,
                    color: AppColor.whiteColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.notifications_none,
                    size: 30,
                    color: AppColor.whiteColor,
                  ),
                ],
              ),
            ),
            isOn ? onDuty() : offDuty(),
          ],
        ),
      ),
    );
  }

  Widget offDuty() {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            color: Colors.grey.shade300,
            child: Row(
              children: [
                Text(
                  "Today,s Earnings",
                  style: FontConstant.styleSemiBold(
                      fontSize: 15, color: AppColor.blackColor),
                ),
                const Spacer(),
                Text(
                  "₹ 0.00",
                  style: FontConstant.styleSemiBold(
                      fontSize: 17, color: AppColor.blackColor),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/opentoogle.png",
                    width: SizeConfig.widthPercentage(60),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Good Morning, Prashant Yadav Captain 🌞",
                    style: FontConstant.styleRegular(
                        fontSize: 13, color: AppColor.darkgrey),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Go On Duty to start earning",
                    style: FontConstant.styleSemiBold(
                        fontSize: 20, color: AppColor.blackColor),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget onDuty() {
    return Expanded(child: CurrentLocation());
  }
}
