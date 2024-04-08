class LastMinutesFantasy {
  String? teamImage;
  String? expertName;

  LastMinutesFantasy({this.teamImage, this.expertName});

  LastMinutesFantasy.fromJson(Map<String, dynamic> json) {
    teamImage = json['teamImage'];
    expertName = json['expertName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamImage'] = this.teamImage;
    data['expertName'] = this.expertName;
    return data;
  }
}
