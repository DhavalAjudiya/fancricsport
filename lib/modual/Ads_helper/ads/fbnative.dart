import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:flutter/material.dart';

class FBNativeAds extends StatefulWidget {
  static bool isLoadedFBNative = false;

  FBNativeAds({
    Key? key,
  }) : super(key: key);

  @override
  State<FBNativeAds> createState() => _FBNativeAdsState();
}

class _FBNativeAdsState extends State<FBNativeAds> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("NativeAds.isLoaded -----${AdConstants.isShowFacebookBannerAds}");

    return Container(
      height: 300,
      alignment: const Alignment(0.5, 1),
      child: FacebookNativeAd(
        placementId: AdConstants.faceBookNativeAdsId,
        // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
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
            FBNativeAds.isLoadedFBNative = true;
            print(
                "Native Banner error: $result --> $value------>${FBNativeAds.isLoadedFBNative}");
            // isLoaded = AdConstants.isShowNativeAds ;
            setState(() {});
          }
        },
        keepExpandedWhileLoading: true,
        keepAlive: true,
        expandAnimationDuraion: 1000,
      ),
    );
  }
}
