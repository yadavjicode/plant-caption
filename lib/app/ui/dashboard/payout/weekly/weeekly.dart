import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/widget/font_constant.dart';

class weekly extends StatefulWidget {
  const weekly({super.key});

  @override
  State<weekly> createState() => _weeklyState();
}

class _weeklyState extends State<weekly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
                  children: [
          Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Text("02 Dec, 2025 - ",
                    style: FontConstant.styleRegular(
                        fontSize: 15, color: AppColor.darkgrey)),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Text("09 Dec 2025",
                        style: FontConstant.styleRegular(
                            fontSize: 15, color: AppColor.darkgrey))),
                Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Performance for Today",
                        style: FontConstant.styleBold(
                            fontSize: 18, color: AppColor.blackColor))),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Column(
                            children: [
                              Text(
                                "Total  Trips",
                                style: FontConstant.styleRegular(
                                    fontSize: 15, color: AppColor.darkgrey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("04",
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 19, color: AppColor.blackColor))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Column(
                            children: [
                              Text(
                                "Login Hours",
                                style: FontConstant.styleRegular(
                                    fontSize: 15, color: AppColor.darkgrey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("17",
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 19, color: AppColor.blackColor))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Column(
                            children: [
                              Text(
                                "Total Works",
                                style: FontConstant.styleRegular(
                                    fontSize: 15, color: AppColor.darkgrey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("10",
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 19, color: AppColor.blackColor))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
                         
          Container(
            margin: const EdgeInsets.all(20.0),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(19)),
                border: Border.all(color: AppColor.grey)),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Earning for Today",
                          style: FontConstant.styleBold(
                              fontSize: 17, color: AppColor.blackColor),
                        ),
                      ),
                      Text("₹ 00.0",
                          style: FontConstant.styleSemiBold(
                              fontSize: 17, color: AppColor.primaryColor))
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primaryColor,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/bag.svg",
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Earning",
                              style: FontConstant.styleMedium(
                                  fontSize: 17, color: AppColor.blackColor),
                            ),
                            Text(
                              "earning per order",
                              style: FontConstant.styleRegular(
                                  fontSize: 13, color: AppColor.darkgrey),
                            ),
                          ],
                        ),
                      ),
                      Text("₹ 00.0",
                          style: FontConstant.styleMedium(
                              fontSize: 17, color: AppColor.blackColor))
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0XFF0B4E85),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/like.svg",
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Gardener Tips",
                          style: FontConstant.styleMedium(
                              fontSize: 17, color: AppColor.blackColor),
                        ),
                      ),
                      Text("₹ 00.0",
                          style: FontConstant.styleMedium(
                              fontSize: 17, color: AppColor.blackColor))
                    ],
                  ),
                )
              ],
            ),
          ),
            WeeklyEarningsBarChart(),
                  ],
                )),
    );
  }
}

class WeeklyEarningsBarChart extends StatelessWidget {
  final List<double> weeklyData = [
    5,
    200,
    150,
    300,
    250,
    400,
    350
  ]; // Earnings for each day

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final days = [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun'
                    ];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        days[value.toInt()],
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                  interval: 1,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      "₹${value.toInt()}",
                      style: const TextStyle(fontSize: 8),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() < weeklyData.length) {
                      return Text(
                        "₹${weeklyData[value.toInt()].toInt()}",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  reservedSize: 20,
                  interval: 1,
                ),
              ),
            ),
            borderData: FlBorderData(
              border: const Border(
                left: BorderSide(color: Colors.black, width: 1),
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            barGroups: weeklyData
                .asMap()
                .entries
                .map(
                  (entry) => BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value,
                        color: Colors.blue,
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                )
                .toList(),
            maxY: 500,
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: WeeklyEarningsBarChart()));
