import 'dart:developer';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_constant.dart';

class BannerAds extends StatefulWidget {
  static bool isLoaded = false;
  bool adSize = false;

  BannerAds({Key? key, this.adSize = false}) : super(key: key);

  @override
  _BannerAdsState createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
  BannerAd? _ad;
  bool isAdError = false;

  @override
  void initState() {
    super.initState();
    // clearBannerAdData();
    adsFunction();
  }

  clearBannerAdData() {
    setState(() {
      AdConstants.url = '';
      AdConstants.id = 0;
      AdConstants.redirectionLink = '';
    });
  }

  void adsFunction() {
    _ad = BannerAd(
      size: AdSize(height: widget.adSize == true ? 50 : 70, width: 400),
      // size: AdSize.banner,

      adUnitId: AdConstants.bannerAdsId,
      // adUnitId: "ca-app-pub-3940256099942544/6300978111",
      // adUnitId: "/6499/example/banner",
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            BannerAds.isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('$BannerAd failedToLoad: $error');
          setState(() {
            BannerAds.isLoaded = true;
          });
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
      request: const AdRequest(),
    );
    _ad!.load();
  }

  @override
  Widget build(BuildContext context) {
    if (AdConstants.isShowAdsOrNot == true) {
      if (BannerAds.isLoaded) {
        if (isAdError == true) {
          return Container(
            width: _ad!.size.width.toDouble(),
            height: _ad!.size.height.toDouble(),
            alignment: Alignment.center,
            child: AdWidget(
              ad: _ad!,
            ),
          );
        }
        return AdConstants.isShowFacebookBannerAds
            ? Container(
                height: 90,
                alignment: const Alignment(0.5, 1),
                child: FacebookBannerAd(
                  placementId: AdConstants.faceBookBannerAdsId,
                  // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047",
                  bannerSize: BannerSize.LARGE,
                  listener: (result, value) {
                    switch (result) {
                      case BannerAdResult.ERROR:
                        print("Facebook Banner Ad Error: $value");
                        setState(() {
                          isAdError = true;
                        });
                        break;
                      case BannerAdResult.LOADED:
                        print("Facebook Banner Ad Loaded: $value");
                        break;
                      case BannerAdResult.CLICKED:
                        break;
                      case BannerAdResult.LOGGING_IMPRESSION:
                        break;
                    }
                  },
                ),
              )
            : Container(
                width: _ad!.size.width.toDouble(),
                height: _ad!.size.height.toDouble(),
                alignment: Alignment.center,
                child: AdWidget(
                  ad: _ad!,
                ),
              );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}
