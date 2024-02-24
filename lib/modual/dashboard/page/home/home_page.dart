import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fancricsport/helper/shared_preference.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/Ads_helper/ads/open_app_ads.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/modual/dashboard/modal/live_matchmodal.dart';
import 'package:fancricsport/modual/dashboard/service/live_matchservice.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MatchController matchController = Get.find();
  StreamController<List<LiveMatchModal>> streamController = StreamController();
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  @override
  void initState() {
    // showAd();
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      employeeControllerMethod();
    });
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

  Future<LiveMatchModal?> employeeControllerMethod() async {
    matchController.cricketModalList.value = await MatchService().liveMatch() ?? [];
    streamController.sink.add(matchController.cricketModalList.value);
  }

  LiveMatchJsonRunModal? jsonRun;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.blackDarkT,
        title: const AppText("FanCric", color: AppColor.white, fontWeight: FontWeight.w600),
      ),
      body: SafeArea(
        child: StreamBuilder<List<LiveMatchModal>>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            matchController.cricketModalList.value = snapshot.data ?? [];
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CupertinoActivityIndicator(color: AppColor.white),
                );
              default:
                if (snapshot.hasError) {
                  return const Text("Please Wait");
                } else {
                  String matchDate = "";

                  return Obx(
                    () => ListView.separated(
                      padding: const EdgeInsets.only(bottom: 15, top: 10),
                      shrinkWrap: true,
                      itemCount: matchController.cricketModalList.value.length,
                      itemBuilder: (context, index) {
                        final data = matchController.cricketModalList.value[index];

                        String toss;
                        Jsonruns? jRun;
                        if ((data.jsondata?.isNotEmpty ?? false) &&
                            (data.jsonruns?.isNotEmpty ?? false)) {
                          String a = data.jsondata.toString().replaceAll("\n", "");
                          String b = data.jsonruns.toString().replaceAll("\n", "");
                          Map<String, dynamic> mapData = jsonDecode(a);
                          Map<String, dynamic> mapRun = jsonDecode(b);
                          jsonRun = LiveMatchJsonRunModal.fromJson(mapRun);
                          jRun = jsonRun?.jsonruns;

                          if (data.jsondata.toString().contains("Toss - ")) {
                            toss = data.jsondata.toString().split("Toss - ").last;
                          } else {
                            toss = "";
                          }
                        } else {
                          jRun = null;
                          toss = "";
                        }

                        bool timeHeader = true;
                        if (index == 0) {
                          timeHeader = true;

                          matchDate = data.matchDate.toString();
                        } else if (matchDate == data.matchDate.toString()) {
                          timeHeader = false;
                        } else {
                          timeHeader = true;
                          matchDate = data.matchDate.toString();
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: cricketCard(
                              onTap: () async {
                                if (data.result?.isNotEmpty ?? false) {
                                  AppConfig.completedBottomBarValue.value = 0;
                                  matchController.completedTeamA.value = data.teamA ?? "";
                                  matchController.completedType.value = data.title ?? "";
                                  matchController.completedImage.value = data.imgeUrl ?? "";
                                  await matchController.getAllPlayer(data.matchId.toString());
                                  Navigation.pushNamed(Routes.completedPageBottomPage);
                                  await matchController.matchRunData(data.matchId.toString());
                                  await matchController.matchStatus(data.matchId.toString());
                                } else if ((data.jsondata?.isNotEmpty ?? false) &&
                                    (data.jsonruns?.isNotEmpty ?? false)) {
                                  matchController.matchTile.value =
                                      "${data.teamA} vs ${data.teamB}";
                                  matchController.matchId.value = data.matchId.toString();
                                  matchController.teamAName.value = data.teamA.toString();
                                  matchController.teamBName.value = data.teamB.toString();
                                  matchController.teamAImage.value = data.imgeUrl.toString();
                                  Navigation.pushNamed(Routes.liveMatchDataPage);
                                }
                              },
                              toss: toss.split("\\n\\n").first,
                              result: (data.result?.isEmpty ?? false) ? "" : data.result,
                              showDate: timeHeader,
                              time: data.matchDate.toString(),
                              header: data.title,
                              i1: data.imgeUrl.toString() + data.teamAImage.toString(),
                              i2: data.imgeUrl.toString() + data.teamBImage.toString(),
                              t1: data.teamA,
                              subHeader: data.matchType,
                              r1: jRun != null &&
                                      jRun.rateA.toString().isNotEmpty &&
                                      !jRun.rateA.toString().contains("--")
                                  ? jRun.rateA.toString()
                                  : "00",
                              r2: jRun != null &&
                                      jRun.rateB.toString().isNotEmpty &&
                                      !jRun.rateA.toString().contains("--")
                                  ? jRun.rateB.toString()
                                  : "00",
                              /*     r1: r1.toString().replaceAll("\"", "").split(",").first.isEmpty
                                ? "00"
                                : r1.toString().replaceAll("\"", "").split(",").first,
                            r2: r2.toString().replaceAll("\"", "").split(",").first.isEmpty
                                ? "00"
                                : r2.toString().replaceAll("\"", "").split(",").first,*/
                              venue: data.venue,
                              startTime: data.matchtime,
                              t2: data.teamB),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                            (index + 1) % 2 == 0 ? BannerAds(adSize: true) : const SizedBox(),
                            SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                          ],
                        );
                      },
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }

  showAd() {
    if (AdConstants.appstart == "1") {
      appOpenAdManager.showAdIfAvailable();
    }
  }
}
