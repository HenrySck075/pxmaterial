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
    required this.themeSize,
    required this.themeSpacing,
  });
  factory _SuggestedSettings.fromJson(Map<String, dynamic> json) {
    return _SuggestedSettings(
    viewMode: json['viewMode'],
    themeBackground: json['themeBackground'],
    themeSize: json['themeSize'],
    themeSpacing: json['themeSpacing'],
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
    required this.marker,
    required this.userNovels,
    required this.hasGlossary,
    required this.language,
    required this.textEmbeddedImages,
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

