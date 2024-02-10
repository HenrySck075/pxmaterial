// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoothItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoothItem _$BoothItemFromJson(Map<String, dynamic> json) => BoothItem(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      imageUrl: json['imageUrl'] as String,
      adult: json['adult'] as bool,
    );

Map<String, dynamic> _$BoothItemToJson(BoothItem instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'adult': instance.adult,
    };
