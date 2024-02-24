class SportNews {
  List<NewsList>? newsList;
  bool? success;
  String? msg;

  SportNews({this.newsList, this.success, this.msg});

  SportNews.fromJson(Map<String, dynamic> json) {
    if (json['NewsList'] != null) {
      newsList = <NewsList>[];
      json['NewsList'].forEach((v) {
        newsList!.add(new NewsList.fromJson(v));
      });
    }
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsList != null) {
      data['NewsList'] = this.newsList!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['msg'] = this.msg;
    return data;
  }
}

class NewsList {
  String? author;
  String? title;
  String? description;
  String? uRL;
  String? uRLToImage;
  String? publishedAT;
  String? content;

  NewsList(
      {this.author,
      this.title,
      this.description,
      this.uRL,
      this.uRLToImage,
      this.publishedAT,
      this.content});

  NewsList.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    uRL = json['URL'];
    uRLToImage = json['URLToImage'];
    publishedAT = json['PublishedAT'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['URL'] = this.uRL;
    data['URLToImage'] = this.uRLToImage;
    data['PublishedAT'] = this.publishedAT;
    data['content'] = this.content;
    return data;
  }
}
