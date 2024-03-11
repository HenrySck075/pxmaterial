import 'package:sofieru/json/ajax/top/shared/Ranking.dart' show Ranking;
import 'Tag.dart' show Tag;
import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/request/Request.dart' show Request;
import '../../shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
class _Recommend {
  /// 
  final List<String> ids;
  _Recommend({
    required this.ids,
  });
  factory _Recommend.fromJson(Map<String, dynamic> json) => _Recommend(
    ids: (json['ids'] as List<dynamic>).map((e)=>e as String).toList(),
  );

}

class _RecommendByTag {
  final String tag;
  final List<String> ids;
  _RecommendByTag({
    required this.tag,
    required this.ids,
  });
  factory _RecommendByTag.fromJson(Map<String, dynamic> json) => _RecommendByTag(
    tag: json['tag'],
    ids: (json['ids'] as List<dynamic>).map((e)=>e as String).toList(),
  );

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
  factory _Pixivision.fromJson(Map<String, dynamic> json) => _Pixivision(
    id: json['id'],
    title: json['title'],
    thumbnailUrl: json['thumbnailUrl'],
    url: json['url'],
  );

}

class _RecommendUser {
  final int id;
  final List<String> illustIds;
  final List<dynamic> novelIds;
  _RecommendUser({
    required this.id,
    required this.illustIds,
    required this.novelIds,
  });
  factory _RecommendUser.fromJson(Map<String, dynamic> json) => _RecommendUser(
    id: json['id'],
    illustIds: (json['illustIds'] as List<dynamic>).map((e)=>e as String).toList(),
    novelIds: (json['novelIds'] as List<dynamic>),
  );

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
  factory _ContestOngoing.fromJson(Map<String, dynamic> json) => _ContestOngoing(
    slug: json['slug'],
    type: json['type'],
    name: json['name'],
    url: json['url'],
    iconUrl: json['iconUrl'],
    workIds: (json['workIds'] as List<dynamic>).map((e)=>e as int).toList(),
    isNew: json['isNew'],
  );

}

class _EditorRecommend {
  final String illustId;
  final String comment;
  _EditorRecommend({
    required this.illustId,
    required this.comment,
  });
  factory _EditorRecommend.fromJson(Map<String, dynamic> json) => _EditorRecommend(
    illustId: json['illustId'],
    comment: json['comment'],
  );

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
  factory _TrendingTags.fromJson(Map<String, dynamic> json) => _TrendingTags(
    tag: json['tag'],
    trendingRate: json['trendingRate'],
    ids: (json['ids'] as List<dynamic>).map((e)=>e as int).toList(),
  );

}

class _Page {
  /// Tags objects
  final List<Tag> tags;
  /// Works from users you're following
  final List<int> follow;
  /// que
  final List<dynamic> mypixiv;
  /// Recommended artworks
  final _Recommend recommend;
  /// Recommended artworks by tag
  final List<_RecommendByTag> recommendByTag;
  final Ranking ranking;
  final List<_Pixivision> pixivision;
  final List<_RecommendUser> recommendUser;
  final List<_ContestOngoing> contestOngoing;
  final List<dynamic> contestResult;
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
  factory _Page.fromJson(Map<String, dynamic> json) => _Page(
    tags: (json['tags'] as List<dynamic>).map((e)=>Tag.fromJson(e)).toList(),
    follow: (json['follow'] as List<dynamic>).map((e)=>e as int).toList(),
    mypixiv: (json['mypixiv'] as List<dynamic>),
    recommend: _Recommend.fromJson(json['recommend']),
    recommendByTag: (json['recommendByTag'] as List<dynamic>).map((e)=>_RecommendByTag.fromJson(e)).toList(),
    ranking: Ranking.fromJson(json['ranking']),
    pixivision: (json['pixivision'] as List<dynamic>).map((e)=>_Pixivision.fromJson(e)).toList(),
    recommendUser: (json['recommendUser'] as List<dynamic>).map((e)=>_RecommendUser.fromJson(e)).toList(),
    contestOngoing: (json['contestOngoing'] as List<dynamic>).map((e)=>_ContestOngoing.fromJson(e)).toList(),
    contestResult: (json['contestResult'] as List<dynamic>),
    editorRecommend: (json['editorRecommend'] as List<dynamic>).map((e)=>_EditorRecommend.fromJson(e)).toList(),
    boothFollowItemIds: (json['boothFollowItemIds'] as List<dynamic>).map((e)=>e as String).toList(),
    sketchLiveFollowIds: (json['sketchLiveFollowIds'] as List<dynamic>),
    sketchLivePopularIds: (json['sketchLivePopularIds'] as List<dynamic>),
    myFavoriteTags: (json['myFavoriteTags'] as List<dynamic>),
    newPost: (json['newPost'] as List<dynamic>).map((e)=>e as String).toList(),
    trendingTags: (json['trendingTags'] as List<dynamic>).map((e)=>_TrendingTags.fromJson(e)).toList(),
    completeRequestIds: (json['completeRequestIds'] as List<dynamic>).map((e)=>e as String).toList(),
    userEventIds: (json['userEventIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );

}

class _BoothItems {
  final String id;
  final String userId;
  final String title;
  final String url;
  final String imageUrl;
  final bool adult;
  _BoothItems({
    required this.id,
    required this.userId,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.adult,
  });
  factory _BoothItems.fromJson(Map<String, dynamic> json) => _BoothItems(
    id: json['id'],
    userId: json['userId'],
    title: json['title'],
    url: json['url'],
    imageUrl: json['imageUrl'],
    adult: json['adult'],
  );

}

/// Represents the payload of `/ajax/top/illust` request.
/// Objects like works, requests, ... are in partial
class IllustTop {
  /// Tag translations
  final Map<String, TagTranslation> tagTranslation;
  /// Works data
  final Thumbnails thumbnails;
  /// i think this is deprecated
  final List<dynamic> illustSeries;
  /// Request objects
  final List<Request> requests;
  /// User objects
  final List<PartialUser> users;
  /// Data to build page content (need better explaination)
  final _Page page;
  final List<_BoothItems> boothItems;
  final List<dynamic> sketchLives;
  IllustTop({
    required this.tagTranslation,
    required this.thumbnails,
    required this.illustSeries,
    required this.requests,
    required this.users,
    required this.page,
    required this.boothItems,
    required this.sketchLives,
  });
  factory IllustTop.fromJson(Map<String, dynamic> json) => IllustTop(
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    thumbnails: Thumbnails.fromJson(json['thumbnails']),
    illustSeries: (json['illustSeries'] as List<dynamic>),
    requests: (json['requests'] as List<dynamic>).map((e)=>Request.fromJson(e)).toList(),
    users: (json['users'] as List<dynamic>).map((e)=>PartialUser.fromJson(e)).toList(),
    page: _Page.fromJson(json['page']),
    boothItems: (json['boothItems'] as List<dynamic>).map((e)=>_BoothItems.fromJson(e)).toList(),
    sketchLives: (json['sketchLives'] as List<dynamic>),
  );

}

