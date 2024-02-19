// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Thumbnails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailsRemap _$ThumbnailsRemapFromJson(Map<String, dynamic> json) =>
    ThumbnailsRemap(
      illust: (json['illust'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Artwork.fromJson(e as Map<String, dynamic>)),
      ),
      novel: (json['novel'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Novel.fromJson(e as Map<String, dynamic>)),
      ),
      novelDraft: json['novelDraft'] as List<dynamic>,
      novelSeries: json['novelSeries'] as List<dynamic>,
    );

Map<String, dynamic> _$ThumbnailsRemapToJson(ThumbnailsRemap instance) =>
    <String, dynamic>{
      'illust': instance.illust,
      'novel': instance.novel,
      'novelDraft': instance.novelDraft,
      'novelSeries': instance.novelSeries,
    };

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) => Thumbnails(
      illust: (json['illust'] as List<dynamic>)
          .map((e) => Artwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      novel: (json['novel'] as List<dynamic>)
          .map((e) => Novel.fromJson(e as Map<String, dynamic>))
          .toList(),
      novelDraft: json['novelDraft'] as List<dynamic>,
      novelSeries: json['novelSeries'] as List<dynamic>,
    );

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) =>
    <String, dynamic>{
      'illust': instance.illust,
      'novel': instance.novel,
      'novelDraft': instance.novelDraft,
      'novelSeries': instance.novelSeries,
    };
