import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();

  static final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  static const String baseURL = "http://cricpro.cricnet.co.in/api/values/";
  static const String live = "LiveLine";
  static const String lineMatch = "LiveLine_Match";
  static const String upComingMatch = "upcomingMatches";
  static const String news = "SportsNews";
  static String newsCollocation = "news";
  static String advertisementData = "AdvertisementData";
  static String updateAdvertisementData = "updateAdvertisementData";

  static ValueNotifier<int> bottomBarValue = ValueNotifier<int>(0);
  static ValueNotifier<int> completedBottomBarValue = ValueNotifier<int>(0);

  static const dateFormat = 'EEE, dd MMM';
  static const dateTimeFormate = 'EEEE, dd MMM';
  static const showAd = 'SHOWAD';

  static Map<String, String> getRequestHeader() {
    return {"Content-Type": "application/json"};
  }
}
