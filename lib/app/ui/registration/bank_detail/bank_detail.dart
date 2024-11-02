import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealista/app/const/CustomTextFeild.dart';

import '../../../const/addColor.dart';
import '../../../const/button_constant.dart';
import '../../../const/font_constant.dart';
import '../../../util/size.dart';
import '../../widget/appbar.dart';

class BankDetail extends StatefulWidget {
  const BankDetail({super.key});

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AddColor.whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              AppBarConst().appBarOff(context, "Bank Detail", "registration"),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(8),
                        vertical: SizeConfig.heightPercentage(2)),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Provide your bank details",
                              style: FontConstant.styleSemiBold(
                                  fontSize: 17, color: AddColor.blackColor),
                            )),
                        SizedBox(
                          height: SizeConfig.heightPercentage(2),
                        ),
                        CustomTextField(
                          labelText: "Account number",
                          hintText: "Enter Account number",
                        ),
                        SizedBox(
                          height: SizeConfig.heightPercentage(1),
                        ),
                        CustomTextField(
                          labelText: "Re-enter account number",
                          hintText: "Re-enter account number",
                        ),
                        SizedBox(
                          height: SizeConfig.heightPercentage(1),
                        ),
                        CustomTextField(
                          labelText: "Bank name",
                          hintText: "Enter Bank name",
                        ),
                        SizedBox(
                          height: SizeConfig.heightPercentage(1),
                        ),
                        CustomTextField(
                          labelText: "IFSC code",
                          hintText: "Enter IFSC code",
                        ),
                         Container(
                        
                        
                            padding: EdgeInsets.symmetric(horizontal: 7,vertical: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Eg. ABCD000123  you can find it on your passbook or chequebook",
                              style: FontConstant.styleRegular(
                                  fontSize: 10, color: AddColor.darkgrey),
                            )),
                        SizedBox(
                          height: SizeConfig.heightPercentage(2),
                        ),
                        buttonUplaod("Bank passbook image upload"),
                        SizedBox(
                          height: SizeConfig.heightPercentage(4),
                        ),
                        CustomButton(
                            
                            color: AddColor.primaryColor,
                            textStyle: FontConstant.styleRegular(
                                fontSize: 15, color: AddColor.whiteColor),
                            text: "Verify bank details",
                            onPressed: () => {
                              Get.toNamed("/pleaseWait")
                            })
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget buttonUplaod(String title) {
    return Container(
      width: double.infinity,
      height: SizeConfig.heightPercentage(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthPercentage(5)),
        child: Column(
          children: [
            Text(
              title,
              style: FontConstant.styleRegular(
                  fontSize: 15, color: AddColor.darkgrey),
            ),
            Spacer(),
            CustomButton(
                radius: 5,
                color: AddColor.primaryColor,
                textStyle: FontConstant.styleRegular(
                    fontSize: 15, color: AddColor.whiteColor),
                text: "Upload Photo",
                onPressed: () => {})
          ],
        ),
      ),
    );
  }
}
