import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:fancricsport/modual/Ads_helper/ads/interstitialAd.dart';
import 'package:fancricsport/modual/Ads_helper/ads/open_app_ads.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:get/get.dart';

import 'Ad_modal.dart';

class AdvertisementController extends GetxController {
  @override
  void onInit() {
    advertisementData();

    super.onInit();
  }

  late StreamSubscription<FGBGType> subscription;
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  Rx<Adsmodel> adsmodel = Adsmodel().obs;
  Future<void> advertisementData() async {
    AppConfig.databaseReference
        .collection(AppConfig.advertisementData)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {
      value.docs.forEach((element) {
        adsmodel.value = Adsmodel.fromDocumentSnapshot(element);
        bool advertisementType = getInterstitialType("${adsmodel.value.adMobOrFaceBook}");
        log("message---- L1 ${advertisementType}");

        AdConstants.bannerAdsId = adsmodel.value.bannerId ?? "";
        AdConstants.privacyPolicy = adsmodel.value.privacypolicy ?? "";
        AdConstants.termsConditions = adsmodel.value.privacypolicy ?? "";
        AdConstants.appLink = adsmodel.value.applink ?? "";
        AdConstants.nativeAdsId = adsmodel.value.nativeId ?? "";
        AdConstants.interstitialId = adsmodel.value.interstitialId ?? "";
        AdConstants.faceBookInterstitialId = adsmodel.value.faceBookInterstitialId ?? "";
        AdConstants.appOpenAdsId = adsmodel.value.appOpenAdsId ?? "";
        AdConstants.faceBookBannerAdsId = adsmodel.value.faceBookBannerId ?? "";
        AdConstants.faceBookNativeAdsId = adsmodel.value.faceBookNativeId ?? "";

        AdConstants.faceBookTestId = adsmodel.value.faceBookTestId ?? "";
        AdConstants.appstart = adsmodel.value.appstart ?? "";
        AdConstants.opneapp = adsmodel.value.opneapp ?? "";
        AdConstants.adShowCount = int.parse(adsmodel.value.firstCountDown ?? "0");
        AdConstants.isShowAdsOrNot = adsmodel.value.adsShowOrNot!;
        AdConstants.isShowFacebookBannerAds = advertisementType;
        AdConstants.isShowFacebookInterstitialAds = advertisementType;

        appInForGroundOrBackGround();

        InterstitialAdClass.loadInterstitialAds();
      });
    });
  }

  static bool getInterstitialType(String? interstitialTypeName) {
    bool isFacebookAds = false;
    if (interstitialTypeName != null) {
      isFacebookAds = interstitialTypeName == 'facebook' ? true : false;
    }

    return isFacebookAds;
  }

  void appInForGroundOrBackGround() {
    if (AdConstants.isShowAdsOrNot == true) {
      subscription = FGBGEvents.stream.listen((event) async {
        appOpenAdManager.loadAd(id: AdConstants.appOpenAdsId);
        // appOpenAdManager.loadAd(id: "ca-app-pub-3940256099942544/3419835294");

        if (event == FGBGType.foreground) {
          if (!AppOpenAdManager.isShowingAd) {
            log("message---1 ");
            appOpenAdManager.showAdIfAvailable();
          }
        }
        if (event == FGBGType.background) {
          log("message---2 ");

          appOpenAdManager.loadAd(id: AdConstants.appOpenAdsId);
          // appOpenAdManager.loadAd(id: "ca-app-pub-3940256099942544/3419835294");
        }
      });
    }
  }
}
