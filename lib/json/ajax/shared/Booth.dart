class Booth {
  final String id;
  final String userId;
  final String title;
  final String url;
  final String imageUrl;
  final bool adult;
  Booth({
    required this.id,
    required this.userId,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.adult,
  });
  factory Booth.fromJson(Map<String, dynamic> json) {
    return Booth(
    id: json['id'],
    userId: json['userId'],
    title: json['title'],
    url: json['url'],
    imageUrl: json['imageUrl'],
    adult: json['adult'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "id": id,
    "userId": userId,
    "title": title,
    "url": url,
    "imageUrl": imageUrl,
    "adult": adult,
  };
}

