// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tags _$TagsFromJson(Map<String, dynamic> json) => _Tags(
      tag: json['tag'] as String,
      ids: (json['ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$TagsToJson(_Tags instance) => <String, dynamic>{
      'tag': instance.tag,
      'ids': instance.ids,
    };

_Recommend _$RecommendFromJson(Map<String, dynamic> json) => _Recommend(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
      details: (json['details'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ),
    );

Map<String, dynamic> _$RecommendToJson(_Recommend instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'details': instance.details,
    };

_RecommendByTag _$RecommendByTagFromJson(Map<String, dynamic> json) =>
    _RecommendByTag(
      tag: json['tag'] as String,
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
      details: (json['details'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ),
    );

Map<String, dynamic> _$RecommendByTagToJson(_RecommendByTag instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'ids': instance.ids,
      'details': instance.details,
    };

_RecommendUser _$RecommendUserFromJson(Map<String, dynamic> json) =>
    _RecommendUser(
      id: json['id'] as int,
      illustIds:
          (json['illustIds'] as List<dynamic>).map((e) => e as String).toList(),
      novelIds: json['novelIds'] as List<dynamic>,
    );

Map<String, dynamic> _$RecommendUserToJson(_RecommendUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'illustIds': instance.illustIds,
      'novelIds': instance.novelIds,
    };

_ContestOngoing _$ContestOngoingFromJson(Map<String, dynamic> json) =>
    _ContestOngoing(
      slug: json['slug'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      iconUrl: json['iconUrl'] as String,
      workIds: (json['workIds'] as List<dynamic>).map((e) => e as int).toList(),
      isNew: json['isNew'] as bool,
    );

Map<String, dynamic> _$ContestOngoingToJson(_ContestOngoing instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'type': instance.type,
      'name': instance.name,
      'url': instance.url,
      'iconUrl': instance.iconUrl,
      'workIds': instance.workIds,
      'isNew': instance.isNew,
    };

_EditorRecommend _$EditorRecommendFromJson(Map<String, dynamic> json) =>
    _EditorRecommend(
      illustId: json['illustId'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$EditorRecommendToJson(_EditorRecommend instance) =>
    <String, dynamic>{
      'illustId': instance.illustId,
      'comment': instance.comment,
    };

_TrendingTags _$TrendingTagsFromJson(Map<String, dynamic> json) =>
    _TrendingTags(
      tag: json['tag'] as String,
      trendingRate: json['trendingRate'] as int,
      ids: (json['ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$TrendingTagsToJson(_TrendingTags instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'trendingRate': instance.trendingRate,
      'ids': instance.ids,
    };

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      tags: (json['tags'] as List<dynamic>)
          .map((e) => _Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      follow: (json['follow'] as List<dynamic>).map((e) => e as int).toList(),
      mypixiv: json['mypixiv'] as List<dynamic>,
      recommend: _Recommend.fromJson(json['recommend'] as Map<String, dynamic>),
      recommendByTag: (json['recommendByTag'] as List<dynamic>)
          .map((e) => _RecommendByTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      ranking: Ranking.fromJson(json['ranking'] as Map<String, dynamic>),
      pixivision: (json['pixivision'] as List<dynamic>)
          .map((e) => Pixivision.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendUser: (json['recommendUser'] as List<dynamic>)
          .map((e) => _RecommendUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      contestOngoing: (json['contestOngoing'] as List<dynamic>)
          .map((e) => _ContestOngoing.fromJson(e as Map<String, dynamic>))
          .toList(),
      contestResult: json['contestResult'] as List<dynamic>,
      editorRecommend: (json['editorRecommend'] as List<dynamic>)
          .map((e) => _EditorRecommend.fromJson(e as Map<String, dynamic>))
          .toList(),
      boothFollowItemIds: (json['boothFollowItemIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sketchLiveFollowIds: json['sketchLiveFollowIds'] as List<dynamic>,
      sketchLivePopularIds: json['sketchLivePopularIds'] as List<dynamic>,
      myFavoriteTags: json['myFavoriteTags'] as List<dynamic>,
      newPost:
          (json['newPost'] as List<dynamic>).map((e) => e as String).toList(),
      trendingTags: (json['trendingTags'] as List<dynamic>)
          .map((e) => _TrendingTags.fromJson(e as Map<String, dynamic>))
          .toList(),
      completeRequestIds: (json['completeRequestIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userEventIds: (json['userEventIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'tags': instance.tags,
      'follow': instance.follow,
      'mypixiv': instance.mypixiv,
      'recommend': instance.recommend,
      'recommendByTag': instance.recommendByTag,
      'ranking': instance.ranking,
      'pixivision': instance.pixivision,
      'recommendUser': instance.recommendUser,
      'contestOngoing': instance.contestOngoing,
      'contestResult': instance.contestResult,
      'editorRecommend': instance.editorRecommend,
      'boothFollowItemIds': instance.boothFollowItemIds,
      'sketchLiveFollowIds': instance.sketchLiveFollowIds,
      'sketchLivePopularIds': instance.sketchLivePopularIds,
      'myFavoriteTags': instance.myFavoriteTags,
      'newPost': instance.newPost,
      'trendingTags': instance.trendingTags,
      'completeRequestIds': instance.completeRequestIds,
      'userEventIds': instance.userEventIds,
    };
