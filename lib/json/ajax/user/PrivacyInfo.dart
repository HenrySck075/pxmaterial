import 'package:json_annotation/json_annotation.dart';
part 'PrivacyInfo.g.dart';

@JsonSerializable()
class PrivacyInfo {
  final String? name;
  final String? privacyLevel;
  PrivacyInfo({
    this.name,
    this.privacyLevel,
  });

  factory PrivacyInfo.fromJson(Map<String, dynamic> json) => _$PrivacyInfoFromJson(json);
  
}