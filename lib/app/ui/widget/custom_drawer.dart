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
            Stack(children: [
              Image.asset(
                "assets/images/header.png",
                fit: BoxFit.cover,
              ),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prashant Yadav",
                        style: FontConstant.styleSemiBold(
                            fontSize: 16, color: AppColor.whiteColor),
                      ),
                      Text(
                        "+9971253602",
                        style: FontConstant.styleRegular(
                            fontSize: 14, color: AppColor.whiteColor),
                      ),
                      Text(
                        "Member since Nov 2024",
                        style: FontConstant.styleRegular(
                            fontSize: 14, color: AppColor.whiteColor),
                      )
                    ],
                  ))
            ]),
            Expanded(
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  expansionOption("My details"),
                  GestureDetector(
                    child: buildoption(
                        "assets/icons/booking.svg", "My Order", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/myprofile.svg", "My Profile", 22, 24),
                  ),
                  expansionOption("Payments"),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption("assets/icons/wallet.svg",
                        "Plant Ropan Wallet", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: buildoption(
                        "assets/icons/payment.svg", "Payment methods", 24, 24),
                  ),
                  expansionOption("More"),
                  GestureDetector(
                    onTap: () => {},
                    child:
                        buildoption("assets/icons/offer.svg", "Offers", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/referrals.svg", "Referrals", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/incentives.svg", "Incentives", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption("assets/icons/know.svg",
                        "Know About Plant Ropan", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/rate.svg", "Rate App", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/privacy.svg", "Privacy Policy", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption(
                        "assets/icons/notifi.svg", "Notifications", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: buildoption("assets/icons/accountsetting.svg",
                        "Account Setting", 22, 20),
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
            Container(
              width: 30,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                imagepath,
                width: width, // Set the desired width
                height: height, // Set the desired height
              ),
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
    padding: const EdgeInsets.only(left: 60, top: 15, bottom: 6, right: 18),
    child: Text(
      tittle,
      style: FontConstant.styleMedium(fontSize: 17, color: AppColor.blackColor),
    ),
  );
}
