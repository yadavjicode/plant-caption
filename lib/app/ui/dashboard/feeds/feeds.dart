import 'package:flutter/material.dart';
import 'package:idealista/app/constant/app_color.dart';
import 'package:idealista/app/util/size.dart';
import 'package:idealista/app/widget/font_constant.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final List<Map<String, String>> data = [
    {
      'image': 'assets/images/feedA.png',
      'tittle': 'Monsoon Trip',
      'value': 'Lorem Ipsum is simply is a dummy text of printing.'
    },
    {
      'image': 'assets/images/feedB.png',
      'tittle': 'Gardening Services',
      'value': 'Lorem Ipsum is simply is a dummy text of printing.'
    },
    {
      'image': 'assets/images/feedA.png',
      'tittle': 'Monsoon Trip',
      'value': 'Lorem Ipsum is simply is a dummy text of printing.'
    },
    {
      'image': 'assets/images/feedB.png',
      'tittle': 'Gardening Services',
      'value': 'Lorem Ipsum is simply is a dummy text of printing.'
    },
    {
      'image': 'assets/images/feedA.png',
      'tittle': 'Monsoon Trip',
      'value': 'Lorem Ipsum is simply is a dummy text of printing.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: const BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: const BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "Average Performance",
                              style: FontConstant.styleRegular(
                                  fontSize: 13, color: AppColor.blackColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "15/20 Completed Orders",
                          style: FontConstant.styleSemiBold(
                              fontSize: 15, color: AppColor.blackColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: const BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              width: 90,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Know More",
                                      style: FontConstant.styleRegular(
                                          fontSize: 13,
                                          color: AppColor.blackColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      "assets/images/profile.png",
                      height: 60,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: data.map((item) {
                      return Card(
                        color: Colors.grey.shade100,
                        margin: const EdgeInsets.symmetric(vertical: 3.0),
                        shadowColor: AppColor.blackColor,
                        borderOnForeground: true,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image.asset(
                                    '${item['image']}',
                                    height: 100,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${item['tittle']}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: FontConstant.styleMedium(
                                            fontSize: 15,
                                            color: AppColor.blackColor)),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.date_range,
                                          color: AppColor.primaryColor,
                                        ),
                                        Expanded(
                                          child: Text("28 Nov 24",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: FontConstant.styleRegular(
                                                  fontSize: 15,
                                                  color:
                                                      AppColor.primaryColor)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text('${item['value']}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: FontConstant.styleRegular(
                                            fontSize: 12,
                                            color: AppColor.darkgrey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/banner.png",
                height: SizeConfig.heightPercentage(15),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
          ],
        ),
      )),
    );
  }
}
