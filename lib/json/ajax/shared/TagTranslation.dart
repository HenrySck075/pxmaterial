import 'package:json_annotation/json_annotation.dart';
part 'TagTranslation.g.dart';

@JsonSerializable()
class TagTranslationContent {
  final String? en;
  final String? ko;
  final String? zh;
  final String? zh_tw;
  final String? romaji;
  TagTranslationContent({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory TagTranslationContent.fromJson(Map<String, dynamic> json) => _$TagTranslationContentFromJson(json);
  
}
