// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BasedOn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasedOn _$BasedOnFromJson(Map<String, dynamic> json) => BasedOn(
      type: json['type'] as String,
      workId: json['workId'] as String,
      title: json['title'] as String,
      userName: json['userName'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$BasedOnToJson(BasedOn instance) => <String, dynamic>{
      'type': instance.type,
      'workId': instance.workId,
      'title': instance.title,
      'userName': instance.userName,
      'imageUrl': instance.imageUrl,
    };
