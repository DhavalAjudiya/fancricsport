import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAds extends StatefulWidget {
  static bool isLoaded = false;

  NativeAds({
    Key? key,
  }) : super(key: key);

  @override
  State<NativeAds> createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds> {
  bool isAdError = false;
  NativeAd? _nativeAd;

  @override
  void initState() {
    super.initState();
    loadNativeAd();
  }

  void loadNativeAd() {
    _nativeAd = NativeAd(
      nativeAdOptions: NativeAdOptions(
        mediaAspectRatio: MediaAspectRatio.any,
      ),
      // adUnitId: '/6499/example/native',
      adUnitId: AdConstants.nativeAdsId,
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            NativeAds.isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$NativeAd failedToLoad: $error');
          setState(() {
            NativeAds.isLoaded = true;
          });
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$NativeAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$NativeAd onAdClosed.'),
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: Colors.white12,
        callToActionTextStyle: NativeTemplateTextStyle(
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.black38,
          backgroundColor: Colors.white70,
        ),
      ),
    );
    _nativeAd?.load();
  }

  @override
  Widget build(BuildContext context) {
    if (AdConstants.isShowAdsOrNot == true) {
      if (NativeAds.isLoaded) {
        if (isAdError == true) {
          return Container(
            alignment: Alignment.center,
            height: SizeUtils.verticalBlockSize * 40,
            // color: Colors.transparent,
            // color: Colors.black12,
            child: AdWidget(
              ad: _nativeAd!,
            ),
          );
        }
        return AdConstants.isShowFacebookBannerAds
            ? Container(
                height: 300,
                alignment: const Alignment(0.5, 1),
                child: FacebookNativeAd(
                  placementId: AdConstants.faceBookNativeAdsId,
                  // placementId:
                  //     "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
                  adType: NativeAdType.NATIVE_AD_VERTICAL,
                  height: 300,
                  bannerAdSize: NativeBannerAdSize.HEIGHT_120,
                  width: double.infinity,
                  isMediaCover: true,
                  backgroundColor: Colors.blue,
                  titleColor: Colors.white,
                  descriptionColor: Colors.white,
                  buttonColor: Colors.deepPurple,
                  buttonTitleColor: Colors.white,
                  buttonBorderColor: Colors.white,
                  listener: (result, value) {
                    print("Native Banner Ad: $result --> $value");
                    if (result == NativeAdResult.ERROR && value["invalidated"] == true) {
                      setState(() {
                        print("Native Banner error: $result --> $value");
                        isAdError = true;
                        // isLoaded = AdConstants.isShowNativeAds ;
                      });
                    }
                  },
                  keepExpandedWhileLoading: true,
                  keepAlive: true,
                  expandAnimationDuraion: 1000,
                ),
              )
            : ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 300,
                  minHeight: SizeUtils.horizontalBlockSize * 80,
                  maxHeight: SizeUtils.horizontalBlockSize * 100,
                  maxWidth: 450,
                ),
                child: AdWidget(ad: _nativeAd!),
              );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
