import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/top/novel/PartialNovel.dart' show PartialNovel;
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
  factory _SuggestedSettings.fromJson(Map<String, dynamic> json) => _SuggestedSettings(
    viewMode: json['viewMode'],
    themeBackground: json['themeBackground'],
    themeSize: json['themeSize'],
    themeSpacing: json['themeSpacing'],
  );
  
}

class TagInfo {
  final String tag;
  final bool locked;
  final bool deletable;
  final String userId;
  final String userName;
  TagInfo({
    required this.tag,
    required this.locked,
    required this.deletable,
    required this.userId,
    required this.userName,
  });
  factory TagInfo.fromJson(Map<String, dynamic> json) => TagInfo(
    tag: json['tag'],
    locked: json['locked'],
    deletable: json['deletable'],
    userId: json['userId'],
    userName: json['userName'],
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
    tags: json['tags'].map((e)=>TagInfo.fromJson(e)).toList(),
    writable: json['writable'],
  );
  
}

class _Next {
  final String title;
  final int order;
  final String id;
  final bool available;
  _Next({
    required this.title,
    required this.order,
    required this.id,
    required this.available,
  });
  factory _Next.fromJson(Map<String, dynamic> json) => _Next(
    title: json['title'],
    order: json['order'],
    id: json['id'],
    available: json['available'],
  );
  
}

class _SeriesNavData {
  final String seriesType;
  final int seriesId;
  final String title;
  final bool isConcluded;
  final bool isReplaceable;
  final bool isWatched;
  final bool isNotifying;
  final int order;
  final _Next next;
  final String? prev;
  _SeriesNavData({
    required this.seriesType,
    required this.seriesId,
    required this.title,
    required this.isConcluded,
    required this.isReplaceable,
    required this.isWatched,
    required this.isNotifying,
    required this.order,
    required this.next,
    this.prev,
  });
  factory _SeriesNavData.fromJson(Map<String, dynamic> json) => _SeriesNavData(
    seriesType: json['seriesType'],
    seriesId: json['seriesId'],
    title: json['title'],
    isConcluded: json['isConcluded'],
    isReplaceable: json['isReplaceable'],
    isWatched: json['isWatched'],
    isNotifying: json['isNotifying'],
    order: json['order'],
    next: _Next.fromJson(json['next']),
    prev: json['prev'],
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

class Novel {
  final int bookmarkCount;
  final int commentCount;
  final int markerCount;
  final String createDate;
  final String uploadDate;
  final String description;
  final String id;
  final String title;
  final int likeCount;
  final int pageCount;
  final String userId;
  final String userName;
  final int viewCount;
  final bool isOriginal;
  final bool isBungei;
  final int xRestrict;
  final int restrict;
  final String content;
  final String coverUrl;
  final _SuggestedSettings suggestedSettings;
  final bool isBookmarkable;
  final String? bookmarkData;
  final bool likeData;
  final String? pollData;
  final String? marker;
  final _Tags tags;
  final _SeriesNavData? seriesNavData;
  final String? descriptionBoothId;
  final String? descriptionYoutubeId;
  final String? comicPromotion;
  final String? fanboxPromotion;
  final List<dynamic> contestBanners;
  final String? contestData;
  final String? request;
  final List<dynamic> imageResponseOutData;
  final List<dynamic> imageResponseData;
  final int imageResponseCount;
  final Map<String, PartialNovel> userNovels;
  final bool hasGlossary;
  final ExtraData extraData;
  final _TitleCaptionTranslation titleCaptionTranslation;
  final bool isUnlisted;
  final String language;
  final String? textEmbeddedImages;
  final int commentOff;
  final int characterCount;
  final int wordCount;
  final bool useWordCount;
  final int readingTime;
  final int aiType;
  final String genre;
  Novel({
    required this.bookmarkCount,
    required this.commentCount,
    required this.markerCount,
    required this.createDate,
    required this.uploadDate,
    required this.description,
    required this.id,
    required this.title,
    required this.likeCount,
    required this.pageCount,
    required this.userId,
    required this.userName,
    required this.viewCount,
    required this.isOriginal,
    required this.isBungei,
    required this.xRestrict,
    required this.restrict,
    required this.content,
    required this.coverUrl,
    required this.suggestedSettings,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.likeData,
    this.pollData,
    this.marker,
    required this.tags,
    this.seriesNavData,
    this.descriptionBoothId,
    this.descriptionYoutubeId,
    this.comicPromotion,
    this.fanboxPromotion,
    required this.contestBanners,
    this.contestData,
    this.request,
    required this.imageResponseOutData,
    required this.imageResponseData,
    required this.imageResponseCount,
    required this.userNovels,
    required this.hasGlossary,
    required this.extraData,
    required this.titleCaptionTranslation,
    required this.isUnlisted,
    required this.language,
    this.textEmbeddedImages,
    required this.commentOff,
    required this.characterCount,
    required this.wordCount,
    required this.useWordCount,
    required this.readingTime,
    required this.aiType,
    required this.genre,
  });
  factory Novel.fromJson(Map<String, dynamic> json) => Novel(
    bookmarkCount: json['bookmarkCount'],
    commentCount: json['commentCount'],
    markerCount: json['markerCount'],
    createDate: json['createDate'],
    uploadDate: json['uploadDate'],
    description: json['description'],
    id: json['id'],
    title: json['title'],
    likeCount: json['likeCount'],
    pageCount: json['pageCount'],
    userId: json['userId'],
    userName: json['userName'],
    viewCount: json['viewCount'],
    isOriginal: json['isOriginal'],
    isBungei: json['isBungei'],
    xRestrict: json['xRestrict'],
    restrict: json['restrict'],
    content: json['content'],
    coverUrl: json['coverUrl'],
    suggestedSettings: _SuggestedSettings.fromJson(json['suggestedSettings']),
    isBookmarkable: json['isBookmarkable'],
    bookmarkData: json['bookmarkData'],
    likeData: json['likeData'],
    pollData: json['pollData'],
    marker: json['marker'],
    tags: _Tags.fromJson(json['tags']),
    seriesNavData: _SeriesNavData.fromJson(json['seriesNavData']),
    descriptionBoothId: json['descriptionBoothId'],
    descriptionYoutubeId: json['descriptionYoutubeId'],
    comicPromotion: json['comicPromotion'],
    fanboxPromotion: json['fanboxPromotion'],
    contestBanners: json['contestBanners'],
    contestData: json['contestData'],
    request: json['request'],
    imageResponseOutData: json['imageResponseOutData'],
    imageResponseData: json['imageResponseData'],
    imageResponseCount: json['imageResponseCount'],
    userNovels: json['userNovels'].map((k,v)=>MapEntry(k as String,PartialNovel.fromJson(v))),
    hasGlossary: json['hasGlossary'],
    extraData: ExtraData.fromJson(json['extraData']),
    titleCaptionTranslation: _TitleCaptionTranslation.fromJson(json['titleCaptionTranslation']),
    isUnlisted: json['isUnlisted'],
    language: json['language'],
    textEmbeddedImages: json['textEmbeddedImages'],
    commentOff: json['commentOff'],
    characterCount: json['characterCount'],
    wordCount: json['wordCount'],
    useWordCount: json['useWordCount'],
    readingTime: json['readingTime'],
    aiType: json['aiType'],
    genre: json['genre'],
  );
  
}

