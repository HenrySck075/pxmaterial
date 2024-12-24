extension type _FirstEpisode(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get url => json['url'] as String;

// ----------- SETTERS ----------- 
    set url(String value) => json["url"] = value;

}

extension type _Cover(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    Map<String, String> get urls => json['urls'] as Map<String, String>;

// ----------- SETTERS ----------- 
    set urls(Map<String, String> value) => json["urls"] = value;

}

extension type SEOEmbedMeta(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get type => json['type'] as String;
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String get image => json['image'] as String;

// ----------- SETTERS ----------- 
    set type(String value) => json["type"] = value;
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set image(String value) => json["image"] = value;

}

extension type TwitterEmbedMeta(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get card => json['card'] as String;
    String get site => json['site'] as String;
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String get image => json['image'] as String;

// ----------- SETTERS ----------- 
    set card(String value) => json["card"] = value;
    set site(String value) => json["site"] = value;
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set image(String value) => json["image"] = value;

}

extension type _Meta(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String get canonical => json['canonical'] as String;
    SEOEmbedMeta get ogp => json['ogp'] as SEOEmbedMeta;
    TwitterEmbedMeta get twitter => json['twitter'] as TwitterEmbedMeta;

// ----------- SETTERS ----------- 
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set canonical(String value) => json["canonical"] = value;
    set ogp(SEOEmbedMeta value) => json["ogp"] = value;
    set twitter(TwitterEmbedMeta value) => json["twitter"] = value;

}

extension type _ExtraData(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _Meta get meta => json['meta'] as _Meta;

// ----------- SETTERS ----------- 
    set meta(_Meta value) => json["meta"] = value;

}

extension type Series(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get userId => json['userId'] as String;
    String get userName => json['userName'] as String;
    String get profileImageUrl => json['profileImageUrl'] as String;
    int get xRestrict => json['xRestrict'] as int;
    bool get isOriginal => json['isOriginal'] as bool;
    bool get isConcluded => json['isConcluded'] as bool;
    String get genreId => json['genreId'] as String;
    String get title => json['title'] as String;
    String get caption => json['caption'] as String;
    String get language => json['language'] as String;
    List<dynamic> get tags => json['tags'] as List<dynamic>;
    int get publishedContentCount => json['publishedContentCount'] as int;
    int get publishedTotalCharacterCount => json['publishedTotalCharacterCount'] as int;
    int get publishedTotalWordCount => json['publishedTotalWordCount'] as int;
    int get publishedReadingTime => json['publishedReadingTime'] as int;
    bool get useWordCount => json['useWordCount'] as bool;
    int get lastPublishedContentTimestamp => json['lastPublishedContentTimestamp'] as int;
    int get createdTimestamp => json['createdTimestamp'] as int;
    int get updatedTimestamp => json['updatedTimestamp'] as int;
    String get createDate => json['createDate'] as String;
    String get updateDate => json['updateDate'] as String;
    String get firstNovelId => json['firstNovelId'] as String;
    String get latestNovelId => json['latestNovelId'] as String;
    int get displaySeriesContentCount => json['displaySeriesContentCount'] as int;
    String get shareText => json['shareText'] as String;
    int get total => json['total'] as int;
    _FirstEpisode get firstEpisode => json['firstEpisode'] as _FirstEpisode;
    dynamic get watchCount => json['watchCount'] as dynamic;
    dynamic get maxXRestrict => json['maxXRestrict'] as dynamic;
    _Cover get cover => json['cover'] as _Cover;
    dynamic get coverSettingData => json['coverSettingData'] as dynamic;
    bool get isWatched => json['isWatched'] as bool;
    bool get isNotifying => json['isNotifying'] as bool;
    int get aiType => json['aiType'] as int;
    bool get hasGlossary => json['hasGlossary'] as bool;
    _ExtraData get extraData => json['extraData'] as _ExtraData;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set userId(String value) => json["userId"] = value;
    set userName(String value) => json["userName"] = value;
    set profileImageUrl(String value) => json["profileImageUrl"] = value;
    set xRestrict(int value) => json["xRestrict"] = value;
    set isOriginal(bool value) => json["isOriginal"] = value;
    set isConcluded(bool value) => json["isConcluded"] = value;
    set genreId(String value) => json["genreId"] = value;
    set title(String value) => json["title"] = value;
    set caption(String value) => json["caption"] = value;
    set language(String value) => json["language"] = value;
    set tags(List<dynamic> value) => json["tags"] = value;
    set publishedContentCount(int value) => json["publishedContentCount"] = value;
    set publishedTotalCharacterCount(int value) => json["publishedTotalCharacterCount"] = value;
    set publishedTotalWordCount(int value) => json["publishedTotalWordCount"] = value;
    set publishedReadingTime(int value) => json["publishedReadingTime"] = value;
    set useWordCount(bool value) => json["useWordCount"] = value;
    set lastPublishedContentTimestamp(int value) => json["lastPublishedContentTimestamp"] = value;
    set createdTimestamp(int value) => json["createdTimestamp"] = value;
    set updatedTimestamp(int value) => json["updatedTimestamp"] = value;
    set createDate(String value) => json["createDate"] = value;
    set updateDate(String value) => json["updateDate"] = value;
    set firstNovelId(String value) => json["firstNovelId"] = value;
    set latestNovelId(String value) => json["latestNovelId"] = value;
    set displaySeriesContentCount(int value) => json["displaySeriesContentCount"] = value;
    set shareText(String value) => json["shareText"] = value;
    set total(int value) => json["total"] = value;
    set firstEpisode(_FirstEpisode value) => json["firstEpisode"] = value;
    set watchCount(dynamic value) => json["watchCount"] = value;
    set maxXRestrict(dynamic value) => json["maxXRestrict"] = value;
    set cover(_Cover value) => json["cover"] = value;
    set coverSettingData(dynamic value) => json["coverSettingData"] = value;
    set isWatched(bool value) => json["isWatched"] = value;
    set isNotifying(bool value) => json["isNotifying"] = value;
    set aiType(int value) => json["aiType"] = value;
    set hasGlossary(bool value) => json["hasGlossary"] = value;
    set extraData(_ExtraData value) => json["extraData"] = value;

}

