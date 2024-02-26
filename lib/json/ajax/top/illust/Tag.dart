class Tag {
  final String tag;
  final List<int> ids;
  Tag({
    required this.tag,
    required this.ids,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    tag: json['tag'],
    ids: (json['ids'] as List<dynamic>).map((e)=>e as int).toList(),
  );
  
}

