
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

class PartialNovel {
  final String id;
  final String title;
  final int xRestrict;
  final int restrict;
  final String url;
  final List<String> tags;
  final String userId;
  final String userName;
  final String profileImageUrl;
  final int textCount;
  final int wordCount;
  final int readingTime;
  final bool useWordCount;
  final String description;
  final bool isBookmarkable;
  final String? bookmarkData;
  final int bookmarkCount;
  final bool isOriginal;
  final String? marker;
  final _TitleCaptionTranslation titleCaptionTranslation;
  final String createDate;
  final String updateDate;
  final bool isMasked;
  final bool isUnlisted;
  final int aiType;
  final String genre;
  PartialNovel({
    required this.id,
    required this.title,
    required this.xRestrict,
    required this.restrict,
    required this.url,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.profileImageUrl,
    required this.textCount,
    required this.wordCount,
    required this.readingTime,
    required this.useWordCount,
    required this.description,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.bookmarkCount,
    required this.isOriginal,
    this.marker,
    required this.titleCaptionTranslation,
    required this.createDate,
    required this.updateDate,
    required this.isMasked,
    required this.isUnlisted,
    required this.aiType,
    required this.genre,
  });
  factory PartialNovel.fromJson(Map<String, dynamic> json) => PartialNovel(
    id: json['id'] as String,
    title: json['title'] as String,
    xRestrict: json['xRestrict'] as int,
    restrict: json['restrict'] as int,
    url: json['url'] as String,
    tags: json['tags'],
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    profileImageUrl: json['profileImageUrl'] as String,
    textCount: json['textCount'] as int,
    wordCount: json['wordCount'] as int,
    readingTime: json['readingTime'] as int,
    useWordCount: json['useWordCount'] as bool,
    description: json['description'] as String,
    isBookmarkable: json['isBookmarkable'] as bool,
    bookmarkData: json['bookmarkData'] as String,
    bookmarkCount: json['bookmarkCount'] as int,
    isOriginal: json['isOriginal'] as bool,
    marker: json['marker'] as String,
    titleCaptionTranslation: json['titleCaptionTranslation'].map((k,v)=>MapEntry(k,_TitleCaptionTranslation.fromJson(v))),
    createDate: json['createDate'] as String,
    updateDate: json['updateDate'] as String,
    isMasked: json['isMasked'] as bool,
    isUnlisted: json['isUnlisted'] as bool,
    aiType: json['aiType'] as int,
    genre: json['genre'] as String,
  );
  
}
