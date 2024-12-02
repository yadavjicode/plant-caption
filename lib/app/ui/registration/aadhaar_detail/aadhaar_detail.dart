import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/controller/addhaar_controller.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';
import 'package:idealista/app/widget/CustomTextFeild.dart';
import 'package:idealista/app/widget/font_constant.dart';
import '../../../constant/app_color.dart';
import '../../../widget/button_constant.dart';
import '../../widget/appbar.dart';
import '../../../util/size.dart';

class AadhaarDetail extends StatefulWidget {
  const AadhaarDetail({super.key});

  @override
  State<AadhaarDetail> createState() => _AadhaarDetailState();
}

class _AadhaarDetailState extends State<AadhaarDetail> {
  final AddhaarController addhaarController = Get.put(AddhaarController());
  final TextEditingController aadhaarController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validation() {
    if (formKey.currentState!.validate() &&
        addhaarController.frontAddharImage.value != null &&
        addhaarController.backAddharImage.value != null) {
      return true;
    } else if (addhaarController.frontAddharImage.value == null) {
      CustomSanckbar.showSnackbar(
          context, "Please select front Aadhaar image!", false);
      return false;
    } else if (addhaarController.backAddharImage.value == null) {
      CustomSanckbar.showSnackbar(
          context, "Please select back Aadhaar image!", false);
      return false;
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
            SafeArea(
              child: Column(
                children: [
                  AppBarConst()
                      .appBarOff(context, "Aadhaar Detail", "registration"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthPercentage(8),
                            vertical: SizeConfig.heightPercentage(5)),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    _showBottomSheet(context, true);
                                  },
                                  child: addhaarController
                                              .frontAddharImage.value !=
                                          null
                                      ? Container(
                                          width: SizeConfig.widthPercentage(80),
                                          height:
                                              SizeConfig.widthPercentage(80) *
                                                  4 /
                                                  7,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                color: AppColor.primaryColor),
                                            image: addhaarController
                                                        .frontAddharImage
                                                        .value !=
                                                    null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                        addhaarController
                                                            .frontAddharImage
                                                            .value!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ))
                                      : buttonUplaod(
                                          "Front side of your Aadhaar photo",
                                          true,
                                          addhaarController
                                                  .frontAddharImage.value !=
                                              null)),
                              SizedBox(
                                height: SizeConfig.heightPercentage(5),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _showBottomSheet(context, false);
                                  },
                                  child: addhaarController
                                              .backAddharImage.value !=
                                          null
                                      ? Container(
                                          width: SizeConfig.widthPercentage(80),
                                          height:
                                              SizeConfig.widthPercentage(80) *
                                                  4 /
                                                  7,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                                color: AppColor.primaryColor),
                                            image: addhaarController
                                                        .backAddharImage
                                                        .value !=
                                                    null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                        addhaarController
                                                            .backAddharImage
                                                            .value!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ))
                                      : buttonUplaod(
                                          "Back side of your Aadhaar photo",
                                          false,
                                          addhaarController
                                                  .backAddharImage.value !=
                                              null)),
                              SizedBox(
                                height: SizeConfig.heightPercentage(3),
                              ),
                              CustomTextField(
                                keyboardType: TextInputType.number,
                                controller: aadhaarController,
                                maxlength: 12,
                                labelText: "Aadhaar Number",
                                hintText: "Enter Aadhaar Number",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Aadhaar number';
                                  } else if (value.length != 12) {
                                    return 'Please enter valid Aadhaar number';
                                  }
                                  return null;
                                },
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 4),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Eg. 1234 5678 6789",
                                    style: FontConstant.styleRegular(
                                        fontSize: 10, color: AppColor.darkgrey),
                                  )),
                              SizedBox(
                                height: SizeConfig.heightPercentage(8),
                              ),
                              CustomButton(
                                  color: AppColor.primaryColor,
                                  textStyle: FontConstant.styleRegular(
                                      fontSize: 15, color: AppColor.whiteColor),
                                  text: "Submit",
                                  onPressed: () => {
                                        if (validation())
                                          {
                                            addhaarController.aadhaarDetails(
                                                context,
                                                aadhaarController.text
                                                    .toString()
                                                    .trim(),
                                                addhaarController
                                                    .frontAddharImage.value!,
                                                addhaarController
                                                    .backAddharImage.value!)
                                          }
                                      })
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (addhaarController.isLoading.value)
              const Center(
                  child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ))
          ]);
        }));
  }

  Widget buttonUplaod(String title, bool side, bool status) {
    return Container(
      width: SizeConfig.widthPercentage(80),
      height: SizeConfig.widthPercentage(80) * 4 / 7,
      decoration: BoxDecoration(
          border: Border.all(color: status ? AppColor.darkgrey : Colors.red),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthPercentage(5)),
        child: Column(
          children: [
            Text(
              title,
              style: FontConstant.styleRegular(
                  fontSize: 15, color: AppColor.darkgrey),
            ),
            Spacer(),
            CustomButton(
                radius: 5,
                color: AppColor.primaryColor,
                textStyle: FontConstant.styleRegular(
                    fontSize: 15, color: AppColor.whiteColor),
                text: "Upload Photo",
                onPressed: () => {_showBottomSheet(context, side)})
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, bool side) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        backgroundColor: AppColor.backgroundColor,
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
                        addhaarController.pickImageFromGallery(side);
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
                        addhaarController.pickImageFromCamera(side);
                      },
                      child: Image.asset('assets/images/camera.png')),
                ],
              )
            ],
          );
        });
  }
}
