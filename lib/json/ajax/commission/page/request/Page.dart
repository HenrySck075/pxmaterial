import 'package:json_annotation/json_annotation.dart';
part 'Page.g.dart';

@JsonSerializable()
class _UserList {
  final String id;
  final List<String> illustIds;
  _UserList({
    required this.id,
    required this.illustIds,
  });

  factory _UserList.fromJson(Map<String, dynamic> json) => _$UserListFromJson(json);
  
}
@JsonSerializable()
class Page {
  final List<String> completeRequestIdsIllust;
  final List<String> completeRequestIdsManga;
  final List<String> completeRequestIdsNovels;
  final List<String> inProgressRequestIds;
  final List<String> newerCreatorUserIds;
  final List<String> followCreatorUserIds;
  final List<String> recommendIllustIdsByCreatorAcceptingRequest;
  final List<_UserList> userList;
  Page({
    required this.completeRequestIdsIllust,
    required this.completeRequestIdsManga,
    required this.completeRequestIdsNovels,
    required this.inProgressRequestIds,
    required this.newerCreatorUserIds,
    required this.followCreatorUserIds,
    required this.recommendIllustIdsByCreatorAcceptingRequest,
    required this.userList,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  
}
