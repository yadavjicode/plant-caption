import 'package:flutter/material.dart';
import 'package:idealista/app/const/CustomTextFeild.dart';
import 'package:idealista/app/const/font_constant.dart';
import '../../../const/addColor.dart';
import '../../../const/button_constant.dart';
import '../../widget/appbar.dart';
import '../../../util/size.dart';

class AadhaarDetail extends StatefulWidget {
  const AadhaarDetail({super.key});

  @override
  State<AadhaarDetail> createState() => _AadhaarDetailState();
}

class _AadhaarDetailState extends State<AadhaarDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AddColor.whiteColor,
        body: SafeArea(
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
                    child: Column(
                      children: [
                        buttonUplaod("Front side of your Aadhaar photo"),
                        SizedBox(
                          height: SizeConfig.heightPercentage(5),
                        ),
                        buttonUplaod("Back side of your Aadhaar photo"),
                        SizedBox(
                          height: SizeConfig.heightPercentage(3),
                        ),
                        const CustomTextField(
                          labelText: "Aadhaar Number",
                          hintText: "Enter Aadhaar Number",
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Eg. 1234 5678 6789",
                              style: FontConstant.styleRegular(
                                  fontSize: 10, color: AddColor.darkgrey),
                            )),
                        SizedBox(
                          height: SizeConfig.heightPercentage(8),
                        ),
                        CustomButton(
                            color: AddColor.primaryColor,
                            textStyle: FontConstant.styleRegular(
                                fontSize: 15, color: AddColor.whiteColor),
                            text: "Submit",
                            onPressed: () => {})
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
