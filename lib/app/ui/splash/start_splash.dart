import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/pageRoute/page_route.dart';

import 'package:idealista/app/widget/button_constant.dart';
import 'package:idealista/app/widget/font_constant.dart';
import 'package:idealista/app/util/size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/app_color.dart';
import '../../controller/my_profile_controller copy.dart';

class StartSplash extends StatefulWidget {
  const StartSplash({super.key});

  @override
  State<StartSplash> createState() => _StartSplashState();
}

class _StartSplashState extends State<StartSplash> {
  final MyProfilrController myProfilrController =
      Get.put(MyProfilrController());
  final List<String> imgList = [
    'assets/images/sliderA.png',
    'assets/images/sliderB.png',
    'assets/images/sliderC.png',
  ];

  // Define a list of text captions for each image
  final List<String> captions = [
    'Flexible Timing & Gardening Sevice.',
    'Join & Earn up to ₹ 30000/month',
    'Join our Gardening App Today',
  ];

  int _currentIndex = 0;
  Future<void> _loadTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      myProfilrController.myProfile(context).then((_) {
        if (myProfilrController.member?.data?.profileInfoStepFirst &&
            myProfilrController.member?.data?.aadharInfoStepSecond &&
            myProfilrController.member?.data?.bankInfoStepThird) {
          Get.offAndToNamed(PageRoutes.pleaseWait);
        } else {
          Get.offAndToNamed(PageRoutes.registration);
        }
      });
    } else {
      Get.offAndToNamed(PageRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Obx(() {
          return Stack(children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 4 / 6,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: imgList.asMap().entries.map((entry) {
                          int index = entry.key;
                          String imageUrl = entry.value;
                          return Column(
                            children: [
                              Expanded(
                                // Wrap Image.asset with Expanded to avoid overflow
                                child: ClipRRect(
                                  child: Image.asset(
                                    imageUrl,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                child: Text(
                                  captions[
                                      index], // Display caption for each image
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 24, color: AppColor.blackColor),

                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((url) {
                        int index = imgList.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? AppColor.backgroundColor
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Made in India",
                                style: FontConstant.styleRegular(
                                    fontSize: 12, color: AppColor.darkgrey),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/images/flag.png",
                                height: 20,
                                width: 20,
                              )
                            ],
                          ),
                          Text(
                            "5.3.41",
                            style: FontConstant.styleRegular(
                                fontSize: 12, color: AppColor.darkgrey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                              text: "GET STARTED",
                              onPressed: () => {_loadTokenAndNavigate()},
                              color: AppColor.primaryColor,
                              textStyle: FontConstant.styleSemiBold(
                                  fontSize: 16, color: AppColor.whiteColor)),
                          SizedBox(
                            height: SizeConfig.heightPercentage(5),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (myProfilrController.isLoading.value)
              Center(
                  child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ))
          ]);
        }));
  }
}
