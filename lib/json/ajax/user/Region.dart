import 'package:json_annotation/json_annotation.dart';
part 'Region.g.dart';

@JsonSerializable()
class Region {
  final String? name;
  final String? region;
  final String? prefecture;
  final String? privacyLevel;
  Region({
    this.name,
    this.region,
    this.prefecture,
    this.privacyLevel,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  
}