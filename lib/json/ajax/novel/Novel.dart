import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/top/novel/PartialNovel.dart' show PartialNovel;
import 'package:sofieru/json/ajax/shared/Placeholder.dart' show Placeholder;

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
    viewMode: json['viewMode'] as int,
    themeBackground: json['themeBackground'] as int,
    themeSize: json['themeSize'] as String,
    themeSpacing: json['themeSpacing'] as String,
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
    tag: json['tag'] as String,
    locked: json['locked'] as bool,
    deletable: json['deletable'] as bool,
    userId: json['userId'] as String,
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
  final Placeholder? seriesNavData;
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
    bookmarkCount: json['bookmarkCount'] as int,
    commentCount: json['commentCount'] as int,
    markerCount: json['markerCount'] as int,
    createDate: json['createDate'] as String,
    uploadDate: json['uploadDate'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
    title: json['title'] as String,
    likeCount: json['likeCount'] as int,
    pageCount: json['pageCount'] as int,
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    viewCount: json['viewCount'] as int,
    isOriginal: json['isOriginal'] as bool,
    isBungei: json['isBungei'] as bool,
    xRestrict: json['xRestrict'] as int,
    restrict: json['restrict'] as int,
    content: json['content'] as String,
    coverUrl: json['coverUrl'] as String,
    suggestedSettings: _SuggestedSettings.fromJson(json['suggestedSettings']),
    isBookmarkable: json['isBookmarkable'] as bool,
    bookmarkData: json['bookmarkData'] as String,
    likeData: json['likeData'] as bool,
    pollData: json['pollData'] as String,
    marker: json['marker'] as String,
    tags: _Tags.fromJson(json['tags']),
    seriesNavData: Placeholder.fromJson(json['seriesNavData']),
    descriptionBoothId: json['descriptionBoothId'] as String,
    descriptionYoutubeId: json['descriptionYoutubeId'] as String,
    comicPromotion: json['comicPromotion'] as String,
    fanboxPromotion: json['fanboxPromotion'] as String,
    contestBanners: json['contestBanners'],
    contestData: json['contestData'] as String,
    request: json['request'] as String,
    imageResponseOutData: json['imageResponseOutData'],
    imageResponseData: json['imageResponseData'],
    imageResponseCount: json['imageResponseCount'] as int,
    userNovels: json['userNovels'].map((k,v)=>MapEntry(k,PartialNovel.fromJson(v))),
    hasGlossary: json['hasGlossary'] as bool,
    extraData: ExtraData.fromJson(json['extraData']),
    titleCaptionTranslation: _TitleCaptionTranslation.fromJson(json['titleCaptionTranslation']),
    isUnlisted: json['isUnlisted'] as bool,
    language: json['language'] as String,
    textEmbeddedImages: json['textEmbeddedImages'] as String,
    commentOff: json['commentOff'] as int,
    characterCount: json['characterCount'] as int,
    wordCount: json['wordCount'] as int,
    useWordCount: json['useWordCount'] as bool,
    readingTime: json['readingTime'] as int,
    aiType: json['aiType'] as int,
    genre: json['genre'] as String,
  );
  
}
