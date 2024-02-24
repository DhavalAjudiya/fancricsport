import 'dart:convert';

List<LiveMatchDataModal> liveMatchDataModalFromJson(String str) =>
    List<LiveMatchDataModal>.from(json.decode(str).map((x) => LiveMatchDataModal.fromJson(x)));

String liveMatchDataModalToJson(List<LiveMatchDataModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LiveMatchDataModal {
  final String? jsonruns;
  final String? jsondata;
  final dynamic title;
  final dynamic matchtime;
  final dynamic venue;
  final dynamic result;
  final int? isfinished;
  final int? ispriority;
  final dynamic teamA;
  final dynamic teamAImage;
  final dynamic teamB;
  final int? seriesid;
  final dynamic teamBImage;
  final dynamic imgeUrl;
  final dynamic matchType;
  final dynamic matchDate;
  final int? matchId;
  final dynamic appversion;
  final dynamic adphone;
  final dynamic adimage;
  final dynamic admsg;

  LiveMatchDataModal({
    this.jsonruns,
    this.jsondata,
    this.title,
    this.matchtime,
    this.venue,
    this.result,
    this.isfinished,
    this.ispriority,
    this.teamA,
    this.teamAImage,
    this.teamB,
    this.seriesid,
    this.teamBImage,
    this.imgeUrl,
    this.matchType,
    this.matchDate,
    this.matchId,
    this.appversion,
    this.adphone,
    this.adimage,
    this.admsg,
  });

  factory LiveMatchDataModal.fromJson(Map<String, dynamic> json) => LiveMatchDataModal(
        jsonruns: json["jsonruns"],
        jsondata: json["jsondata"],
        title: json["Title"],
        matchtime: json["Matchtime"],
        venue: json["venue"],
        result: json["Result"],
        isfinished: json["isfinished"],
        ispriority: json["ispriority"],
        teamA: json["TeamA"],
        teamAImage: json["TeamAImage"],
        teamB: json["TeamB"],
        seriesid: json["seriesid"],
        teamBImage: json["TeamBImage"],
        imgeUrl: json["ImgeURL"],
        matchType: json["MatchType"],
        matchDate: json["MatchDate"],
        matchId: json["MatchId"],
        appversion: json["Appversion"],
        adphone: json["adphone"],
        adimage: json["adimage"],
        admsg: json["admsg"],
      );

  Map<String, dynamic> toJson() => {
        "jsonruns": jsonruns,
        "jsondata": jsondata,
        "Title": title,
        "Matchtime": matchtime,
        "venue": venue,
        "Result": result,
        "isfinished": isfinished,
        "ispriority": ispriority,
        "TeamA": teamA,
        "TeamAImage": teamAImage,
        "TeamB": teamB,
        "seriesid": seriesid,
        "TeamBImage": teamBImage,
        "ImgeURL": imgeUrl,
        "MatchType": matchType,
        "MatchDate": matchDate,
        "MatchId": matchId,
        "Appversion": appversion,
        "adphone": adphone,
        "adimage": adimage,
        "admsg": admsg,
      };
}

class LMatchJsonRunModal {
  Jsonruns? jsonruns;

  LMatchJsonRunModal({this.jsonruns});

  LMatchJsonRunModal.fromJson(Map<String, dynamic> json) {
    jsonruns = json['jsonruns'] != null ? new Jsonruns.fromJson(json['jsonruns']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jsonruns != null) {
      data['jsonruns'] = this.jsonruns!.toJson();
    }
    return data;
  }
}

class Jsonruns {
  String? runxa;
  String? runxb;
  String? fav;
  String? rateA;
  String? rateB;
  String? sessionA;
  String? sessionB;
  String? sessionOver;
  String? summary;
  String? stat;

  Jsonruns(
      {this.runxa,
      this.runxb,
      this.fav,
      this.rateA,
      this.rateB,
      this.sessionA,
      this.sessionB,
      this.sessionOver,
      this.summary,
      this.stat});

  Jsonruns.fromJson(Map<String, dynamic> json) {
    runxa = json['runxa'];
    runxb = json['runxb'];
    fav = json['fav'];
    rateA = json['rateA'];
    rateB = json['rateB'];
    sessionA = json['sessionA'];
    sessionB = json['sessionB'];
    sessionOver = json['sessionOver'];
    summary = json['summary'];
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['runxa'] = this.runxa;
    data['runxb'] = this.runxb;
    data['fav'] = this.fav;
    data['rateA'] = this.rateA;
    data['rateB'] = this.rateB;
    data['sessionA'] = this.sessionA;
    data['sessionB'] = this.sessionB;
    data['sessionOver'] = this.sessionOver;
    data['summary'] = this.summary;
    data['stat'] = this.stat;
    return data;
  }
}

class LMatchJsonDataModal {
  Jsondata? jsondata;

  LMatchJsonDataModal({this.jsondata});

  LMatchJsonDataModal.fromJson(Map<String, dynamic> json) {
    jsondata = json['jsondata'] != null ? new Jsondata.fromJson(json['jsondata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jsondata != null) {
      data['jsondata'] = this.jsondata!.toJson();
    }
    return data;
  }
}

class Jsondata {
  String? batsman;
  String? batsmanimage;
  String? appversion;
  String? s4;
  String? s6;
  String? ns4;
  String? ns6;
  String? bowler;
  String? oversA;
  String? oversB;
  String? rateA;
  String? score;
  String? sessionA;
  String? sessionB;
  String? sessionOver;
  String? teamA;
  String? teamB;
  String? totalballs;
  String? title;
  String? wicketA;
  String? wicketB;
  String? last6Balls;
  String? teamABanner;
  String? teamBBanner;
  String? imgurl;
  String? admsg;
  String? matchtype;
  String? testTeamA;
  String? testTeamARate1;
  String? testTeamARate2;
  String? testTeamB;
  String? testTeamBRate1;
  String? testTeamBRate2;
  String? testdraw;
  String? testdrawRate1;
  String? testdrawRate2;
  String? netfooterad2;
  String? netfooterurl2;
  String? netfooterredirect2;
  String? matchId;
  String? partnership;
  String? lastwicket;
  String? bowler1;
  String? bover1;
  String? brun1;
  String? bwicket1;
  String? beco1;
  String? bowler2;
  String? bover2;
  String? brun2;
  String? bwicket2;
  String? beco2;
  String? bowler3;
  String? bover3;
  String? brun3;
  String? bwicket3;
  String? beco3;
  String? bowler4;
  String? bover4;
  String? brun4;
  String? bwicket4;
  String? beco4;
  String? bowler5;
  String? bover5;
  String? brun5;
  String? bwicket5;
  String? beco5;
  String? bowler6;
  String? bover6;
  String? brun6;
  String? bwicket6;
  String? beco6;
  String? bowler7;
  String? bover7;
  String? brun7;
  String? bwicket7;
  String? beco7;
  String? bowler8;
  String? bover8;
  String? brun8;
  String? bwicket8;
  String? beco8;
  String? cbowler1;
  String? cover1;
  String? crun1;
  String? cwicket1;
  String? ceco1;
  String? lambiA;
  String? lambiB;

  Jsondata(
      {this.batsman,
      this.batsmanimage,
      this.appversion,
      this.s4,
      this.s6,
      this.ns4,
      this.ns6,
      this.bowler,
      this.oversA,
      this.oversB,
      this.rateA,
      this.score,
      this.sessionA,
      this.sessionB,
      this.sessionOver,
      this.teamA,
      this.teamB,
      this.totalballs,
      this.title,
      this.wicketA,
      this.wicketB,
      this.last6Balls,
      this.teamABanner,
      this.teamBBanner,
      this.imgurl,
      this.admsg,
      this.matchtype,
      this.testTeamA,
      this.testTeamARate1,
      this.testTeamARate2,
      this.testTeamB,
      this.testTeamBRate1,
      this.testTeamBRate2,
      this.testdraw,
      this.testdrawRate1,
      this.testdrawRate2,
      this.netfooterad2,
      this.netfooterurl2,
      this.netfooterredirect2,
      this.matchId,
      this.partnership,
      this.lastwicket,
      this.bowler1,
      this.bover1,
      this.brun1,
      this.bwicket1,
      this.beco1,
      this.bowler2,
      this.bover2,
      this.brun2,
      this.bwicket2,
      this.beco2,
      this.bowler3,
      this.bover3,
      this.brun3,
      this.bwicket3,
      this.beco3,
      this.bowler4,
      this.bover4,
      this.brun4,
      this.bwicket4,
      this.beco4,
      this.bowler5,
      this.bover5,
      this.brun5,
      this.bwicket5,
      this.beco5,
      this.bowler6,
      this.bover6,
      this.brun6,
      this.bwicket6,
      this.beco6,
      this.bowler7,
      this.bover7,
      this.brun7,
      this.bwicket7,
      this.beco7,
      this.bowler8,
      this.bover8,
      this.brun8,
      this.bwicket8,
      this.beco8,
      this.cbowler1,
      this.cover1,
      this.crun1,
      this.cwicket1,
      this.ceco1,
      this.lambiA,
      this.lambiB});

  Jsondata.fromJson(Map<String, dynamic> json) {
    batsman = json['batsman'];
    batsmanimage = json['batsmanimage'];
    appversion = json['appversion'];
    s4 = json['s4'];
    s6 = json['s6'];
    ns4 = json['ns4'];
    ns6 = json['ns6'];
    bowler = json['bowler'];
    oversA = json['oversA'];
    oversB = json['oversB'];
    rateA = json['rateA'];
    score = json['score'];
    sessionA = json['sessionA'];
    sessionB = json['sessionB'];
    sessionOver = json['sessionOver'];
    teamA = json['teamA'];
    teamB = json['teamB'];
    totalballs = json['totalballs'];
    title = json['title'];
    wicketA = json['wicketA'];
    wicketB = json['wicketB'];
    last6Balls = json['Last6Balls'];
    teamABanner = json['TeamABanner'];
    teamBBanner = json['TeamBBanner'];
    imgurl = json['imgurl'];
    admsg = json['admsg'];
    matchtype = json['matchtype'];
    testTeamA = json['TestTeamA'];
    testTeamARate1 = json['TestTeamARate1'];
    testTeamARate2 = json['TestTeamARate2'];
    testTeamB = json['TestTeamB'];
    testTeamBRate1 = json['TestTeamBRate1'];
    testTeamBRate2 = json['TestTeamBRate2'];
    testdraw = json['Testdraw'];
    testdrawRate1 = json['TestdrawRate1'];
    testdrawRate2 = json['TestdrawRate2'];
    netfooterad2 = json['netfooterad2'];
    netfooterurl2 = json['netfooterurl2'];
    netfooterredirect2 = json['netfooterredirect2'];
    matchId = json['MatchId'];
    partnership = json['partnership'];
    lastwicket = json['lastwicket'];
    bowler1 = json['bowler1'];
    bover1 = json['bover1'];
    brun1 = json['brun1'];
    bwicket1 = json['bwicket1'];
    beco1 = json['beco1'];
    bowler2 = json['bowler2'];
    bover2 = json['bover2'];
    brun2 = json['brun2'];
    bwicket2 = json['bwicket2'];
    beco2 = json['beco2'];
    bowler3 = json['bowler3'];
    bover3 = json['bover3'];
    brun3 = json['brun3'];
    bwicket3 = json['bwicket3'];
    beco3 = json['beco3'];
    bowler4 = json['bowler4'];
    bover4 = json['bover4'];
    brun4 = json['brun4'];
    bwicket4 = json['bwicket4'];
    beco4 = json['beco4'];
    bowler5 = json['bowler5'];
    bover5 = json['bover5'];
    brun5 = json['brun5'];
    bwicket5 = json['bwicket5'];
    beco5 = json['beco5'];
    bowler6 = json['bowler6'];
    bover6 = json['bover6'];
    brun6 = json['brun6'];
    bwicket6 = json['bwicket6'];
    beco6 = json['beco6'];
    bowler7 = json['bowler7'];
    bover7 = json['bover7'];
    brun7 = json['brun7'];
    bwicket7 = json['bwicket7'];
    beco7 = json['beco7'];
    bowler8 = json['bowler8'];
    bover8 = json['bover8'];
    brun8 = json['brun8'];
    bwicket8 = json['bwicket8'];
    beco8 = json['beco8'];
    cbowler1 = json['cbowler1'];
    cover1 = json['cover1'];
    crun1 = json['crun1'];
    cwicket1 = json['cwicket1'];
    ceco1 = json['ceco1'];
    lambiA = json['LambiA'];
    lambiB = json['LambiB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batsman'] = this.batsman;
    data['batsmanimage'] = this.batsmanimage;
    data['appversion'] = this.appversion;
    data['s4'] = this.s4;
    data['s6'] = this.s6;
    data['ns4'] = this.ns4;
    data['ns6'] = this.ns6;
    data['bowler'] = this.bowler;
    data['oversA'] = this.oversA;
    data['oversB'] = this.oversB;
    data['rateA'] = this.rateA;
    data['score'] = this.score;
    data['sessionA'] = this.sessionA;
    data['sessionB'] = this.sessionB;
    data['sessionOver'] = this.sessionOver;
    data['teamA'] = this.teamA;
    data['teamB'] = this.teamB;
    data['totalballs'] = this.totalballs;
    data['title'] = this.title;
    data['wicketA'] = this.wicketA;
    data['wicketB'] = this.wicketB;
    data['Last6Balls'] = this.last6Balls;
    data['TeamABanner'] = this.teamABanner;
    data['TeamBBanner'] = this.teamBBanner;
    data['imgurl'] = this.imgurl;
    data['admsg'] = this.admsg;
    data['matchtype'] = this.matchtype;
    data['TestTeamA'] = this.testTeamA;
    data['TestTeamARate1'] = this.testTeamARate1;
    data['TestTeamARate2'] = this.testTeamARate2;
    data['TestTeamB'] = this.testTeamB;
    data['TestTeamBRate1'] = this.testTeamBRate1;
    data['TestTeamBRate2'] = this.testTeamBRate2;
    data['Testdraw'] = this.testdraw;
    data['TestdrawRate1'] = this.testdrawRate1;
    data['TestdrawRate2'] = this.testdrawRate2;
    data['netfooterad2'] = this.netfooterad2;
    data['netfooterurl2'] = this.netfooterurl2;
    data['netfooterredirect2'] = this.netfooterredirect2;
    data['MatchId'] = this.matchId;
    data['partnership'] = this.partnership;
    data['lastwicket'] = this.lastwicket;
    data['bowler1'] = this.bowler1;
    data['bover1'] = this.bover1;
    data['brun1'] = this.brun1;
    data['bwicket1'] = this.bwicket1;
    data['beco1'] = this.beco1;
    data['bowler2'] = this.bowler2;
    data['bover2'] = this.bover2;
    data['brun2'] = this.brun2;
    data['bwicket2'] = this.bwicket2;
    data['beco2'] = this.beco2;
    data['bowler3'] = this.bowler3;
    data['bover3'] = this.bover3;
    data['brun3'] = this.brun3;
    data['bwicket3'] = this.bwicket3;
    data['beco3'] = this.beco3;
    data['bowler4'] = this.bowler4;
    data['bover4'] = this.bover4;
    data['brun4'] = this.brun4;
    data['bwicket4'] = this.bwicket4;
    data['beco4'] = this.beco4;
    data['bowler5'] = this.bowler5;
    data['bover5'] = this.bover5;
    data['brun5'] = this.brun5;
    data['bwicket5'] = this.bwicket5;
    data['beco5'] = this.beco5;
    data['bowler6'] = this.bowler6;
    data['bover6'] = this.bover6;
    data['brun6'] = this.brun6;
    data['bwicket6'] = this.bwicket6;
    data['beco6'] = this.beco6;
    data['bowler7'] = this.bowler7;
    data['bover7'] = this.bover7;
    data['brun7'] = this.brun7;
    data['bwicket7'] = this.bwicket7;
    data['beco7'] = this.beco7;
    data['bowler8'] = this.bowler8;
    data['bover8'] = this.bover8;
    data['brun8'] = this.brun8;
    data['bwicket8'] = this.bwicket8;
    data['beco8'] = this.beco8;
    data['cbowler1'] = this.cbowler1;
    data['cover1'] = this.cover1;
    data['crun1'] = this.crun1;
    data['cwicket1'] = this.cwicket1;
    data['ceco1'] = this.ceco1;
    data['LambiA'] = this.lambiA;
    data['LambiB'] = this.lambiB;
    return data;
  }
}
