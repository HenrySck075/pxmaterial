class TagInfo {
  final String tag;
  final bool locked;
  final bool deletable;
  final String? userId;
  final String? romaji;
  final Map<String, String>? translation;
  final String? userName;
  TagInfo({
    required this.tag,
    required this.locked,
    required this.deletable,
    this.userId,
    this.romaji,
    this.translation,
    this.userName,
  });
  factory TagInfo.fromJson(Map<String, dynamic> json) => TagInfo(
    tag: json['tag'],
    locked: json['locked'],
    deletable: json['deletable'],
    userId: json['userId'] == null?null:json['userId'],
    romaji: json['romaji'] == null?null:json['romaji'],
    translation: json['translation'] == null?null:(json['translation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,v as String)),
    userName: json['userName'] == null?null:json['userName'],
  );

}

