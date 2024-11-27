import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_color.dart';
import '../../widget/font_constant.dart';

class AppBarConst {
  Widget appBarOff(BuildContext context, String title, String move) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: FontConstant.styleSemiBold(
            fontSize: 18, color: AppColor.blackColor),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColor.blackColor,
        ),
        onPressed: () {
          Get.offAndToNamed('/$move');
        },
      ),
    );
  }
}
