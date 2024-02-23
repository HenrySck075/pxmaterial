import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/top/illust/PartialArtwork.dart' show PartialArtwork;

class _Urls {
  final String mini;
  final String thumb;
  final String small;
  final String regular;
  final String original;
  _Urls({
    required this.mini,
    required this.thumb,
    required this.small,
    required this.regular,
    required this.original,
  });
  factory _Urls.fromJson(Map<String, dynamic> json) => _Urls(
    mini: json['mini'] as String,
    thumb: json['thumb'] as String,
    small: json['small'] as String,
    regular: json['regular'] as String,
    original: json['original'] as String,
  );
  
}

class _Translation {
  final String en;
  _Translation({
    required this.en,
  });
  factory _Translation.fromJson(Map<String, dynamic> json) => _Translation(
    en: json['en'] as String,
  );
  
}

class TagInfo {
  final String tag;
  final bool locked;
  final bool deletable;
  final String userId;
  final String romaji;
  final _Translation translation;
  final String userName;
  TagInfo({
    required this.tag,
    required this.locked,
    required this.deletable,
    required this.userId,
    required this.romaji,
    required this.translation,
    required this.userName,
  });
  factory TagInfo.fromJson(Map<String, dynamic> json) => TagInfo(
    tag: json['tag'] as String,
    locked: json['locked'] as bool,
    deletable: json['deletable'] as bool,
    userId: json['userId'] as String,
    romaji: json['romaji'] as String,
    translation: _Translation.fromJson(json['translation']),
    userName: json['userName'] as String,
  );
  
}

class _Tags {
  final String authorId;
  final bool isLocked;
  final List<TagInfo> tags;
  final bool writable;
  _Tags({
    required this.authorId,
    required this.isLocked,
    required this.tags,
    required this.writable,
  });
  factory _Tags.fromJson(Map<String, dynamic> json) => _Tags(
    authorId: json['authorId'] as String,
    isLocked: json['isLocked'] as bool,
    tags: json['tags'].map((e)=>TagInfo.fromJson(e)).toList(),
    writable: json['writable'] as bool,
  );
  
}

class _TitleCaptionTranslation {
  final String? workTitle;
  final String? workCaption;
  _TitleCaptionTranslation({
    this.workTitle,
    this.workCaption,
  });
  factory _TitleCaptionTranslation.fromJson(Map<String, dynamic> json) => _TitleCaptionTranslation(
    workTitle: json['workTitle'] as String,
    workCaption: json['workCaption'] as String,
  );
  
}

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
  final Map<String, PartialArtwork> userIllusts;
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
  final ExtraData extraData;
  final _TitleCaptionTranslation titleCaptionTranslation;
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
  factory Artwork.fromJson(Map<String, dynamic> json) => Artwork(
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
    urls: _Urls.fromJson(json['urls']),
    tags: _Tags.fromJson(json['tags']),
    alt: json['alt'] as String,
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    userAccount: json['userAccount'] as String,
    userIllusts: json['userIllusts'].map((k,v)=>MapEntry(k,PartialArtwork.fromJson(v))),
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
    imageResponseOutData: json['imageResponseOutData'],
    imageResponseData: json['imageResponseData'],
    imageResponseCount: json['imageResponseCount'] as int,
    pollData: json['pollData'] as String,
    seriesNavData: json['seriesNavData'] as String,
    descriptionBoothId: json['descriptionBoothId'] as String,
    descriptionYoutubeId: json['descriptionYoutubeId'] as String,
    comicPromotion: json['comicPromotion'] as String,
    fanboxPromotion: json['fanboxPromotion'] as String,
    contestBanners: json['contestBanners'],
    isBookmarkable: json['isBookmarkable'] as bool,
    bookmarkData: json['bookmarkData'] as String,
    contestData: json['contestData'] as String,
    extraData: ExtraData.fromJson(json['extraData']),
    titleCaptionTranslation: _TitleCaptionTranslation.fromJson(json['titleCaptionTranslation']),
    isUnlisted: json['isUnlisted'] as bool,
    request: json['request'] as String,
    commentOff: json['commentOff'] as int,
    aiType: json['aiType'] as int,
    reuploadDate: json['reuploadDate'] as String,
    locationMask: json['locationMask'] as bool,
  );
  
}
