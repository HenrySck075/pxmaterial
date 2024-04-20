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
  factory TagInfo.fromJson(Map<String, dynamic> json) {
    return TagInfo(
    tag: json['tag'],
    locked: json['locked'],
    deletable: json['deletable'],
    userId: json['userId'],
    romaji: json['romaji'],
    translation: json['translation'] == null?null:(json['translation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,v as String)),
    userName: json['userName'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "tag": tag,
    "locked": locked,
    "deletable": deletable,
    "userId": userId,
    "romaji": romaji,
    "translation": translation?.map((k,v)=>MapEntry(k,v as String)),
    "userName": userName,
  };
}

