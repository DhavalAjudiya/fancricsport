class CompletedModal {
  List<AllMatch>? allMatch;
  bool? success;
  String? msg;

  CompletedModal({this.allMatch, this.success, this.msg});

  CompletedModal.fromJson(Map<String, dynamic> json) {
    if (json['AllMatch'] != null) {
      allMatch = <AllMatch>[];
      json['AllMatch'].forEach((v) {
        allMatch!.add(new AllMatch.fromJson(v));
      });
    }
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allMatch != null) {
      data['AllMatch'] = this.allMatch!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['msg'] = this.msg;
    return data;
  }
}

class AllMatch {
  String? title;
  String? matchtime;
  String? venue;
  int? matchId;
  String? teamA;
  String? teamB;
  String? teamAImage;
  String? matchtype;
  String? teamBImage;
  String? result;
  String? imageUrl;

  AllMatch(
      {this.title,
      this.matchtime,
      this.venue,
      this.matchId,
      this.teamA,
      this.teamB,
      this.teamAImage,
      this.matchtype,
      this.teamBImage,
      this.result,
      this.imageUrl});

  AllMatch.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    matchtime = json['Matchtime'];
    venue = json['Venue'];
    matchId = json['MatchId'];
    teamA = json['TeamA'];
    teamB = json['TeamB'];
    teamAImage = json['TeamAImage'];
    matchtype = json['Matchtype'];
    teamBImage = json['TeamBImage'];
    result = json['Result'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Matchtime'] = this.matchtime;
    data['Venue'] = this.venue;
    data['MatchId'] = this.matchId;
    data['TeamA'] = this.teamA;
    data['TeamB'] = this.teamB;
    data['TeamAImage'] = this.teamAImage;
    data['Matchtype'] = this.matchtype;
    data['TeamBImage'] = this.teamBImage;
    data['Result'] = this.result;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }
}
