import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/series/IllustSeries.dart' show IllustSeries;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
class _Page {
  final List<int> ids;
  final bool isLastPage;
  final List<dynamic> tags;
  _Page({
    required this.ids,
    required this.isLastPage,
    required this.tags,
  });
  factory _Page.fromJson(Map<String, dynamic> json) {
    return _Page(
    ids: (json['ids'] as List<dynamic>).map((e)=>e as int).toList(),
    isLastPage: json['isLastPage'],
    tags: (json['tags'] as List<dynamic>),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "ids": ids,
    "isLastPage": isLastPage,
    "tags": tags,
  };
}

class IMFromFollowing {
  final _Page page;
  final Map<String, TagTranslation> tagTranslation;
  final List<IllustSeries> illustSeries;
  final Thumbnails thumbnails;
  final List<Request> requests;
  final List<PartialUser> users;
  IMFromFollowing({
    required this.page,
    required this.tagTranslation,
    required this.illustSeries,
    required this.thumbnails,
    required this.requests,
    required this.users,
  });
  factory IMFromFollowing.fromJson(Map<String, dynamic> json) {
    return IMFromFollowing(
    page: _Page.fromJson(json['page']),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    illustSeries: (json['illustSeries'] as List<dynamic>).map((e)=>IllustSeries.fromJson(e)).toList(),
    thumbnails: Thumbnails.fromJson(json['thumbnails']),
    requests: (json['requests'] as List<dynamic>).map((e)=>Request.fromJson(e)).toList(),
    users: (json['users'] as List<dynamic>).map((e)=>PartialUser.fromJson(e)).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "page": page.toJson(),
    "tagTranslation": tagTranslation.map((k,v)=>MapEntry(k,v.toJson())),
    "illustSeries": illustSeries.map((e)=>e.toJson()).toList(),
    "thumbnails": thumbnails.toJson(),
    "requests": requests.map((e)=>e.toJson()).toList(),
    "users": users.map((e)=>e.toJson()).toList(),
  };
}

