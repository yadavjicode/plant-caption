import 'package:flutter/material.dart';

import '../../../const/addColor.dart';
import '../../widget/appbar.dart';

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
              AppBarConst().appBarOff(context, "Aadhaar Detail", "registration")
            ],
          ),
        )
    );
  }
}