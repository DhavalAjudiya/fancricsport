class FantasyModal {
  String? team1;
  List<Fantasy>? fantasy;
  int? matchId;
  String? image1;
  bool? lineup;
  String? image2;
  List<Playerstate>? playerstate;
  String? team2;
  String? time;

  FantasyModal({
    this.team1,
    this.fantasy,
    this.matchId,
    this.image1,
    this.lineup,
    this.image2,
    this.playerstate,
    this.team2,
    this.time,
  });

  FantasyModal.fromJson(Map<String, dynamic> json) {
    team1 = json['team_1'];
    if (json['fantasy'] != null) {
      fantasy = <Fantasy>[];
      json['fantasy'].forEach((v) {
        fantasy!.add(new Fantasy.fromJson(v));
      });
    }
    matchId = json['match_id'];
    image1 = json['image_1'];
    lineup = json['lineup'];
    image2 = json['image_2'];
    if (json['playerstate'] != null) {
      playerstate = <Playerstate>[];
      json['playerstate'].forEach((v) {
        playerstate!.add(new Playerstate.fromJson(v));
      });
    }
    team2 = json['team_2'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_1'] = this.team1;
    if (this.fantasy != null) {
      data['fantasy'] = this.fantasy!.map((v) => v.toJson()).toList();
    }
    data['match_id'] = this.matchId;
    data['image_1'] = this.image1;
    data['lineup'] = this.lineup;
    data['image_2'] = this.image2;
    if (this.playerstate != null) {
      data['playerstate'] = this.playerstate!.map((v) => v.toJson()).toList();
    }
    data['team_2'] = this.team2;
    data['time'] = this.time;
    return data;
  }
}

class Fantasy {
  String? image;
  String? captionimage;
  String? name;
  String? vcaptionimage;
  String? caption;
  String? vcaption;
  String? type;
  String? teamimage;
  String? player;
  String? cr;

  Fantasy(
      {this.image,
      this.captionimage,
      this.name,
      this.vcaptionimage,
      this.caption,
      this.vcaption,
      this.type,
      this.teamimage,
      this.player,
      this.cr});

  Fantasy.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    captionimage = json['captionimage'];
    name = json['name'];
    vcaptionimage = json['vcaptionimage'];
    caption = json['caption'];
    vcaption = json['vcaption'];
    type = json['type'];
    teamimage = json['teamimage'];
    player = json['player'];
    cr = json['cr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['captionimage'] = this.captionimage;
    data['name'] = this.name;
    data['vcaptionimage'] = this.vcaptionimage;
    data['caption'] = this.caption;
    data['vcaption'] = this.vcaption;
    data['type'] = this.type;
    data['teamimage'] = this.teamimage;
    data['player'] = this.player;
    data['cr'] = this.cr;
    return data;
  }
}

class Playerstate {
  String? mplayed;
  String? name;
  String? pmatch;
  String? type;
  String? value;
  bool? announce;

  Playerstate({this.mplayed, this.name, this.pmatch, this.type, this.announce, this.value});

  Playerstate.fromJson(Map<String, dynamic> json) {
    mplayed = json['mplayed'];
    name = json['name'];
    pmatch = json['pmatch'];
    type = json['type'];
    announce = json['announce'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mplayed'] = this.mplayed;
    data['name'] = this.name;
    data['pmatch'] = this.pmatch;
    data['type'] = this.type;
    data['announce'] = this.announce;
    data['value'] = this.value;
    return data;
  }
}
