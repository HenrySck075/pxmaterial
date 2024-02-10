// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Urls _$UrlsFromJson(Map<String, dynamic> json) => _Urls(
      mini: json['mini'] as String,
      thumb: json['thumb'] as String,
      small: json['small'] as String,
      regular: json['regular'] as String,
      original: json['original'] as String,
    );

Map<String, dynamic> _$UrlsToJson(_Urls instance) => <String, dynamic>{
      'mini': instance.mini,
      'thumb': instance.thumb,
      'small': instance.small,
      'regular': instance.regular,
      'original': instance.original,
    };

_TagItem _$TagItemFromJson(Map<String, dynamic> json) => _TagItem(
      tag: json['tag'] as String,
      locked: json['locked'] as bool,
      deletable: json['deletable'] as bool,
      userId: json['userId'] as String,
      romaji: json['romaji'] as String,
      translation: (json['translation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$TagItemToJson(_TagItem instance) => <String, dynamic>{
      'tag': instance.tag,
      'locked': instance.locked,
      'deletable': instance.deletable,
      'userId': instance.userId,
      'romaji': instance.romaji,
      'translation': instance.translation,
      'userName': instance.userName,
    };

_Tags _$TagsFromJson(Map<String, dynamic> json) => _Tags(
      authorId: json['authorId'] as String,
      isLocked: json['isLocked'] as bool,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => _TagItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      writable: json['writable'] as bool,
    );

Map<String, dynamic> _$TagsToJson(_Tags instance) => <String, dynamic>{
      'authorId': instance.authorId,
      'isLocked': instance.isLocked,
      'tags': instance.tags,
      'writable': instance.writable,
    };

_Responsive _$ResponsiveFromJson(Map<String, dynamic> json) => _Responsive(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ResponsiveToJson(_Responsive instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_Rectangle _$RectangleFromJson(Map<String, dynamic> json) => _Rectangle(
      url: json['url'] as String,
    );

Map<String, dynamic> _$RectangleToJson(_Rectangle instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_AlternateLanguages _$AlternateLanguagesFromJson(Map<String, dynamic> json) =>
    _AlternateLanguages(
      ja: json['ja'] as String,
      en: json['en'] as String,
    );

Map<String, dynamic> _$AlternateLanguagesToJson(_AlternateLanguages instance) =>
    <String, dynamic>{
      'ja': instance.ja,
      'en': instance.en,
    };

_Ogp _$OgpFromJson(Map<String, dynamic> json) => _Ogp(
      description: json['description'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$OgpToJson(_Ogp instance) => <String, dynamic>{
      'description': instance.description,
      'image': instance.image,
      'title': instance.title,
      'type': instance.type,
    };

_Twitter _$TwitterFromJson(Map<String, dynamic> json) => _Twitter(
      description: json['description'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      card: json['card'] as String,
    );

Map<String, dynamic> _$TwitterToJson(_Twitter instance) => <String, dynamic>{
      'description': instance.description,
      'image': instance.image,
      'title': instance.title,
      'card': instance.card,
    };

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
      title: json['title'] as String,
      description: json['description'] as String,
      canonical: json['canonical'] as String,
      alternateLanguages: _AlternateLanguages.fromJson(
          json['alternateLanguages'] as Map<String, dynamic>),
      descriptionHeader: json['descriptionHeader'] as String,
      ogp: _Ogp.fromJson(json['ogp'] as Map<String, dynamic>),
      twitter: _Twitter.fromJson(json['twitter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'canonical': instance.canonical,
      'alternateLanguages': instance.alternateLanguages,
      'descriptionHeader': instance.descriptionHeader,
      'ogp': instance.ogp,
      'twitter': instance.twitter,
    };

_ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) => _ExtraData(
      meta: _Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtraDataToJson(_ExtraData instance) =>
    <String, dynamic>{
      'meta': instance.meta,
    };

_TitleCaptionTranslation _$TitleCaptionTranslationFromJson(
        Map<String, dynamic> json) =>
    _TitleCaptionTranslation(
      workTitle: json['workTitle'] as String?,
      workCaption: json['workCaption'] as String?,
    );

Map<String, dynamic> _$TitleCaptionTranslationToJson(
        _TitleCaptionTranslation instance) =>
    <String, dynamic>{
      'workTitle': instance.workTitle,
      'workCaption': instance.workCaption,
    };

Artwork _$ArtworkFromJson(Map<String, dynamic> json) => Artwork(
      illustId: json['illustId'] as String,
      illustTitle: json['illustTitle'] as String,
      illustComment: json['illustComment'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      illustType: json['illustType'] as int,
      createDate: json['createDate'] as String,
      uploadDate: json['uploadDate'] as String,
      restrict: json['restrict'] as int,
      xRestrict: json['xRestrict'] as int,
      sl: json['sl'] as int,
      urls: _Urls.fromJson(json['urls'] as Map<String, dynamic>),
      tags: _Tags.fromJson(json['tags'] as Map<String, dynamic>),
      alt: json['alt'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAccount: json['userAccount'] as String,
      userIllusts: (json['userIllusts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Artwork.fromJson(e as Map<String, dynamic>)),
      ),
      likeData: json['likeData'] as bool,
      width: json['width'] as int,
      height: json['height'] as int,
      pageCount: json['pageCount'] as int,
      bookmarkCount: json['bookmarkCount'] as int,
      likeCount: json['likeCount'] as int,
      commentCount: json['commentCount'] as int,
      responseCount: json['responseCount'] as int,
      viewCount: json['viewCount'] as int,
      bookStyle: json['bookStyle'] as int,
      isHowto: json['isHowto'] as bool,
      isOriginal: json['isOriginal'] as bool,
      imageResponseOutData: json['imageResponseOutData'] as List<dynamic>,
      imageResponseData: json['imageResponseData'] as List<dynamic>,
      imageResponseCount: json['imageResponseCount'] as int,
      pollData: json['pollData'] as String?,
      seriesNavData: json['seriesNavData'] as String?,
      descriptionBoothId: json['descriptionBoothId'] as String?,
      descriptionYoutubeId: json['descriptionYoutubeId'] as String?,
      comicPromotion: json['comicPromotion'] as String?,
      fanboxPromotion: json['fanboxPromotion'] as String?,
      contestBanners: json['contestBanners'] as List<dynamic>,
      isBookmarkable: json['isBookmarkable'] as bool,
      bookmarkData: json['bookmarkData'] as String?,
      contestData: json['contestData'] as String?,
      extraData: _ExtraData.fromJson(json['extraData'] as Map<String, dynamic>),
      titleCaptionTranslation: _TitleCaptionTranslation.fromJson(
          json['titleCaptionTranslation'] as Map<String, dynamic>),
      isUnlisted: json['isUnlisted'] as bool,
      request: json['request'] as String?,
      commentOff: json['commentOff'] as int,
      aiType: json['aiType'] as int,
      reuploadDate: json['reuploadDate'] as String?,
      locationMask: json['locationMask'] as bool,
    );

Map<String, dynamic> _$ArtworkToJson(Artwork instance) => <String, dynamic>{
      'illustId': instance.illustId,
      'illustTitle': instance.illustTitle,
      'illustComment': instance.illustComment,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'illustType': instance.illustType,
      'createDate': instance.createDate,
      'uploadDate': instance.uploadDate,
      'restrict': instance.restrict,
      'xRestrict': instance.xRestrict,
      'sl': instance.sl,
      'urls': instance.urls,
      'tags': instance.tags,
      'alt': instance.alt,
      'userId': instance.userId,
      'userName': instance.userName,
      'userAccount': instance.userAccount,
      'userIllusts': instance.userIllusts,
      'likeData': instance.likeData,
      'width': instance.width,
      'height': instance.height,
      'pageCount': instance.pageCount,
      'bookmarkCount': instance.bookmarkCount,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'responseCount': instance.responseCount,
      'viewCount': instance.viewCount,
      'bookStyle': instance.bookStyle,
      'isHowto': instance.isHowto,
      'isOriginal': instance.isOriginal,
      'imageResponseOutData': instance.imageResponseOutData,
      'imageResponseData': instance.imageResponseData,
      'imageResponseCount': instance.imageResponseCount,
      'pollData': instance.pollData,
      'seriesNavData': instance.seriesNavData,
      'descriptionBoothId': instance.descriptionBoothId,
      'descriptionYoutubeId': instance.descriptionYoutubeId,
      'comicPromotion': instance.comicPromotion,
      'fanboxPromotion': instance.fanboxPromotion,
      'contestBanners': instance.contestBanners,
      'isBookmarkable': instance.isBookmarkable,
      'bookmarkData': instance.bookmarkData,
      'contestData': instance.contestData,
      'extraData': instance.extraData,
      'titleCaptionTranslation': instance.titleCaptionTranslation,
      'isUnlisted': instance.isUnlisted,
      'request': instance.request,
      'commentOff': instance.commentOff,
      'aiType': instance.aiType,
      'reuploadDate': instance.reuploadDate,
      'locationMask': instance.locationMask,
    };
