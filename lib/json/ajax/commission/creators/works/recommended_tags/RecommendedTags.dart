import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
class RecommendedTags {
  final List<String> recommendesTags;
  final Map<String, TagTranslation> tagTranslation;
  RecommendedTags({
    required this.recommendesTags,
    required this.tagTranslation,
  });
  factory RecommendedTags.fromJson(Map<String, dynamic> json) => RecommendedTags(
    recommendesTags: (json['recommendesTags'] as List<dynamic>).map((e)=>e as String).toList(),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
  );

}

