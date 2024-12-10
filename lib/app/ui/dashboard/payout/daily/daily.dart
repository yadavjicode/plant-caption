import 'package:flutter/material.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/widget/font_constant.dart';

class Daily extends StatefulWidget {
  const Daily({super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Text("Today :",
                    style: FontConstant.styleRegular(
                        fontSize: 15, color: AppColor.blackColor)),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Text("29 Nov, 2025",
                        style: FontConstant.styleRegular(
                            fontSize: 15, color: AppColor.darkgrey))),
                Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Performance for Today",
                        style: FontConstant.styleBold(
                            fontSize: 18, color: AppColor.blackColor))),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [Text("Total  Trips"), Text("04")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Text("Login Hours"), Text("10")],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Text("Total Works"), Text("10")],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
