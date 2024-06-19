import 'package:sofieru/json/base.dart' show checkFalsy;
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart' show PartialArtwork;
import 'package:sofieru/json/ajax/shared/Work.dart' show Work;
import 'package:sofieru/shared.dart';
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
  factory _Urls.fromJson(Map<String, dynamic> json) {
    return _Urls(
    mini: json['mini'],
    thumb: json['thumb'],
    small: json['small'],
    regular: json['regular'],
    original: json['original'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "mini": mini,
    "thumb": thumb,
    "small": small,
    "regular": regular,
    "original": original,
  };
}

class Artwork extends Work {
  /// Artwork id
  final String illustId;
  /// Artwork title
  final String illustTitle;
  /// Artwork description
  final String illustComment;
  /// Artwork type 
  /// 1: Illustration
  /// 2: Manga
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
    required this.reuploadDate,
    required this.locationMask,
    required super.id,
    required super.title,
    required super.description,
    super.bookStyle,
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
    required super.pollData,
    super.seriesNavData,
    required super.descriptionBoothId,
    required super.descriptionYoutubeId,
    required super.comicPromotion,
    required super.fanboxPromotion,
    required super.contestBanners,
    required super.isBookmarkable,
    required super.bookmarkData,
    required super.contestData,
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
    bookStyle: parent.bookStyle,
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
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll(<String,dynamic>{
    "illustId": illustId,
    "illustTitle": illustTitle,
    "illustComment": illustComment,
    "illustType": illustType,
    "sl": sl,
    "urls": urls.toJson(),
    "alt": alt,
    "userAccount": userAccount,
    "userIllusts": userIllusts.map((k,v)=>MapEntry(k,v==null?null:v.toJson())),
    "width": width,
    "height": height,
    "responseCount": responseCount,
    "isHowto": isHowto,
    "reuploadDate": reuploadDate,
    "locationMask": locationMask,
    "id": id,
    "title": title,
    "description": description,
    "bookStyle": bookStyle,
    "createDate": createDate,
    "uploadDate": uploadDate,
    "restrict": restrict,
    "xRestrict": xRestrict,
    "tags": tags,
    "userId": userId,
    "userName": userName,
    "likeData": likeData,
    "pageCount": pageCount,
    "bookmarkCount": bookmarkCount,
    "likeCount": likeCount,
    "commentCount": commentCount,
    "viewCount": viewCount,
    "isOriginal": isOriginal,
    "imageResponseOutData": imageResponseOutData,
    "imageResponseData": imageResponseData,
    "imageResponseCount": imageResponseCount,
    "pollData": pollData,
    "seriesNavData": seriesNavData,
    "descriptionBoothId": descriptionBoothId,
    "descriptionYoutubeId": descriptionYoutubeId,
    "comicPromotion": comicPromotion,
    "fanboxPromotion": fanboxPromotion,
    "contestBanners": contestBanners,
    "isBookmarkable": isBookmarkable,
    "bookmarkData": bookmarkData,
    "contestData": contestData,
    "extraData": extraData,
    "titleCaptionTranslation": titleCaptionTranslation,
    "isUnlisted": isUnlisted,
    "request": request,
    "commentOff": commentOff,
    "aiType": aiType,
  });
}

