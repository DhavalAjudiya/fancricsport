import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/navigation_utils/navigation.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

import '../../../../widget/app_text.dart';

class TeamViewPage extends StatefulWidget {
  const TeamViewPage({Key? key}) : super(key: key);

  @override
  State<TeamViewPage> createState() => _TeamViewPageState();
}

class _TeamViewPageState extends State<TeamViewPage> {
  MatchController matchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: SizeUtils.horizontalBlockSize * 8,
        iconTheme: const IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.blackDarkT,
        title: GestureDetector(
          onTap: () {
            Navigation.pop();
          },
          child: AppText(
            matchController.fantasyTeamView.value,
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontSize: SizeUtils.fSize_15(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: SizeUtils.horizontalBlockSize * 3,
                left: SizeUtils.horizontalBlockSize * 3,
                top: SizeUtils.horizontalBlockSize * 3,
                bottom: SizeUtils.horizontalBlockSize * 6,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ImageFade(
                  image: NetworkImage(matchController.fantasyTeamVImage.value),
                  duration: const Duration(milliseconds: 500),
                  syncDuration: const Duration(milliseconds: 150),
                  placeholder: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetsPath.loaderImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  loadingBuilder: (context, progress, chunkEvent) => Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeUtils.horizontalBlockSize * 20),
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                  ),
                  errorBuilder: (context, error) => Container(
                    color: const Color(0xFF6F6D6A),
                    alignment: Alignment.center,
                    child: const Icon(Icons.warning,
                        color: Colors.black26, size: 128.0),
                  ),
                ),
              ),
            ),
            const BannerAds(),
          ],
        ),
      ),
    );
  }
}
