import 'dart:async';
import 'dart:convert';

import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/modual/dashboard/modal/livematch_datamodal.dart';
import 'package:fancricsport/modual/dashboard/service/live_matchservice.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/image_lodar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveMatchDataPage extends StatefulWidget {
  const LiveMatchDataPage({Key? key}) : super(key: key);

  @override
  State<LiveMatchDataPage> createState() => _LiveMatchDataPageState();
}

class _LiveMatchDataPageState extends State<LiveMatchDataPage> {
  MatchController matchController = Get.find();
  StreamController<List<LiveMatchDataModal>> streamController =
      StreamController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      employeeControllerMethod();
    });
  }

  Future<LiveMatchDataModal?> employeeControllerMethod() async {
    try {
      matchController.liveMatchDataList =
          await MatchService().liveData(matchController.matchId.value) ?? [];
      streamController.sink.add(matchController.liveMatchDataList);
      setState(() {});
    } catch (e, st) {
      debugPrint("ASDASDASDASD--$e");
    }
  }

  List<String> over = [];
  String? oversATeam, oversBTeam, playerARun, playerBRun;
  int b1Run = 0, b2Run = 0;
  LMatchJsonDataModal? jsonData;
  LMatchJsonRunModal? jsonRun;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.silverColor),
        backgroundColor: AppColor.blackDarkT,
        title: AppText(matchController.matchTile.value,
            color: AppColor.silverColor,
            fontWeight: FontWeight.w400,
            fontSize: SizeUtils.fSize_16()),
      ),
      body: SafeArea(
        child: StreamBuilder<List<LiveMatchDataModal>>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            matchController.liveMatchDataList = snapshot.data ?? [];
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CupertinoActivityIndicator(color: AppColor.white),
                );
              default:
                if (snapshot.hasError) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 25),
                    child: Column(
                      children: [
                        Image.asset(AssetsPath.empty),
                        AppText("No Data found",
                            fontSize: SizeUtils.fSize_21(),
                            color: AppColor.darkGrayTextDarkT,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  );
                } else {
                  final data = matchController.liveMatchDataList.first.jsondata;
                  final dataR =
                      matchController.liveMatchDataList.first.jsonruns;
                  String last6Ball, ball = "", crr, rrr;
                  String? b1, b2;

                  Jsondata? jData;
                  Jsonruns? jRun;
                  if ((dataR?.isNotEmpty ?? false) &&
                      (data?.isNotEmpty ?? false)) {
                    String a = data.toString().replaceAll("\n", "");
                    String b = dataR.toString().replaceAll("\n", "");
                    Map<String, dynamic> mapData = jsonDecode(a);
                    Map<String, dynamic> mapRun = jsonDecode(b);
                    jsonData = LMatchJsonDataModal.fromJson(mapData);
                    jsonRun = LMatchJsonRunModal.fromJson(mapRun);
                    jData = jsonData?.jsondata;
                    jRun = jsonRun?.jsonruns;
                    b1 = jData?.batsman.toString().split("*|").first;
                    b2 = jData?.batsman.toString().split("*|").last;

                    if (data?.contains("C.RR") ?? false) {
                      crr = data.toString().split("C.RR: ").last;
                    } else {
                      crr = "0.00000";
                    }
                    if (data?.contains("R.RR") ?? false) {
                      rrr = data.toString().split("R.RR: ").last;
                    } else {
                      rrr = "0.00000";
                    }

                    if ((jData?.last6Balls.toString().contains(".-.-.-.-.-.") ??
                        false)) {
                      last6Ball = "0-0-0-0-0-0";
                      ball = last6Ball.replaceAll("-", "").toString();
                    } else {
                      last6Ball = jData?.last6Balls.toString() ?? "";
                      ball = last6Ball
                          .replaceAll("-", "")
                          .toString()
                          .replaceAll("\"", "");
                    }
                  } else {
                    jsonData = null;
                    jsonRun = null;
                    crr = "";
                    ball = "";
                    rrr = "";
                    b1 = "";
                    b2 = "";
                    oversATeam = "";
                    oversBTeam = "";
                    playerARun = "";
                  }
                  String? rtA1 = (jData?.testTeamARate1?.isNotEmpty ?? false)
                      ? jData?.testTeamARate1.toString()
                      : "00";

                  String? rtA2 = (jData?.testTeamARate2?.isNotEmpty ?? false)
                      ? jData?.testTeamARate2.toString()
                      : "00";

                  String? rtB1 = (jData?.testTeamBRate1?.isNotEmpty ?? false)
                      ? jData?.testTeamARate1.toString()
                      : "00";

                  String? rtB2 = (jData?.testTeamBRate2?.isNotEmpty ?? false)
                      ? jData?.testTeamARate2.toString()
                      : "00";

                  String? rd1 = (jData?.testdrawRate1?.isNotEmpty ?? false)
                      ? jData?.testdrawRate1.toString()
                      : "00";

                  String? rd2 = (jData?.testdrawRate2?.isNotEmpty ?? false)
                      ? jData?.testdrawRate2.toString()
                      : "00";

                  String? r1 = (jData?.wicketB?.isNotEmpty ?? false)
                      ? jData?.wicketA.toString().split("/").first
                      : "00";
                  String? r2 = (jData?.wicketA?.isNotEmpty ?? false)
                      ? jData?.wicketB.toString().split("/").first
                      : "00";

                  String? s1 = (jData?.sessionA?.isNotEmpty ?? false)
                      ? jData?.sessionA.toString()
                      : "00";

                  String? s2 = (jData?.sessionB?.isNotEmpty ?? false)
                      ? jData?.sessionB.toString()
                      : "00";
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeUtils.horizontalBlockSize * 2),
                        child: Container(
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.screen,
                              color: AppColor.bgColorDarkT,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    imageLoader(
                                      h: SizeUtils.horizontalBlockSize * 10,
                                      w: SizeUtils.horizontalBlockSize * 10,
                                      loaderImage: AssetsPath.loaderImage,
                                      url: matchController.teamAImage.value +
                                          (jData?.teamABanner.toString() ?? ""),
                                    ),
                                    SizedBox(
                                        width:
                                            SizeUtils.horizontalBlockSize * 3),
                                    AppText(
                                      (jData?.teamA?.isNotEmpty ?? false)
                                          ? (jData?.teamA.toString() ?? "")
                                          : matchController.teamAName.value,
                                      color: AppColor.pureWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeUtils.fSize_15(),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: int.parse(r1.toString()) <
                                                int.parse(r2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: AppText(
                                          (jData?.wicketA?.isNotEmpty ?? false)
                                              ? (jData?.wicketA.toString() ??
                                                  "")
                                              : "0/0",
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_15(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: SizeUtils.horizontalBlockSize * 2),
                                Row(
                                  children: [
                                    imageLoader(
                                        h: SizeUtils.horizontalBlockSize * 10,
                                        w: SizeUtils.horizontalBlockSize * 10,
                                        loaderImage: AssetsPath.loaderImage,
                                        url: matchController.teamAImage.value +
                                            (jData?.teamBBanner.toString() ??
                                                "")),
                                    SizedBox(
                                        width:
                                            SizeUtils.horizontalBlockSize * 3),
                                    AppText(
                                      (jData?.teamB?.isNotEmpty ?? false)
                                          ? (jData?.teamB.toString() ?? "")
                                          : matchController.teamBName.value,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeUtils.fSize_15(),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: int.parse(r1.toString()) >
                                                int.parse(r2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: AppText(
                                          (jData?.wicketB?.isNotEmpty ?? false)
                                              ? (jData?.wicketB.toString() ??
                                                  "")
                                              : "0/0",
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_15(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.horizontalBlockSize * 2,
                            horizontal: SizeUtils.horizontalBlockSize * 2),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.screen,
                              color: AppColor.bgColorDarkT,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                            ),
                            child: Column(
                              children: [
                                AppText(
                                  jData?.score.toString() ?? "",
                                  color: AppColor.bronzeColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeUtils.fSize_16(),
                                ),
                                SizedBox(
                                    height: SizeUtils.horizontalBlockSize * 2),
                                AppText(
                                  "batsman : $b1",
                                  color: AppColor.darkGrayTextDarkT,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeUtils.fSize_15(),
                                ),
                                AppText(
                                  "batsman : $b2",
                                  color: AppColor.darkGrayTextDarkT,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeUtils.fSize_15(),
                                ),
                                SizedBox(
                                    height: SizeUtils.horizontalBlockSize * 2),
                                AppText(
                                  "PartnerShip : ${jData?.partnership.toString() ?? ""}",
                                  color: AppColor.darkGrayTextDarkT,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeUtils.fSize_15(),
                                ),
                                AppText(
                                  "LastWicket : ${jData?.lastwicket.toString() ?? ""}",
                                  color: AppColor.darkGrayTextDarkT,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeUtils.fSize_15(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.horizontalBlockSize * 2,
                            horizontal: SizeUtils.horizontalBlockSize * 2),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.screen,
                              color: AppColor.bgColorDarkT,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            AppText(
                                              "Over :",
                                              color: AppColor.darkGrayTextDarkT,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_17(),
                                            ),
                                            SizedBox(
                                              height: SizeUtils
                                                      .horizontalBlockSize *
                                                  5,
                                              width: SizeUtils
                                                      .horizontalBlockSize *
                                                  42,
                                              child: ListView.separated(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                itemCount: ball.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: ball[index] == "4"
                                                          ? AppColor.locationBtn
                                                          : ball[index] == "6"
                                                              ? AppColor
                                                                  .bronzeColor
                                                              : ball[index] ==
                                                                      "W"
                                                                  ? AppColor
                                                                      .redColor
                                                                  : AppColor
                                                                      .darkGrayTextDarkT,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3),
                                                      child: AppText(
                                                        ball[index],
                                                        color: AppColor.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: SizeUtils
                                                            .fSize_12(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return SizedBox(
                                                    width: SizeUtils
                                                            .horizontalBlockSize *
                                                        2,
                                                  );
                                                },
                                              ),
                                            ),
                                            AppText(
                                              "(${jData?.oversA != "" ? jData?.oversA : "00"})",
                                              color: AppColor.pureWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_15(),
                                            ),
                                          ],
                                        ),
                                        AppText(
                                          "Blower : ${jData?.bowler != "" ? jData?.bowler : ""}",
                                          color: AppColor.darkGrayTextDarkT,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_15(),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        AppText(
                                          "C.RR : ${crr.toString().isNotEmpty ? crr.toString().substring(0, 4) : "0.00"}",
                                          color: AppColor.linkBtn,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_15(),
                                        ),
                                        AppText(
                                          "R.RR : ${rrr.toString().isNotEmpty ? rrr.toString().substring(0, 4) : "0.00"}",
                                          color: AppColor.linkBtn,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_15(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeUtils.horizontalBlockSize * 2,
                            vertical: SizeUtils.horizontalBlockSize * 2),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.screen,
                              color: AppColor.bgColorDarkT,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      "Session",
                                      color: AppColor.darkGrayTextDarkT,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeUtils.fSize_14(),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeUtils.horizontalBlockSize * 2),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: int.parse(s1.toString()) <
                                                    int.parse(s2.toString())
                                                ? AppColor.redColor
                                                : AppColor.greenTextDarkT,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: AppText(
                                              "${jData?.sessionA != "" ? jData?.sessionA : "00"}",
                                              // sessionA
                                              //     .toString()
                                              //     .split(",")
                                              //     .first
                                              //     .replaceAll("\"", ""),
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    4),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: int.parse(s1.toString()) >
                                                    int.parse(s2.toString())
                                                ? AppColor.redColor
                                                : AppColor.greenTextDarkT,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: AppText(
                                              "${jData?.sessionB != "" ? jData?.sessionB : "00"}",
                                              /*sessionB
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", ""),*/
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      "Sessionover",
                                      color: AppColor.darkGrayTextDarkT,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeUtils.fSize_14(),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeUtils.horizontalBlockSize * 2),
                                    AppText(
                                      "${jData?.sessionOver != "" ? jData?.sessionOver : "00"}",

                                      /* sessionOver
                                          .toString()
                                          .split(",")
                                          .first
                                          .replaceAll("\"", ""),*/
                                      color: AppColor.silverColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeUtils.fSize_15(),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      "Run x Ball",
                                      color: AppColor.darkGrayTextDarkT,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeUtils.fSize_14(),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeUtils.horizontalBlockSize * 2),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: SizeUtils.horizontalBlockSize *
                                              12,
                                          child: AppText(
                                            "${jRun?.runxa != "" ? jRun?.runxa : "0"}",

                                            /*  runXA
                                                .toString()
                                                .split(",")
                                                .first
                                                .replaceAll("\"", ""),*/
                                            color: AppColor.silverColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeUtils.fSize_15(),
                                          ),
                                        ),
                                        AppText(
                                          "${jRun?.runxb != "" ? jRun?.runxb : "0"}",
                                          /*     runXB
                                              .toString()
                                              .split(",")
                                              .first
                                              .replaceAll("\"", ""),*/
                                          color: AppColor.silverColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_15(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.horizontalBlockSize * 2,
                            horizontal: SizeUtils.horizontalBlockSize * 2),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.screen,
                              color: AppColor.bgColorDarkT,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                              SizeUtils.horizontalBlockSize * 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: AppText(
                                    "Draw and Rate point",
                                    color: AppColor.darkGrayTextDarkT,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeUtils.fSize_14(),
                                  ),
                                ),
                                SizedBox(
                                    height: SizeUtils.horizontalBlockSize * 3),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 62,
                                      child: AppText(
                                        "${jData?.teamA != "" ? jData?.teamA : matchController.teamAName.value}",

                                        /*        teamA
                                                .toString()
                                                .split(",")
                                                .first
                                                .replaceAll("\"", "")
                                                .isNotEmpty
                                            ? teamA
                                                .toString()
                                                .split(",")
                                                .first
                                                .replaceAll("\"", "")
                                            : matchController.teamBName.value,*/
                                        color: AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: double.parse(rtA1.toString()) <
                                                double.parse(rtA2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: AppText(
                                          "${jData?.testTeamARate1 != "" ? jData?.testTeamARate1 : "0.0"}",

                                          /*teamRateA1
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                                  .isNotEmpty
                                              ? teamRateA1
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                              : "00",*/
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_14(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: double.parse(rtA1.toString()) >
                                                double.parse(rtA2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: AppText(
                                          "${jData?.testTeamARate2 != "" ? jData?.testTeamARate2 : "0.0"}",

                                          /*  teamRateA2
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                                  .isNotEmpty
                                              ? teamRateA2
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                              : "00",*/
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_14(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeUtils.horizontalBlockSize * 2),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 62,
                                      child: AppText(
                                        "${jData?.teamB != "" ? jData?.teamB : matchController.teamBName.value}",

                                        /* teamB
                                                .toString()
                                                .split(",")
                                                .first
                                                .replaceAll("\"", "")
                                                .isNotEmpty
                                            ? teamB
                                                .toString()
                                                .split(",")
                                                .first
                                                .replaceAll("\"", "")
                                            : matchController.teamBName.value,*/
                                        color: AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: double.parse(rtB1.toString()) <
                                                double.parse(rtB2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: AppText(
                                          "${jData?.testTeamBRate1 != "" ? jData?.testTeamBRate1 : "0.0"}",

                                          /* teamRateB1
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                                  .isNotEmpty
                                              ? teamRateB1
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                              : "00",*/
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_14(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: double.parse(rtB1.toString()) >
                                                double.parse(rtB2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: AppText(
                                          "${jData?.testTeamBRate2 != "" ? jData?.testTeamBRate2 : "0.0"}",

                                          /*teamRateB2
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                                  .isNotEmpty
                                              ? teamRateB2
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                              : "00",*/
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_14(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeUtils.horizontalBlockSize * 2),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 62,
                                      child: AppText(
                                        "Draw",
                                        color: AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: double.parse(rd1.toString()) <
                                                double.parse(rd2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: AppText(
                                          "${jData?.testdrawRate1 != "" ? jData?.testdrawRate1 : "0.0"}",

                                          /* drawRateA
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                                  .isNotEmpty
                                              ? drawRateA
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                              : "00",*/
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_14(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: double.parse(rd1.toString()) >
                                                double.parse(rd2.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: AppText(
                                          "${jData?.testdrawRate2 != "" ? jData?.testdrawRate2 : "0.0"}",

                                          /*drawRateB
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                                  .isNotEmpty
                                              ? drawRateB
                                                  .toString()
                                                  .split(",")
                                                  .first
                                                  .replaceAll("\"", "")
                                              : "00",*/
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_14(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                      const BannerAds(),
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
