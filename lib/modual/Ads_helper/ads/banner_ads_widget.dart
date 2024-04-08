import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatefulWidget {
  const BannerAds({Key? key}) : super(key: key);

  @override
  State<BannerAds> createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
  BannerAd? bannerAd;
  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return AdConstants.isShowAdsOrNot
        ? AdConstants.isShowFacebookBannerAds
            ? FacebookBannerAd(
                placementId: AdConstants.faceBookBannerAdsId,
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {
                  switch (result) {
                    case BannerAdResult.ERROR:
                      debugPrint("Facebook Banner Ad Error0: $value");
                      setState(() {});
                      break;
                    case BannerAdResult.LOADED:
                      debugPrint("Facebook Banner Ad Loaded: $value");
                      break;
                    case BannerAdResult.CLICKED:
                      break;
                    case BannerAdResult.LOGGING_IMPRESSION:
                      break;
                  }
                },
              )
            : bannerAd != null
                ? SizedBox(
                    width: bannerAd?.size.width.toDouble(),
                    height: bannerAd?.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd!),
                  )
                : const SizedBox.shrink()
        : const SizedBox.shrink();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  void load() {
    BannerAd(
      adUnitId: AdConstants.bannerAdsId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {},
        onAdClosed: (Ad ad) {},
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }
}
