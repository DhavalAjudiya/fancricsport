import 'dart:async';
import 'dart:developer';

import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:fancricsport/modual/Ads_helper/ads/open_app_ads.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  @override
  void initState() {
    super.initState();

    startTimeOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      body: Container(
        alignment: Alignment.bottomCenter,
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/splash.jpg"), fit: BoxFit.cover)),
        child: Image.asset(
          "assets/image/splash_loaderAnimation.gif",
          scale: 5,
        ),
      ),
    );
  }

  void startTimeOut() {
    Timer(
      const Duration(seconds: 2),
      () {
        appOpenAdManager.loadSplashAds(id: AdConstants.appOpenAdsId);
        Navigation.pushNamed(Routes.bottomPage);
      },
    );
  }
}
