import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Adsmodel adsmodelFromJson(String str) => Adsmodel.fromJson(json.decode(str));

String adsmodelToJson(Adsmodel data) => json.encode(data.toJson());

class Adsmodel {
  Adsmodel({
    this.adsShowOrNot,
    this.interstitialId,
    this.bannerId,
    this.firstCountDown,
    this.appstart,
    this.opneapp,
    this.faceBookInterstitialId,
    this.adMobOrFaceBook,
    this.faceBookBannerId,
    this.appOpenAdsId,
    this.docId,
    this.faceBookTestId,
    this.nativeId,
    this.faceBookNativeId,
    this.privacypolicy,
    this.termsConditions,
    this.applink,
  });

  bool? adsShowOrNot;
  String? interstitialId;
  String? termsConditions;
  String? privacypolicy;
  String? applink;
  String? bannerId;
  String? nativeId;
  String? firstCountDown;
  String? appstart;
  String? opneapp;
  String? faceBookInterstitialId;
  String? adMobOrFaceBook;
  String? faceBookBannerId;
  String? faceBookNativeId;
  String? appOpenAdsId;
  String? docId;
  String? faceBookTestId;

  Adsmodel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    adsShowOrNot = data["adsShowOrNot"] == null ? null : data["adsShowOrNot"];
    interstitialId = data["interstitialId"] == null ? null : data["interstitialId"];
    bannerId = data["bannerId"] == null ? null : data["bannerId"];
    privacypolicy = data["privacypolicy"] == null ? null : data["privacypolicy"];
    termsConditions = data["termsConditions"] == null ? null : data["termsConditions"];
    applink = data["applink"] == null ? null : data["applink"];
    nativeId = data["nativeId"] == null ? null : data["nativeId"];
    firstCountDown = data["firstCountDown"] == null ? null : data["firstCountDown"];
    appstart = data["appstart"] == null ? null : data["appstart"];
    opneapp = data["opneapp"] == null ? null : data["opneapp"];
    faceBookInterstitialId =
        data["faceBookInterstitialId"] == null ? null : data["faceBookInterstitialId"];
    adMobOrFaceBook = data["adMobOrFaceBook"] == null ? null : data["adMobOrFaceBook"];
    faceBookBannerId = data["faceBookBannerId"] == null ? null : data["faceBookBannerId"];
    faceBookNativeId = data["faceBookNativeId"] == null ? null : data["faceBookNativeId"];
    appOpenAdsId = data["appOpenAdsId"] == null ? null : data["appOpenAdsId"];
    docId = data["docId"] == null ? null : data["docId"];
    faceBookTestId = data["faceBookTestId"] == null ? null : data["faceBookTestId"];
  }

  factory Adsmodel.fromJson(Map<String, dynamic> json) => Adsmodel(
        adsShowOrNot: json["adsShowOrNot"] == null ? null : json["adsShowOrNot"],
        interstitialId: json["interstitialId"] == null ? null : json["interstitialId"],
        bannerId: json["bannerId"] == null ? null : json["bannerId"],
        applink: json["applink"] == null ? null : json["applink"],
        privacypolicy: json["privacypolicy"] == null ? null : json["privacypolicy"],
    termsConditions: json["termsConditions"] == null ? null : json["termsConditions"],
        nativeId: json["nativeId"] == null ? null : json["nativeId"],
        firstCountDown: json["firstCountDown"] == null ? null : json["firstCountDown"],
        appstart: json["appstart"] == null ? null : json["appstart"],
        opneapp: json["opneapp"] == null ? null : json["opneapp"],
        faceBookInterstitialId:
            json["faceBookInterstitialId"] == null ? null : json["faceBookInterstitialId"],
        adMobOrFaceBook: json["adMobOrFaceBook"] == null ? null : json["adMobOrFaceBook"],
        faceBookBannerId: json["faceBookBannerId"] == null ? null : json["faceBookBannerId"],
        faceBookNativeId: json["faceBookNativeId"] == null ? null : json["faceBookNativeId"],
        appOpenAdsId: json["appOpenAdsId"] == null ? null : json["appOpenAdsId"],
        docId: json["docId"] == null ? null : json["docId"],
        faceBookTestId: json["faceBookTestId"] == null ? null : json["faceBookTestId"],
      );

  Map<String, dynamic> toJson() => {
        "adsShowOrNot": adsShowOrNot ?? null,
        "interstitialId": interstitialId == null ? null : interstitialId,
        "bannerId": bannerId == null ? null : bannerId,
        "applink": applink == null ? null : applink,
        "privacypolicy": privacypolicy == null ? null : privacypolicy,
        "termsConditions": termsConditions == null ? null : termsConditions,
        "nativeId": nativeId == null ? null : nativeId,
        "firstCountDown": firstCountDown == null ? null : firstCountDown,
        "appstart": appstart == null ? null : appstart,
        "faceBookInterstitialId": faceBookInterstitialId == null ? null : faceBookInterstitialId,
        "adMobOrFaceBook": adMobOrFaceBook == null ? null : adMobOrFaceBook,
        "faceBookBannerId": faceBookBannerId == null ? null : faceBookBannerId,
        "faceBookNativeId": faceBookNativeId == null ? null : faceBookNativeId,
        "appOpenAdsId": appOpenAdsId == null ? null : appOpenAdsId,
        "docId": docId == null ? null : docId,
        "faceBookTestId": faceBookTestId == null ? null : faceBookTestId,
      };
}
