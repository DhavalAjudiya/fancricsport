import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/Ads_helper/ads/interstitialAd.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/res/strings_utils.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  MatchController matchController = Get.find()..completedMatch();

  String? matchD = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.blackDarkT,
        title: AppText(AppString.completedMatch,
            color: AppColor.white, fontWeight: FontWeight.w600),
      ),
      body: SafeArea(
        child: Obx(
          () => (matchController.completedList.value?.allMatch?.isEmpty ??
                  false)
              ? const Center(
                  child: CupertinoActivityIndicator(color: AppColor.white),
                )
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 15, top: 0),
                  shrinkWrap: true,
                  itemCount:
                      matchController.completedList.value?.allMatch?.length ??
                          0,
                  itemBuilder: (context, index) {
                    final data =
                        matchController.completedList.value?.allMatch?[index];
                    bool timeHeader = true;
                    if (index == 0) {
                      timeHeader = true;

                      matchD = data?.matchtime?.split(" at").first;
                    } else if (matchD ==
                        data?.matchtime?.split(" at").first.toString()) {
                      timeHeader = false;
                    } else {
                      timeHeader = true;
                      matchD = data?.matchtime?.split(" at").first;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: completedCard(
                          onTap: () async {
                            InterstitialAdClass.showInterstitialAds();
                            AppConfig.completedBottomBarValue.value = 0;
                            matchController.completedMatchId.value =
                                data?.matchId.toString() ?? "";
                            matchController.completedTeamA.value =
                                data?.teamA ?? "";
                            matchController.completedType.value =
                                data?.title ?? "";
                            matchController.completedImage.value =
                                data?.imageUrl ?? "";
                            await matchController.getAllPlayer(
                                matchController.completedMatchId.value);
                            Navigation.pushNamed(
                                Routes.completedPageBottomPage);

                            await matchController.matchRunData(
                                matchController.completedMatchId.value);
                            await matchController.matchStatus(
                                matchController.completedMatchId.value);
                          },
                          toss: "",
                          result: data?.result,
                          showDate: timeHeader,
                          time: matchD,
                          header: data?.title,
                          i1: (data?.imageUrl ?? "") + (data?.teamAImage ?? ""),
                          i2: (data?.imageUrl ?? "") + (data?.teamBImage ?? ""),
                          t1: data?.teamA,
                          subHeader: data?.matchtype ?? "",
                          venue: data?.venue,
                          startTime: data?.matchtime,
                          t2: data?.teamB),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                        (index + 1) % 2 == 0
                            ? const BannerAds()
                            : const SizedBox(),
                        SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
