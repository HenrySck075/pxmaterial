import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/shared/TagInfo.dart' show TagInfo;
import 'package:sofieru/json/ajax/novel/PartialNovel.dart' show PartialNovel;
import 'package:sofieru/json/ajax/shared/Work.dart' show Work;
class _SuggestedSettings {
  final int viewMode;
  final int themeBackground;
  final String? themeSize;
  final String? themeSpacing;
  _SuggestedSettings({
    required this.viewMode,
    required this.themeBackground,
    this.themeSize,
    this.themeSpacing,
  });
  factory _SuggestedSettings.fromJson(Map<String, dynamic> json) {
    return _SuggestedSettings(
    viewMode: json['viewMode'],
    themeBackground: json['themeBackground'],
    themeSize: json['themeSize'],
    themeSpacing: json['themeSpacing'],
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

class _Prev {
  final String id;
  final String title;
  final int order;
  _Prev({
    required this.id,
    required this.title,
    required this.order,
  });
  factory _Prev.fromJson(Map<String, dynamic> json) {
    return _Prev(
    id: json['id'],
    title: json['title'],
    order: json['order'],
  );}

}

class _SeriesNavData {
  final String seriesType;
  final String seriesId;
  final String title;
  final int order;
  final bool isWatched;
  final bool isNotifying;
  final _Prev prev;
  final String? next;
  _SeriesNavData({
    required this.seriesType,
    required this.seriesId,
    required this.title,
    required this.order,
    required this.isWatched,
    required this.isNotifying,
    required this.prev,
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
    prev: _Prev.fromJson(json['prev']),
    next: json['next'],
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

class Novel extends Work {
  final int markerCount;
  final bool isBungei;
  final String content;
  final String coverUrl;
  final _SuggestedSettings suggestedSettings;
  final String? marker;
  final Map<String, PartialNovel?> userNovels;
  final bool hasGlossary;
  final String language;
  final String? textEmbeddedImages;
  final int characterCount;
  final int wordCount;
  final bool useWordCount;
  final int readingTime;
  final String genre;
  Novel({
    required this.markerCount,
    required this.isBungei,
    required this.content,
    required this.coverUrl,
    required this.suggestedSettings,
    this.marker,
    required this.userNovels,
    required this.hasGlossary,
    required this.language,
    this.textEmbeddedImages,
    required this.characterCount,
    required this.wordCount,
    required this.useWordCount,
    required this.readingTime,
    required this.genre,
    required super.id,
    required super.title,
    required super.description,
    required super.bookStyle,
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
  factory Novel.fromJson(Map<String, dynamic> json) {
    final parent = Work.fromJson(json);
    return Novel(
    markerCount: json['markerCount'],
    isBungei: json['isBungei'],
    content: json['content'],
    coverUrl: json['coverUrl'],
    suggestedSettings: _SuggestedSettings.fromJson(json['suggestedSettings']),
    marker: json['marker'],
    userNovels: (json['userNovels'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,v==null?null:PartialNovel.fromJson(v))),
    hasGlossary: json['hasGlossary'],
    language: json['language'],
    textEmbeddedImages: json['textEmbeddedImages'],
    characterCount: json['characterCount'],
    wordCount: json['wordCount'],
    useWordCount: json['useWordCount'],
    readingTime: json['readingTime'],
    genre: json['genre'],
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

}

