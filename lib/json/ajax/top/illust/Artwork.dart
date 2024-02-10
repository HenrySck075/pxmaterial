import 'package:json_annotation/json_annotation.dart';
part 'Artwork.g.dart';

@JsonSerializable()
class _TitleCaptionTranslation {
  final String? workTitle;
  final String? workCaption;
  _TitleCaptionTranslation({
    this.workTitle,
    this.workCaption,
  });

  factory _TitleCaptionTranslation.fromJson(Map<String, dynamic> json) => _$TitleCaptionTranslationFromJson(json);
  Map<String, dynamic> toJson() => _$TitleCaptionTranslationToJson(this);
}
@JsonSerializable()
class Artwork {
  final String id;
  final String title;
  final int illustType;
  final int xRestrict;
  final int restrict;
  final int sl;
  final String url;
  final String description;
  final List<String> tags;
  final String userId;
  final String userName;
  final int width;
  final int height;
  final int pageCount;
  final bool isBookmarkable;
  final String? bookmarkData;
  final String alt;
  final _TitleCaptionTranslation titleCaptionTranslation;
  final String createDate;
  final String updateDate;
  final bool isUnlisted;
  final bool isMasked;
  final int aiType;
  final Map<String, String> urls;
  final String profileImageUrl;
  Artwork({
    required this.id,
    required this.title,
    required this.illustType,
    required this.xRestrict,
    required this.restrict,
    required this.sl,
    required this.url,
    required this.description,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.width,
    required this.height,
    required this.pageCount,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.alt,
    required this.titleCaptionTranslation,
    required this.createDate,
    required this.updateDate,
    required this.isUnlisted,
    required this.isMasked,
    required this.aiType,
    required this.urls,
    required this.profileImageUrl,
  });

  factory Artwork.fromJson(Map<String, dynamic> json) => _$ArtworkFromJson(json);
  Map<String, dynamic> toJson() => _$ArtworkToJson(this);
}
