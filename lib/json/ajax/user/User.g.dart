// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Background _$BackgroundFromJson(Map<String, dynamic> json) => _Background(
      color: json['color'] as String?,
      isPrivate: json['isPrivate'] as bool,
      repeat: json['repeat'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BackgroundToJson(_Background instance) =>
    <String, dynamic>{
      'color': instance.color,
      'isPrivate': instance.isPrivate,
      'repeat': instance.repeat,
      'url': instance.url,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      partial: json['partial'] as int,
      comment: json['comment'] as String?,
      followedBack: json['followedBack']!=null,
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
      acceptRequest: json['acceptRequest'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'partial': instance.partial,
      'comment': instance.comment,
      'followedBack': instance.followedBack,
      'userId': instance.userId,
      'name': instance.name,
      'image': instance.image,
      'imageBig': instance.imageBig,
      'premium': instance.premium,
      'isFollowed': instance.isFollowed,
      'isMypixiv': instance.isMypixiv,
      'isBlocking': instance.isBlocking,
      'background': instance.background,
      'acceptRequest': instance.acceptRequest,
    };