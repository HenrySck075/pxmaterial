class _FirstEpisode {
  final String url;
  _FirstEpisode({
    required this.url,
  });
  factory _FirstEpisode.fromJson(Map<String, dynamic> json) {
    return _FirstEpisode(
    url: json['url'],
  );}

}

class _Cover {
  final Map<String, String> urls;
  _Cover({
    required this.urls,
  });
  factory _Cover.fromJson(Map<String, dynamic> json) {
    return _Cover(
    urls: (json['urls'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,v as String)),
  );}

}

class SEOEmbedMeta {
  final String type;
  final String title;
  final String description;
  final String image;
  SEOEmbedMeta({
    required this.type,
    required this.title,
    required this.description,
    required this.image,
  });
  factory SEOEmbedMeta.fromJson(Map<String, dynamic> json) {
    return SEOEmbedMeta(
    type: json['type'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
  );}

}

class TwitterEmbedMeta {
  final String card;
  final String site;
  final String title;
  final String description;
  final String image;
  TwitterEmbedMeta({
    required this.card,
    required this.site,
    required this.title,
    required this.description,
    required this.image,
  });
  factory TwitterEmbedMeta.fromJson(Map<String, dynamic> json) {
    return TwitterEmbedMeta(
    card: json['card'],
    site: json['site'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
  );}

}

class _Meta {
  final String title;
  final String description;
  final String canonical;
  final SEOEmbedMeta ogp;
  final TwitterEmbedMeta twitter;
  _Meta({
    required this.title,
    required this.description,
    required this.canonical,
    required this.ogp,
    required this.twitter,
  });
  factory _Meta.fromJson(Map<String, dynamic> json) {
    return _Meta(
    title: json['title'],
    description: json['description'],
    canonical: json['canonical'],
    ogp: SEOEmbedMeta.fromJson(json['ogp']),
    twitter: TwitterEmbedMeta.fromJson(json['twitter']),
  );}

}

class _ExtraData {
  final _Meta meta;
  _ExtraData({
    required this.meta,
  });
  factory _ExtraData.fromJson(Map<String, dynamic> json) {
    return _ExtraData(
    meta: _Meta.fromJson(json['meta']),
  );}

}

class Series {
  final String id;
  final String userId;
  final String userName;
  final String profileImageUrl;
  final int xRestrict;
  final bool isOriginal;
  final bool isConcluded;
  final String genreId;
  final String title;
  final String caption;
  final String language;
  final List<dynamic> tags;
  final int publishedContentCount;
  final int publishedTotalCharacterCount;
  final int publishedTotalWordCount;
  final int publishedReadingTime;
  final bool useWordCount;
  final int lastPublishedContentTimestamp;
  final int createdTimestamp;
  final int updatedTimestamp;
  final String createDate;
  final String updateDate;
  final String firstNovelId;
  final String latestNovelId;
  final int displaySeriesContentCount;
  final String shareText;
  final int total;
  final _FirstEpisode firstEpisode;
  final String? watchCount;
  final String? maxXRestrict;
  final _Cover cover;
  final String? coverSettingData;
  final bool isWatched;
  final bool isNotifying;
  final int aiType;
  final bool hasGlossary;
  final _ExtraData extraData;
  Series({
    required this.id,
    required this.userId,
    required this.userName,
    required this.profileImageUrl,
    required this.xRestrict,
    required this.isOriginal,
    required this.isConcluded,
    required this.genreId,
    required this.title,
    required this.caption,
    required this.language,
    required this.tags,
    required this.publishedContentCount,
    required this.publishedTotalCharacterCount,
    required this.publishedTotalWordCount,
    required this.publishedReadingTime,
    required this.useWordCount,
    required this.lastPublishedContentTimestamp,
    required this.createdTimestamp,
    required this.updatedTimestamp,
    required this.createDate,
    required this.updateDate,
    required this.firstNovelId,
    required this.latestNovelId,
    required this.displaySeriesContentCount,
    required this.shareText,
    required this.total,
    required this.firstEpisode,
    this.watchCount,
    this.maxXRestrict,
    required this.cover,
    this.coverSettingData,
    required this.isWatched,
    required this.isNotifying,
    required this.aiType,
    required this.hasGlossary,
    required this.extraData,
  });
  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
    id: json['id'],
    userId: json['userId'],
    userName: json['userName'],
    profileImageUrl: json['profileImageUrl'],
    xRestrict: json['xRestrict'],
    isOriginal: json['isOriginal'],
    isConcluded: json['isConcluded'],
    genreId: json['genreId'],
    title: json['title'],
    caption: json['caption'],
    language: json['language'],
    tags: (json['tags'] as List<dynamic>),
    publishedContentCount: json['publishedContentCount'],
    publishedTotalCharacterCount: json['publishedTotalCharacterCount'],
    publishedTotalWordCount: json['publishedTotalWordCount'],
    publishedReadingTime: json['publishedReadingTime'],
    useWordCount: json['useWordCount'],
    lastPublishedContentTimestamp: json['lastPublishedContentTimestamp'],
    createdTimestamp: json['createdTimestamp'],
    updatedTimestamp: json['updatedTimestamp'],
    createDate: json['createDate'],
    updateDate: json['updateDate'],
    firstNovelId: json['firstNovelId'],
    latestNovelId: json['latestNovelId'],
    displaySeriesContentCount: json['displaySeriesContentCount'],
    shareText: json['shareText'],
    total: json['total'],
    firstEpisode: _FirstEpisode.fromJson(json['firstEpisode']),
    watchCount: json['watchCount'],
    maxXRestrict: json['maxXRestrict'],
    cover: _Cover.fromJson(json['cover']),
    coverSettingData: json['coverSettingData'],
    isWatched: json['isWatched'],
    isNotifying: json['isNotifying'],
    aiType: json['aiType'],
    hasGlossary: json['hasGlossary'],
    extraData: _ExtraData.fromJson(json['extraData']),
  );}

}

