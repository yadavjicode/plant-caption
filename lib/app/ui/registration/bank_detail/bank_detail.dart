import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/addColor.dart';
import '../../../const/font_constant.dart';
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
              AppBarConst().appBarOff(context, "Bank Detail", "registration")
            ],
          ),
        ));
  }
}
