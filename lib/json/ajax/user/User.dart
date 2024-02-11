import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class _Background {
  final String? color;
  final bool isPrivate;
  final int? repeat;
  final String? url;
  _Background({
    required this.color,
    required this.isPrivate,
    required this.repeat,
    required this.url
  });


  factory _Background.fromJson(Map<String, dynamic> json) => _$BackgroundFromJson(json);
}

@JsonSerializable()
class User {
  final int partial;
  final String? comment;
  final bool followedBack;
  final String userId;
  final String name;
  final String image;
  final String imageBig;
  final bool premium;
  final bool isFollowed;
  final bool isMypixiv;
  final bool isBlocking;
  final _Background? background;
  final bool acceptRequest;
  User({
    required this.partial,
    required this.comment,
    required this.followedBack,
    required this.userId,
    required this.name,
    required this.image,
    required this.imageBig,
    required this.premium,
    required this.isFollowed,
    required this.isMypixiv,
    required this.isBlocking,
    this.background,
    required this.acceptRequest,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
}
