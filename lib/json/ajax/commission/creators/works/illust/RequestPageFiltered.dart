import 'package:sofieru/json/ajax/user/User.dart' show User;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
class _Pager {
  final int page;
  final bool hasNextPage;
  _Pager({
    required this.page,
    required this.hasNextPage,
  });
  factory _Pager.fromJson(Map<String, dynamic> json) {
    return _Pager(
    page: json['page'],
    hasNextPage: json['hasNextPage'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "page": page,
    "hasNextPage": hasNextPage,
  };
}

class RequestPageFiltered {
  final List<int> workIds;
  final String workType;
  final String mode;
  final List<String> tags;
  final _Pager pager;
  final Map<String, TagTranslation> tagTranslation;
  final Thumbnails thumbnails;
  final List<dynamic> illustSeries;
  final List<Request> requests;
  final List<User> users;
  RequestPageFiltered({
    required this.workIds,
    required this.workType,
    required this.mode,
    required this.tags,
    required this.pager,
    required this.tagTranslation,
    required this.thumbnails,
    required this.illustSeries,
    required this.requests,
    required this.users,
  });
  factory RequestPageFiltered.fromJson(Map<String, dynamic> json) {
    return RequestPageFiltered(
    workIds: (json['workIds'] as List<dynamic>).map((e)=>e as int).toList(),
    workType: json['workType'],
    mode: json['mode'],
    tags: (json['tags'] as List<dynamic>).map((e)=>e as String).toList(),
    pager: _Pager.fromJson(json['pager']),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    thumbnails: Thumbnails.fromJson(json['thumbnails']),
    illustSeries: (json['illustSeries'] as List<dynamic>),
    requests: (json['requests'] as List<dynamic>).map((e)=>Request.fromJson(e)).toList(),
    users: (json['users'] as List<dynamic>).map((e)=>User.fromJson(e)).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "workIds": workIds,
    "workType": workType,
    "mode": mode,
    "tags": tags,
    "pager": pager.toJson(),
    "tagTranslation": tagTranslation.map((k,v)=>MapEntry(k,v.toJson())),
    "thumbnails": thumbnails.toJson(),
    "illustSeries": illustSeries,
    "requests": requests.map((e)=>e.toJson()).toList(),
    "users": users.map((e)=>e.toJson()).toList(),
  };
}

