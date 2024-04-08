import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/res/strings_utils.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/image_lodar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScorePage extends StatelessWidget {
  ScorePage({Key? key}) : super(key: key);
  MatchController matchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => matchController.teamAPlayersList.isEmpty ||
              matchController.teamBPlayersList.isEmpty
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CupertinoActivityIndicator(
                    color: AppColor.white,
                  ),
                )
              ],
            )
          : DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: AppColor.blackDarkT,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize *
                      14), // here the desired height
                  child: AppBar(
                    backgroundColor: AppColor.blackDarkT,
                    automaticallyImplyLeading: false,
                    bottom: TabBar(
                      dividerColor: AppColor.blackDarkT,
                      indicatorColor: AppColor.silverColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColor.silverColor,
                      tabs: [
                        Tab(
                          child: AppText(
                            "${matchController.teamAPlayersList[0].teamName}\n${matchController.teamAPlayersList[0].teamRuns})",
                            textAlign: TextAlign.center,
                            color: AppColor.silverColor,
                          ),
                        ),
                        Tab(
                            child: AppText(
                          "${matchController.teamBPlayersList[0].teamName}\n${matchController.teamBPlayersList[0].teamRuns})",
                          textAlign: TextAlign.center,
                          color: AppColor.silverColor,
                        )),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.horizontalBlockSize * 4),
                            child: Row(
                              children: [
                                AppText(
                                  AppString.batsman,
                                  color: AppColor.silverColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 6,
                                  child: const AppText(
                                    "R",
                                    color: AppColor.silverColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 6,
                                  child: const AppText(
                                    "B",
                                    color: AppColor.silverColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 8,
                                  child: RichText(
                                    text: const TextSpan(
                                        text: "4",
                                        style: TextStyle(
                                          color: AppColor.silverColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "s",
                                            style: TextStyle(
                                              color: AppColor.silverColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                RichText(
                                  text: const TextSpan(
                                      text: "6",
                                      style: TextStyle(
                                        color: AppColor.silverColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "s",
                                          style: TextStyle(
                                            color: AppColor.silverColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ]),
                                ),
                                /*               RichText(
                              text: TextSpan(
                                  text: "s",
                                  style: TextStyle(
                                    color: AppColor.silverColor,
                                    fontSize: SizeUtils.fSize_17(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "r",
                                      style: TextStyle(
                                          color: AppColor.silverColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_13()),
                                    ),
                                  ]),
                            ),*/
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeUtils.horizontalBlockSize * 5),
                              itemCount:
                                  matchController.teamAPlayersList.length,
                              itemBuilder: (context, index) {
                                final data =
                                    matchController.teamAPlayersList[index];
                                String c, b;
                                c = data.outby.toString().split("b").first;
                                b = data.outby.toString().split("b").last;
                                return Container(
                                  decoration: BoxDecoration(
                                      backgroundBlendMode: BlendMode.screen,
                                      color: data.outby.toString() ==
                                              AppString.notOut
                                          ? AppColor.appBarColor
                                          : data.outby.toString() == ""
                                              ? AppColor.cardBtn
                                              : AppColor.bgColorDarkT,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeUtils.horizontalBlockSize * 3,
                                        vertical:
                                            SizeUtils.horizontalBlockSize * 2),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          imageLoader(
                                              w: SizeUtils.horizontalBlockSize *
                                                  10,
                                              h: SizeUtils.horizontalBlockSize *
                                                  10,
                                              r: 20,
                                              loaderImage:
                                                  AssetsPath.errorImage,
                                              url: matchController
                                                      .completedImage.value +
                                                  data.playerImage.toString()),
                                          SizedBox(
                                              width: SizeUtils
                                                      .horizontalBlockSize *
                                                  3),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    40,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                  data.playerName.toString(),
                                                  color: data.outby
                                                              .toString() ==
                                                          AppString.notOut
                                                      ? AppColor.white
                                                      : data.outby.toString() ==
                                                              ""
                                                          ? AppColor.white
                                                          : AppColor
                                                              .darkGrayTextDarkT,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      SizeUtils.fSize_14(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                data.outby.toString() == ""
                                                    ? const SizedBox()
                                                    : RichText(
                                                        text: TextSpan(
                                                            text: c,
                                                            style: TextStyle(
                                                              color: data.outby
                                                                          .toString() ==
                                                                      "not out"
                                                                  ? AppColor
                                                                      .white
                                                                  : AppColor
                                                                      .darkGrayTextDarkT,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: SizeUtils
                                                                  .fSize_12(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: data.outby
                                                                            .toString() ==
                                                                        AppString
                                                                            .notOut
                                                                    ? ""
                                                                    : data.outby.toString() ==
                                                                            ""
                                                                        ? ""
                                                                        : "\nb",
                                                                style:
                                                                    TextStyle(
                                                                  color: data.outby
                                                                              .toString() ==
                                                                          AppString
                                                                              .notOut
                                                                      ? AppColor
                                                                          .white
                                                                      : data.outby.toString() ==
                                                                              ""
                                                                          ? AppColor
                                                                              .white
                                                                          : AppColor
                                                                              .darkGrayTextDarkT,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      SizeUtils
                                                                          .fSize_10(),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: data.outby
                                                                            .toString() ==
                                                                        AppString
                                                                            .notOut
                                                                    ? ""
                                                                    : b,
                                                                style:
                                                                    TextStyle(
                                                                  color: data.outby
                                                                              .toString() ==
                                                                          AppString
                                                                              .notOut
                                                                      ? AppColor
                                                                          .white
                                                                      : data.outby.toString() ==
                                                                              ""
                                                                          ? AppColor
                                                                              .white
                                                                          : AppColor
                                                                              .darkGrayTextDarkT,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      SizeUtils
                                                                          .fSize_12(),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    9,
                                            child: AppText(
                                              data.runs.toString(),
                                              color: data.outby.toString() ==
                                                      AppString.notOut
                                                  ? AppColor.white
                                                  : data.outby.toString() == ""
                                                      ? AppColor.white
                                                      : int.parse(data.runs
                                                                  .toString()) >=
                                                              100
                                                          ? AppColor.linkBtn
                                                          : int.parse(data.runs
                                                                      .toString()) >=
                                                                  50
                                                              ? AppColor
                                                                  .locationBtn
                                                              : AppColor
                                                                  .darkGrayTextDarkT,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    9,
                                            child: AppText(
                                              data.balls.toString(),
                                              color: data.outby.toString() ==
                                                      AppString.notOut
                                                  ? AppColor.white
                                                  : data.outby.toString() == ""
                                                      ? AppColor.white
                                                      : AppColor
                                                          .darkGrayTextDarkT,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    8,
                                            child: AppText(
                                              data.four.toString(),
                                              color: data.outby.toString() ==
                                                      AppString.notOut
                                                  ? AppColor.white
                                                  : data.outby.toString() == ""
                                                      ? AppColor.white
                                                      : AppColor
                                                          .darkGrayTextDarkT,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                          AppText(
                                            data.six.toString(),
                                            color: data.outby.toString() ==
                                                    AppString.notOut
                                                ? AppColor.white
                                                : data.outby.toString() == ""
                                                    ? AppColor.white
                                                    : AppColor
                                                        .darkGrayTextDarkT,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeUtils.fSize_14(),
                                          ),
                                          /*    AppText(
                                    data.runs.toString(),
                                    color: AppColor.darkGrayTextDarkT,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeUtils.fSize_14(),
                                  ),*/
                                        ]),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                        height: SizeUtils.horizontalBlockSize *
                                            1.5),
                                    (index + 1) % 5 == 0
                                        ? const BannerAds()
                                        : const SizedBox(),
                                    SizedBox(
                                        height: SizeUtils.horizontalBlockSize *
                                            1.5),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.horizontalBlockSize * 4),
                            child: Row(
                              children: [
                                const AppText(
                                  "Batsman",
                                  color: AppColor.silverColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 6,
                                  child: const AppText(
                                    "R",
                                    color: AppColor.silverColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 6,
                                  child: const AppText(
                                    "B",
                                    color: AppColor.silverColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 8,
                                  child: RichText(
                                    text: const TextSpan(
                                        text: "4",
                                        style: TextStyle(
                                          color: AppColor.silverColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "s",
                                            style: TextStyle(
                                              color: AppColor.silverColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                RichText(
                                  text: const TextSpan(
                                      text: "6",
                                      style: TextStyle(
                                        color: AppColor.silverColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "s",
                                          style: TextStyle(
                                            color: AppColor.silverColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ]),
                                ),
                                /*               RichText(
                              text: TextSpan(
                                  text: "s",
                                  style: TextStyle(
                                    color: AppColor.silverColor,
                                    fontSize: SizeUtils.fSize_17(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "r",
                                      style: TextStyle(
                                          color: AppColor.silverColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_13()),
                                    ),
                                  ]),
                            ),*/
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeUtils.horizontalBlockSize * 5),
                              itemCount:
                                  matchController.teamBPlayersList.length,
                              itemBuilder: (context, index) {
                                final data =
                                    matchController.teamBPlayersList[index];
                                String c, b;
                                c = data.outby.toString().split("b").first;
                                b = data.outby.toString().split("b").last;
                                return Container(
                                  decoration: BoxDecoration(
                                      backgroundBlendMode: BlendMode.screen,
                                      color: data.outby.toString() ==
                                              AppString.notOut
                                          ? AppColor.appBarColor
                                          : data.outby.toString() == ""
                                              ? AppColor.cardBtn
                                              : AppColor.bgColorDarkT,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeUtils.horizontalBlockSize * 3,
                                        vertical:
                                            SizeUtils.horizontalBlockSize * 2),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          imageLoader(
                                              w: SizeUtils.horizontalBlockSize *
                                                  10,
                                              h: SizeUtils.horizontalBlockSize *
                                                  10,
                                              r: 20,
                                              loaderImage:
                                                  AssetsPath.errorImage,
                                              url: matchController
                                                      .completedImage.value +
                                                  data.playerImage.toString()),
                                          SizedBox(
                                              width: SizeUtils
                                                      .horizontalBlockSize *
                                                  3),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    40,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                  data.playerName.toString(),
                                                  color: data.outby
                                                              .toString() ==
                                                          AppString.notOut
                                                      ? AppColor.white
                                                      : data.outby.toString() ==
                                                              ""
                                                          ? AppColor.white
                                                          : AppColor
                                                              .darkGrayTextDarkT,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      SizeUtils.fSize_14(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                data.outby.toString() == ""
                                                    ? const SizedBox()
                                                    : RichText(
                                                        text: TextSpan(
                                                            text: c,
                                                            style: TextStyle(
                                                              color: data.outby
                                                                          .toString() ==
                                                                      AppString
                                                                          .notOut
                                                                  ? AppColor
                                                                      .white
                                                                  : AppColor
                                                                      .darkGrayTextDarkT,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: SizeUtils
                                                                  .fSize_12(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: data.outby
                                                                            .toString() ==
                                                                        AppString
                                                                            .notOut
                                                                    ? ""
                                                                    : data.outby.toString() ==
                                                                            ""
                                                                        ? ""
                                                                        : "\nb",
                                                                style:
                                                                    TextStyle(
                                                                  color: data.outby
                                                                              .toString() ==
                                                                          AppString
                                                                              .notOut
                                                                      ? AppColor
                                                                          .white
                                                                      : data.outby.toString() ==
                                                                              ""
                                                                          ? AppColor
                                                                              .white
                                                                          : AppColor
                                                                              .darkGrayTextDarkT,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      SizeUtils
                                                                          .fSize_10(),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: data.outby
                                                                            .toString() ==
                                                                        AppString
                                                                            .notOut
                                                                    ? ""
                                                                    : b,
                                                                style:
                                                                    TextStyle(
                                                                  color: data.outby
                                                                              .toString() ==
                                                                          "not out"
                                                                      ? AppColor
                                                                          .white
                                                                      : data.outby.toString() ==
                                                                              ""
                                                                          ? AppColor
                                                                              .white
                                                                          : AppColor
                                                                              .darkGrayTextDarkT,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      SizeUtils
                                                                          .fSize_12(),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    9,
                                            child: AppText(
                                              data.runs.toString(),
                                              color: data.outby.toString() ==
                                                      AppString.notOut
                                                  ? AppColor.white
                                                  : data.outby.toString() == ""
                                                      ? AppColor.white
                                                      : int.parse(data.runs
                                                                  .toString()) >=
                                                              100
                                                          ? AppColor.linkBtn
                                                          : int.parse(data.runs
                                                                      .toString()) >=
                                                                  50
                                                              ? AppColor
                                                                  .locationBtn
                                                              : AppColor
                                                                  .darkGrayTextDarkT,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    9,
                                            child: AppText(
                                              data.balls.toString(),
                                              color: data.outby.toString() ==
                                                      AppString.notOut
                                                  ? AppColor.white
                                                  : data.outby.toString() == ""
                                                      ? AppColor.white
                                                      : AppColor
                                                          .darkGrayTextDarkT,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeUtils.horizontalBlockSize *
                                                    8,
                                            child: AppText(
                                              data.four.toString(),
                                              color: data.outby.toString() ==
                                                      AppString.notOut
                                                  ? AppColor.white
                                                  : data.outby.toString() == ""
                                                      ? AppColor.white
                                                      : AppColor
                                                          .darkGrayTextDarkT,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeUtils.fSize_14(),
                                            ),
                                          ),
                                          AppText(
                                            data.six.toString(),
                                            color: data.outby.toString() ==
                                                    AppString.notOut
                                                ? AppColor.white
                                                : data.outby.toString() == ""
                                                    ? AppColor.white
                                                    : AppColor
                                                        .darkGrayTextDarkT,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeUtils.fSize_14(),
                                          ),
                                          /*    AppText(
                                    data.runs.toString(),
                                    color: AppColor.darkGrayTextDarkT,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeUtils.fSize_14(),
                                  ),*/
                                        ]),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                        height: SizeUtils.horizontalBlockSize *
                                            1.5),
                                    (index + 1) % 5 == 0
                                        ? const BannerAds()
                                        : const SizedBox(),
                                    SizedBox(
                                        height: SizeUtils.horizontalBlockSize *
                                            1.5),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
