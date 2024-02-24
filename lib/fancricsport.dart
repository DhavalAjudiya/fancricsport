import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:fancricsport/helper/net_conectivity.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:fancricsport/modual/Ads_helper/ads/open_app_ads.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/utils/app_binding.dart';
import 'package:fancricsport/utils/my_behavior.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class FanCricSport extends StatelessWidget {
  FanCricSport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: Routes.splashPage,
      getPages: Routes.routes,
      builder: (context, child) {
        SizeUtils().init(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ConnectivityWidget(
              builder: (_, __) => BotToastInit()(_, child),
            ),
          ),
        );
      },
    );
  }
}
