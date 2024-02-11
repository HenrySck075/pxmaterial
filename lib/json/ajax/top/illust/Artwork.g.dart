// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artwork _$ArtworkFromJson(Map<String, dynamic> json) => Artwork(
      id: json['id'] as String,
      title: json['title'] as String,
      illustType: json['illustType'] as int,
      xRestrict: json['xRestrict'] as int,
      restrict: json['restrict'] as int,
      sl: json['sl'] as int,
      url: json['url'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      pageCount: json['pageCount'] as int,
      isBookmarkable: json['isBookmarkable'] as bool,
      bookmarkData: json['bookmarkData'] as String?,
      alt: json['alt'] as String,
      titleCaptionTranslation: TitleCaptionTranslation.fromJson(
          json['titleCaptionTranslation'] as Map<String, dynamic>),
      createDate: json['createDate'] as String,
      updateDate: json['updateDate'] as String,
      isUnlisted: json['isUnlisted'] as bool,
      isMasked: json['isMasked'] as bool,
      aiType: json['aiType'] as int,
      urls: json['urls']!=null?Map<String, String>.from(json['urls'] as Map):null,
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$ArtworkToJson(Artwork instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'illustType': instance.illustType,
      'xRestrict': instance.xRestrict,
      'restrict': instance.restrict,
      'sl': instance.sl,
      'url': instance.url,
      'description': instance.description,
      'tags': instance.tags,
      'userId': instance.userId,
      'userName': instance.userName,
      'width': instance.width,
      'height': instance.height,
      'pageCount': instance.pageCount,
      'isBookmarkable': instance.isBookmarkable,
      'bookmarkData': instance.bookmarkData,
      'alt': instance.alt,
      'titleCaptionTranslation': instance.titleCaptionTranslation,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'isUnlisted': instance.isUnlisted,
      'isMasked': instance.isMasked,
      'aiType': instance.aiType,
      'urls': instance.urls,
      'profileImageUrl': instance.profileImageUrl,
    };
