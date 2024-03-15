import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
class RecommendedTags {
  final List<String> recommendedTags;
  final Map<String, TagTranslation> tagTranslation;
  RecommendedTags({
    required this.recommendedTags,
    required this.tagTranslation,
  });
  factory RecommendedTags.fromJson(Map<String, dynamic> json) => RecommendedTags(
    recommendedTags: (json['recommendedTags'] as List<dynamic>).map((e)=>e as String).toList(),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
  );

}

