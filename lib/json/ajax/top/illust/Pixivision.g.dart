// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pixivision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pixivision _$PixivisionFromJson(Map<String, dynamic> json) => Pixivision(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PixivisionToJson(Pixivision instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
      'url': instance.url,
    };
