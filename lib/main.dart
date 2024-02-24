import 'dart:async';

import 'package:fancricsport/fancricsport.dart';
import 'package:fancricsport/helper/shared_preference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPreference.initMySharedPreferences();
  runApp(FanCricSport());
}
