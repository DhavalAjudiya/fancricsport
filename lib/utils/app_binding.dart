import 'package:fancricsport/modual/Ads_helper/advertisemment_controller.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<SetAdIdController>(SetAdIdController());
    Get.put<AdvertisementController>(AdvertisementController());
    Get.put<MatchController>(MatchController());
  }
}
