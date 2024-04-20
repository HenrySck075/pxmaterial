import 'package:sofieru/json/base.dart' show checkFalsy;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/shared/TagInfo.dart' show TagInfo;
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
  Map<String, dynamic> toJson() => <String,dynamic>{
    "authorId": authorId,
    "isLocked": isLocked,
    "tags": tags.map((e)=>e.toJson()).toList(),
    "writable": writable,
  };
}

class _SeriesNavInfo {
  final String id;
  final String title;
  final int order;
  _SeriesNavInfo({
    required this.id,
    required this.title,
    required this.order,
  });
  factory _SeriesNavInfo.fromJson(Map<String, dynamic> json) {
    return _SeriesNavInfo(
    id: json['id'],
    title: json['title'],
    order: json['order'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "id": id,
    "title": title,
    "order": order,
  };
}

class _SeriesNavData {
  final String seriesType;
  final String seriesId;
  final String title;
  final int order;
  final bool isWatched;
  final bool isNotifying;
  final _SeriesNavInfo? prev;
  final _SeriesNavInfo? next;
  _SeriesNavData({
    required this.seriesType,
    required this.seriesId,
    required this.title,
    required this.order,
    required this.isWatched,
    required this.isNotifying,
    this.prev,
    this.next,
  });
  factory _SeriesNavData.fromJson(Map<String, dynamic> json) {
    return _SeriesNavData(
    seriesType: json['seriesType'],
    seriesId: json['seriesId'],
    title: json['title'],
    order: json['order'],
    isWatched: json['isWatched'],
    isNotifying: json['isNotifying'],
    prev: json['prev'] == null?null:_SeriesNavInfo.fromJson(json['prev']),
    next: json['next'] == null?null:_SeriesNavInfo.fromJson(json['next']),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "seriesType": seriesType,
    "seriesId": seriesId,
    "title": title,
    "order": order,
    "isWatched": isWatched,
    "isNotifying": isNotifying,
    "prev": prev?.toJson(),
    "next": next?.toJson(),
  };
}

class _TitleCaptionTranslation {
  final String? workTitle;
  final String? workCaption;
  _TitleCaptionTranslation({
    required this.workTitle,
    required this.workCaption,
  });
  factory _TitleCaptionTranslation.fromJson(Map<String, dynamic> json) {
    return _TitleCaptionTranslation(
    workTitle: json['workTitle'],
    workCaption: json['workCaption'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "workTitle": workTitle,
    "workCaption": workCaption,
  };
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
  Map<String, dynamic> toJson() => <String,dynamic>{
    "userId": userId,
    "userName": userName,
    "profileImg": profileImg,
  };
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
  Map<String, dynamic> toJson() => <String,dynamic>{
    "collaborating": collaborating,
    "collaborateAnonymousFlg": collaborateAnonymousFlg,
    "collaboratedCnt": collaboratedCnt,
    "userSamples": userSamples,
  };
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
  Map<String, dynamic> toJson() => <String,dynamic>{
    "request": request.toJson(),
    "creator": creator.toJson(),
    "fan": fan.toJson(),
    "collaborateStatus": collaborateStatus.toJson(),
    "editable": editable,
  };
}

class Work {
  final String id;
  final String title;
  final String description;
  /// Denotes how the user advances a page in the manga work.
  /// Values are "0" for vertical and "1" for rtl (known values)
  /// also its 0 (a falsy value) if its an artwork for some fucking reason
  final String? bookStyle;
  final String createDate;
  final String uploadDate;
  /// Sub-prop for `xRestrict`. 0 is just p, 1 is violent stuff included
  final int restrict;
  /// Whether the work is marked as R-18
  final int xRestrict;
  final _Tags tags;
  final String userId;
  final String userName;
  final bool likeData;
  final int pageCount;
  final int bookmarkCount;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final bool isOriginal;
  final List<dynamic> imageResponseOutData;
  final List<dynamic> imageResponseData;
  final int imageResponseCount;
  final String? pollData;
  final _SeriesNavData? seriesNavData;
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
  final _Request? request;
  final int commentOff;
  final int aiType;
  Work({
    required this.id,
    required this.title,
    required this.description,
    this.bookStyle,
    required this.createDate,
    required this.uploadDate,
    required this.restrict,
    required this.xRestrict,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.likeData,
    required this.pageCount,
    required this.bookmarkCount,
    required this.likeCount,
    required this.commentCount,
    required this.viewCount,
    required this.isOriginal,
    required this.imageResponseOutData,
    required this.imageResponseData,
    required this.imageResponseCount,
    required this.pollData,
    this.seriesNavData,
    required this.descriptionBoothId,
    required this.descriptionYoutubeId,
    required this.comicPromotion,
    required this.fanboxPromotion,
    required this.contestBanners,
    required this.isBookmarkable,
    required this.bookmarkData,
    required this.contestData,
    required this.extraData,
    required this.titleCaptionTranslation,
    required this.isUnlisted,
    this.request,
    required this.commentOff,
    required this.aiType,
  });
  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    bookStyle: checkFalsy(json['bookStyle'])?null:json['bookStyle'] as String,
    createDate: json['createDate'],
    uploadDate: json['uploadDate'],
    restrict: json['restrict'],
    xRestrict: json['xRestrict'],
    tags: _Tags.fromJson(json['tags']),
    userId: json['userId'],
    userName: json['userName'],
    likeData: json['likeData'],
    pageCount: json['pageCount'],
    bookmarkCount: json['bookmarkCount'],
    likeCount: json['likeCount'],
    commentCount: json['commentCount'],
    viewCount: json['viewCount'],
    isOriginal: json['isOriginal'],
    imageResponseOutData: (json['imageResponseOutData'] as List<dynamic>),
    imageResponseData: (json['imageResponseData'] as List<dynamic>),
    imageResponseCount: json['imageResponseCount'],
    pollData: json['pollData'],
    seriesNavData: json['seriesNavData'] == null?null:_SeriesNavData.fromJson(json['seriesNavData']),
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
    request: json['request'] == null?null:_Request.fromJson(json['request']),
    commentOff: json['commentOff'],
    aiType: json['aiType'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "id": id,
    "title": title,
    "description": description,
    "bookStyle": bookStyle,
    "createDate": createDate,
    "uploadDate": uploadDate,
    "restrict": restrict,
    "xRestrict": xRestrict,
    "tags": tags.toJson(),
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
    "seriesNavData": seriesNavData?.toJson(),
    "descriptionBoothId": descriptionBoothId,
    "descriptionYoutubeId": descriptionYoutubeId,
    "comicPromotion": comicPromotion,
    "fanboxPromotion": fanboxPromotion,
    "contestBanners": contestBanners,
    "isBookmarkable": isBookmarkable,
    "bookmarkData": bookmarkData,
    "contestData": contestData,
    "extraData": extraData.toJson(),
    "titleCaptionTranslation": titleCaptionTranslation.toJson(),
    "isUnlisted": isUnlisted,
    "request": request?.toJson(),
    "commentOff": commentOff,
    "aiType": aiType,
  };
}

