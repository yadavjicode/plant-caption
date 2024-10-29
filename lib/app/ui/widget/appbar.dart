import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../const/addColor.dart';
import '../../const/font_constant.dart';

class AppBarConst {
  Widget appBarOff(BuildContext context, String title, String move) {
    return AppBar(
      elevation: 0,
      backgroundColor: AddColor.whiteColor,
      title: Text(
        title,
        style: FontConstant.styleSemiBold(
            fontSize: 18, color: AddColor.blackColor),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AddColor.blackColor,
        ),
        onPressed: () {
          Get.offAndToNamed('/$move');
        },
      ),
    );
  }
}
