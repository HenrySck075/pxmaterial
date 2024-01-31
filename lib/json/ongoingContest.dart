
class ContestOngoing {
  final String slug;
  final String type;
  final String name;
  final String url;
  final String iconUrl;
  final List<int> workIds;
  final bool isNew;
  ContestOngoing({
    required this.slug,
    required this.type,
    required this.name,
    required this.url,
    required this.iconUrl,
    required this.workIds,
    required this.isNew,
  });

  factory ContestOngoing.fromJson(Map<String, dynamic> json) => ContestOngoing(
    slug=json["slug"],
    type=json["type"],
    name=json["name"],
    url=json["url"],
    iconUrl=json["iconUrl"],
    workIds=json["workIds"],
    isNew=json["isNew"],
  );

  Map<String, dynamic> ContestOngoing.toJson() => Map<String, dynamic>{
    "slug": this.slug,
    "type": this.type,
    "name": this.name,
    "url": this.url,
    "iconUrl": this.iconUrl,
    "workIds": this.workIds,
    "isNew": this.isNew,
  };

}
