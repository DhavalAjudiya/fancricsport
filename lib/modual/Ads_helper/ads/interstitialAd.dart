import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
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

  // static bool firstAdShowDelayed = true;
  static int _numInterstitialLoadAttempts = 0;
  static int interstitialAdShow = 0;
  static bool isAdIsRewarded = false;
  static late RewardedAd rewardAd;

  static void loadInterstitialAds() async {
    if (AdConstants.isShowAdsOrNot == true) {
      if (AdConstants.isShowFacebookInterstitialAds) {
        loadFacebookAd("FacebookInterstitialAds");
      } else {
        loadAdMobAd("AdMobInterstitialAds");
      }

      // if (firstAdShowDelayed) {
      //   Future.delayed(Duration(seconds: AdConstants.firstCoolDown), () {
      //     firstAdShowDelayed = false;
      //   });
      // }
    }
  }

  static loadFacebookAd(String adsType) {
    print('InterstitialAdResult 1---${AdConstants.faceBookInterstitialId}');

    FacebookInterstitialAd.loadInterstitialAd(
      placementId: AdConstants.faceBookInterstitialId,
      // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
      listener: (result, value) {
        switch (result) {
          case InterstitialAdResult.LOADED:
            isFacebookInterstitialAdLoaded = true;
            print('LOADED ads');
            break;
          case InterstitialAdResult.DISMISSED:
            isFacebookInterstitialAdLoaded = false;
            print('DISMISSED ads');
            loadInterstitialAds();
            break;
          case InterstitialAdResult.ERROR:
            if (adsType != "AdMobInterstitialAds") {
              loadAdMobAd("FacebookInterstitialAds");
              print('InterstitialAdResult ee---${value}');
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
      // adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          adMobInterstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          isInterstitialAdLoaded = true;
          // if(Utils.firstTimeAdShow) {
          //   Utils.firstTimeAdShow = false;
          //   adMobInterstitialAd.show();
          // }
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (adsType != "FacebookInterstitialAds") {
            loadFacebookAd("AdMobInterstitialAds");
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

  // static firstTimeDisplayAd() async {
  //   if (dashBoardController.firstTimeAdShow) {
  //     print('forInfoData in interstitialId===>>>${AdConstants.interstitialId}');
  //     InterstitialAd.load(
  //       adUnitId: AdConstants.interstitialId,
  //       request: request,
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           dashBoardController.firstTimeAdShow = false;
  //           adMobInterstitialAd = ad.show() as InterstitialAd;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           firstTimeDisplayAd();
  //         },
  //       ),
  //     );
  //   }
  // }

  static showInterstitialAds() {
    if (interstitialAdShow == AdConstants.adShowCount) {
      interstitialAdShow = 0;
      if (isReadyToShowAd && adMobInterstitialAd != null) {
        adMobInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (InterstitialAd ad) =>
              print('ad onAdShowedFullScreenContent.'),
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            ad.dispose();
            loadInterstitialAds();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            print('$ad onAdFailedToShowFullScreenContent: $error');
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
    /* if (!firstAdShowDelayed) {
      if (isReadyToShowAd && adMobInterstitialAd != null) {
        adMobInterstitialAd!.fullScreenContentCallback =
            FullScreenContentCallback(
          onAdShowedFullScreenContent: (InterstitialAd ad) =>
              print('ad onAdShowedFullScreenContent.'),
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            ad.dispose();
            loadInterstitialAds();
          },
          onAdFailedToShowFullScreenContent:
              (InterstitialAd ad, AdError error) {
            print('$ad onAdFailedToShowFullScreenContent: $error');
            ad.dispose();
            loadInterstitialAds();
          },
        );
        adMobInterstitialAd!.show();
        adMobInterstitialAd = null;
        isReadyToShowAd = false;
        // Future.delayed(
        //   Duration(seconds: AdConstants.secondCoolDown),
        //       () {
        //     isReadyToShowAd = true;
        //   },
        // );
      } else if (isReadyToShowAd && isFacebookInterstitialAdLoaded) {
        FacebookInterstitialAd.showInterstitialAd();
        isReadyToShowAd = false;
        // Future.delayed(
        //   Duration(seconds: AdConstants.secondCoolDown),
        //       () {
        //     isReadyToShowAd = true;
        //   },
        // );
      } else {}
    } else {}*/
  }
}
