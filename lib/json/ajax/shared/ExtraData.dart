class _AlternateLanguages {
  final String ja;
  final String en;
  _AlternateLanguages({
    required this.ja,
    required this.en,
  });
  factory _AlternateLanguages.fromJson(Map<String, dynamic> json) {
    return _AlternateLanguages(
    ja: json['ja'],
    en: json['en'],
  );}

}

class _EmbedMeta {
  final String description;
  final String image;
  final String title;
  final String? type;
  final String? card;
  _EmbedMeta({
    required this.description,
    required this.image,
    required this.title,
    this.type,
    this.card,
  });
  factory _EmbedMeta.fromJson(Map<String, dynamic> json) {
    return _EmbedMeta(
    description: json['description'],
    image: json['image'],
    title: json['title'],
    type: json['type'] == null?null:json['type'],
    card: json['card'] == null?null:json['card'],
  );}

}

class _Meta {
  /// Page title
  final String title;
  /// Page description
  final String description;
  final String canonical;
  final _AlternateLanguages? alternateLanguages;
  /// that one text that appears on any users that views the works without logged in
  final String descriptionHeader;
  final _EmbedMeta ogp;
  final _EmbedMeta twitter;
  _Meta({
    required this.title,
    required this.description,
    required this.canonical,
    this.alternateLanguages,
    required this.descriptionHeader,
    required this.ogp,
    required this.twitter,
  });
  factory _Meta.fromJson(Map<String, dynamic> json) {
    return _Meta(
    title: json['title'],
    description: json['description'],
    canonical: json['canonical'],
    alternateLanguages: json['alternateLanguages'] == null?null:_AlternateLanguages.fromJson(json['alternateLanguages']),
    descriptionHeader: json['descriptionHeader'],
    ogp: _EmbedMeta.fromJson(json['ogp']),
    twitter: _EmbedMeta.fromJson(json['twitter']),
  );}

}

class ExtraData {
  final _Meta meta;
  ExtraData({
    required this.meta,
  });
  factory ExtraData.fromJson(Map<String, dynamic> json) {
    return ExtraData(
    meta: _Meta.fromJson(json['meta']),
  );}

}

