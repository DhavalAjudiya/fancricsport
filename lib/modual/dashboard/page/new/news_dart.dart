import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/Ads_helper/ads/interstitialAd.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/modual/dashboard/modal/news_modal.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/utils/time_manager.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/image_lodar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  MatchController matchController = Get.find()..sportNews();
  List<NewsModal> newsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.blackDarkT,
        title: const AppText("News", color: AppColor.white, fontWeight: FontWeight.w600),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: news()),
        /* child: Obx(
          () => (matchController.sportNewsList.value?.newsList?.isEmpty ?? false)
              ? const Center(
                  child: CupertinoActivityIndicator(color: AppColor.white),
                )
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 15, top: 0, left: 10, right: 10),
                  shrinkWrap: true,
                  itemCount: matchController.sportNewsList.value?.newsList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final data = matchController.sportNewsList.value?.newsList?[index];
                    String? dateSp =
                        data?.publishedAT?.split("Date(").last.replaceAll(")/", "");
                    String date = TimeManager().displayTimeAgoFromTimestamp(
                        int.parse(dateSp ?? DateTime.now().toString()));

                    return GestureDetector(
                      onTap: () {
                        matchController.newsAuthor.value = data?.author ?? '';
                        matchController.newsTitle.value = data?.title ?? '';
                        matchController.newsDescription.value = data?.description ?? '';
                        matchController.newsURL.value = data?.uRL ?? '';
                        matchController.newsURLToImage.value = data?.uRLToImage ?? '';
                        matchController.content.value = data?.content ?? '';
                        matchController.publishedAT.value = date;
                        matchController.index.value = index;
                        Navigation.pushNamed(Routes.newsDetailsPage);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.screen,
                            color: AppColor.bgColorDarkT,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.horizontalBlockSize * 2,
                              vertical: SizeUtils.horizontalBlockSize * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: "image$index",
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: (data?.uRLToImage?.isEmpty ?? false)
                                      ? Image.asset(
                                          AssetsPath.loaderImage,
                                          fit: BoxFit.cover,
                                          height: SizeUtils.horizontalBlockSize * 50,
                                          width: SizeUtils.horizontalBlockSize * 100,
                                        )
                                      : Image.network(
                                          data?.uRLToImage ?? "",
                                          fit: BoxFit.cover,
                                          height: SizeUtils.horizontalBlockSize * 50,
                                          width: SizeUtils.horizontalBlockSize * 100,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              height: SizeUtils.horizontalBlockSize * 50,
                                              width: SizeUtils.horizontalBlockSize * 100,
                                              decoration: BoxDecoration(
                                                color: AppColor.blackDarkT,
                                                image: DecorationImage(
                                                  image: AssetImage(AssetsPath.loaderImage),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                  */ /* child: imageLoader(
                                        r: 12,
                                        url: data?.uRLToImage ?? "",
                                        h: SizeUtils.horizontalBlockSize * 45,
                                        w: SizeUtils.horizontalBlockSize * 100)*/ /*
                                ),
                              ),
                              // AppText(data?.author ?? "", color: AppColor.white),
                              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                              AppText(date,
                                  color: AppColor.darkGrayTextDarkT,
                                  fontSize: SizeUtils.fSize_13(),
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: SizeUtils.horizontalBlockSize * 1),

                              AppText(data?.title ?? "",
                                  color: AppColor.darkGrayTextDarkT,
                                  fontSize: SizeUtils.fSize_13(),
                                  fontWeight: FontWeight.w500),
                              // AppText(data?.content ?? "", color: AppColor.white),
                              // AppText(data?.description ?? "", color: AppColor.white),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: SizeUtils.horizontalBlockSize * 3);
                  },
                ),
        ),*/
      ),
    );
  }

  news() {
    return StreamBuilder(
      stream: AppConfig.databaseReference
          .collection(AppConfig.newsCollocation)
          .orderBy("time", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        newsList.clear();
        for (var element in snapshot.data?.docs ?? []) {
          NewsModal highlightModal = NewsModal.fromMap(element.data() as Map<String, dynamic>);
          newsList.add(highlightModal);
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: Padding(
                  padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                  child: const CupertinoActivityIndicator(color: AppColor.white)),
            );
          default:
            if (snapshot.hasError) {
              return Padding(
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
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.only(bottom: 15, top: 0),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final data = newsList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        InterstitialAdClass.showInterstitialAds();
                        matchController.newsTitle.value = data.title.toString();
                        matchController.newsDescription.value = data.description.toString();
                        matchController.newsURLToImage.value = data.image.toString();
                        matchController.content.value = data.subtitle.toString();
                        matchController.publishedAT.value = data.time.toString();
                        matchController.index.value = index;
                        Navigation.pushNamed(Routes.newsDetailsPage);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.screen,
                            color: AppColor.bgColorDarkT,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.horizontalBlockSize * 2,
                              vertical: SizeUtils.horizontalBlockSize * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: "image$index",
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: data.image.toString().isEmpty
                                      ? Image.asset(
                                          AssetsPath.loaderImage,
                                          fit: BoxFit.cover,
                                          height: SizeUtils.horizontalBlockSize * 40,
                                          width: SizeUtils.horizontalBlockSize * 100,
                                        )
                                      : Image.network(
                                          data.image.toString(),
                                          fit: BoxFit.cover,
                                          height: SizeUtils.horizontalBlockSize * 40,
                                          width: SizeUtils.horizontalBlockSize * 100,
                                          loadingBuilder: (context, Widget child,
                                              ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const Center(
                                                child: CupertinoActivityIndicator(
                                                    color: AppColor.white));
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              height: SizeUtils.horizontalBlockSize * 50,
                                              width: SizeUtils.horizontalBlockSize * 100,
                                              decoration: BoxDecoration(
                                                color: AppColor.blackDarkT,
                                                image: DecorationImage(
                                                  image: AssetImage(AssetsPath.loaderImage),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                  /* child: imageLoader(
                                          r: 12,
                                          url: data?.uRLToImage ?? "",
                                          h: SizeUtils.horizontalBlockSize * 45,
                                          w: SizeUtils.horizontalBlockSize * 100)*/
                                ),
                              ),
                              // AppText(data?.author ?? "", color: AppColor.white),
                              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                              AppText(
                                  TimeManager.setNewsUpdateTime(
                                    newsList[index].time,
                                  ),
                                  color: AppColor.darkGrayTextDarkT,
                                  fontSize: SizeUtils.fSize_13(),
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: SizeUtils.horizontalBlockSize * 1),

                              AppText(data.title.toString(),
                                  color: AppColor.darkGrayTextDarkT,
                                  fontSize: SizeUtils.fSize_13(),
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: SizeUtils.horizontalBlockSize * 2),

                              AppText(data.subtitle.toString(),
                                  color: AppColor.darkGrayTextDarkT,
                                  fontSize: SizeUtils.fSize_13(),
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),
                      ),
                    ),
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
              );
            }
        }
        /*  if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return newsList.isEmpty
                ? Column(
              children: [
                SizedBox(height: SizeUtils.verticalBlockSize * 30),
                Icon(SFSymbols.doc_text, size: SizeUtils.horizontalBlockSize * 15),
                SizedBox(height: SizeUtils.horizontalBlockSize * 3),
                AppText(
                  "News not found",
                  fontSize: SizeUtils.fSize_20(),
                  color: AppColor.white,
                )
              ],
            )
                : Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: SizeUtils.horizontalBlockSize * 2,
                        right: SizeUtils.horizontalBlockSize * 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.itemColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.screenWidth * 0.02,
                          vertical: SizeUtils.screenHeight * 0.02,
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                InterstitialAdClass.showInterstitialAds();
                                Navigation.pushNamed(
                                  Routes.oneNewsPage,
                                  arg: {
                                    "title": newsList[index].title.toString(),
                                    "description": newsList[index].description.toString(),
                                    "image": newsList[index].image.toString(),
                                    "subtitle": newsList[index].subtitle.toString() ?? "",
                                    "time": newsList[index].time ?? 0,
                                    "index": index,
                                  },
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Hero(
                                  tag: "news$index",
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: SizeUtils.screenHeight * 0.13,
                                        width: SizeUtils.screenWidth * 0.34,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: ImageFade(
                                            image: NetworkImage(
                                              newsList[index].image.toString(),
                                            ),
                                            duration: const Duration(
                                              milliseconds: 900,
                                            ),
                                            syncDuration: const Duration(
                                              milliseconds: 150,
                                            ),
                                            fit: BoxFit.cover,
                                            placeholder: Container(
                                              color: const Color(0xFFCFCDCA),
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.photo,
                                                color: Colors.white30,
                                                size: 115.0,
                                              ),
                                            ),
                                            loadingBuilder: (context, progress, chunkEvent) =>
                                                Center(
                                                  child: CircularProgressIndicator(
                                                    value: progress,
                                                  ),
                                                ),
                                            errorBuilder: (context, error) => Container(
                                              color: const Color(0xFF6F6D6A),
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.warning,
                                                color: Colors.black26,
                                                size: 115.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeUtils.screenWidth * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: SizeUtils.screenWidth * 0.55,
                                            height: SizeUtils.screenHeight * 0.10,
                                            child: SingleChildScrollView(
                                              physics: const BouncingScrollPhysics(),
                                              child: AppText(
                                                newsList[index].title.toString(),
                                                color: AppColor.white,
                                                maxLines: 4,
                                                fontSize: SizeUtils.fSize_16(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: SizeUtils.horizontalBlockSize * 1,
                                          ),
                                          AppText(
                                            TimeManager.setNewsUpdateTime(
                                              newsList[index].time,
                                            ),
                                            maxLines: 1,
                                            color: AppColor.white.withOpacity(0.5),
                                            fontSize: SizeUtils.fSize_14(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeUtils.screenHeight * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.screenWidth * 0.002,
                              ),
                              child: divider1(),
                            ),
                            SizedBox(
                              height: SizeUtils.screenHeight * 0.01,
                            ),
                            AppText(
                              newsList[index].subtitle.toString(),
                              maxLines: 2,
                              color: AppColor.white,
                              fontSize: SizeUtils.fSize_13(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: SizeUtils.horizontalBlockSize * 3);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const AppText(
              "Server are on maintenance Please Try after some time",
              color: AppColor.black,
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.locationBtn,
                ));
          }
        } else {
          return const SizedBox();
        }*/
      },
    );
  }
}
