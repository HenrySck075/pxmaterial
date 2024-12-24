extension type _TitleCaptionTranslation(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    dynamic get workTitle => json['workTitle'] as dynamic;
    dynamic get workCaption => json['workCaption'] as dynamic;

// ----------- SETTERS ----------- 
    set workTitle(dynamic value) => json["workTitle"] = value;
    set workCaption(dynamic value) => json["workCaption"] = value;

}

extension type PartialArtwork(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get title => json['title'] as String;
    int get illustType => json['illustType'] as int;
    int get xRestrict => json['xRestrict'] as int;
    int get restrict => json['restrict'] as int;
    int get sl => json['sl'] as int;
    String get url => json['url'] as String;
    String get description => json['description'] as String;
    List<String> get tags => json['tags'] as List<String>;
    String get userId => json['userId'] as String;
    String get userName => json['userName'] as String;
    int get width => json['width'] as int;
    int get height => json['height'] as int;
    int get pageCount => json['pageCount'] as int;
    bool get isBookmarkable => json['isBookmarkable'] as bool;
    dynamic get bookmarkData => json['bookmarkData'] as dynamic;
    String get alt => json['alt'] as String;
    _TitleCaptionTranslation get titleCaptionTranslation => json['titleCaptionTranslation'] as _TitleCaptionTranslation;
    String get createDate => json['createDate'] as String;
    String get updateDate => json['updateDate'] as String;
    bool get isUnlisted => json['isUnlisted'] as bool;
    bool get isMasked => json['isMasked'] as bool;
    int get aiType => json['aiType'] as int;
    Map<String, String>? get urls => json['urls'];
    String? get profileImageUrl => json['profileImageUrl'];

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set title(String value) => json["title"] = value;
    set illustType(int value) => json["illustType"] = value;
    set xRestrict(int value) => json["xRestrict"] = value;
    set restrict(int value) => json["restrict"] = value;
    set sl(int value) => json["sl"] = value;
    set url(String value) => json["url"] = value;
    set description(String value) => json["description"] = value;
    set tags(List<String> value) => json["tags"] = value;
    set userId(String value) => json["userId"] = value;
    set userName(String value) => json["userName"] = value;
    set width(int value) => json["width"] = value;
    set height(int value) => json["height"] = value;
    set pageCount(int value) => json["pageCount"] = value;
    set isBookmarkable(bool value) => json["isBookmarkable"] = value;
    set bookmarkData(dynamic value) => json["bookmarkData"] = value;
    set alt(String value) => json["alt"] = value;
    set titleCaptionTranslation(_TitleCaptionTranslation value) => json["titleCaptionTranslation"] = value;
    set createDate(String value) => json["createDate"] = value;
    set updateDate(String value) => json["updateDate"] = value;
    set isUnlisted(bool value) => json["isUnlisted"] = value;
    set isMasked(bool value) => json["isMasked"] = value;
    set aiType(int value) => json["aiType"] = value;
    set urls(Map<String, String>? value) => json["urls"] = value;
    set profileImageUrl(String? value) => json["profileImageUrl"] = value;

}

