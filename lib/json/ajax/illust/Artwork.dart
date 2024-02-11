import 'package:json_annotation/json_annotation.dart';
import 'package:sofieru/json/operator_bracket.dart';
import '../shared/TitleCaptionTranslation.dart';
part 'Artwork.g.dart';

@JsonSerializable()
class _Urls {
  final String? mini;
  final String? thumb;
  final String? small;
  final String? regular;
  final String? original;
  _Urls({
    required this.mini,
    required this.thumb,
    required this.small,
    required this.regular,
    required this.original,
  });

  factory _Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
  

  /// You still have to make sure it exists
  String? operator [] (String idk) => eval(this, idk);
}
@JsonSerializable()
class _TagItem {
  final String tag;
  final bool locked;
  final bool deletable;
  final String? userId;
  final String? romaji;
  final Map<String, String>? translation;
  final String? userName;
  _TagItem({
    required this.tag,
    required this.locked,
    required this.deletable,
    required this.userId,
    required this.romaji,
    required this.translation,
    required this.userName,
  });

  factory _TagItem.fromJson(Map<String, dynamic> json) => _$TagItemFromJson(json);
  
}
@JsonSerializable()
class _Tags {
  final String authorId;
  final bool isLocked;
  final List<_TagItem> tags;
  final bool writable;
  _Tags({
    required this.authorId,
    required this.isLocked,
    required this.tags,
    required this.writable,
  });

  factory _Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  
}
@JsonSerializable()
class _Responsive {
  final String url;
  _Responsive({
    required this.url,
  });

  factory _Responsive.fromJson(Map<String, dynamic> json) => _$ResponsiveFromJson(json);
  
}
@JsonSerializable()
class _Rectangle {
  final String url;
  _Rectangle({
    required this.url,
  });

  factory _Rectangle.fromJson(Map<String, dynamic> json) => _$RectangleFromJson(json);
  
}
@JsonSerializable()
class _AlternateLanguages {
  final String ja;
  final String en;
  _AlternateLanguages({
    required this.ja,
    required this.en,
  });

  factory _AlternateLanguages.fromJson(Map<String, dynamic> json) => _$AlternateLanguagesFromJson(json);
  
}
@JsonSerializable()
class _Ogp {
  final String description;
  final String image;
  final String title;
  final String type;
  _Ogp({
    required this.description,
    required this.image,
    required this.title,
    required this.type,
  });

  factory _Ogp.fromJson(Map<String, dynamic> json) => _$OgpFromJson(json);
  
}
@JsonSerializable()
class _Twitter {
  final String description;
  final String image;
  final String title;
  final String card;
  _Twitter({
    required this.description,
    required this.image,
    required this.title,
    required this.card,
  });

  factory _Twitter.fromJson(Map<String, dynamic> json) => _$TwitterFromJson(json);
  
}
@JsonSerializable()
class _Meta {
  final String title;
  final String description;
  final String canonical;
  final _AlternateLanguages alternateLanguages;
  final String descriptionHeader;
  final _Ogp ogp;
  final _Twitter twitter;
  _Meta({
    required this.title,
    required this.description,
    required this.canonical,
    required this.alternateLanguages,
    required this.descriptionHeader,
    required this.ogp,
    required this.twitter,
  });

  factory _Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  
}
@JsonSerializable()
class _ExtraData {
  final _Meta meta;
  _ExtraData({
    required this.meta,
  });

  factory _ExtraData.fromJson(Map<String, dynamic> json) => _$ExtraDataFromJson(json);
  
}
@JsonSerializable()
class _ArtworkLite {
  final String id;
  final String title;
  final int illustType;
  final int xRestrict;
  final int restrict;
  final int sl;
  final String url;
  final String description;
  final List<String> tags;
  final String userId;
  final String userName;
  final int width;
  final int height;
  final int pageCount;
  final bool isBookmarkable;
  final String? bookmarkData;
  final String alt;
  final TitleCaptionTranslation titleCaptionTranslation;
  final String createDate;
  final String updateDate;
  final bool isUnlisted;
  final bool isMasked;
  final int aiType;
  _ArtworkLite({
    required this.id,
    required this.title,
    required this.illustType,
    required this.xRestrict,
    required this.restrict,
    required this.sl,
    required this.url,
    required this.description,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.width,
    required this.height,
    required this.pageCount,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.alt,
    required this.titleCaptionTranslation,
    required this.createDate,
    required this.updateDate,
    required this.isUnlisted,
    required this.isMasked,
    required this.aiType,
  });

  factory _ArtworkLite.fromJson(Map<String, dynamic> json) => _$ArtworkLiteFromJson(json);
  
}
@JsonSerializable()
class Artwork {
  final String illustId;
  final String illustTitle;
  final String illustComment;
  final String id;
  final String title;
  final String description;
  final int illustType;
  final String createDate;
  final String uploadDate;
  final int restrict;
  final int xRestrict;
  final int sl;
  final _Urls urls;
  final _Tags tags;
  final String alt;
  final String userId;
  final String userName;
  final String userAccount;
  final Map<String, _ArtworkLite?> userIllusts;
  final bool likeData;
  final int width;
  final int height;
  final int pageCount;
  final int bookmarkCount;
  final int likeCount;
  final int commentCount;
  final int responseCount;
  final int viewCount;
  final int bookStyle;
  final bool isHowto;
  final bool isOriginal;
  final List<dynamic> imageResponseOutData;
  final List<dynamic> imageResponseData;
  final int imageResponseCount;
  final String? pollData;
  final String? seriesNavData;
  final String? descriptionBoothId;
  final String? descriptionYoutubeId;
  final String? comicPromotion;
  final String? fanboxPromotion;
  final List<dynamic> contestBanners;
  final bool isBookmarkable;
  final String? bookmarkData;
  final String? contestData;
  final _ExtraData extraData;
  final TitleCaptionTranslation titleCaptionTranslation;
  final bool isUnlisted;
  final String? request;
  final int commentOff;
  final int aiType;
  final String? reuploadDate;
  final bool locationMask;
  Artwork({
    required this.illustId,
    required this.illustTitle,
    required this.illustComment,
    required this.id,
    required this.title,
    required this.description,
    required this.illustType,
    required this.createDate,
    required this.uploadDate,
    required this.restrict,
    required this.xRestrict,
    required this.sl,
    required this.urls,
    required this.tags,
    required this.alt,
    required this.userId,
    required this.userName,
    required this.userAccount,
    required this.userIllusts,
    required this.likeData,
    required this.width,
    required this.height,
    required this.pageCount,
    required this.bookmarkCount,
    required this.likeCount,
    required this.commentCount,
    required this.responseCount,
    required this.viewCount,
    required this.bookStyle,
    required this.isHowto,
    required this.isOriginal,
    required this.imageResponseOutData,
    required this.imageResponseData,
    required this.imageResponseCount,
    this.pollData,
    this.seriesNavData,
    this.descriptionBoothId,
    this.descriptionYoutubeId,
    this.comicPromotion,
    this.fanboxPromotion,
    required this.contestBanners,
    required this.isBookmarkable,
    this.bookmarkData,
    this.contestData,
    required this.extraData,
    required this.titleCaptionTranslation,
    required this.isUnlisted,
    this.request,
    required this.commentOff,
    required this.aiType,
    this.reuploadDate,
    required this.locationMask,
  });

  factory Artwork.fromJson(Map<String, dynamic> json) => _$ArtworkFromJson(json);
  
}
