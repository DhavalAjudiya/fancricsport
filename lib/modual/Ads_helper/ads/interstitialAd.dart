import 'dart:developer';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class InterstitialAdClass {
  static InterstitialAd? adMobInterstitialAd;
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  static bool isFacebookInterstitialAdLoaded = false;
  static bool isInterstitialAdLoaded = false;
  static bool isReadyToShowAd = true;

  static int _numInterstitialLoadAttempts = 0;
  static int interstitialAdShow = 0;

  static void loadInterstitialAds() async {
    if (AdConstants.isShowAdsOrNot == true) {
      if (AdConstants.isShowFacebookInterstitialAds) {
        loadFacebookAd("FacebookInterstitialAds");
      } else {
        loadAdMobAd("AdMobInterstitialAds");
      }
    }
  }

  static loadFacebookAd(String adsType) {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: AdConstants.faceBookInterstitialId,
      listener: (result, value) {
        switch (result) {
          case InterstitialAdResult.LOADED:
            isFacebookInterstitialAdLoaded = true;
            debugPrint('LOADED ads');

            break;
          case InterstitialAdResult.DISMISSED:
            isFacebookInterstitialAdLoaded = false;

            loadInterstitialAds();
            break;
          case InterstitialAdResult.ERROR:
            if (adsType != "AdMobInterstitialAds") {
              loadAdMobAd("AdMobInterstitialAds");
            }
            break;
          default:
        }
      },
    );
  }

  static loadAdMobAd(String adsType) {
    InterstitialAd.load(
      adUnitId: AdConstants.interstitialId,
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          adMobInterstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          isInterstitialAdLoaded = true;
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (adsType != "FacebookInterstitialAds") {
            loadFacebookAd("FacebookInterstitialAds");
          }
          _numInterstitialLoadAttempts += 1;
          adMobInterstitialAd = null;
          if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            loadInterstitialAds();
          }
        },
      ),
    );
  }

  static showInterstitialAds() {
    if (interstitialAdShow == AdConstants.adShowCount) {
      interstitialAdShow = 0;
      if (isReadyToShowAd && adMobInterstitialAd != null) {
        adMobInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (InterstitialAd ad) =>
              debugPrint('ad onAdShowedFullScreenContent.'),
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            ad.dispose();
            loadInterstitialAds();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            ad.dispose();
            loadInterstitialAds();
          },
        );
        adMobInterstitialAd?.show();
        adMobInterstitialAd = null;
        interstitialAdShow++;
        isReadyToShowAd = true;
      } else if (isReadyToShowAd && isFacebookInterstitialAdLoaded) {
        FacebookInterstitialAd.showInterstitialAd();
        isReadyToShowAd = true;
        interstitialAdShow++;
      } else {}
    } else {
      interstitialAdShow++;
    }
  }
}
