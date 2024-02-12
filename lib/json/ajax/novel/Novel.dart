import 'package:json_annotation/json_annotation.dart';
part 'Novel.g.dart';

@JsonSerializable()
class _TitleCaptionTranslation {
  final String? workTitle;
  final String? workCaption;
  _TitleCaptionTranslation({
    this.workTitle,
    this.workCaption,
  });

  factory _TitleCaptionTranslation.fromJson(Map<String, dynamic> json) => _$TitleCaptionTranslationFromJson(json);
  
}
@JsonSerializable()
class Novel {
  final String id;
  final String title;
  final int xRestrict;
  final int restrict;
  final String url;
  final List<String> tags;
  final String userId;
  final String userName;
  final String profileImageUrl;
  final int textCount;
  final int wordCount;
  final int readingTime;
  final bool useWordCount;
  final String description;
  final bool isBookmarkable;
  final String? bookmarkData;
  final int bookmarkCount;
  final bool isOriginal;
  final String? marker;
  final _TitleCaptionTranslation titleCaptionTranslation;
  final String createDate;
  final String updateDate;
  final bool isMasked;
  final bool isUnlisted;
  final int aiType;
  final String genre;
  Novel({
    required this.id,
    required this.title,
    required this.xRestrict,
    required this.restrict,
    required this.url,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.profileImageUrl,
    required this.textCount,
    required this.wordCount,
    required this.readingTime,
    required this.useWordCount,
    required this.description,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.bookmarkCount,
    required this.isOriginal,
    this.marker,
    required this.titleCaptionTranslation,
    required this.createDate,
    required this.updateDate,
    required this.isMasked,
    required this.isUnlisted,
    required this.aiType,
    required this.genre,
  });

  factory Novel.fromJson(Map<String, dynamic> json) => _$NovelFromJson(json);
  
}