class Topic {
  int id;
  String title;
  String imageUrl;
  String thumbnailUrl;
  DateTime? dateTime;

  Topic({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.thumbnailUrl,
    this.dateTime,
  });

  factory Topic.fromJson(Map<String, dynamic> parsedJson) {
    return Topic(
      id: parsedJson["id"],
      title: parsedJson["title"],
      imageUrl: parsedJson["url"],
      thumbnailUrl: parsedJson["thumbnailUrl"],
    );
  }
}
