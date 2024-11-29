import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/controller/profile_info_controller.dart';
import 'package:idealista/app/widget/CustomTextFeild.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/widget/font_constant.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widget/button_constant.dart';
import '../../../util/size.dart';
import '../../widget/appbar.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int? gender;
  String? _image;

  final ProfileInfoController profileInfoController =
      Get.put(ProfileInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Obx(() {
          return Stack(children: [
            // Center(
            //   child: Image.asset(
            //     "assets/images/background.png",
            //     fit: BoxFit.cover,
            //     height: double.infinity,
            //     width: double.infinity,
            //   ),
            // ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBarConst()
                        .appBarOff(context, "Profile Info", "registration"),
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
                                    fontSize: 17, color: AppColor.blackColor),
                              )),
                          SizedBox(
                            height: SizeConfig.heightPercentage(3),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Container(
                              height: SizeConfig.widthPercentage(40),
                              width: SizeConfig.widthPercentage(40),
                              decoration: const BoxDecoration(
                                  // border: Border.all(color: AppColor.primaryColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: AppColor.secondaryColor),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  profileInfoController.selectedImage.value !=
                                          null
                                      ? Container(
                                          height:
                                              SizeConfig.widthPercentage(40),
                                          width: SizeConfig.widthPercentage(40),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: AppColor.secondaryColor,
                                            image: profileInfoController
                                                        .selectedImage.value !=
                                                    null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                        profileInfoController
                                                            .selectedImage
                                                            .value!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ))
                                      : Image.asset(
                                          "assets/images/addImage.png",
                                          width: double.infinity,
                                        ),
                                ],
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "+ Upload Profile Image",
                              style: FontConstant.styleRegular(
                                  fontSize: 15, color: AppColor.blackColor),
                              textAlign: TextAlign.center,
                            ),
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
                                    fontSize: 17, color: AppColor.blackColor),
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
                                    activeColor: AppColor.primaryColor,
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
                                    activeColor: AppColor.primaryColor,
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
                              color: AppColor.primaryColor,
                              textStyle: FontConstant.styleRegular(
                                  fontSize: 15, color: AppColor.whiteColor),
                              text: "Submit",
                              onPressed: () => {})
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (profileInfoController.isLoading.value)
              CircularProgressIndicator()
          ]);
        }));
  }

  void _showBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                top: screenHeight * .03, bottom: screenHeight * .05),
            children: [
              //pick profile picture label
              const Text('Pick Profile Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              //for adding some space
              SizedBox(height: screenHeight * .02),

              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize:
                              Size(screenWidth * .3, screenHeight * .15)),
                      onPressed: () async {
                        profileInfoController.pickImageFromGallery();
                      },
                      child: Image.asset('assets/images/add_image.png')),

                  //take picture from camera button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize:
                              Size(screenWidth * .3, screenHeight * .15)),
                      onPressed: () async {
                        profileInfoController.pickImageFromCamera();
                      },
                      child: Image.asset('assets/images/camera.png')),
                ],
              )
            ],
          );
        });
  }
}
