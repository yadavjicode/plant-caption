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

  Widget aadhaarIcon() {
    if (myProfilrController.member?.data?.profileInfoStepFirst) {
      if (myProfilrController.member?.data?.aadharInfoStepSecond) {
        return Icon(
          Icons.check,
          color: AppColor.primaryColor,
        );
      } else {
        return Icon(Icons.forward, color: AppColor.darkRed);
      }
    } else {
      return Icon(Icons.lock);
    }
  }

  Widget bankIcon() {
    if (myProfilrController.member?.data?.profileInfoStepFirst &&
        myProfilrController.member?.data?.aadharInfoStepSecond) {
      if (myProfilrController.member?.data?.bankInfoStepThird) {
        return Icon(
          Icons.check,
          color: AppColor.primaryColor,
        );
      } else {
        return Icon(
          Icons.forward,
          color: AppColor.darkRed,
        );
      }
    } else {
      return Icon(Icons.lock);
    }
  }

  bool profileStatus() {
    if (myProfilrController.member?.data?.profileInfoStepFirst) {
      return false;
    } else {
      return true;
    }
  }

  bool aadhaarStatus() {
    if (myProfilrController.member?.data?.profileInfoStepFirst) {
      if (myProfilrController.member?.data?.aadharInfoStepSecond) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  bool bankStatus() {
    if (myProfilrController.member?.data?.profileInfoStepFirst &&
        myProfilrController.member?.data?.aadharInfoStepSecond) {
      if (myProfilrController.member?.data?.bankInfoStepThird) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Obx(() {
          return Stack(children: [
            if (!myProfilrController.isLoading.value)
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4))),
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

                      pageContainer(
                          context,
                          "Profile Info",
                          "profileInfo",
                          myProfilrController.member?.data?.profileInfoStepFirst
                              ? const Icon(
                                  Icons.check,
                                  color: AppColor.primaryColor,
                                )
                              : const Icon(
                                  Icons.forward,
                                  color: AppColor.darkRed,
                                ),
                          profileStatus()),
                      pageContainer(context, "Aadhaar Detail", "aadhaarDetail",
                          aadhaarIcon(), aadhaarStatus()),
                      pageContainer(context, "Bank Detail", "bankDetail",
                          bankIcon(), bankStatus()),
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

  Widget pageContainer(BuildContext context, String value, String move,
      Widget icon, bool status) {
    return GestureDetector(
      onTap: () {
        status ? Get.offAndToNamed("/$move") : null;
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
            border: Border.all(
                color: status ? AppColor.darkRed : AppColor.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Expanded(
                child: Text(
              value,
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColor.blackColor),
            )),
            icon
          ],
        ),
      ),
    );
  }
}
