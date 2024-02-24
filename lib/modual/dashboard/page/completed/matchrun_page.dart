import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/image_lodar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchRunPage extends StatelessWidget {
  MatchRunPage({Key? key}) : super(key: key);
  MatchController matchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.blackDarkT,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(SizeUtils.horizontalBlockSize * 14), // here the desired height
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
                    "1st Innings",
                    textAlign: TextAlign.center,
                    color: AppColor.silverColor,
                    fontSize: SizeUtils.fSize_16(),
                  ),
                ),
                Tab(
                    child: AppText(
                  "2nd Innings",
                  textAlign: TextAlign.center,
                  color: AppColor.silverColor,
                  fontSize: SizeUtils.fSize_16(),
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
                  matchController.firstInningList.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                          child: Column(
                            children: [
                              Image.asset(AssetsPath.empty),
                              AppText("No Data found",
                                  fontSize: SizeUtils.fSize_21(),
                                  color: AppColor.darkGrayTextDarkT,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 5),
                            itemCount: matchController.firstInningList.length,
                            itemBuilder: (context, index) {
                              final data = matchController.firstInningList[index];

                              return Container(
                                decoration: BoxDecoration(
                                    backgroundBlendMode: BlendMode.screen,
                                    color: AppColor.bgColorDarkT,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeUtils.horizontalBlockSize * 3,
                                      vertical: SizeUtils.horizontalBlockSize * 2),
                                  child: Row(children: [
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 20,
                                      child: AppText(
                                        data.overs.toString(),
                                        color: !data.overs.toString().contains(".")
                                            ? AppColor.linkBtn
                                            : AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 37,
                                      child: AppText(
                                        data.score.toString(),
                                        color: data.score.toString().contains("WK")
                                            ? AppColor.emailBtn
                                            : data.score.toString().contains("4")
                                                ? AppColor.contactBtn
                                                : data.score.toString().contains("6")
                                                    ? AppColor.locationBtn
                                                    : AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 18,
                                      child: AppText(
                                        data.teamruns.toString(),
                                        color: AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                      ),
                                    ),
                                    /*AppText(
                                data.battingteam.toString(),
                                color: AppColor.darkGrayTextDarkT,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeUtils.fSize_14(),
                              )*/
                                    Container(
                                      decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: int.parse(data.mrateA.toString()) <
                                                int.parse(data.mrateB.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: AppText(
                                          data.mrateA.toString(),
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_12(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: int.parse(data.mrateA.toString()) >
                                                int.parse(data.mrateB.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: AppText(
                                          data.mrateB.toString(),
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_12(),
                                        ),
                                      ),
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
                            separatorBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                                  (index + 1) % 11 == 0
                                      ? BannerAds(adSize: true)
                                      : const SizedBox(),
                                  SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
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
                  matchController.secondInningList.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                          child: Column(
                            children: [
                              Image.asset(AssetsPath.empty),
                              AppText("No Data found",
                                  fontSize: SizeUtils.fSize_21(),
                                  color: AppColor.darkGrayTextDarkT,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 5),
                            itemCount: matchController.secondInningList.length,
                            itemBuilder: (context, index) {
                              final data = matchController.secondInningList[index];

                              return Container(
                                decoration: BoxDecoration(
                                    backgroundBlendMode: BlendMode.screen,
                                    color: AppColor.bgColorDarkT,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeUtils.horizontalBlockSize * 3,
                                      vertical: SizeUtils.horizontalBlockSize * 2),
                                  child: Row(children: [
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 20,
                                      child: AppText(
                                        data.overs.toString(),
                                        color: !data.overs.toString().contains(".")
                                            ? AppColor.linkBtn
                                            : AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 37,
                                      child: AppText(
                                        data.score.toString(),
                                        color: data.score.toString().contains("WK")
                                            ? AppColor.emailBtn
                                            : data.score.toString().contains("4")
                                                ? AppColor.contactBtn
                                                : data.score.toString().contains("6")
                                                    ? AppColor.locationBtn
                                                    : AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 18,
                                      child: AppText(
                                        data.teamruns.toString(),
                                        color: AppColor.darkGrayTextDarkT,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeUtils.fSize_14(),
                                      ),
                                    ),
                                    /*AppText(
                                data.battingteam.toString(),
                                color: AppColor.darkGrayTextDarkT,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeUtils.fSize_14(),
                              )*/
                                    Container(
                                      decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: int.parse(data.mrateA.toString()) <
                                                int.parse(data.mrateB.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: AppText(
                                          data.mrateA.toString(),
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_12(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: int.parse(data.mrateA.toString()) >
                                                int.parse(data.mrateB.toString())
                                            ? AppColor.redColor
                                            : AppColor.greenTextDarkT,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: AppText(
                                          data.mrateB.toString(),
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeUtils.fSize_12(),
                                        ),
                                      ),
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
                            separatorBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                                  (index + 1) % 11 == 0
                                      ? BannerAds(adSize: true)
                                      : const SizedBox(),
                                  SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
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
    );
  }
}
