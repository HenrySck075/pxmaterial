class _FirstEpisode {
  final String url;
  _FirstEpisode({
    required this.url,
  });
  factory _FirstEpisode.fromJson(Map<String, dynamic> json) => _FirstEpisode(
    url: json['url'] as String,
  );
  
}

class _Cover {
  final Map<String, String> urls;
  _Cover({
    required this.urls,
  });
  factory _Cover.fromJson(Map<String, dynamic> json) => _Cover(
    urls: json['urls'].map((k,v)=>MapEntry(k,String.fromJson(v))),
  );
  
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
  factory SEOEmbedMeta.fromJson(Map<String, dynamic> json) => SEOEmbedMeta(
    type: json['type'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    image: json['image'] as String,
  );
  
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
  factory TwitterEmbedMeta.fromJson(Map<String, dynamic> json) => TwitterEmbedMeta(
    card: json['card'] as String,
    site: json['site'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    image: json['image'] as String,
  );
  
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
  factory _Meta.fromJson(Map<String, dynamic> json) => _Meta(
    title: json['title'] as String,
    description: json['description'] as String,
    canonical: json['canonical'] as String,
    ogp: SEOEmbedMeta.fromJson(json['ogp']),
    twitter: TwitterEmbedMeta.fromJson(json['twitter']),
  );
  
}

class _ExtraData {
  final _Meta meta;
  _ExtraData({
    required this.meta,
  });
  factory _ExtraData.fromJson(Map<String, dynamic> json) => _ExtraData(
    meta: _Meta.fromJson(json['meta']),
  );
  
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
  factory Series.fromJson(Map<String, dynamic> json) => Series(
    id: json['id'] as String,
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    profileImageUrl: json['profileImageUrl'] as String,
    xRestrict: json['xRestrict'] as int,
    isOriginal: json['isOriginal'] as bool,
    isConcluded: json['isConcluded'] as bool,
    genreId: json['genreId'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    language: json['language'] as String,
    tags: json['tags'],
    publishedContentCount: json['publishedContentCount'] as int,
    publishedTotalCharacterCount: json['publishedTotalCharacterCount'] as int,
    publishedTotalWordCount: json['publishedTotalWordCount'] as int,
    publishedReadingTime: json['publishedReadingTime'] as int,
    useWordCount: json['useWordCount'] as bool,
    lastPublishedContentTimestamp: json['lastPublishedContentTimestamp'] as int,
    createdTimestamp: json['createdTimestamp'] as int,
    updatedTimestamp: json['updatedTimestamp'] as int,
    createDate: json['createDate'] as String,
    updateDate: json['updateDate'] as String,
    firstNovelId: json['firstNovelId'] as String,
    latestNovelId: json['latestNovelId'] as String,
    displaySeriesContentCount: json['displaySeriesContentCount'] as int,
    shareText: json['shareText'] as String,
    total: json['total'] as int,
    firstEpisode: _FirstEpisode.fromJson(json['firstEpisode']),
    watchCount: json['watchCount'] as String,
    maxXRestrict: json['maxXRestrict'] as String,
    cover: _Cover.fromJson(json['cover']),
    coverSettingData: json['coverSettingData'] as String,
    isWatched: json['isWatched'] as bool,
    isNotifying: json['isNotifying'] as bool,
    aiType: json['aiType'] as int,
    hasGlossary: json['hasGlossary'] as bool,
    extraData: _ExtraData.fromJson(json['extraData']),
  );
  
}

