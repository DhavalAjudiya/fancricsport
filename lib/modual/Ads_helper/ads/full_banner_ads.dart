import 'dart:developer';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_constant.dart';

class FullBannerAds extends StatefulWidget {
  static bool isLoaded = false;
  // bool type = false;

  FullBannerAds({Key? key}) : super(key: key);

  @override
  _FullBannerAdsState createState() => _FullBannerAdsState();
}

class _FullBannerAdsState extends State<FullBannerAds> {
  BannerAd? _ad;
  bool isAdError = false;
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  @override
  void initState() {
    super.initState();
    clearBannerAdData();
    // CustomBanners();
    adsFunction();
    // _ad!.load();
  }

  clearBannerAdData() {
    setState(() {
      AdConstants.url = '';
      AdConstants.id = 0;
      AdConstants.redirectionLink = '';
    });
  }

  void adsFunction() {
    _nativeAd = NativeAd(
      adUnitId: '/6499/example/native',
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          print('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
            FullBannerAds.isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$NativeAd failedToLoad: $error');
          setState(() {
            FullBannerAds.isLoaded = true;
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
    )..load();
    /* _ad = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdConstants.bannerAdsId,
      // adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            FullBannerAds.isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('$BannerAd failedToLoad: $error');
          setState(() {
            FullBannerAds.isLoaded = true;
          });
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
      request: const AdRequest(),
    );*/
    _ad?.load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("AdConstants.isShowFacebookBannerAds------${AdConstants.isShowFacebookBannerAds}");
    if (AdConstants.isShowAdsOrNot == true) {
      if (FullBannerAds.isLoaded) {
        if (isAdError == true) {
          return Container(
            width: _ad!.size.width.toDouble(),
            height: _ad!.size.height.toDouble(),
            // alignment: Alignment.center,
            child: AdWidget(
              ad: _nativeAd!,
            ),
          );
        }
        return AdConstants.isShowFacebookBannerAds
            ? Container(
                height: SizeUtils.verticalBlockSize * 35,
                alignment: const Alignment(0.5, 1),
                child: FacebookNativeAd(
                  placementId: AdConstants.faceBookNativeAdsId,
                  // placementId:
                  //     "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
                  adType: NativeAdType.NATIVE_AD_VERTICAL,
                  // height: SizeUtils.verticalBlockSize * 16,
                  height: 350,
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
                    if (result == NativeAdResult.ERROR && value["invalidated"] == true) {
                      isAdError = true;
                      setState(() {});
                    }
                  },
                  keepExpandedWhileLoading: true,
                  keepAlive: true,
                  expandAnimationDuraion: 1000,
                ),
              )
            : ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 300,
                  minHeight: 350,
                  maxHeight: 400,
                  maxWidth: 450,
                ),
                child: AdWidget(ad: _nativeAd!),
              );
        /*Container(
                width: _ad!.size.width.toDouble(),
                height: _ad!.size.height.toDouble(),
                // alignment: Alignment.center,
                child: AdWidget(
                  ad: _ad!,
                ),
              );*/
      } else {
        return const SizedBox();
      }
    } else {
      return SizedBox();
    }
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return (!ConstantsData.status)
//         ? bannerAds.isLoaded
//             ? Container(
//                 child: AdWidget(
//                   ad: _ad,
//                 ),
//                 width: _ad.size.width.toDouble(),
//                 height: _ad.size.height.toDouble(),
//                 alignment: Alignment.center,
//               )
//             : SizedBox()
//         : CustomBanners();
//   }
// }

// class CustomBanners extends StatefulWidget {
//   @override
//   _CustomBannersState createState() => _CustomBannersState();
// }
//
// class _CustomBannersState extends State<CustomBanners> {
//   final _getPropertiesController = GetPropertiesController();
//
//   CustomBannerModel getCustomBannerModel = CustomBannerModel();
//
//   Future getCustomBanners() async {
//     getCustomBannerModel = await _getPropertiesController.getCustomBanners();
//     setState(() {
//       ConstantsData.url = getCustomBannerModel.url ?? 'null';
//       ConstantsData.id = getCustomBannerModel.id ?? '9';
//       ConstantsData.redirectionLink =
//           getCustomBannerModel.redirectionLink ?? 'null';
//       ConstantsData.status = getCustomBannerModel.status ?? false;
//     });
//
//     return getCustomBannerModel;
//   }
//
//   @override
//   void initState() {
//     getCustomBannerModel = null;
//     getCustomBanners();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return (ConstantsData.url.isNotEmpty)
//         ? GestureDetector(
//             onTap: () async {
//               _getPropertiesController.getClickEvent(ConstantsData.id);
//               String url = ConstantsData.redirectionLink;
//               if (await canLaunch(url))
//                 await launch(url);
//               else
//                 // can't launch url, there is some error
//                 throw "Could not launch $url";
//             },
//             child: Stack(alignment: Alignment.topLeft, children: [
//               Container(
//                 color: Colors.black12,
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 13.0,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.network(
//                         ConstantsData.url,
//                         fit: BoxFit.fill,
//                         height: MediaQuery.of(context).size.height / 13.0,
//                         width: MediaQuery.of(context).size.width,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ]),
//           )
//         : SizedBox();
//   }
// }

///

// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:stock_info/ads/ad_constant.dart';
//
// class BannerAds extends StatefulWidget {
//   static bool isLoaded = false;
//
//   const BannerAds({Key? key}) : super(key: key);
//
//   @override
//   _BannerAdsState createState() => _BannerAdsState();
// }
//
// class _BannerAdsState extends State<BannerAds> {
//   BannerAd? _ad;
//
//   @override
//   void initState() {
//     super.initState();
//     clearBannerAdData();
//     // CustomBanners();
//     adsFunction();
//     _ad!.load();
//   }
//
//   clearBannerAdData() {
//     setState(() {
//       AdConstants.url = '';
//       AdConstants.id = 0;
//       AdConstants.redirectionLink = '';
//     });
//   }
//
//   void adsFunction() {
//     _ad = BannerAd(
//       size: AdSize.fullBanner,
//       adUnitId: AdConstants.bannerAdsId,
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           setState(() {
//             BannerAds.isLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           log('$BannerAd failedToLoad: $error');
//           ad.dispose();
//         },
//         onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
//         onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
//       ),
//       request: const AdRequest(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BannerAds.isLoaded
//         ? Container(
//             child: AdWidget(
//               ad: _ad!,
//             ),
//             width: _ad!.size.width.toDouble(),
//             height: _ad!.size.height.toDouble(),
//             alignment: Alignment.center,
//           )
//         : const SizedBox();
//   }
// }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return (!ConstantsData.status)
// //         ? bannerAds.isLoaded
// //             ? Container(
// //                 child: AdWidget(
// //                   ad: _ad,
// //                 ),
// //                 width: _ad.size.width.toDouble(),
// //                 height: _ad.size.height.toDouble(),
// //                 alignment: Alignment.center,
// //               )
// //             : SizedBox()
// //         : CustomBanners();
// //   }
// // }
//
// // class CustomBanners extends StatefulWidget {
// //   @override
// //   _CustomBannersState createState() => _CustomBannersState();
// // }
// //
// // class _CustomBannersState extends State<CustomBanners> {
// //   final _getPropertiesController = GetPropertiesController();
// //
// //   CustomBannerModel getCustomBannerModel = CustomBannerModel();
// //
// //   Future getCustomBanners() async {
// //     getCustomBannerModel = await _getPropertiesController.getCustomBanners();
// //     setState(() {
// //       ConstantsData.url = getCustomBannerModel.url ?? 'null';
// //       ConstantsData.id = getCustomBannerModel.id ?? '9';
// //       ConstantsData.redirectionLink =
// //           getCustomBannerModel.redirectionLink ?? 'null';
// //       ConstantsData.status = getCustomBannerModel.status ?? false;
// //     });
// //
// //     return getCustomBannerModel;
// //   }
// //
// //   @override
// //   void initState() {
// //     getCustomBannerModel = null;
// //     getCustomBanners();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return (ConstantsData.url.isNotEmpty)
// //         ? GestureDetector(
// //             onTap: () async {
// //               _getPropertiesController.getClickEvent(ConstantsData.id);
// //               String url = ConstantsData.redirectionLink;
// //               if (await canLaunch(url))
// //                 await launch(url);
// //               else
// //                 // can't launch url, there is some error
// //                 throw "Could not launch $url";
// //             },
// //             child: Stack(alignment: Alignment.topLeft, children: [
// //               Container(
// //                 color: Colors.black12,
// //                 width: MediaQuery.of(context).size.width,
// //                 height: MediaQuery.of(context).size.height / 13.0,
// //                 child: SingleChildScrollView(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Image.network(
// //                         ConstantsData.url,
// //                         fit: BoxFit.fill,
// //                         height: MediaQuery.of(context).size.height / 13.0,
// //                         width: MediaQuery.of(context).size.width,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ]),
// //           )
// //         : SizedBox();
// //   }
// // }
