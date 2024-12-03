import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/controller/bank_details_controller.dart';
import 'package:idealista/app/ui/widget/CustomSnackbar.dart';
import 'package:idealista/app/widget/CustomTextFeild.dart';

import '../../../constant/app_color.dart';
import '../../../widget/button_constant.dart';
import '../../../widget/font_constant.dart';
import '../../../util/size.dart';
import '../../widget/appbar.dart';

class BankDetail extends StatefulWidget {
  const BankDetail({super.key});

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  final BankDetailsController bankDetailsController =
      Get.put(BankDetailsController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isReEnterBankNumberHidden = true;
  final TextEditingController holderNameControler = TextEditingController();
  final TextEditingController accountNoControler = TextEditingController();
  final TextEditingController reaccountNoControler = TextEditingController();
  final TextEditingController bankNameControler = TextEditingController();
  final TextEditingController ifscControler = TextEditingController();
  bool validation() {
    if (formKey.currentState!.validate() &&
        bankDetailsController.bankImage.value != null) {
      return true;
    } else if (bankDetailsController.bankImage.value == null) {
      CustomSanckbar.showSnackbar(
          context, "Please select Bank Passbook image!", false);
      return false;
    }
    {
      return false;
    }
  }


  @override
  void dispose() {
    bankDetailsController.bankImage.value = null;
    // bankDetailsController.dispose();
    super.dispose();
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
                      .appBarOff(context, "Bank Detail", "registration"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthPercentage(8),
                            vertical: SizeConfig.heightPercentage(2)),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Provide your bank details",
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 17,
                                        color: AppColor.blackColor),
                                  )),
                              SizedBox(
                                height: SizeConfig.heightPercentage(2),
                              ),
                              CustomTextField(
                                controller: holderNameControler,
                                labelText: "Account holder name",
                                hintText: "Enter holder name",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter holder name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.heightPercentage(1),
                              ),
                              CustomTextField(
                                controller: accountNoControler,
                                labelText: "Account number",
                                hintText: "Enter Account number",
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter account number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.heightPercentage(1),
                              ),
                              CustomTextField(
                                controller: reaccountNoControler,
                                labelText: "Re-enter account number",
                                hintText: "Re-enter account number",
                                obscureText: _isReEnterBankNumberHidden,
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isReEnterBankNumberHidden
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isReEnterBankNumberHidden =
                                            !_isReEnterBankNumberHidden;
                                      });
                                    }),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter re_account number';
                                  } else if (accountNoControler.text
                                          .toString()
                                          .trim() !=
                                      reaccountNoControler.text
                                          .toString()
                                          .trim()) {
                                    return 'Please enter correct account number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.heightPercentage(1),
                              ),
                              CustomTextField(
                                controller: bankNameControler,
                                labelText: "Bank name",
                                hintText: "Enter Bank name",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter account name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.heightPercentage(1),
                              ),
                              CustomTextField(
                                controller: ifscControler,
                                labelText: "IFSC code",
                                hintText: "Enter IFSC code",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter IFSC code';
                                  }
                                  return null;
                                },
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 4),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Eg. ABCD000123  you can find it on your passbook or chequebook",
                                    style: FontConstant.styleRegular(
                                        fontSize: 10, color: AppColor.darkgrey),
                                  )),
                              SizedBox(
                                height: SizeConfig.heightPercentage(2),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _showBottomSheet(context);
                                  },
                                  child: bankDetailsController
                                              .bankImage.value !=
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
                                            image: bankDetailsController
                                                        .bankImage.value !=
                                                    null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                        bankDetailsController
                                                            .bankImage.value!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ))
                                      : buttonUplaod(
                                          "Bank passbook image upload")),
                              SizedBox(
                                height: SizeConfig.heightPercentage(4),
                              ),
                              CustomButton(
                                  color: AppColor.primaryColor,
                                  textStyle: FontConstant.styleRegular(
                                      fontSize: 15, color: AppColor.whiteColor),
                                  text: "Verify bank details",
                                  onPressed: () => {
                                        if (validation())
                                          {
                                            bankDetailsController.bankDetails(
                                                context,
                                                holderNameControler.text
                                                    .toString()
                                                    .trim(),
                                                reaccountNoControler.text
                                                    .toString()
                                                    .trim(),
                                                bankNameControler.text
                                                    .toString()
                                                    .trim(),
                                                ifscControler.text
                                                    .toString()
                                                    .trim(),
                                                bankDetailsController
                                                    .bankImage.value!)
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
            if (bankDetailsController.isLoading.value)
              Center(
                  child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ))
          ]);
        }));
  }

  Widget buttonUplaod(String title) {
    return Container(
      width: SizeConfig.widthPercentage(80),
      height: SizeConfig.widthPercentage(80) * 4 / 7,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red.shade400),
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
                onPressed: () => {_showBottomSheet(context)})
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
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
                        bankDetailsController.pickImageFromGallery();
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
                        bankDetailsController.pickImageFromCamera();
                      },
                      child: Image.asset('assets/images/camera.png')),
                ],
              )
            ],
          );
        });
  }
}
