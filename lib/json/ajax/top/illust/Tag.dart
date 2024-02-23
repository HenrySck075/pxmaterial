class Tag {
  final String tag;
  final List<int> ids;
  Tag({
    required this.tag,
    required this.ids,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    tag: json['tag'] as String,
    ids: json['ids'],
  );
  
}

