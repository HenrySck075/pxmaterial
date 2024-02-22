import 'package:sofieru/json/ajax/shared/Placeholder.dart' show Placeholder;

class _EmbedMeta {
  final String description;
  final String image;
  final String title;
  final Placeholder? type;
  final Placeholder? card;
  _EmbedMeta({
    required this.description,
    required this.image,
    required this.title,
    this.type,
    this.card,
  });
  factory _EmbedMeta.fromJson(Map<String, dynamic> json) => _EmbedMeta(
    description: json['description'] as String,
    image: json['image'] as String,
    title: json['title'] as String,
    type: json['type'] as Placeholder,
    card: json['card'] as Placeholder,
  );
  
}

class _Meta {
  final String title;
  final String description;
  final String canonical;
  final Placeholder? alternateLanguages;
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
  factory _Meta.fromJson(Map<String, dynamic> json) => _Meta(
    title: json['title'] as String,
    description: json['description'] as String,
    canonical: json['canonical'] as String,
    alternateLanguages: json['alternateLanguages'].map((k,v)=>MapEntry(k,Placeholder.fromJson(v))),
    descriptionHeader: json['descriptionHeader'] as String,
    ogp: json['ogp'].map((k,v)=>MapEntry(k,_EmbedMeta.fromJson(v))),
    twitter: json['twitter'].map((k,v)=>MapEntry(k,_EmbedMeta.fromJson(v))),
  );
  
}

class ExtraData {
  final _Meta meta;
  ExtraData({
    required this.meta,
  });
  factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
    meta: json['meta'].map((k,v)=>MapEntry(k,_Meta.fromJson(v))),
  );
  
}
