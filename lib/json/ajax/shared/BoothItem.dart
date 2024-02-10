import 'package:json_annotation/json_annotation.dart';
part 'BoothItem.g.dart';

@JsonSerializable()
class BoothItem {
  final String id;
  final String userId;
  final String title;
  final String url;
  final String imageUrl;
  final bool adult;
  BoothItem({
    required this.id,
    required this.userId,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.adult,
  });

  factory BoothItem.fromJson(Map<String, dynamic> json) => _$BoothItemFromJson(json);
  Map<String, dynamic> toJson() => _$BoothItemToJson(this);
}