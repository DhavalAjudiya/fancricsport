import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/Ads_helper/ads/interstitialAd.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/modual/dashboard/modal/news_modal.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/res/strings_utils.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/navigation_utils/routes.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/utils/time_manager.dart';
import 'package:fancricsport/widget/app_text.dart';
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
        title: const AppText("News",
            color: AppColor.white, fontWeight: FontWeight.w600),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: news()),
      ),
    );
  }

  news() {
    return StreamBuilder(
      stream: AppConfig.databaseReference
          .collection(AppConfig.newsCollocation)
          .orderBy(AppConfig.time, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        newsList.clear();
        for (var element in snapshot.data?.docs ?? []) {
          NewsModal highlightModal =
              NewsModal.fromMap(element.data() as Map<String, dynamic>);
          newsList.add(highlightModal);
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: Padding(
                  padding:
                      EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                  child:
                      const CupertinoActivityIndicator(color: AppColor.white)),
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
                      AppText(AppString.noDatafound,
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
                        matchController.newsDescription.value =
                            data.description.toString();
                        matchController.newsURLToImage.value =
                            data.image.toString();
                        matchController.content.value =
                            data.subtitle.toString();
                        matchController.publishedAT.value =
                            data.time.toString();
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
                                          height:
                                              SizeUtils.horizontalBlockSize *
                                                  40,
                                          width: SizeUtils.horizontalBlockSize *
                                              100,
                                        )
                                      : Image.network(
                                          data.image.toString(),
                                          fit: BoxFit.cover,
                                          height:
                                              SizeUtils.horizontalBlockSize *
                                                  40,
                                          width: SizeUtils.horizontalBlockSize *
                                              100,
                                          loadingBuilder: (context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const Center(
                                                child:
                                                    CupertinoActivityIndicator(
                                                        color: AppColor.white));
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              height: SizeUtils
                                                      .horizontalBlockSize *
                                                  50,
                                              width: SizeUtils
                                                      .horizontalBlockSize *
                                                  100,
                                              decoration: BoxDecoration(
                                                color: AppColor.blackDarkT,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      AssetsPath.loaderImage),
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
                              SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 2),
                              AppText(
                                  TimeManager.setNewsUpdateTime(
                                    newsList[index].time,
                                  ),
                                  color: AppColor.darkGrayTextDarkT,
                                  fontSize: SizeUtils.fSize_13(),
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 1),

                              AppText(data.title.toString(),
                                  color: AppColor.darkGrayTextDarkT,
                                  fontSize: SizeUtils.fSize_13(),
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 2),

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
    );
  }
}
