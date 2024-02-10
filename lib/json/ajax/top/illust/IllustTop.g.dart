// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IllustTop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) => _Thumbnails(
      illust: (json['illust'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Artwork.fromJson(e as Map<String, dynamic>)),
      ),
      novel: (json['novel'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Novel.fromJson(e as Map<String, dynamic>)),
      ),
      novelDraft: json['novelDraft'] as List<dynamic>,
      novelSeries: json['novelSeries'] as List<dynamic>,
    );

Map<String, dynamic> _$ThumbnailsToJson(_Thumbnails instance) =>
    <String, dynamic>{
      'illust': instance.illust,
      'novel': instance.novel,
      'novelDraft': instance.novelDraft,
      'novelSeries': instance.novelSeries,
    };

IllustTop _$IllustTopFromJson(Map<String, dynamic> json) => IllustTop(
      tagTranslation: (json['tagTranslation'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, TagTranslationContent.fromJson(e as Map<String, dynamic>)),
      ),
      boothItems: (json['boothItems'] as List<dynamic>)
          .map((e) => BoothItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      illustSeries: json['illustSeries'] as List<dynamic>,
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
      requests: (json['requests'] as List<dynamic>)
          .map((e) => Request.fromJson(e as Map<String, dynamic>))
          .toList(),
      sketchLives: json['sketchLives'] as List<dynamic>,
      thumbnails:
          _Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IllustTopToJson(IllustTop instance) => <String, dynamic>{
      'tagTranslation': instance.tagTranslation,
      'boothItems': instance.boothItems,
      'illustSeries': instance.illustSeries,
      'page': instance.page,
      'requests': instance.requests,
      'sketchLives': instance.sketchLives,
      'thumbnails': instance.thumbnails,
      'users': instance.users,
    };
