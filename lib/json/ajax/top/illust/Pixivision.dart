import 'package:json_annotation/json_annotation.dart';
part 'Pixivision.g.dart';

@JsonSerializable()
class Pixivision {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String url;
  Pixivision({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.url,
  });

  factory Pixivision.fromJson(Map<String, dynamic> json) => _$PixivisionFromJson(json);
  Map<String, dynamic> toJson() => _$PixivisionToJson(this);
}
