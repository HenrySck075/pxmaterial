extension type IllustSeries(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get userId => json['userId'] as String;
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String get caption => json['caption'] as String;
    int get total => json['total'] as int;
    dynamic get content_order => json['content_order'] as dynamic;
    String get url => json['url'] as String;
    int get coverImageSl => json['coverImageSl'] as int;
    String get firstIllustId => json['firstIllustId'] as String;
    String get latestIllustId => json['latestIllustId'] as String;
    String get createDate => json['createDate'] as String;
    String get updateDate => json['updateDate'] as String;
    dynamic get watchCount => json['watchCount'] as dynamic;
    bool get isWatched => json['isWatched'] as bool;
    bool get isNotifying => json['isNotifying'] as bool;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set userId(String value) => json["userId"] = value;
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set caption(String value) => json["caption"] = value;
    set total(int value) => json["total"] = value;
    set content_order(dynamic value) => json["content_order"] = value;
    set url(String value) => json["url"] = value;
    set coverImageSl(int value) => json["coverImageSl"] = value;
    set firstIllustId(String value) => json["firstIllustId"] = value;
    set latestIllustId(String value) => json["latestIllustId"] = value;
    set createDate(String value) => json["createDate"] = value;
    set updateDate(String value) => json["updateDate"] = value;
    set watchCount(dynamic value) => json["watchCount"] = value;
    set isWatched(bool value) => json["isWatched"] = value;
    set isNotifying(bool value) => json["isNotifying"] = value;

}

