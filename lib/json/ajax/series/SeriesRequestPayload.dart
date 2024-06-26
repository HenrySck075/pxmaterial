import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/series/IllustSeries.dart' show IllustSeries;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
class _Series {
  final String workId;
  final int order;
  _Series({
    required this.workId,
    required this.order,
  });
  factory _Series.fromJson(Map<String, dynamic> json) {
    return _Series(
    workId: json['workId'],
    order: json['order'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "workId": workId,
    "order": order,
  };
}

class _Page {
  final List<_Series> series;
  final bool isSetCover;
  final int seriesId;
  final String otherSeriesId;
  final List<int> recentUpdatedWorkIds;
  final int total;
  final bool isWatched;
  final bool isNotifying;
  _Page({
    required this.series,
    required this.isSetCover,
    required this.seriesId,
    required this.otherSeriesId,
    required this.recentUpdatedWorkIds,
    required this.total,
    required this.isWatched,
    required this.isNotifying,
  });
  factory _Page.fromJson(Map<String, dynamic> json) {
    return _Page(
    series: (json['series'] as List<dynamic>).map((e)=>_Series.fromJson(e)).toList(),
    isSetCover: json['isSetCover'],
    seriesId: json['seriesId'],
    otherSeriesId: json['otherSeriesId'],
    recentUpdatedWorkIds: (json['recentUpdatedWorkIds'] as List<dynamic>).map((e)=>e as int).toList(),
    total: json['total'],
    isWatched: json['isWatched'],
    isNotifying: json['isNotifying'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "series": series.map((e)=>e.toJson()).toList(),
    "isSetCover": isSetCover,
    "seriesId": seriesId,
    "otherSeriesId": otherSeriesId,
    "recentUpdatedWorkIds": recentUpdatedWorkIds,
    "total": total,
    "isWatched": isWatched,
    "isNotifying": isNotifying,
  };
}

class SeriesRequestPayload {
  final Map<String, TagTranslation> tagTranslation;
  final Thumbnails thumbnails;
  final List<IllustSeries> illustSeries;
  final List<dynamic> requests;
  final List<PartialUser> users;
  final _Page page;
  final ExtraData extraData;
  SeriesRequestPayload({
    required this.tagTranslation,
    required this.thumbnails,
    required this.illustSeries,
    required this.requests,
    required this.users,
    required this.page,
    required this.extraData,
  });
  factory SeriesRequestPayload.fromJson(Map<String, dynamic> json) {
    return SeriesRequestPayload(
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    thumbnails: Thumbnails.fromJson(json['thumbnails']),
    illustSeries: (json['illustSeries'] as List<dynamic>).map((e)=>IllustSeries.fromJson(e)).toList(),
    requests: (json['requests'] as List<dynamic>),
    users: (json['users'] as List<dynamic>).map((e)=>PartialUser.fromJson(e)).toList(),
    page: _Page.fromJson(json['page']),
    extraData: ExtraData.fromJson(json['extraData']),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "tagTranslation": tagTranslation.map((k,v)=>MapEntry(k,v.toJson())),
    "thumbnails": thumbnails.toJson(),
    "illustSeries": illustSeries.map((e)=>e.toJson()).toList(),
    "requests": requests,
    "users": users.map((e)=>e.toJson()).toList(),
    "page": page.toJson(),
    "extraData": extraData.toJson(),
  };
}

