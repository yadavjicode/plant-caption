import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/const/button_constant.dart';
import 'package:idealista/app/const/font_constant.dart';
import 'package:idealista/app/util/size.dart';
import '../../const/addColor.dart';

class StartSplash extends StatefulWidget {
  const StartSplash({super.key});

  @override
  State<StartSplash> createState() => _StartSplashState();
}

class _StartSplashState extends State<StartSplash> {
  final List<String> imgList = [
    'assets/images/bannerA.jpeg',
    'assets/images/bannerB.jpeg',
    'assets/images/bannerC.jpeg',
  ];

  // Define a list of text captions for each image
  final List<String> captions = [
    'Flexible Timing & Gardening Sevice.',
    'Join & Earn up to ₹ 30000/month',
    'Join our Gardening App Today',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 4 / 5,
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
                            captions[index], // Display caption for each image
                            style: FontConstant.styleBold(
                                fontSize: 24, color: AddColor.blackColor),

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
                          ? AddColor.backgroundColor
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
                    Text(
                      "Made in India",
                      style: FontConstant.styleRegular(
                          fontSize: 12, color: AddColor.grey),
                    ),
                    Text(
                      "5.3.41",
                      style: FontConstant.styleRegular(
                          fontSize: 12, color: AddColor.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        text: "Start Gardening",
                        onPressed: () => {Get.offAndToNamed("/login")},
                        color: AddColor.primaryColor,
                        textStyle: FontConstant.styleRegular(
                            fontSize: 16, color: AddColor.whiteColor)),
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
    );
  }
}
