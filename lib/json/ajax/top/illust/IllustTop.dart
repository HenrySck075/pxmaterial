import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/series/IllustSeries.dart' show IllustSeries;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
import 'package:sofieru/json/ajax/shared/Booth.dart' show Booth;
class _Tags {
  final String tag;
  final List<int> ids;
  _Tags({
    required this.tag,
    required this.ids,
  });
  factory _Tags.fromJson(Map<String, dynamic> json) {
    return _Tags(
    tag: json['tag'],
    ids: (json['ids'] as List<dynamic>).map((e)=>e as int).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "tag": tag,
    "ids": ids,
  };
}

class _Recommend {
  final List<String> ids;
  _Recommend({
    required this.ids,
  });
  factory _Recommend.fromJson(Map<String, dynamic> json) {
    return _Recommend(
    ids: (json['ids'] as List<dynamic>).map((e)=>e as String).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "ids": ids,
  };
}

class _RecommendByTag {
  final String tag;
  final List<String> ids;
  _RecommendByTag({
    required this.tag,
    required this.ids,
  });
  factory _RecommendByTag.fromJson(Map<String, dynamic> json) {
    return _RecommendByTag(
    tag: json['tag'],
    ids: (json['ids'] as List<dynamic>).map((e)=>e as String).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "tag": tag,
    "ids": ids,
  };
}

class _Items {
  final String rank;
  final String id;
  _Items({
    required this.rank,
    required this.id,
  });
  factory _Items.fromJson(Map<String, dynamic> json) {
    return _Items(
    rank: json['rank'],
    id: json['id'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "rank": rank,
    "id": id,
  };
}

class _Ranking {
  final List<_Items> items;
  final String date;
  _Ranking({
    required this.items,
    required this.date,
  });
  factory _Ranking.fromJson(Map<String, dynamic> json) {
    return _Ranking(
    items: (json['items'] as List<dynamic>).map((e)=>_Items.fromJson(e)).toList(),
    date: json['date'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "items": items.map((e)=>e.toJson()).toList(),
    "date": date,
  };
}

class _Pixivision {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String url;
  _Pixivision({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.url,
  });
  factory _Pixivision.fromJson(Map<String, dynamic> json) {
    return _Pixivision(
    id: json['id'],
    title: json['title'],
    thumbnailUrl: json['thumbnailUrl'],
    url: json['url'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "id": id,
    "title": title,
    "thumbnailUrl": thumbnailUrl,
    "url": url,
  };
}

class _RecommendUser {
  final int id;
  final List<String> illustIds;
  final List<String> novelIds;
  _RecommendUser({
    required this.id,
    required this.illustIds,
    required this.novelIds,
  });
  factory _RecommendUser.fromJson(Map<String, dynamic> json) {
    return _RecommendUser(
    id: json['id'],
    illustIds: (json['illustIds'] as List<dynamic>).map((e)=>e as String).toList(),
    novelIds: (json['novelIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "id": id,
    "illustIds": illustIds,
    "novelIds": novelIds,
  };
}

class _ContestOngoing {
  final String slug;
  final String type;
  final String name;
  final String url;
  final String iconUrl;
  final List<int> workIds;
  final bool isNew;
  _ContestOngoing({
    required this.slug,
    required this.type,
    required this.name,
    required this.url,
    required this.iconUrl,
    required this.workIds,
    required this.isNew,
  });
  factory _ContestOngoing.fromJson(Map<String, dynamic> json) {
    return _ContestOngoing(
    slug: json['slug'],
    type: json['type'],
    name: json['name'],
    url: json['url'],
    iconUrl: json['iconUrl'],
    workIds: (json['workIds'] as List<dynamic>).map((e)=>e as int).toList(),
    isNew: json['isNew'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "slug": slug,
    "type": type,
    "name": name,
    "url": url,
    "iconUrl": iconUrl,
    "workIds": workIds,
    "isNew": isNew,
  };
}

class _ContestResult {
  final String slug;
  final String type;
  final String name;
  final String url;
  final String iconUrl;
  final List<int> winnerWorkIds;
  _ContestResult({
    required this.slug,
    required this.type,
    required this.name,
    required this.url,
    required this.iconUrl,
    required this.winnerWorkIds,
  });
  factory _ContestResult.fromJson(Map<String, dynamic> json) {
    return _ContestResult(
    slug: json['slug'],
    type: json['type'],
    name: json['name'],
    url: json['url'],
    iconUrl: json['iconUrl'],
    winnerWorkIds: (json['winnerWorkIds'] as List<dynamic>).map((e)=>e as int).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "slug": slug,
    "type": type,
    "name": name,
    "url": url,
    "iconUrl": iconUrl,
    "winnerWorkIds": winnerWorkIds,
  };
}

class _EditorRecommend {
  final String illustId;
  final String comment;
  _EditorRecommend({
    required this.illustId,
    required this.comment,
  });
  factory _EditorRecommend.fromJson(Map<String, dynamic> json) {
    return _EditorRecommend(
    illustId: json['illustId'],
    comment: json['comment'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "illustId": illustId,
    "comment": comment,
  };
}

class _TrendingTags {
  final String tag;
  final int trendingRate;
  final List<int> ids;
  _TrendingTags({
    required this.tag,
    required this.trendingRate,
    required this.ids,
  });
  factory _TrendingTags.fromJson(Map<String, dynamic> json) {
    return _TrendingTags(
    tag: json['tag'],
    trendingRate: json['trendingRate'],
    ids: (json['ids'] as List<dynamic>).map((e)=>e as int).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "tag": tag,
    "trendingRate": trendingRate,
    "ids": ids,
  };
}

class _Page {
  final List<_Tags> tags;
  final List<int> follow;
  final List<dynamic> mypixiv;
  final _Recommend recommend;
  final List<_RecommendByTag> recommendByTag;
  final _Ranking ranking;
  final List<_Pixivision> pixivision;
  final List<_RecommendUser> recommendUser;
  final List<_ContestOngoing> contestOngoing;
  final List<_ContestResult> contestResult;
  final List<_EditorRecommend> editorRecommend;
  final List<String> boothFollowItemIds;
  final List<dynamic> sketchLiveFollowIds;
  final List<dynamic> sketchLivePopularIds;
  final List<dynamic> myFavoriteTags;
  final List<String> newPost;
  final List<_TrendingTags> trendingTags;
  final List<String> completeRequestIds;
  final List<String> userEventIds;
  _Page({
    required this.tags,
    required this.follow,
    required this.mypixiv,
    required this.recommend,
    required this.recommendByTag,
    required this.ranking,
    required this.pixivision,
    required this.recommendUser,
    required this.contestOngoing,
    required this.contestResult,
    required this.editorRecommend,
    required this.boothFollowItemIds,
    required this.sketchLiveFollowIds,
    required this.sketchLivePopularIds,
    required this.myFavoriteTags,
    required this.newPost,
    required this.trendingTags,
    required this.completeRequestIds,
    required this.userEventIds,
  });
  factory _Page.fromJson(Map<String, dynamic> json) {
    return _Page(
    tags: (json['tags'] as List<dynamic>).map((e)=>_Tags.fromJson(e)).toList(),
    follow: (json['follow'] as List<dynamic>).map((e)=>e as int).toList(),
    mypixiv: (json['mypixiv'] as List<dynamic>),
    recommend: _Recommend.fromJson(json['recommend']),
    recommendByTag: (json['recommendByTag'] as List<dynamic>).map((e)=>_RecommendByTag.fromJson(e)).toList(),
    ranking: _Ranking.fromJson(json['ranking']),
    pixivision: (json['pixivision'] as List<dynamic>).map((e)=>_Pixivision.fromJson(e)).toList(),
    recommendUser: (json['recommendUser'] as List<dynamic>).map((e)=>_RecommendUser.fromJson(e)).toList(),
    contestOngoing: (json['contestOngoing'] as List<dynamic>).map((e)=>_ContestOngoing.fromJson(e)).toList(),
    contestResult: (json['contestResult'] as List<dynamic>).map((e)=>_ContestResult.fromJson(e)).toList(),
    editorRecommend: (json['editorRecommend'] as List<dynamic>).map((e)=>_EditorRecommend.fromJson(e)).toList(),
    boothFollowItemIds: (json['boothFollowItemIds'] as List<dynamic>).map((e)=>e as String).toList(),
    sketchLiveFollowIds: (json['sketchLiveFollowIds'] as List<dynamic>),
    sketchLivePopularIds: (json['sketchLivePopularIds'] as List<dynamic>),
    myFavoriteTags: (json['myFavoriteTags'] as List<dynamic>),
    newPost: (json['newPost'] as List<dynamic>).map((e)=>e as String).toList(),
    trendingTags: (json['trendingTags'] as List<dynamic>).map((e)=>_TrendingTags.fromJson(e)).toList(),
    completeRequestIds: (json['completeRequestIds'] as List<dynamic>).map((e)=>e as String).toList(),
    userEventIds: (json['userEventIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "tags": tags.map((e)=>e.toJson()).toList(),
    "follow": follow,
    "mypixiv": mypixiv,
    "recommend": recommend.toJson(),
    "recommendByTag": recommendByTag.map((e)=>e.toJson()).toList(),
    "ranking": ranking.toJson(),
    "pixivision": pixivision.map((e)=>e.toJson()).toList(),
    "recommendUser": recommendUser.map((e)=>e.toJson()).toList(),
    "contestOngoing": contestOngoing.map((e)=>e.toJson()).toList(),
    "contestResult": contestResult.map((e)=>e.toJson()).toList(),
    "editorRecommend": editorRecommend.map((e)=>e.toJson()).toList(),
    "boothFollowItemIds": boothFollowItemIds,
    "sketchLiveFollowIds": sketchLiveFollowIds,
    "sketchLivePopularIds": sketchLivePopularIds,
    "myFavoriteTags": myFavoriteTags,
    "newPost": newPost,
    "trendingTags": trendingTags.map((e)=>e.toJson()).toList(),
    "completeRequestIds": completeRequestIds,
    "userEventIds": userEventIds,
  };
}

class IllustTop {
  final List<Booth> boothItems;
  final _Page page;
  final Map<String, TagTranslation> tagTranslation;
  final List<IllustSeries> illustSeries;
  final Thumbnails thumbnails;
  final List<Request> requests;
  final List<PartialUser> users;
  IllustTop({
    required this.boothItems,
    required this.page,
    required this.tagTranslation,
    required this.illustSeries,
    required this.thumbnails,
    required this.requests,
    required this.users,
  });
  factory IllustTop.fromJson(Map<String, dynamic> json) {
    return IllustTop(
    boothItems: (json['boothItems'] as List<dynamic>).map((e)=>Booth.fromJson(e)).toList(),
    page: _Page.fromJson(json['page']),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    illustSeries: (json['illustSeries'] as List<dynamic>).map((e)=>IllustSeries.fromJson(e)).toList(),
    thumbnails: Thumbnails.fromJson(json['thumbnails']),
    requests: (json['requests'] as List<dynamic>).map((e)=>Request.fromJson(e)).toList(),
    users: (json['users'] as List<dynamic>).map((e)=>PartialUser.fromJson(e)).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "boothItems": boothItems.map((e)=>e.toJson()).toList(),
    "page": page.toJson(),
    "tagTranslation": tagTranslation.map((k,v)=>MapEntry(k,v.toJson())),
    "illustSeries": illustSeries.map((e)=>e.toJson()).toList(),
    "thumbnails": thumbnails.toJson(),
    "requests": requests.map((e)=>e.toJson()).toList(),
    "users": users.map((e)=>e.toJson()).toList(),
  };
}

