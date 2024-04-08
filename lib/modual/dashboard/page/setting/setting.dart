import 'package:fancricsport/modual/Ads_helper/ad_constant.dart';
import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/utils/size_utils.dart';
import 'package:fancricsport/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

enum Availability { loading, available, unavailable }

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final InAppReview inAppReview = InAppReview.instance;
  Availability availability = Availability.loading;
  PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
    buildSignature: '',
  );
  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  @override
  void initState() {
    initPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackDarkT,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.blackDarkT,
        title: const AppText("Setting", color: AppColor.white, fontWeight: FontWeight.w600),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 3),
        child: Column(
          children: [
            item(
              text: "Rate us",
              onTap: () async {
                try {
                  final isAvailable = await inAppReview.isAvailable();
                  if (isAvailable == true) {
                    inAppReview.requestReview();
                  }
                } catch (_) {
                  setState(() => availability = Availability.unavailable);
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2),
              child: const Divider(color: Colors.grey, height: 0),
            ),
            item(
              text: "Share app",
              onTap: () async {
                Share.share(AdConstants.appLink);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2),
              child: const Divider(color: Colors.grey, height: 0),
            ),
            item(
              text: "Terms & Condition",
              onTap: () async {
                if (!await launchUrl(
                  Uri.parse(AdConstants.termsConditions),
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception("Error");
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2),
              child: const Divider(color: Colors.grey, height: 0),
            ),
            item(
              text: "Privacy Policy",
              onTap: () async {
                if (!await launchUrl(
                  Uri.parse(AdConstants.termsConditions),
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception("Error");
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2),
              child: const Divider(color: Colors.grey, height: 0),
            ),
            Row(
              children: [
                AppText(
                  "Version",
                  fontSize: SizeUtils.fSize_18(),
                  color: AppColor.silverColor,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                AppText(
                  packageInfo.version,
                  fontSize: SizeUtils.fSize_18(),
                  color: AppColor.silverColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  item({String? text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          AppText(
            text ?? "",
            fontSize: SizeUtils.fSize_18(),
            color: AppColor.silverColor,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColor.silverColor,
            size: SizeUtils.horizontalBlockSize * 6,
          )
        ],
      ),
    );
  }
}
