class NewsModal {
  String? image;
  String? title;
  String? subtitle;
  String? description;
  int? time;

  NewsModal({
    this.image,
    this.title,
    this.subtitle,
    this.description,
    this.time,
  });

  NewsModal.fromMap(Map<String, dynamic> map) {
    image = map["image"] ?? '';
    title = map["title"] ?? '';
    subtitle = map["subtitle"] ?? '';
    description = map["description"];
    time = map["time"];
  }

  Map<String, dynamic> toMap() {
    return {
      "image": image,
      "title": title,
      "subtitle": subtitle,
      "description": description,
      "time": time,
    };
  }
}
