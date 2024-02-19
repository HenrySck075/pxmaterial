// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
      requests: (json['requests'] as List<dynamic>)
          .map((e) => RequestLite.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagTranslation: (json['tagTranslation'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, TagTranslationContent.fromJson(e as Map<String, dynamic>)),
      ),
      thumbnails:
          Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'page': instance.page,
      'requests': instance.requests,
      'tagTranslation': instance.tagTranslation,
      'thumbnails': instance.thumbnails,
      'users': instance.users,
    };
