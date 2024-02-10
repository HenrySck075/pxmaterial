// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      partial: json['partial'] as int,
      comment: json['comment'] as String,
      followedBack: json['followedBack'] as bool,
      userId: json['userId'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      imageBig: json['imageBig'] as String,
      premium: json['premium'] as bool,
      isFollowed: json['isFollowed'] as bool,
      isMypixiv: json['isMypixiv'] as bool,
      isBlocking: json['isBlocking'] as bool,
      background: json['background'] as String?,
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
