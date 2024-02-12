import 'package:json_annotation/json_annotation.dart';
part 'BasedOn.g.dart';

@JsonSerializable()
class BasedOn {
  final String type;
  final String workId;
  final String title;
  final String userName;
  final String imageUrl;
  BasedOn({
    required this.type,
    required this.workId,
    required this.title,
    required this.userName,
    required this.imageUrl,
  });

  factory BasedOn.fromJson(Map<String, dynamic> json) => _$BasedOnFromJson(json);
  
}