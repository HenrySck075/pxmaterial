import 'package:json_annotation/json_annotation.dart';
part 'TitleCaptionTranslation.g.dart';

@JsonSerializable()
class TitleCaptionTranslation {
  final String? workTitle;
  final String? workCaption;
  TitleCaptionTranslation({
    this.workTitle,
    this.workCaption,
  });

  factory TitleCaptionTranslation.fromJson(Map<String, dynamic> json) => _$TitleCaptionTranslationFromJson(json);
  
}
