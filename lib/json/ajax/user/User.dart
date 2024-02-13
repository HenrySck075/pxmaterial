import 'PrivacyInfo.dart' show PrivacyInfo;
import 'Region.dart' show Region;
import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class _SocialMedia {
  final String url;
  _SocialMedia({
    required this.url
  });

  factory _SocialMedia.fromJson(Map<String, dynamic> json) => _$SocialMediaFromJson(json);
}

@JsonSerializable()
class _Background {
  final String? repeat;
  final String? color;
  final String url;
  final bool isPrivate;
  _Background({
    this.repeat,
    this.color,
    required this.url,
    required this.isPrivate,
  });

  factory _Background.fromJson(Map<String, dynamic> json) => _$BackgroundFromJson(json);
  
}
@JsonSerializable()
class _Workspace {
  final String? userWorkspaceMonitor;
  final String? userWorkspaceDesktop;
  final String? userWorkspacePc;
  final String userWorkspaceTool;
  final String userWorkspaceTablet;
  final String? userWorkspaceMouse;
  _Workspace({
    this.userWorkspaceMonitor,
    this.userWorkspaceDesktop,
    this.userWorkspacePc,
    required this.userWorkspaceTool,
    required this.userWorkspaceTablet,
    this.userWorkspaceMouse,
  });

  factory _Workspace.fromJson(Map<String, dynamic> json) => _$WorkspaceFromJson(json);
  
}
@JsonSerializable()
class User {
  final String userId;
  final String name;
  final String image;
  final String imageBig;
  final bool premium;
  final bool isFollowed;
  final bool isMypixiv;
  final bool isBlocking;
  final _Background? background;
  final String? sketchLiveId;
  final int partial;
  final bool acceptRequest;
  final List<dynamic> sketchLives;
  final int following;
  final int mypixivCount;
  final bool followedBack;
  final String comment;
  final String commentHtml;
  final String? webpage;
  final Map<String, _SocialMedia>? social;
  final bool canSendMessage;
  final Region region;
  final PrivacyInfo age;
  final PrivacyInfo birthDay;
  final PrivacyInfo gender;
  final PrivacyInfo job;
  final _Workspace workspace;
  final bool official;
  final String? group;
  User({
    required this.userId,
    required this.name,
    required this.image,
    required this.imageBig,
    required this.premium,
    required this.isFollowed,
    required this.isMypixiv,
    required this.isBlocking,
    required this.background,
    this.sketchLiveId,
    required this.partial,
    required this.acceptRequest,
    required this.sketchLives,
    required this.following,
    required this.mypixivCount,
    required this.followedBack,
    required this.comment,
    required this.commentHtml,
    required this.webpage,
    required this.social,
    required this.canSendMessage,
    required this.region,
    required this.age,
    required this.birthDay,
    required this.gender,
    required this.job,
    required this.workspace,
    required this.official,
    this.group,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
}
