import 'package:flutter/material.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/ui/dashboard/payout/daily/daily.dart';
import 'package:idealista/app/widget/font_constant.dart';

class Payout extends StatelessWidget {
  const Payout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: TabBar(
            indicatorColor: AppColor.primaryColor,
            labelStyle: FontConstant.styleSemiBold(
                fontSize: 15, color: AppColor.primaryColor),
            unselectedLabelStyle:
                FontConstant.styleMedium(fontSize: 15, color: AppColor.darkRed),
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.darkgrey,
            tabs: const [
              Tab(text: 'Daily'),
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Daily(),
            Center(child: Text('Discover Content')),
            Center(child: Text('Friends Content')),
          ],
        ),
      ),
    );
  }
}
