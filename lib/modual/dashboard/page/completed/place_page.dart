import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PlacePage extends StatelessWidget {
  PlacePage({Key? key}) : super(key: key);
  MatchController matchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      body: Column(
        children: [
          matchController.matchStatusList.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(AssetsPath.empty),
                        AppText("No Data found",
                            fontSize: SizeUtils.fSize_21(),
                            color: AppColor.darkGrayTextDarkT,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      bottom: SizeUtils.horizontalBlockSize * 5,
                      right: SizeUtils.horizontalBlockSize * 2,
                      left: SizeUtils.horizontalBlockSize * 2,
                    ),
                    itemCount: matchController.matchStatusList.length,
                    itemBuilder: (context, index) {
                      final data = matchController.matchStatusList[index];
                      String a = Bidi.stripHtmlIfNeeded(data?.stat1descr ?? "");
                      String b = Bidi.stripHtmlIfNeeded(data?.stat2descr ?? "");
                      String c = Bidi.stripHtmlIfNeeded(data?.stat3descr ?? "");

                      return Column(
                        children: [
                          a.isEmpty
                              ? const SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                      backgroundBlendMode: BlendMode.screen,
                                      color: AppColor.bgColorDarkT,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: SizeUtils.horizontalBlockSize * 2,
                                        vertical: SizeUtils.horizontalBlockSize * 2),
                                    child: AppText(a,
                                        fontSize: SizeUtils.fSize_15(),
                                        color: AppColor.silverColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                          a.isEmpty ? const SizedBox() : BannerAds(adSize: true),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                          b.isEmpty
                              ? const SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                      backgroundBlendMode: BlendMode.screen,
                                      color: AppColor.bgColorDarkT,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: SizeUtils.horizontalBlockSize * 2,
                                        vertical: SizeUtils.horizontalBlockSize * 2),
                                    child: AppText(b,
                                        fontSize: SizeUtils.fSize_15(),
                                        color: AppColor.silverColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                          b.isEmpty ? const SizedBox() : BannerAds(adSize: true),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                          c.isEmpty
                              ? const SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                      backgroundBlendMode: BlendMode.screen,
                                      color: AppColor.bgColorDarkT,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: SizeUtils.horizontalBlockSize * 2,
                                        vertical: SizeUtils.horizontalBlockSize * 2),
                                    child: AppText(c,
                                        fontSize: SizeUtils.fSize_15(),
                                        color: AppColor.silverColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                          c.isEmpty ? const SizedBox() : BannerAds(adSize: true),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                        ],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
