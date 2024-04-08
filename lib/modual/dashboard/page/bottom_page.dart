import 'dart:developer';
import 'dart:io';

import 'package:fancricsport/modual/dashboard/page/completed/complete_page.dart';
import 'package:fancricsport/modual/dashboard/page/fantasy/fantasy_page.dart';
import 'package:fancricsport/modual/dashboard/page/home/home_page.dart';
import 'package:fancricsport/modual/dashboard/page/new/news_dart.dart';
import 'package:fancricsport/modual/dashboard/page/upcoming/upcoming_page.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int pageIndex = 0;

  final pages = [HomePage(), FantasyPage(), UpComingPage(), CompletedPage(), NewsPage()];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: AppConfig.bottomBarValue,
          builder: (BuildContext context, int value, Widget? child) {
            return pages[value];
          },
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: AppConfig.bottomBarValue,
          builder: (BuildContext context, int bValue, _) {
            return BottomNavigationBar(
              backgroundColor: AppColor.blackDarkT,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColor.white,
              unselectedItemColor: AppColor.darkGrayTextDarkT,
              selectedLabelStyle: TextStyle(
                fontSize: SizeUtils.fSize_14(),
                fontWeight: FontWeight.w600,
              ),
              currentIndex: bValue,
              showUnselectedLabels: true,
              onTap: (value) async {
                AppConfig.bottomBarValue.value = value;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(AssetsPath.live,
                      height: SizeUtils.horizontalBlockSize * 7,
                      color: AppConfig.bottomBarValue.value == 0
                          ? AppColor.white
                          : AppColor.darkGrayTextDarkT),
                  label: "Live",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetsPath.fantasy,
                      height: SizeUtils.horizontalBlockSize * 7,
                      color: AppConfig.bottomBarValue.value == 1
                          ? AppColor.white
                          : AppColor.darkGrayTextDarkT),
                  label: "Fantasy",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetsPath.upComing,
                      height: SizeUtils.horizontalBlockSize * 7,
                      color: AppConfig.bottomBarValue.value == 2
                          ? AppColor.white
                          : AppColor.darkGrayTextDarkT),
                  label: "UpComing",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetsPath.completed,
                      height: SizeUtils.horizontalBlockSize * 7,
                      color: AppConfig.bottomBarValue.value == 3
                          ? AppColor.white
                          : AppColor.darkGrayTextDarkT),
                  label: "Completed",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetsPath.news,
                      height: SizeUtils.horizontalBlockSize * 7,
                      color: AppConfig.bottomBarValue.value == 4
                          ? AppColor.white
                          : AppColor.darkGrayTextDarkT),
                  label: "News",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
