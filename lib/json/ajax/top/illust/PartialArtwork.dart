
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

class PartialArtwork {
  final String id;
  final String title;
  final int illustType;
  final int xRestrict;
  final int restrict;
  final int sl;
  final String url;
  final String description;
  final List<String> tags;
  final String userId;
  final String userName;
  final int width;
  final int height;
  final int pageCount;
  final bool isBookmarkable;
  final String? bookmarkData;
  final String alt;
  final _TitleCaptionTranslation titleCaptionTranslation;
  final String createDate;
  final String updateDate;
  final bool isUnlisted;
  final bool isMasked;
  final int aiType;
  final Map<String, String> urls;
  final String profileImageUrl;
  PartialArtwork({
    required this.id,
    required this.title,
    required this.illustType,
    required this.xRestrict,
    required this.restrict,
    required this.sl,
    required this.url,
    required this.description,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.width,
    required this.height,
    required this.pageCount,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.alt,
    required this.titleCaptionTranslation,
    required this.createDate,
    required this.updateDate,
    required this.isUnlisted,
    required this.isMasked,
    required this.aiType,
    required this.urls,
    required this.profileImageUrl,
  });
  factory PartialArtwork.fromJson(Map<String, dynamic> json) => PartialArtwork(
    id: json['id'] as String,
    title: json['title'] as String,
    illustType: json['illustType'] as int,
    xRestrict: json['xRestrict'] as int,
    restrict: json['restrict'] as int,
    sl: json['sl'] as int,
    url: json['url'] as String,
    description: json['description'] as String,
    tags: json['tags'],
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    pageCount: json['pageCount'] as int,
    isBookmarkable: json['isBookmarkable'] as bool,
    bookmarkData: json['bookmarkData'] as String,
    alt: json['alt'] as String,
    titleCaptionTranslation: json['titleCaptionTranslation'].map((k,v)=>MapEntry(k,_TitleCaptionTranslation.fromJson(v))),
    createDate: json['createDate'] as String,
    updateDate: json['updateDate'] as String,
    isUnlisted: json['isUnlisted'] as bool,
    isMasked: json['isMasked'] as bool,
    aiType: json['aiType'] as int,
    urls: json['urls'].map((k,v)=>MapEntry(k,String.fromJson(v))),
    profileImageUrl: json['profileImageUrl'] as String,
  );
  
}
