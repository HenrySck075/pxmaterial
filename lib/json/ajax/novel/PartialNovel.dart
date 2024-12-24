extension type _TitleCaptionTranslation(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    dynamic get workTitle => json['workTitle'] as dynamic;
    dynamic get workCaption => json['workCaption'] as dynamic;

// ----------- SETTERS ----------- 
    set workTitle(dynamic value) => json["workTitle"] = value;
    set workCaption(dynamic value) => json["workCaption"] = value;

}

extension type PartialNovel(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get title => json['title'] as String;
    int get xRestrict => json['xRestrict'] as int;
    int get restrict => json['restrict'] as int;
    String get url => json['url'] as String;
    List<String> get tags => json['tags'] as List<String>;
    String get userId => json['userId'] as String;
    String get userName => json['userName'] as String;
    String get profileImageUrl => json['profileImageUrl'] as String;
    int get textCount => json['textCount'] as int;
    int get wordCount => json['wordCount'] as int;
    int get readingTime => json['readingTime'] as int;
    bool get useWordCount => json['useWordCount'] as bool;
    String get description => json['description'] as String;
    bool get isBookmarkable => json['isBookmarkable'] as bool;
    dynamic get bookmarkData => json['bookmarkData'] as dynamic;
    int get bookmarkCount => json['bookmarkCount'] as int;
    bool get isOriginal => json['isOriginal'] as bool;
    dynamic get marker => json['marker'] as dynamic;
    _TitleCaptionTranslation get titleCaptionTranslation => json['titleCaptionTranslation'] as _TitleCaptionTranslation;
    String get createDate => json['createDate'] as String;
    String get updateDate => json['updateDate'] as String;
    bool get isMasked => json['isMasked'] as bool;
    bool get isUnlisted => json['isUnlisted'] as bool;
    int get aiType => json['aiType'] as int;
    String get genre => json['genre'] as String;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set title(String value) => json["title"] = value;
    set xRestrict(int value) => json["xRestrict"] = value;
    set restrict(int value) => json["restrict"] = value;
    set url(String value) => json["url"] = value;
    set tags(List<String> value) => json["tags"] = value;
    set userId(String value) => json["userId"] = value;
    set userName(String value) => json["userName"] = value;
    set profileImageUrl(String value) => json["profileImageUrl"] = value;
    set textCount(int value) => json["textCount"] = value;
    set wordCount(int value) => json["wordCount"] = value;
    set readingTime(int value) => json["readingTime"] = value;
    set useWordCount(bool value) => json["useWordCount"] = value;
    set description(String value) => json["description"] = value;
    set isBookmarkable(bool value) => json["isBookmarkable"] = value;
    set bookmarkData(dynamic value) => json["bookmarkData"] = value;
    set bookmarkCount(int value) => json["bookmarkCount"] = value;
    set isOriginal(bool value) => json["isOriginal"] = value;
    set marker(dynamic value) => json["marker"] = value;
    set titleCaptionTranslation(_TitleCaptionTranslation value) => json["titleCaptionTranslation"] = value;
    set createDate(String value) => json["createDate"] = value;
    set updateDate(String value) => json["updateDate"] = value;
    set isMasked(bool value) => json["isMasked"] = value;
    set isUnlisted(bool value) => json["isUnlisted"] = value;
    set aiType(int value) => json["aiType"] = value;
    set genre(String value) => json["genre"] = value;

}

