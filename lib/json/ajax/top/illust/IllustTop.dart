import 'package:sofieru/json/ajax/top/shared/Ranking.dart' show Ranking;
import 'package:sofieru/json/ajax/shared/RecommendStatus.dart' show RecommendStatus;
import 'Tag.dart' show Tag;
import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/request/Request.dart' show Request;
import '../novel/PartialNovel.dart' show PartialNovel;
import 'PartialArtwork.dart' show PartialArtwork;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;

class _Thumbnails {
  final List<PartialArtwork> illust;
  final List<PartialNovel> novel;
  final List<dynamic> novelSeries;
  final List<dynamic> novelDraft;
  final List<dynamic> collection;
  _Thumbnails({
    required this.illust,
    required this.novel,
    required this.novelSeries,
    required this.novelDraft,
    required this.collection,
  });
  factory _Thumbnails.fromJson(Map<String, dynamic> json) => _Thumbnails(
    illust: json['illust'].map((e)=>PartialArtwork.fromJson(e)).toList(),
    novel: json['novel'].map((e)=>PartialNovel.fromJson(e)).toList(),
    novelSeries: json['novelSeries'],
    novelDraft: json['novelDraft'],
    collection: json['collection'],
  );
  
}

class _Recommend {
  final List<String> ids;
  final RecommendStatus details;
  _Recommend({
    required this.ids,
    required this.details,
  });
  factory _Recommend.fromJson(Map<String, dynamic> json) => _Recommend(
    ids: json['ids'],
    details: RecommendStatus.fromJson(json['details']),
  );
  
}

class _RecommendByTag {
  final String tag;
  final List<String> ids;
  final RecommendStatus details;
  _RecommendByTag({
    required this.tag,
    required this.ids,
    required this.details,
  });
  factory _RecommendByTag.fromJson(Map<String, dynamic> json) => _RecommendByTag(
    tag: json['tag'] as String,
    ids: json['ids'],
    details: RecommendStatus.fromJson(json['details']),
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
    id: json['id'] as String,
    title: json['title'] as String,
    thumbnailUrl: json['thumbnailUrl'] as String,
    url: json['url'] as String,
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
    id: json['id'] as int,
    illustIds: json['illustIds'],
    novelIds: json['novelIds'],
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
    slug: json['slug'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
    url: json['url'] as String,
    iconUrl: json['iconUrl'] as String,
    workIds: json['workIds'],
    isNew: json['isNew'] as bool,
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
    illustId: json['illustId'] as String,
    comment: json['comment'] as String,
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
    tag: json['tag'] as String,
    trendingRate: json['trendingRate'] as int,
    ids: json['ids'],
  );
  
}

class _Page {
  final List<Tag> tags;
  final List<int> follow;
  final List<dynamic> mypixiv;
  final _Recommend recommend;
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
    tags: json['tags'].map((e)=>Tag.fromJson(e)).toList(),
    follow: json['follow'],
    mypixiv: json['mypixiv'],
    recommend: _Recommend.fromJson(json['recommend']),
    recommendByTag: json['recommendByTag'].map((e)=>_RecommendByTag.fromJson(e)).toList(),
    ranking: Ranking.fromJson(json['ranking']),
    pixivision: json['pixivision'].map((e)=>_Pixivision.fromJson(e)).toList(),
    recommendUser: json['recommendUser'].map((e)=>_RecommendUser.fromJson(e)).toList(),
    contestOngoing: json['contestOngoing'].map((e)=>_ContestOngoing.fromJson(e)).toList(),
    contestResult: json['contestResult'],
    editorRecommend: json['editorRecommend'].map((e)=>_EditorRecommend.fromJson(e)).toList(),
    boothFollowItemIds: json['boothFollowItemIds'],
    sketchLiveFollowIds: json['sketchLiveFollowIds'],
    sketchLivePopularIds: json['sketchLivePopularIds'],
    myFavoriteTags: json['myFavoriteTags'],
    newPost: json['newPost'],
    trendingTags: json['trendingTags'].map((e)=>_TrendingTags.fromJson(e)).toList(),
    completeRequestIds: json['completeRequestIds'],
    userEventIds: json['userEventIds'],
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
    id: json['id'] as String,
    userId: json['userId'] as String,
    title: json['title'] as String,
    url: json['url'] as String,
    imageUrl: json['imageUrl'] as String,
    adult: json['adult'] as bool,
  );
  
}

class IllustTop {
  final Map<String, TagTranslation> tagTranslation;
  final _Thumbnails thumbnails;
  final List<dynamic> illustSeries;
  final List<Request> requests;
  final List<PartialUser> users;
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
    tagTranslation: json['tagTranslation'].map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    thumbnails: _Thumbnails.fromJson(json['thumbnails']),
    illustSeries: json['illustSeries'],
    requests: json['requests'].map((e)=>Request.fromJson(e)).toList(),
    users: json['users'].map((e)=>PartialUser.fromJson(e)).toList(),
    page: _Page.fromJson(json['page']),
    boothItems: json['boothItems'].map((e)=>_BoothItems.fromJson(e)).toList(),
    sketchLives: json['sketchLives'],
  );
  
}
