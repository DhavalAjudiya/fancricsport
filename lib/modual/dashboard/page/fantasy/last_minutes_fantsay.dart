import 'package:fancricsport/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fancricsport/modual/dashboard/modal/last_minutes_model.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';

class LastMinutesPage extends StatefulWidget {
  const LastMinutesPage({super.key});

  @override
  State<LastMinutesPage> createState() => _LastMinutesPageState();
}

class _LastMinutesPageState extends State<LastMinutesPage> {
  List<LastMinutesFantasy> fantasyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.silverColor),
        backgroundColor: AppColor.blackDarkT,
        title: AppText("Last Minutes Fantasy",
            fontSize: SizeUtils.fSize_17(),
            color: AppColor.silverColor,
            fontWeight: FontWeight.w600),
      ),
      body: StreamBuilder(
        stream:
            AppConfig.databaseReference.collection("lastMinutes").snapshots(),
        builder: (context, snapshot) {
          fantasyList.clear();
          for (var element in snapshot.data?.docs ?? []) {
            LastMinutesFantasy fantasyModal = LastMinutesFantasy.fromJson(
                element.data() as Map<String, dynamic>);
            fantasyList.add(fantasyModal);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 25),
                    child: const CupertinoActivityIndicator(
                        color: AppColor.white)),
              );
            default:
              if (snapshot.hasError) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(AssetsPath.empty),
                        AppText("Fantasy Articles coming soon!",
                            fontSize: SizeUtils.fSize_20(),
                            color: AppColor.darkGrayTextDarkT,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.data?.docs.isEmpty ?? false) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 25),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(AssetsPath.empty),
                        AppText("Fantasy Articles coming soon!",
                            fontSize: SizeUtils.fSize_20(),
                            color: AppColor.darkGrayTextDarkT,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                );
              } else {
                return ListView.separated(
                  padding: EdgeInsets.only(
                    top: SizeUtils.horizontalBlockSize * 1,
                    left: SizeUtils.horizontalBlockSize * 3,
                    right: SizeUtils.horizontalBlockSize * 3,
                    bottom: SizeUtils.horizontalBlockSize * 10,
                  ),
                  itemCount: fantasyList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = fantasyList[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.horizontalBlockSize * 2,
                        horizontal: SizeUtils.horizontalBlockSize * 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (data.expertName?.isNotEmpty ?? false)
                              ? AppText(
                                  data.expertName ?? '',
                                  color: AppColor.silverColor,
                                  fontSize: SizeUtils.fSize_15(),
                                  fontWeight: FontWeight.bold,
                                )
                              : const SizedBox.shrink(),
                          SizedBox(height: SizeUtils.horizontalBlockSize * 1),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ImageFade(
                              width: double.infinity,
                              fit: BoxFit.fill,
                              image: NetworkImage(data.teamImage ?? ''),
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
                              loadingBuilder: (context, progress, chunkEvent) =>
                                  Center(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            SizeUtils.horizontalBlockSize * 20),
                                    child: const CupertinoActivityIndicator(
                                        color: AppColor.white)),
                              ),
                              errorBuilder: (context, error) => Container(
                                color: const Color(0xFF6F6D6A),
                                alignment: Alignment.center,
                                child: const Icon(Icons.warning,
                                    color: Colors.black26, size: 128.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                        (index + 1) % 2 == 0
                            ? const BannerAds()
                            : const Divider(
                                color: Colors.grey, height: 0, thickness: 2),
                        SizedBox(height: SizeUtils.horizontalBlockSize * 1.5),
                      ],
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}
