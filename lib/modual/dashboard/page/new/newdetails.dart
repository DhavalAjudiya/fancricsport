import 'package:fancricsport/modual/dashboard/controller/match_controller.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/utils/time_manager.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:fancricsport/widget/image_lodar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatelessWidget {
  NewsDetailsPage({Key? key}) : super(key: key);
  MatchController matchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        backgroundColor: AppColor.blackDarkT,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.silverColor),
        title: AppText(matchController.newsAuthor.value ?? "",
            color: AppColor.silverColor,
            fontSize: SizeUtils.fSize_16(),
            fontWeight: FontWeight.w600),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: "image${matchController.index.value}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: matchController.newsURLToImage.value.isEmpty
                          ? Image.asset(
                              AssetsPath.loaderImage,
                              fit: BoxFit.cover,
                              height: SizeUtils.horizontalBlockSize * 50,
                              width: SizeUtils.horizontalBlockSize * 100,
                            )
                          : Image.network(
                              matchController.newsURLToImage.value,
                              fit: BoxFit.cover,
                              height: SizeUtils.horizontalBlockSize * 50,
                              width: SizeUtils.horizontalBlockSize * 100,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: SizeUtils.horizontalBlockSize * 50,
                                  width: SizeUtils.horizontalBlockSize * 100,
                                  decoration: BoxDecoration(
                                    color: AppColor.blackDarkT,
                                    image: DecorationImage(
                                      image: AssetImage(AssetsPath.loaderImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                    )),
                /*               child: imageLoader(
                      r: 12,
                      url: matchController.newsURLToImage.value ?? "",
                      h: SizeUtils.horizontalBlockSize * 50,
                      w: SizeUtils.horizontalBlockSize * 100)*/
                // ),
                SizedBox(height: SizeUtils.horizontalBlockSize * 3),
                AppText(
                    TimeManager.setNewsUpdateTime(
                        int.parse(matchController.publishedAT.value.toString())),
                    color: AppColor.darkGrayTextDarkT,
                    fontSize: SizeUtils.fSize_14(),
                    fontWeight: FontWeight.w500),
                SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                AppText(matchController.newsTitle.value,
                    color: AppColor.darkGrayTextDarkT,
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w500),
                SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                AppText(matchController.content.value,
                    color: AppColor.darkGrayTextDarkT,
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w500),
                SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                AppText(matchController.newsDescription.value,
                    color: AppColor.darkGrayTextDarkT,
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w500),
                SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                /*GestureDetector(
                  onTap: () {
                    final Uri _url = Uri.parse(matchController.newsURL.value);
            
                    _launchUrl(_url);
                  },
                  child: AppText(matchController.newsURL.value,
                      color: AppColor.blueColor,
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w500),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
