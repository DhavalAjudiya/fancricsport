import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/modual/dashboard/modal/fantasy_model.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  MatchController matchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.white),
        centerTitle: true,
        backgroundColor: AppColor.blackDarkT,
        title: appBarTitle(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 3,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              matchController.megaFantasyList.isNotEmpty
                  ? megaTeam()
                  : const SizedBox.shrink(),
              matchController.headFantasyList.isNotEmpty
                  ? headTeam()
                  : const SizedBox.shrink(),
              matchController.smallFantasyList.isNotEmpty
                  ? smallTeam()
                  : const SizedBox.shrink(),
              matchController.playerStateList.isNotEmpty
                  ? playerState()
                  : const SizedBox.shrink(),
              SizedBox(height: SizeUtils.horizontalBlockSize * 10),
            ],
          ),
        ),
      ),
    );
  }

  appBarTitle() {
    return RichText(
      text: TextSpan(
          text: matchController.fantasyFTeam.value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SizeUtils.fSize_17(),
            color: AppColor.white,
          ),
          children: [
            TextSpan(
                text: "  vs  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_17(),
                  color: AppColor.silverColor,
                )),
            TextSpan(
              text: matchController.fantasySTeam.value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_17(),
                color: AppColor.white,
              ),
            )
          ]),
    );
  }

  team(Fantasy smallTeam, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeUtils.horizontalBlockSize * 1.5,
          horizontal: SizeUtils.horizontalBlockSize * 2),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColor.smsBtn,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 1,
                          vertical: SizeUtils.horizontalBlockSize * 0.5),
                      child: AppText(
                        "TEAM  ${index + 1}",
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 4),
                  RichText(
                    text: TextSpan(
                      text: "Cr: ${smallTeam.cr?.split("/").first}",
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeUtils.fSize_13(),
                      ),
                      children: [
                        TextSpan(
                            text: "/100",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w300,
                              fontSize: SizeUtils.fSize_13(),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  badges.Badge(
                    alignment: Alignment.center,
                    badgeColor: Colors.green.shade900,
                    badgeContent: AppText(
                      "C",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_12(),
                    ),
                    position: BadgePosition.topEnd(top: -5, end: 32),
                    child: imageLoader(
                      h: SizeUtils.horizontalBlockSize * 11,
                      w: SizeUtils.horizontalBlockSize * 11,
                      url: smallTeam.captionimage ?? "",
                    ),
                    /* child: CircleAvatar(
                      backgroundColor: AppColor.appBarColor,
                      backgroundImage: NetworkImage(smallTeam.captionimage ?? ""),
                    ),*/
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 1),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColor.cardBtn,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 1,
                          vertical: SizeUtils.horizontalBlockSize * 0.5),
                      child: AppText(
                        smallTeam.caption ?? "",
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: SizeUtils.horizontalBlockSize * 5),
              Column(
                children: [
                  badges.Badge(
                    padding: const EdgeInsets.only(
                        top: 5, left: 5, bottom: 3, right: 3),
                    alignment: Alignment.center,
                    badgeColor: Colors.green.shade900,
                    badgeContent: AppText(
                      "VC",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_10(),
                    ),
                    position: BadgePosition.topEnd(top: -3, end: 32),
                    child: imageLoader(
                      h: SizeUtils.horizontalBlockSize * 11,
                      w: SizeUtils.horizontalBlockSize * 11,
                      url: smallTeam.vcaptionimage ?? "",
                    ),
                    /*   child: CircleAvatar(
                      backgroundColor: AppColor.appBarColor,
                      backgroundImage: NetworkImage(smallTeam.vcaptionimage ??
                          "https://wallpaperaccess.com/full/6773197.jpg"),
                    ),*/
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 1),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColor.locationBtn,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 1,
                          vertical: SizeUtils.horizontalBlockSize * 0.5),
                      child: AppText(
                        smallTeam.vcaption ?? "",
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subHeader(
                  test: "WK ", subTest: smallTeam.player?.substring(0, 1)),
              subHeader(
                  test: "BAT ", subTest: smallTeam.player?.substring(1, 2)),
              subHeader(
                  test: "ALL ", subTest: smallTeam.player?.substring(2, 3)),
              subHeader(
                  test: "BOWL ", subTest: smallTeam.player?.substring(3, 4)),
            ],
          )
        ],
      ),
    );
  }

  subHeader({
    String? test,
    String? subTest,
  }) {
    return RichText(
      text: TextSpan(
        text: test ?? "",
        style: TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.w300,
          fontSize: SizeUtils.fSize_12(),
        ),
        children: [
          TextSpan(
              text: subTest ?? "",
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w600,
                fontSize: SizeUtils.fSize_13(),
              )),
        ],
      ),
    );
  }

  megaTeam() {
    return Column(
      children: [
        Row(children: [
          AppText(
            "Mega League Team",
            color: AppColor.silverColor,
            fontWeight: FontWeight.bold,
            fontSize: SizeUtils.fSize_15(),
          ),
          const Spacer(),
          AppText(
            "${matchController.mega.value}",
            color: AppColor.silverColor,
            fontSize: SizeUtils.fSize_15(),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: SizeUtils.horizontalBlockSize * 2),
        ]),
        SizedBox(height: SizeUtils.horizontalBlockSize * 2),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: SizeUtils.horizontalBlockSize * 1,
          ),
          shrinkWrap: true,
          itemCount: matchController.megaFantasyList.length,
          itemBuilder: (context, index) {
            var data = matchController.megaFantasyList[index];
            return GestureDetector(
              onTap: () {
                matchController.fantasyTeamView.value =
                    "Mega League Team by ${data.name ?? ""}";
                matchController.fantasyTeamVImage.value = data.teamimage ?? "";

                Navigation.pushNamed(Routes.teamViewPage);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.itemColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          imageLoader(
                            h: SizeUtils.horizontalBlockSize * 11,
                            w: SizeUtils.horizontalBlockSize * 11,
                            url: data.image ?? "",
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 3,
                          ),
                          AppText(
                            data.name ?? "",
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeUtils.fSize_17(),
                          ),
                          // Image.asset("assets/image/line.png", scale: 1.2),
                          // SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.horizontalBlockSize * 2,
                          horizontal: SizeUtils.horizontalBlockSize * 2,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(
                              0.5,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: team(data, index),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          matchController.fantasyTeamView.value =
                              "Mega League Team by ${data.name ?? ""}";
                          matchController.fantasyTeamVImage.value =
                              data.teamimage ?? "";

                          Navigation.pushNamed(Routes.teamViewPage);
                        },
                        child: Row(
                          children: [
                            AppText(
                              "See this team",
                              color: AppColor.white.withOpacity(0.7),
                              fontSize: SizeUtils.fSize_14(),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.white.withOpacity(0.7),
                              size: SizeUtils.horizontalBlockSize * 3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: SizeUtils.horizontalBlockSize * 3,
            );
          },
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.horizontalBlockSize * 1),
            child: const BannerAds()),
/*        Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.horizontalBlockSize * 3),
            child: const Divider(color: Colors.grey, height: 0, thickness: 2)),*/
      ],
    );
  }

  headTeam() {
    return Column(
      children: [
        Row(children: [
          AppText(
            "Head to Head Team",
            color: AppColor.silverColor,
            fontWeight: FontWeight.bold,
            fontSize: SizeUtils.fSize_15(),
          ),
          const Spacer(),
          AppText(
            "${matchController.head.value}",
            color: AppColor.silverColor,
            fontSize: SizeUtils.fSize_15(),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: SizeUtils.horizontalBlockSize * 2),
        ]),
        SizedBox(height: SizeUtils.horizontalBlockSize * 2),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: SizeUtils.horizontalBlockSize * 1,
          ),
          shrinkWrap: true,
          itemCount: matchController.headFantasyList.length,
          itemBuilder: (context, index) {
            var data = matchController.headFantasyList[index];
            return GestureDetector(
              onTap: () {
                matchController.fantasyTeamView.value =
                    "Head to head Team by ${data.name ?? ""}";
                matchController.fantasyTeamVImage.value = data.teamimage ?? "";

                Navigation.pushNamed(Routes.teamViewPage);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.itemColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          imageLoader(
                            h: SizeUtils.horizontalBlockSize * 11,
                            w: SizeUtils.horizontalBlockSize * 11,
                            url: data.image ?? "",
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 3,
                          ),
                          AppText(
                            data.name ?? "",
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeUtils.fSize_17(),
                          ),
                          // Image.asset("assets/image/line.png", scale: 1.2),
                          // SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.horizontalBlockSize * 2,
                          horizontal: SizeUtils.horizontalBlockSize * 2,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(
                              0.5,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: team(data, index),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          matchController.fantasyTeamView.value =
                              "Head to head Team by ${data.name ?? ""}";
                          matchController.fantasyTeamVImage.value =
                              data.teamimage ?? "";

                          Navigation.pushNamed(Routes.teamViewPage);
                        },
                        child: Row(
                          children: [
                            AppText(
                              "See this team",
                              color: AppColor.white.withOpacity(0.7),
                              fontSize: SizeUtils.fSize_14(),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.white.withOpacity(0.7),
                              size: SizeUtils.horizontalBlockSize * 3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: SizeUtils.horizontalBlockSize * 3,
            );
          },
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.horizontalBlockSize * 1),
            child: const BannerAds()),
/*        Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.horizontalBlockSize * 3),
            child: const Divider(color: Colors.grey, height: 0, thickness: 2)),*/
      ],
    );
  }

  smallTeam() {
    return Column(
      children: [
        Row(children: [
          AppText(
            "Small League Team",
            color: AppColor.silverColor,
            fontWeight: FontWeight.bold,
            fontSize: SizeUtils.fSize_15(),
          ),
          const Spacer(),
          AppText(
            "${matchController.small.value}",
            color: AppColor.silverColor,
            fontSize: SizeUtils.fSize_15(),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(width: SizeUtils.horizontalBlockSize * 2),
        ]),
        SizedBox(height: SizeUtils.horizontalBlockSize * 2),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: SizeUtils.horizontalBlockSize * 1,
          ),
          shrinkWrap: true,
          itemCount: matchController.smallFantasyList.length,
          itemBuilder: (context, index) {
            var data = matchController.smallFantasyList[index];
            return GestureDetector(
              onTap: () {
                matchController.fantasyTeamView.value =
                    "Small League Team by ${data.name ?? ""}";
                matchController.fantasyTeamVImage.value = data.teamimage ?? "";

                Navigation.pushNamed(Routes.teamViewPage);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.itemColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          imageLoader(
                            h: SizeUtils.horizontalBlockSize * 11,
                            w: SizeUtils.horizontalBlockSize * 11,
                            url: data.image ?? "",
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 3,
                          ),
                          AppText(
                            data.name ?? "",
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeUtils.fSize_17(),
                          ),
                          // Image.asset("assets/image/line.png", scale: 1.2),
                          // SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.horizontalBlockSize * 2,
                          horizontal: SizeUtils.horizontalBlockSize * 2,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(
                              0.5,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: team(data, index),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          matchController.fantasyTeamView.value =
                              "Small League Team by ${data.name ?? ""}";
                          matchController.fantasyTeamVImage.value =
                              data.teamimage ?? "";
                          Navigation.pushNamed(Routes.teamViewPage);
                        },
                        child: Row(
                          children: [
                            AppText(
                              "See this team",
                              color: AppColor.white.withOpacity(0.7),
                              fontSize: SizeUtils.fSize_14(),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.white.withOpacity(0.7),
                              size: SizeUtils.horizontalBlockSize * 3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: SizeUtils.horizontalBlockSize * 3,
            );
          },
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.horizontalBlockSize * 1),
            child: const BannerAds()),
        /*  matchController.playerStateList.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.horizontalBlockSize * 1),
                child: const BannerAds())
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeUtils.horizontalBlockSize * 3),
                child:
                    const Divider(color: Colors.grey, height: 0, thickness: 2))
            : const SizedBox.shrink(),*/
      ],
    );
  }

  playerState() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.horizontalBlockSize * 2,
            left: SizeUtils.horizontalBlockSize * 4,
            right: SizeUtils.horizontalBlockSize * 4,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Player Stats",
                    color: AppColor.silverColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtils.fSize_17(),
                  ),
                  AppText(
                    "stats from this tour",
                    color: AppColor.silverColor,
                    fontWeight: FontWeight.w400,
                    fontSize: SizeUtils.fSize_13(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 3,
            vertical: SizeUtils.horizontalBlockSize * 1,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.backGroundColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 2,
                  vertical: SizeUtils.horizontalBlockSize * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Player",
                    color: AppColor.silverColor,
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w700,
                  ),
                  const Spacer(),
                  AppText(
                    "Matches\nPlayed",
                    color: AppColor.silverColor,
                    fontSize: SizeUtils.fSize_11(),
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  AppText(
                    "Point per\nMatch",
                    color: AppColor.silverColor,
                    fontSize: SizeUtils.fSize_11(),
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.itemColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: AppText(
                        "DT%",
                        color: AppColor.silverColor,
                        fontSize: SizeUtils.fSize_11(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matchController.playerStateList.length,
          itemBuilder: (context, index) {
            var data = matchController.playerStateList[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 4,
                  vertical: SizeUtils.horizontalBlockSize * 0.5),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data.name ?? "",
                          color: AppColor.white,
                          fontSize: SizeUtils.fSize_14(),
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          data.type ?? "",
                          color: AppColor.silverColor,
                          fontSize: SizeUtils.fSize_11(),
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 14,
                    child: AppText(
                      data.pmatch ?? "",
                      color: AppColor.white,
                      fontSize: SizeUtils.fSize_14(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 15,
                    child: AppText(
                      data.mplayed ?? "",
                      color: AppColor.white,
                      fontSize: SizeUtils.fSize_14(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 9,
                    child: AppText(
                      data.value ?? "",
                      color: AppColor.white,
                      fontSize: SizeUtils.fSize_14(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeUtils.horizontalBlockSize * 2),
            child: const BannerAds()),
        SizedBox(height: SizeUtils.horizontalBlockSize * 5),
      ],
    );
  }
}
