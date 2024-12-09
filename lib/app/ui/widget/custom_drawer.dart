import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/widget/font_constant.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  CustomDrawer({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/header.png"),
            ),
            Expanded(
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  expansionOption("My details"),
                  GestureDetector(
                    child: buildoption(
                        "assets/icons/booking.svg", "Dashboard", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/wallet.svg", "My Profile", 20, 20),
                  ),
                  expansionOption("Payments"),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption("assets/icons/booking.svg",
                        "Plant Ropan Wallet", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Payment methods", 22, 22),
                  ),
                  expansionOption("More"),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Offers", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Referrals", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Incentives", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption("assets/icons/booking.svg",
                        "Know About Plant Ropan", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Rate App", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Privacy Policy", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Notifications", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Account Setting", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/booking.svg", "Log Out", 22, 22),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildoption(
    String imagepath, String tittle, double height, double width) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              imagepath,
              width: width, // Set the desired width
              height: height, // Set the desired height
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                tittle,
                style: FontConstant.styleRegular(
                    fontSize: 15, color: AppColor.blackColor),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 1,
        color: Colors.grey.shade300,
      )
    ],
  );
}

Widget expansionOption(String tittle) {
  return Container(
    color: AppColor.backgroundColor,
    width: double.infinity,
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(left: 50, top: 15, bottom: 6, right: 18),
    child: Text(
      tittle,
      style: FontConstant.styleMedium(fontSize: 17, color: AppColor.blackColor),
    ),
  );
}
