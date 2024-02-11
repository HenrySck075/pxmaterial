import 'package:json_annotation/json_annotation.dart';
part 'Ranking.g.dart';

@JsonSerializable()
class _Items {
  final String rank;
  final String id;
  _Items({
    required this.rank,
    required this.id,
  });

  factory _Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  
}
@JsonSerializable()
class Ranking {
  final List<_Items> items;
  final String date;
  Ranking({
    required this.items,
    required this.date,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) => _$RankingFromJson(json);
  
}
