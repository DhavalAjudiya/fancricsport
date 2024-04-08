import 'dart:async';

import 'package:fancricsport/fancricsport.dart';
import 'package:fancricsport/helper/shared_preference.dart';
import 'package:fancricsport/res/appconfig.dart';
import 'package:fancricsport/utils/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initialize();
  AppConfig.messaging.subscribeToTopic("fancric");
  await MobileAds.instance.initialize();
  await AppPreference.initMySharedPreferences();

  runApp(const FanCricSport());
}
