// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserList _$UserListFromJson(Map<String, dynamic> json) => _UserList(
      id: json['id'] as String,
      illustIds:
          (json['illustIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserListToJson(_UserList instance) => <String, dynamic>{
      'id': instance.id,
      'illustIds': instance.illustIds,
    };

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      completeRequestIdsIllust:
          (json['completeRequestIdsIllust'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      completeRequestIdsManga:
          (json['completeRequestIdsManga'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      completeRequestIdsNovels:
          (json['completeRequestIdsNovels'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      inProgressRequestIds: (json['inProgressRequestIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      newerCreatorUserIds: (json['newerCreatorUserIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      followCreatorUserIds: (json['followCreatorUserIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recommendIllustIdsByCreatorAcceptingRequest:
          (json['recommendIllustIdsByCreatorAcceptingRequest'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      userList: (json['userList'] as List<dynamic>)
          .map((e) => _UserList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'completeRequestIdsIllust': instance.completeRequestIdsIllust,
      'completeRequestIdsManga': instance.completeRequestIdsManga,
      'completeRequestIdsNovels': instance.completeRequestIdsNovels,
      'inProgressRequestIds': instance.inProgressRequestIds,
      'newerCreatorUserIds': instance.newerCreatorUserIds,
      'followCreatorUserIds': instance.followCreatorUserIds,
      'recommendIllustIdsByCreatorAcceptingRequest':
          instance.recommendIllustIdsByCreatorAcceptingRequest,
      'userList': instance.userList,
    };
