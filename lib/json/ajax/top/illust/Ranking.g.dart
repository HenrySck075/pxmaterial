// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Items _$ItemsFromJson(Map<String, dynamic> json) => _Items(
      rank: json['rank'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ItemsToJson(_Items instance) => <String, dynamic>{
      'rank': instance.rank,
      'id': instance.id,
    };

Ranking _$RankingFromJson(Map<String, dynamic> json) => Ranking(
      items: (json['items'] as List<dynamic>)
          .map((e) => _Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$RankingToJson(Ranking instance) => <String, dynamic>{
      'items': instance.items,
      'date': instance.date,
    };
