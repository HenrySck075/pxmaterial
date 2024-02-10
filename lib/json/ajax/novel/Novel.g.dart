// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Novel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TitleCaptionTranslation _$TitleCaptionTranslationFromJson(
        Map<String, dynamic> json) =>
    _TitleCaptionTranslation(
      workTitle: json['workTitle'] as String?,
      workCaption: json['workCaption'] as String?,
    );

Map<String, dynamic> _$TitleCaptionTranslationToJson(
        _TitleCaptionTranslation instance) =>
    <String, dynamic>{
      'workTitle': instance.workTitle,
      'workCaption': instance.workCaption,
    };

Novel _$NovelFromJson(Map<String, dynamic> json) => Novel(
      id: json['id'] as String,
      title: json['title'] as String,
      xRestrict: json['xRestrict'] as int,
      restrict: json['restrict'] as int,
      url: json['url'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      textCount: json['textCount'] as int,
      wordCount: json['wordCount'] as int,
      readingTime: json['readingTime'] as int,
      useWordCount: json['useWordCount'] as bool,
      description: json['description'] as String,
      isBookmarkable: json['isBookmarkable'] as bool,
      bookmarkData: json['bookmarkData'] as String?,
      bookmarkCount: json['bookmarkCount'] as int,
      isOriginal: json['isOriginal'] as bool,
      marker: json['marker'] as String?,
      titleCaptionTranslation: _TitleCaptionTranslation.fromJson(
          json['titleCaptionTranslation'] as Map<String, dynamic>),
      createDate: json['createDate'] as String,
      updateDate: json['updateDate'] as String,
      isMasked: json['isMasked'] as bool,
      isUnlisted: json['isUnlisted'] as bool,
      aiType: json['aiType'] as int,
      genre: json['genre'] as String,
    );

Map<String, dynamic> _$NovelToJson(Novel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'xRestrict': instance.xRestrict,
      'restrict': instance.restrict,
      'url': instance.url,
      'tags': instance.tags,
      'userId': instance.userId,
      'userName': instance.userName,
      'profileImageUrl': instance.profileImageUrl,
      'textCount': instance.textCount,
      'wordCount': instance.wordCount,
      'readingTime': instance.readingTime,
      'useWordCount': instance.useWordCount,
      'description': instance.description,
      'isBookmarkable': instance.isBookmarkable,
      'bookmarkData': instance.bookmarkData,
      'bookmarkCount': instance.bookmarkCount,
      'isOriginal': instance.isOriginal,
      'marker': instance.marker,
      'titleCaptionTranslation': instance.titleCaptionTranslation,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'isMasked': instance.isMasked,
      'isUnlisted': instance.isUnlisted,
      'aiType': instance.aiType,
      'genre': instance.genre,
    };
