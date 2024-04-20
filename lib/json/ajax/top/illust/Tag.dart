class Tag {
  final String tag;
  final List<int> ids;
  Tag({
    required this.tag,
    required this.ids,
  });
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
    tag: json['tag'],
    ids: (json['ids'] as List<dynamic>).map((e)=>e as int).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "tag": tag,
    "ids": ids,
  };
}

