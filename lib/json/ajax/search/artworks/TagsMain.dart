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

class _Data {
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
  final String profileImageUrl;
  _Data({
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
    required this.profileImageUrl,
  });
  factory _Data.fromJson(Map<String, dynamic> json) => _Data(
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
    profileImageUrl: json['profileImageUrl'],
  );
  
}

class _BookmarkRanges {
  final String? min;
  final String? max;
  _BookmarkRanges({
    this.min,
    this.max,
  });
  factory _BookmarkRanges.fromJson(Map<String, dynamic> json) => _BookmarkRanges(
    min: json['min'],
    max: json['max'],
  );
  
}

class _IllustManga {
  final List<_Data> data;
  final int total;
  final int lastPage;
  final List<_BookmarkRanges> bookmarkRanges;
  _IllustManga({
    required this.data,
    required this.total,
    required this.lastPage,
    required this.bookmarkRanges,
  });
  factory _IllustManga.fromJson(Map<String, dynamic> json) => _IllustManga(
    data: (json['data'] as List<dynamic>).map((e)=>_Data.fromJson(e)).toList(),
    total: json['total'],
    lastPage: json['lastPage'],
    bookmarkRanges: (json['bookmarkRanges'] as List<dynamic>).map((e)=>_BookmarkRanges.fromJson(e)).toList(),
  );
  
}

class _Popular {
  final List<dynamic> recent;
  final List<dynamic> permanent;
  _Popular({
    required this.recent,
    required this.permanent,
  });
  factory _Popular.fromJson(Map<String, dynamic> json) => _Popular(
    recent: (json['recent'] as List<dynamic>),
    permanent: (json['permanent'] as List<dynamic>),
  );
  
}

class _お誕生日おめでとうございます {
  final String en;
  _お誕生日おめでとうございます({
    required this.en,
  });
  factory _お誕生日おめでとうございます.fromJson(Map<String, dynamic> json) => _お誕生日おめでとうございます(
    en: json['en'],
  );
  
}

class _貧乳キャラクター {
  final String en;
  _貧乳キャラクター({
    required this.en,
  });
  factory _貧乳キャラクター.fromJson(Map<String, dynamic> json) => _貧乳キャラクター(
    en: json['en'],
  );
  
}

class _日高里菜 {
  final String en;
  _日高里菜({
    required this.en,
  });
  factory _日高里菜.fromJson(Map<String, dynamic> json) => _日高里菜(
    en: json['en'],
  );
  
}

class _アクセル・ワールド {
  final String en;
  _アクセル・ワールド({
    required this.en,
  });
  factory _アクセル・ワールド.fromJson(Map<String, dynamic> json) => _アクセル・ワールド(
    en: json['en'],
  );
  
}

class _クローム髑髏 {
  final String en;
  _クローム髑髏({
    required this.en,
  });
  factory _クローム髑髏.fromJson(Map<String, dynamic> json) => _クローム髑髏(
    en: json['en'],
  );
  
}

class _遊戯王GX {
  final String en;
  _遊戯王GX({
    required this.en,
  });
  factory _遊戯王GX.fromJson(Map<String, dynamic> json) => _遊戯王GX(
    en: json['en'],
  );
  
}

class _風船 {
  final String en;
  _風船({
    required this.en,
  });
  factory _風船.fromJson(Map<String, dynamic> json) => _風船(
    en: json['en'],
  );
  
}

class _ピース {
  final String en;
  _ピース({
    required this.en,
  });
  factory _ピース.fromJson(Map<String, dynamic> json) => _ピース(
    en: json['en'],
  );
  
}

class _包帯 {
  final String en;
  _包帯({
    required this.en,
  });
  factory _包帯.fromJson(Map<String, dynamic> json) => _包帯(
    en: json['en'],
  );
  
}

class _TagTranslationContent {
  final String en;
  _TagTranslationContent({
    required this.en,
  });
  factory _TagTranslationContent.fromJson(Map<String, dynamic> json) => _TagTranslationContent(
    en: json['en'],
  );
  
}

class _AlternateLanguages {
  final String ja;
  final String en;
  _AlternateLanguages({
    required this.ja,
    required this.en,
  });
  factory _AlternateLanguages.fromJson(Map<String, dynamic> json) => _AlternateLanguages(
    ja: json['ja'],
    en: json['en'],
  );
  
}

class _Meta {
  final String title;
  final String description;
  final String canonical;
  final _AlternateLanguages alternateLanguages;
  final String descriptionHeader;
  _Meta({
    required this.title,
    required this.description,
    required this.canonical,
    required this.alternateLanguages,
    required this.descriptionHeader,
  });
  factory _Meta.fromJson(Map<String, dynamic> json) => _Meta(
    title: json['title'],
    description: json['description'],
    canonical: json['canonical'],
    alternateLanguages: _AlternateLanguages.fromJson(json['alternateLanguages']),
    descriptionHeader: json['descriptionHeader'],
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

class TagsMain {
  final _IllustManga illustManga;
  final _Popular popular;
  final List<String> relatedTags;
  final Map<String, _TagTranslationContent> tagTranslation;
  final _ExtraData extraData;
  TagsMain({
    required this.illustManga,
    required this.popular,
    required this.relatedTags,
    required this.tagTranslation,
    required this.extraData,
  });
  factory TagsMain.fromJson(Map<String, dynamic> json) => TagsMain(
    illustManga: _IllustManga.fromJson(json['illustManga']),
    popular: _Popular.fromJson(json['popular']),
    relatedTags: (json['relatedTags'] as List<dynamic>).map((e)=>e as String).toList(),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,_TagTranslationContent.fromJson(v))),
    extraData: _ExtraData.fromJson(json['extraData']),
  );
  
}

