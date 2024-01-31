
class Tags {
  final String tag;
  final List<String> ids;
  Tags({
    required this.tag,
    required this.ids,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    tag=json["tag"],
    ids=json["ids"],
  );

  Map<String, dynamic> Tags.toJson() => Map<String, dynamic>{
    "tag": this.tag,
    "ids": this.ids,
  };

}
