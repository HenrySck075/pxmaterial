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
  final Map<String, String>? urls;
  final String? profileImageUrl;
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
    this.urls,
    this.profileImageUrl,
  });
  factory PartialArtwork.fromJson(Map<String, dynamic> json) {
    return PartialArtwork(
    id: json['id'],
    title: json['title'],
    illustType: json['illustType'],
    xRestrict: json['xRestrict'],
    restrict: json['restrict'],
    sl: json['sl'],
    url: json['url'],
    description: json['description'],
    tags: (json['tags'] as List<dynamic>).map((e)=>e as String).toList(),
    userId: json['userId'],
    userName: json['userName'],
    width: json['width'],
    height: json['height'],
    pageCount: json['pageCount'],
    isBookmarkable: json['isBookmarkable'],
    bookmarkData: json['bookmarkData'],
    alt: json['alt'],
    titleCaptionTranslation: _TitleCaptionTranslation.fromJson(json['titleCaptionTranslation']),
    createDate: json['createDate'],
    updateDate: json['updateDate'],
    isUnlisted: json['isUnlisted'],
    isMasked: json['isMasked'],
    aiType: json['aiType'],
    urls: json['urls'] == null?null:(json['urls'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,v as String)),
    profileImageUrl: json['profileImageUrl'] == null?null:json['profileImageUrl'],
  );}

}

