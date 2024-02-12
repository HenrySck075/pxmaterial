// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) => _SocialMedia(
      url: json['url'] as String,
    );

Map<String, dynamic> _$SocialMediaToJson(_SocialMedia instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_Background _$BackgroundFromJson(Map<String, dynamic> json) => _Background(
      repeat: json['repeat'] as String?,
      color: json['color'] as String?,
      url: json['url'] as String,
      isPrivate: json['isPrivate'] as bool,
    );

Map<String, dynamic> _$BackgroundToJson(_Background instance) =>
    <String, dynamic>{
      'repeat': instance.repeat,
      'color': instance.color,
      'url': instance.url,
      'isPrivate': instance.isPrivate,
    };

_Workspace _$WorkspaceFromJson(Map<String, dynamic> json) => _Workspace(
      userWorkspaceMonitor: json['userWorkspaceMonitor'] as String,
      userWorkspaceTool: json['userWorkspaceTool'] as String,
      userWorkspaceTablet: json['userWorkspaceTablet'] as String,
      userWorkspaceMouse: json['userWorkspaceMouse'] as String,
    );

Map<String, dynamic> _$WorkspaceToJson(_Workspace instance) =>
    <String, dynamic>{
      'userWorkspaceMonitor': instance.userWorkspaceMonitor,
      'userWorkspaceTool': instance.userWorkspaceTool,
      'userWorkspaceTablet': instance.userWorkspaceTablet,
      'userWorkspaceMouse': instance.userWorkspaceMouse,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      imageBig: json['imageBig'] as String,
      premium: json['premium'] as bool,
      isFollowed: json['isFollowed'] as bool,
      isMypixiv: json['isMypixiv'] as bool,
      isBlocking: json['isBlocking'] as bool,
      background: json['background'] == null
          ? null
          : _Background.fromJson(json['background'] as Map<String, dynamic>),
      sketchLiveId: json['sketchLiveId'] as String?,
      partial: json['partial'] as int,
      acceptRequest: json['acceptRequest'] as bool,
      sketchLives: json['sketchLives'] as List<dynamic>,
      following: json['following'] as int,
      mypixivCount: json['mypixivCount'] as int,
      followedBack: json['followedBack'] as bool,
      comment: json['comment'] as String,
      commentHtml: json['commentHtml'] as String,
      webpage: json['webpage']==null?null:(json['webpage'] as String),
      social: json['social'] is List?null:(json['social'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, _SocialMedia.fromJson(e as Map<String, dynamic>)),
      ),
      canSendMessage: json['canSendMessage'] as bool,
      region: Region.fromJson(json['region'] as Map<String, dynamic>),
      age: PrivacyInfo.fromJson(json['age'] as Map<String, dynamic>),
      birthDay: PrivacyInfo.fromJson(json['birthDay'] as Map<String, dynamic>),
      gender: PrivacyInfo.fromJson(json['gender'] as Map<String, dynamic>),
      job: PrivacyInfo.fromJson(json['job'] as Map<String, dynamic>),
      workspace: _Workspace.fromJson(json['workspace'] as Map<String, dynamic>),
      official: json['official'] as bool,
      group: json['group'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'image': instance.image,
      'imageBig': instance.imageBig,
      'premium': instance.premium,
      'isFollowed': instance.isFollowed,
      'isMypixiv': instance.isMypixiv,
      'isBlocking': instance.isBlocking,
      'background': instance.background,
      'sketchLiveId': instance.sketchLiveId,
      'partial': instance.partial,
      'acceptRequest': instance.acceptRequest,
      'sketchLives': instance.sketchLives,
      'following': instance.following,
      'mypixivCount': instance.mypixivCount,
      'followedBack': instance.followedBack,
      'comment': instance.comment,
      'commentHtml': instance.commentHtml,
      'webpage': instance.webpage,
      'social': instance.social,
      'canSendMessage': instance.canSendMessage,
      'region': instance.region,
      'age': instance.age,
      'birthDay': instance.birthDay,
      'gender': instance.gender,
      'job': instance.job,
      'workspace': instance.workspace,
      'official': instance.official,
      'group': instance.group,
    };
