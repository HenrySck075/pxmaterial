import 'package:sofieru/json/ajax/novel/PartialNovel.dart' show PartialNovel;
extension type _Thumbnails(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<dynamic> get illust => json['illust'] as List<dynamic>;
    List<PartialNovel> get novel => json['novel'] as List<PartialNovel>;
    List<dynamic> get novelSeries => json['novelSeries'] as List<dynamic>;
    List<dynamic> get novelDraft => json['novelDraft'] as List<dynamic>;
    List<dynamic> get collection => json['collection'] as List<dynamic>;

// ----------- SETTERS ----------- 
    set illust(List<dynamic> value) => json["illust"] = value;
    set novel(List<PartialNovel> value) => json["novel"] = value;
    set novelSeries(List<dynamic> value) => json["novelSeries"] = value;
    set novelDraft(List<dynamic> value) => json["novelDraft"] = value;
    set collection(List<dynamic> value) => json["collection"] = value;

}

extension type _Series(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    int get id => json['id'] as int;
    int get viewableType => json['viewableType'] as int;
    int get contentOrder => json['contentOrder'] as int;

// ----------- SETTERS ----------- 
    set id(int value) => json["id"] = value;
    set viewableType(int value) => json["viewableType"] = value;
    set contentOrder(int value) => json["contentOrder"] = value;

}

extension type _SeriesContents(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get userId => json['userId'] as String;
    _Series get series => json['series'] as _Series;
    String get title => json['title'] as String;
    String get commentHtml => json['commentHtml'] as String;
    List<String> get tags => json['tags'] as List<String>;
    int get restrict => json['restrict'] as int;
    int get xRestrict => json['xRestrict'] as int;
    bool get isOriginal => json['isOriginal'] as bool;
    int get textLength => json['textLength'] as int;
    int get characterCount => json['characterCount'] as int;
    int get wordCount => json['wordCount'] as int;
    bool get useWordCount => json['useWordCount'] as bool;
    int get readingTime => json['readingTime'] as int;
    int get bookmarkCount => json['bookmarkCount'] as int;
    String get url => json['url'] as String;
    int get uploadTimestamp => json['uploadTimestamp'] as int;
    int get reuploadTimestamp => json['reuploadTimestamp'] as int;
    bool get isBookmarkable => json['isBookmarkable'] as bool;
    dynamic get bookmarkData => json['bookmarkData'] as dynamic;
    int get aiType => json['aiType'] as int;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set userId(String value) => json["userId"] = value;
    set series(_Series value) => json["series"] = value;
    set title(String value) => json["title"] = value;
    set commentHtml(String value) => json["commentHtml"] = value;
    set tags(List<String> value) => json["tags"] = value;
    set restrict(int value) => json["restrict"] = value;
    set xRestrict(int value) => json["xRestrict"] = value;
    set isOriginal(bool value) => json["isOriginal"] = value;
    set textLength(int value) => json["textLength"] = value;
    set characterCount(int value) => json["characterCount"] = value;
    set wordCount(int value) => json["wordCount"] = value;
    set useWordCount(bool value) => json["useWordCount"] = value;
    set readingTime(int value) => json["readingTime"] = value;
    set bookmarkCount(int value) => json["bookmarkCount"] = value;
    set url(String value) => json["url"] = value;
    set uploadTimestamp(int value) => json["uploadTimestamp"] = value;
    set reuploadTimestamp(int value) => json["reuploadTimestamp"] = value;
    set isBookmarkable(bool value) => json["isBookmarkable"] = value;
    set bookmarkData(dynamic value) => json["bookmarkData"] = value;
    set aiType(int value) => json["aiType"] = value;

}

extension type _Page(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<_SeriesContents> get seriesContents => json['seriesContents'] as List<_SeriesContents>;

// ----------- SETTERS ----------- 
    set seriesContents(List<_SeriesContents> value) => json["seriesContents"] = value;

}

extension type Content(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<dynamic> get tagTranslation => json['tagTranslation'] as List<dynamic>;
    _Thumbnails get thumbnails => json['thumbnails'] as _Thumbnails;
    List<dynamic> get illustSeries => json['illustSeries'] as List<dynamic>;
    List<dynamic> get requests => json['requests'] as List<dynamic>;
    List<dynamic> get users => json['users'] as List<dynamic>;
    _Page get page => json['page'] as _Page;

// ----------- SETTERS ----------- 
    set tagTranslation(List<dynamic> value) => json["tagTranslation"] = value;
    set thumbnails(_Thumbnails value) => json["thumbnails"] = value;
    set illustSeries(List<dynamic> value) => json["illustSeries"] = value;
    set requests(List<dynamic> value) => json["requests"] = value;
    set users(List<dynamic> value) => json["users"] = value;
    set page(_Page value) => json["page"] = value;

}

