import 'package:sofieru/json/ajax/commission/page/request/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/shared/TagInfo.dart' show TagInfo;
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart' show PartialArtwork;
import 'package:sofieru/json/ajax/shared/Work.dart' show Work;
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
  factory _Urls.fromJson(Map<String, dynamic> json) {
    return _Urls(
    mini: json['mini'],
    thumb: json['thumb'],
    small: json['small'],
    regular: json['regular'],
    original: json['original'],
  );}

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
  factory _Tags.fromJson(Map<String, dynamic> json) {
    return _Tags(
    authorId: json['authorId'],
    isLocked: json['isLocked'],
    tags: (json['tags'] as List<dynamic>).map((e)=>TagInfo.fromJson(e)).toList(),
    writable: json['writable'],
  );}

}

class _TitleCaptionTranslation {
  final String? workTitle;
  final String? workCaption;
  _TitleCaptionTranslation({
    this.workTitle,
    this.workCaption,
  });
  factory _TitleCaptionTranslation.fromJson(Map<String, dynamic> json) {
    return _TitleCaptionTranslation(
    workTitle: json['workTitle'],
    workCaption: json['workCaption'],
  );}

}

class RequestUser {
  final String userId;
  final String userName;
  final String profileImg;
  RequestUser({
    required this.userId,
    required this.userName,
    required this.profileImg,
  });
  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
    userId: json['userId'],
    userName: json['userName'],
    profileImg: json['profileImg'],
  );}

}

class _CollaborateStatus {
  final bool collaborating;
  final bool collaborateAnonymousFlg;
  final int collaboratedCnt;
  final List<dynamic> userSamples;
  _CollaborateStatus({
    required this.collaborating,
    required this.collaborateAnonymousFlg,
    required this.collaboratedCnt,
    required this.userSamples,
  });
  factory _CollaborateStatus.fromJson(Map<String, dynamic> json) {
    return _CollaborateStatus(
    collaborating: json['collaborating'],
    collaborateAnonymousFlg: json['collaborateAnonymousFlg'],
    collaboratedCnt: json['collaboratedCnt'],
    userSamples: (json['userSamples'] as List<dynamic>),
  );}

}

class _Request {
  final Request request;
  final RequestUser creator;
  final RequestUser fan;
  final _CollaborateStatus collaborateStatus;
  final bool editable;
  _Request({
    required this.request,
    required this.creator,
    required this.fan,
    required this.collaborateStatus,
    required this.editable,
  });
  factory _Request.fromJson(Map<String, dynamic> json) {
    return _Request(
    request: Request.fromJson(json['request']),
    creator: RequestUser.fromJson(json['creator']),
    fan: RequestUser.fromJson(json['fan']),
    collaborateStatus: _CollaborateStatus.fromJson(json['collaborateStatus']),
    editable: json['editable'],
  );}

}

class Artwork extends Work {
  /// Artwork id
  final String illustId;
  /// Artwork title
  final String illustTitle;
  /// Artwork description
  final String illustComment;
  /// Artwork type 
  /// 1: Single-image artwork
  /// 2:Multi-image-artwork
  /// 3:Animated artwork
  final int illustType;
  final int sl;
  final _Urls urls;
  final String alt;
  final String userAccount;
  final Map<String, PartialArtwork?> userIllusts;
  final int width;
  final int height;
  final int responseCount;
  final bool isHowto;
  final String? reuploadDate;
  final bool locationMask;
  Artwork({
    required this.illustId,
    required this.illustTitle,
    required this.illustComment,
    required this.illustType,
    required this.sl,
    required this.urls,
    required this.alt,
    required this.userAccount,
    required this.userIllusts,
    required this.width,
    required this.height,
    required this.responseCount,
    required this.isHowto,
    this.reuploadDate,
    required this.locationMask,
    required super.id,
    required super.title,
    required super.description,
    required super.createDate,
    required super.uploadDate,
    required super.restrict,
    required super.xRestrict,
    required super.tags,
    required super.userId,
    required super.userName,
    required super.likeData,
    required super.pageCount,
    required super.bookmarkCount,
    required super.likeCount,
    required super.commentCount,
    required super.viewCount,
    required super.isOriginal,
    required super.imageResponseOutData,
    required super.imageResponseData,
    required super.imageResponseCount,
    super.pollData,
    super.seriesNavData,
    super.descriptionBoothId,
    super.descriptionYoutubeId,
    super.comicPromotion,
    super.fanboxPromotion,
    required super.contestBanners,
    required super.isBookmarkable,
    super.bookmarkData,
    super.contestData,
    required super.extraData,
    required super.titleCaptionTranslation,
    required super.isUnlisted,
    super.request,
    required super.commentOff,
    required super.aiType,
  });
  @override
  factory Artwork.fromJson(Map<String, dynamic> json) {
    final parent = Work.fromJson(json);
    return Artwork(
    illustId: json['illustId'],
    illustTitle: json['illustTitle'],
    illustComment: json['illustComment'],
    illustType: json['illustType'],
    sl: json['sl'],
    urls: _Urls.fromJson(json['urls']),
    alt: json['alt'],
    userAccount: json['userAccount'],
    userIllusts: (json['userIllusts'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,v==null?null:PartialArtwork.fromJson(v))),
    width: json['width'],
    height: json['height'],
    responseCount: json['responseCount'],
    isHowto: json['isHowto'],
    reuploadDate: json['reuploadDate'],
    locationMask: json['locationMask'],
    id: parent.id,
    title: parent.title,
    description: parent.description,
    createDate: parent.createDate,
    uploadDate: parent.uploadDate,
    restrict: parent.restrict,
    xRestrict: parent.xRestrict,
    tags: parent.tags,
    userId: parent.userId,
    userName: parent.userName,
    likeData: parent.likeData,
    pageCount: parent.pageCount,
    bookmarkCount: parent.bookmarkCount,
    likeCount: parent.likeCount,
    commentCount: parent.commentCount,
    viewCount: parent.viewCount,
    isOriginal: parent.isOriginal,
    imageResponseOutData: parent.imageResponseOutData,
    imageResponseData: parent.imageResponseData,
    imageResponseCount: parent.imageResponseCount,
    pollData: parent.pollData,
    seriesNavData: parent.seriesNavData,
    descriptionBoothId: parent.descriptionBoothId,
    descriptionYoutubeId: parent.descriptionYoutubeId,
    comicPromotion: parent.comicPromotion,
    fanboxPromotion: parent.fanboxPromotion,
    contestBanners: parent.contestBanners,
    isBookmarkable: parent.isBookmarkable,
    bookmarkData: parent.bookmarkData,
    contestData: parent.contestData,
    extraData: parent.extraData,
    titleCaptionTranslation: parent.titleCaptionTranslation,
    isUnlisted: parent.isUnlisted,
    request: parent.request,
    commentOff: parent.commentOff,
    aiType: parent.aiType,
  );}

}

