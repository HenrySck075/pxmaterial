import 'Pixivision.dart' show Pixivision;
import 'Ranking.dart' show Ranking;
import 'package:json_annotation/json_annotation.dart';
part 'Page.g.dart';

@JsonSerializable()
class _Tags {
  final String tag;
  final List<int> ids;
  _Tags({
    required this.tag,
    required this.ids,
  });

  factory _Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
@JsonSerializable()
class _Recommend {
  final List<String> ids;
  final Map<String, Map> details;
  _Recommend({
    required this.ids,
    required this.details,
  });

  factory _Recommend.fromJson(Map<String, dynamic> json) => _$RecommendFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendToJson(this);
}
@JsonSerializable()
class _RecommendByTag {
  final String tag;
  final List<String> ids;
  final Map<String, Map> details;
  _RecommendByTag({
    required this.tag,
    required this.ids,
    required this.details,
  });

  factory _RecommendByTag.fromJson(Map<String, dynamic> json) => _$RecommendByTagFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendByTagToJson(this);
}
@JsonSerializable()
class _RecommendUser {
  final int id;
  final List<String> illustIds;
  final List<dynamic> novelIds;
  _RecommendUser({
    required this.id,
    required this.illustIds,
    required this.novelIds,
  });

  factory _RecommendUser.fromJson(Map<String, dynamic> json) => _$RecommendUserFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendUserToJson(this);
}
@JsonSerializable()
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

  factory _ContestOngoing.fromJson(Map<String, dynamic> json) => _$ContestOngoingFromJson(json);
  Map<String, dynamic> toJson() => _$ContestOngoingToJson(this);
}
@JsonSerializable()
class _EditorRecommend {
  final String illustId;
  final String comment;
  _EditorRecommend({
    required this.illustId,
    required this.comment,
  });

  factory _EditorRecommend.fromJson(Map<String, dynamic> json) => _$EditorRecommendFromJson(json);
  Map<String, dynamic> toJson() => _$EditorRecommendToJson(this);
}
@JsonSerializable()
class _TrendingTags {
  final String tag;
  final int trendingRate;
  final List<int> ids;
  _TrendingTags({
    required this.tag,
    required this.trendingRate,
    required this.ids,
  });

  factory _TrendingTags.fromJson(Map<String, dynamic> json) => _$TrendingTagsFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingTagsToJson(this);
}
@JsonSerializable()
class Page {
  final List<_Tags> tags;
  final List<int> follow;
  final List<dynamic> mypixiv;
  final _Recommend recommend;
  final List<_RecommendByTag> recommendByTag;
  final Ranking ranking;
  final List<Pixivision> pixivision;
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
  Page({
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

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}
