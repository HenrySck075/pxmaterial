// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      name: json['name'] as String?,
      region: json['region'] as String?,
      prefecture: json['prefecture'] as String?,
      privacyLevel: json['privacyLevel'] as String?,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'prefecture': instance.prefecture,
      'privacyLevel': instance.privacyLevel,
    };
