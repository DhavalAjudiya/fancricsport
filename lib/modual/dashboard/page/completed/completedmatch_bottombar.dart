import 'dart:io';

import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/modual/dashboard/page/completed/complete_page.dart';
import 'package:fancricsport/modual/dashboard/page/completed/matchrun_page.dart';
import 'package:fancricsport/modual/dashboard/page/completed/place_page.dart';
import 'package:fancricsport/modual/dashboard/page/completed/scoreboad_page.dart';
import 'package:fancricsport/modual/dashboard/page/home/home_page.dart';
import 'package:fancricsport/modual/dashboard/page/new/news_dart.dart';
import 'package:fancricsport/modual/dashboard/page/upcoming/upcoming_page.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedPageBottomPage extends StatefulWidget {
  const CompletedPageBottomPage({Key? key}) : super(key: key);

  @override
  State<CompletedPageBottomPage> createState() => _CompletedPageBottomPageState();
}

class _CompletedPageBottomPageState extends State<CompletedPageBottomPage> {
  MatchController matchController = Get.find();

  int pageIndex = 0;

  final pages = [
    ScorePage(),
    MatchRunPage(),
    PlacePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.silverColor),
        backgroundColor: AppColor.blackDarkT,
        title: AppText(matchController.completedType.value,
            fontSize: SizeUtils.fSize_17(),
            color: AppColor.silverColor,
            fontWeight: FontWeight.w600),
      ),
      body: ValueListenableBuilder(
        valueListenable: AppConfig.completedBottomBarValue,
        builder: (BuildContext context, int value, Widget? child) {
          return pages[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: AppConfig.completedBottomBarValue,
        builder: (BuildContext context, int bValue, _) {
          return BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColor.blackDarkT,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.white,
            unselectedItemColor: AppColor.white.withOpacity(0.4),
            selectedLabelStyle: TextStyle(
              fontSize: SizeUtils.fSize_14(),
              fontWeight: FontWeight.w500,
            ),
            currentIndex: bValue,
            showUnselectedLabels: true,
            onTap: (value) async {
              AppConfig.completedBottomBarValue.value = value;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.score,
                ),
                label: "Score Box",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt_sharp,
                ),
                label: "Match Run",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map,
                ),
                label: "Place",
              ),
            ],
          );
        },
      ),
    );
  }
}
