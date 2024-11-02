import 'package:flutter/material.dart';
import 'package:idealista/app/const/CustomTextFeild.dart';
import 'package:idealista/app/const/addColor.dart';
import 'package:idealista/app/const/font_constant.dart';
import '../../../const/button_constant.dart';
import '../../../util/size.dart';
import '../../widget/appbar.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AddColor.whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              AppBarConst().appBarOff(context, "Profile Info", "registration"),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthPercentage(8),
                    vertical: SizeConfig.heightPercentage(5)),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Some basic details",
                          style: FontConstant.styleSemiBold(
                              fontSize: 17, color: AddColor.blackColor),
                        )),
                    SizedBox(
                      height: SizeConfig.heightPercentage(3),
                    ),
                    Container(
                      height: SizeConfig.widthPercentage(40),
                      width: SizeConfig.widthPercentage(40),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image_sharp,
                            size: SizeConfig.widthPercentage(20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Select Profile Image",
                              style: FontConstant.styleRegular(
                                  fontSize: 15, color: AddColor.blackColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: SizeConfig.heightPercentage(3),
                    ),
                    CustomTextField(
                      labelText: "First name",
                      hintText: "Enter First name",
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2)),
                    CustomTextField(
                      labelText: "Last name",
                      hintText: "Enter Last name",
                    ),
                    SizedBox(
                      height: SizeConfig.heightPercentage(3),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select your gender",
                          style: FontConstant.styleSemiBold(
                              fontSize: 17, color: AddColor.blackColor),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                if (gender == 1) {
                                  gender = 0;
                                } else {
                                  gender = 1;
                                }
                              });
                            },
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Male'),
                              activeColor: AddColor.primaryColor,
                              value: 1,
                              groupValue: gender,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    gender = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                if (gender == 2) {
                                  gender = 0;
                                } else {
                                  gender = 2;
                                }
                              });
                            },
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Female'),
                              activeColor: AddColor.primaryColor,
                              value: 2,
                              groupValue: gender,
                              onChanged: (int? value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightPercentage(3),
                    ),
                    CustomButton(
                        color: AddColor.primaryColor,
                        textStyle: FontConstant.styleRegular(
                            fontSize: 15, color: AddColor.whiteColor),
                        text: "Submit",
                        onPressed: () => {})
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
