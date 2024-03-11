import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/top/illust/PartialArtwork.dart' show PartialArtwork;
import 'package:sofieru/json/ajax/shared/TagInfo.dart' show TagInfo;
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
    mini: json['mini'],
    thumb: json['thumb'],
    small: json['small'],
    regular: json['regular'],
    original: json['original'],
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
    authorId: json['authorId'],
    isLocked: json['isLocked'],
    tags: (json['tags'] as List<dynamic>).map((e)=>TagInfo.fromJson(e)).toList(),
    writable: json['writable'],
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
    workTitle: json['workTitle'],
    workCaption: json['workCaption'],
  );

}

class Artwork {
  /// Artwork id
  final String illustId;
  /// Artwork title
  final String illustTitle;
  /// Artwork description
  final String illustComment;
  /// una copia
  final String id;
  /// de lós 3
  final String title;
  /// parámetros anteriores
  final String description;
  /// Artwork type 
  /// 1: Single-image artwork
  /// 2:Multi-image-artwork
  /// 3:Animated artwork
  final int illustType;
  final String createDate;
  final String uploadDate;
  /// Sub-prop for `xRestrict`. 0 is just p, 1 is violent stuff included
  final int restrict;
  /// Whether the work is marked as R-18
  final int xRestrict;
  final int sl;
  final _Urls urls;
  final _Tags tags;
  final String alt;
  final String userId;
  final String userName;
  final String userAccount;
  final Map<String, PartialArtwork?> userIllusts;
  final bool likeData;
  final int width;
  final int height;
  final int pageCount;
  final int bookmarkCount;
  final int likeCount;
  final int commentCount;
  final int responseCount;
  final int viewCount;
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
    illustId: json['illustId'],
    illustTitle: json['illustTitle'],
    illustComment: json['illustComment'],
    id: json['id'],
    title: json['title'],
    description: json['description'],
    illustType: json['illustType'],
    createDate: json['createDate'],
    uploadDate: json['uploadDate'],
    restrict: json['restrict'],
    xRestrict: json['xRestrict'],
    sl: json['sl'],
    urls: _Urls.fromJson(json['urls']),
    tags: _Tags.fromJson(json['tags']),
    alt: json['alt'],
    userId: json['userId'],
    userName: json['userName'],
    userAccount: json['userAccount'],
    userIllusts: (json['userIllusts'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,v==null?null:PartialArtwork.fromJson(v))),
    likeData: json['likeData'],
    width: json['width'],
    height: json['height'],
    pageCount: json['pageCount'],
    bookmarkCount: json['bookmarkCount'],
    likeCount: json['likeCount'],
    commentCount: json['commentCount'],
    responseCount: json['responseCount'],
    viewCount: json['viewCount'],
    isHowto: json['isHowto'],
    isOriginal: json['isOriginal'],
    imageResponseOutData: (json['imageResponseOutData'] as List<dynamic>),
    imageResponseData: (json['imageResponseData'] as List<dynamic>),
    imageResponseCount: json['imageResponseCount'],
    pollData: json['pollData'],
    seriesNavData: json['seriesNavData'],
    descriptionBoothId: json['descriptionBoothId'],
    descriptionYoutubeId: json['descriptionYoutubeId'],
    comicPromotion: json['comicPromotion'],
    fanboxPromotion: json['fanboxPromotion'],
    contestBanners: (json['contestBanners'] as List<dynamic>),
    isBookmarkable: json['isBookmarkable'],
    bookmarkData: json['bookmarkData'],
    contestData: json['contestData'],
    extraData: ExtraData.fromJson(json['extraData']),
    titleCaptionTranslation: _TitleCaptionTranslation.fromJson(json['titleCaptionTranslation']),
    isUnlisted: json['isUnlisted'],
    request: json['request'],
    commentOff: json['commentOff'],
    aiType: json['aiType'],
    reuploadDate: json['reuploadDate'],
    locationMask: json['locationMask'],
  );

}

