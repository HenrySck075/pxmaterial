class WorksResultPayloads {
  final String tagTranslation;
  final String thumbnails;
  WorksResultPayloads({
    required this.tagTranslation,
    required this.thumbnails,
  });
  factory WorksResultPayloads.fromJson(Map<String, dynamic> json) {
    return WorksResultPayloads(
    tagTranslation: json['tagTranslation'],
    thumbnails: json['thumbnails'],
  );}

}

