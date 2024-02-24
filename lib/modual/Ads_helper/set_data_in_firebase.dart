import 'dart:developer';

import 'package:fancricsport/res/appconfig.dart';
import 'package:get/get.dart';

class SetAdIdController extends GetxController {
  Future<void> setAdsData() async {
    try {
      AppConfig.databaseReference
          .collection(AppConfig.advertisementData)
          .doc(AppConfig.updateAdvertisementData)
          .set({
        'adsShowOrNot': true,
        'interstitialId': 'ca-app-pub-3940256099942544/1033173712',
        'bannerId': 'ca-app-pub-3940256099942544/6300978111',
        'nativeId': 'ca-app-pub-3940256099942544/6300978111',
        'opneapp': "0",
        'appstart': "0",
        'firstCountDown': '1',
        'faceBookInterstitialId': 'IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617',
        'faceBookBannerId': 'IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047',
        'faceBookNativeId': 'IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512',
        'appOpenAdsId': 'ca-app-pub-3940256099942544/9257395921',
        'adMobOrFaceBook': 'admob',
        'applink': '',
        'privacypolicy': '',
      });
      log("setadid----------");
    } catch (e, st) {
      log("setadid----------$e---------\n--$st--");
    }
  }

  @override
  void onInit() {
    super.onInit();
    setAdsData();
  }
}
