import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/controller/my_profile_controller%20copy.dart';
import 'package:idealista/app/widget/font_constant.dart';
import 'package:idealista/app/util/size.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final MyProfilrController myProfilrController =
      Get.put(MyProfilrController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      myProfilrController.myProfile(context);
    });
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
                    // GestureDetector(
                    //   onTap: () => {Get.offAndToNamed("/login")},
                    //   child: Container(
                    //       padding: EdgeInsets.all(SizeConfig.widthPercentage(3)),
                    //       alignment: Alignment.centerLeft,
                    //       child: const Icon(Icons.arrow_back,color: AppColor.blackColor,)),
                    // ),
                    Container(
                      decoration:
                          const BoxDecoration(color: AppColor.primaryColor),
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.heightPercentage(1)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => {Get.offAndToNamed("/login")},
                            child: Container(
                                padding: EdgeInsets.all(
                                    SizeConfig.widthPercentage(3)),
                                alignment: Alignment.centerLeft,
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: AppColor.whiteColor,
                                )),
                          ),
                          Expanded(
                              child: Text(
                            "Please Complete all the steps to activate your account",
                            style: FontConstant.styleMedium(
                                fontSize: 15, color: AppColor.whiteColor),
                          )),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.whiteColor, width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthPercentage(2),
                                vertical: SizeConfig.heightPercentage(0.5)),
                            child: const Icon(
                              Icons.person_sharp,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),

                    pageContainer(context, "Profile Info", "profileInfo"),
                    pageContainer(context, "Aadhaar Detail", "aadhaarDetail"),
                    pageContainer(context, "Bank Detail", "bankDetail"),
                  ],
                ),
              ),
            ),
            if (myProfilrController.isLoading.value)
              const Center(
                  child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ))
          ]);
        }));
  }

  Widget pageContainer(BuildContext context, String value, String move) {
    return GestureDetector(
      onTap: () {
        Get.offAndToNamed("/$move");
      },
      // onTap: () =>
      //     {FocusScope.of(context).unfocus(), Get.offAndToNamed("/$move")},
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.widthPercentage(3.5),
            right: SizeConfig.widthPercentage(3.5),
            top: SizeConfig.heightPercentage(2.5)),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthPercentage(3.5),
            vertical: SizeConfig.heightPercentage(3)),
        decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Expanded(
                child: Text(
              value,
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColor.blackColor),
            )),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
