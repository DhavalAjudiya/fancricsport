import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/Ads_helper/ads/interstitialAd.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/modual/dashboard/modal/fantasy_model.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FantasyPage extends StatefulWidget {
  const FantasyPage({Key? key}) : super(key: key);

  @override
  State<FantasyPage> createState() => _FantasyPageState();
}

class _FantasyPageState extends State<FantasyPage> {
  List<FantasyModal> fantasyList = [];
  MatchController matchController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.blackDarkT,
        title: const AppText("Fantasy",
            color: AppColor.white, fontWeight: FontWeight.w600),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 3),
            child: GestureDetector(
              onTap: () {
                Navigation.pushNamed(Routes.lastMinutesPage);
              },
              child: Row(
                children: [
                  AppText("Last Minutes Fantasy",
                      fontSize: SizeUtils.fSize_13(),
                      color: AppColor.silverColor,
                      fontWeight: FontWeight.w600),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 1),
                  Image.asset(AssetsPath.fantasyIcon,
                      scale: 18, color: AppColor.white),
                ],
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: AppConfig.databaseReference
            .collection(AppConfig.cFantasy)
            .orderBy(AppConfig.matchId, descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          fantasyList.clear();
          for (var element in snapshot.data?.docs ?? []) {
            FantasyModal fantasyModal =
                FantasyModal.fromJson(element.data() as Map<String, dynamic>);
            fantasyList.add(fantasyModal);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 25),
                    child: const CupertinoActivityIndicator(
                        color: AppColor.white)),
              );
            default:
              if (snapshot.hasError) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(AssetsPath.empty),
                        AppText("Fantasy Articles coming soon!",
                            fontSize: SizeUtils.fSize_20(),
                            color: AppColor.darkGrayTextDarkT,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.data?.docs.isEmpty ?? false) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(AssetsPath.empty),
                        AppText("Fantasy Articles coming soon!",
                            fontSize: SizeUtils.fSize_20(),
                            color: AppColor.darkGrayTextDarkT,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                );
              } else {
                return ListView.separated(
                  padding: EdgeInsets.only(
                    top: SizeUtils.horizontalBlockSize * 1,
                    left: SizeUtils.horizontalBlockSize * 3,
                    right: SizeUtils.horizontalBlockSize * 3,
                  ),
                  itemCount: fantasyList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = fantasyList[index];
                    int mega = 0;
                    int head = 0;
                    int small = 0;
                    int expert = 0;
                    data.fantasy?.forEach((element) {
                      if (element.type == "Mega League") {
                        mega++;
                      } else if (element.type == "head to head") {
                        head++;
                      } else if (element.type == "small League") {
                        small++;
                      }
                      expert++;
                    });
                    return fantasyCard(
                      onTap: () {
                        InterstitialAdClass.showInterstitialAds();

                        matchController.megaFantasyList.clear();
                        matchController.headFantasyList.clear();
                        matchController.smallFantasyList.clear();
                        matchController.playerStateList.clear();
                        matchController.mega.value = 0;
                        matchController.head.value = 0;
                        matchController.small.value = 0;

                        checkLeague(data);
                        Navigation.pushNamed(Routes.teamPage);
                      },
                      i1: data.image1,
                      i2: data.image2,
                      t1: data.team1,
                      t2: data.team2,
                      linUp: data.lineup,
                      time: data.time,
                      m: mega,
                      h: head,
                      s: small,
                      e: expert,
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
                );
              }
          }
        },
      ),
    );
  }

  checkLeague(FantasyModal data) {
    matchController.fantasyFTeam.value = data.team1 ?? "";
    matchController.fantasySTeam.value = data.team2 ?? "";
    matchController.playerStateList.value = data.playerstate ?? [];
    setState(() {});
    for (var element in data.fantasy ?? []) {
      if (element.type == "Mega League") {
        matchController.mega.value++;
        matchController.megaFantasyList.add(element);
      } else if (element.type == "head to head") {
        matchController.head.value++;
        matchController.headFantasyList.add(element);
      } else if (element.type == "small League") {
        matchController.small.value++;
        matchController.smallFantasyList.add(element);
      }
    }
  }
}
