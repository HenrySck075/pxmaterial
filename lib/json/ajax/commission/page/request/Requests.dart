import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import '../requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
import 'package:sofieru/json/ajax/shared/UserEmbed.dart' show UserEmbed;
class _Page {
  final List<String> completeRequestIdsIllust;
  final List<String> completeRequestIdsManga;
  final List<String> completeRequestIdsNovels;
  final List<String> inProgressRequestIds;
  final List<String> newerCreatorUserIds;
  final List<dynamic> followCreatorUserIds;
  final List<String> recommendIllustIdsByCreatorAcceptingRequest;
  final List<UserEmbed> userList;
  _Page({
    required this.completeRequestIdsIllust,
    required this.completeRequestIdsManga,
    required this.completeRequestIdsNovels,
    required this.inProgressRequestIds,
    required this.newerCreatorUserIds,
    required this.followCreatorUserIds,
    required this.recommendIllustIdsByCreatorAcceptingRequest,
    required this.userList,
  });
  factory _Page.fromJson(Map<String, dynamic> json) {
    return _Page(
    completeRequestIdsIllust: (json['completeRequestIdsIllust'] as List<dynamic>).map((e)=>e as String).toList(),
    completeRequestIdsManga: (json['completeRequestIdsManga'] as List<dynamic>).map((e)=>e as String).toList(),
    completeRequestIdsNovels: (json['completeRequestIdsNovels'] as List<dynamic>).map((e)=>e as String).toList(),
    inProgressRequestIds: (json['inProgressRequestIds'] as List<dynamic>).map((e)=>e as String).toList(),
    newerCreatorUserIds: (json['newerCreatorUserIds'] as List<dynamic>).map((e)=>e as String).toList(),
    followCreatorUserIds: (json['followCreatorUserIds'] as List<dynamic>),
    recommendIllustIdsByCreatorAcceptingRequest: (json['recommendIllustIdsByCreatorAcceptingRequest'] as List<dynamic>).map((e)=>e as String).toList(),
    userList: (json['userList'] as List<dynamic>).map((e)=>UserEmbed.fromJson(e)).toList(),
  );}

}

class Requests {
  final _Page page;
  final Map<String, TagTranslation> tagTranslation;
  final Thumbnails thumbnails;
  final List<dynamic> illustSeries;
  final List<Request> requests;
  final List<PartialUser> users;
  Requests({
    required this.page,
    required this.tagTranslation,
    required this.thumbnails,
    required this.illustSeries,
    required this.requests,
    required this.users,
  });
  factory Requests.fromJson(Map<String, dynamic> json) {
    return Requests(
    page: _Page.fromJson(json['page']),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    thumbnails: Thumbnails.fromJson(json['thumbnails']),
    illustSeries: (json['illustSeries'] as List<dynamic>),
    requests: (json['requests'] as List<dynamic>).map((e)=>Request.fromJson(e)).toList(),
    users: (json['users'] as List<dynamic>).map((e)=>PartialUser.fromJson(e)).toList(),
  );}

}

