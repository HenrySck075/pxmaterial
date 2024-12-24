import 'package:sofieru/json/base.dart' show checkFalsy;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/shared/TagInfo.dart' show TagInfo;
import 'package:sofieru/json/ajax/novel/PartialNovel.dart' show PartialNovel;
import 'package:sofieru/json/ajax/shared/Work.dart' show Work;
extension type _SuggestedSettings(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    int get viewMode => json['viewMode'] as int;
    int get themeBackground => json['themeBackground'] as int;
    dynamic get themeSize => json['themeSize'] as dynamic;
    dynamic get themeSpacing => json['themeSpacing'] as dynamic;

// ----------- SETTERS ----------- 
    set viewMode(int value) => json["viewMode"] = value;
    set themeBackground(int value) => json["themeBackground"] = value;
    set themeSize(dynamic value) => json["themeSize"] = value;
    set themeSpacing(dynamic value) => json["themeSpacing"] = value;

}

extension type _Tags(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get authorId => json['authorId'] as String;
    bool get isLocked => json['isLocked'] as bool;
    List<TagInfo> get tags => json['tags'] as List<TagInfo>;
    bool get writable => json['writable'] as bool;

// ----------- SETTERS ----------- 
    set authorId(String value) => json["authorId"] = value;
    set isLocked(bool value) => json["isLocked"] = value;
    set tags(List<TagInfo> value) => json["tags"] = value;
    set writable(bool value) => json["writable"] = value;

}

extension type _SeriesNavInfo(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get title => json['title'] as String;
    int get order => json['order'] as int;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set title(String value) => json["title"] = value;
    set order(int value) => json["order"] = value;

}

extension type _SeriesNavData(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get seriesType => json['seriesType'] as String;
    String get seriesId => json['seriesId'] as String;
    String get title => json['title'] as String;
    int get order => json['order'] as int;
    bool get isWatched => json['isWatched'] as bool;
    bool get isNotifying => json['isNotifying'] as bool;
    _SeriesNavInfo? get prev => json['prev'];
    _SeriesNavInfo? get next => json['next'];

// ----------- SETTERS ----------- 
    set seriesType(String value) => json["seriesType"] = value;
    set seriesId(String value) => json["seriesId"] = value;
    set title(String value) => json["title"] = value;
    set order(int value) => json["order"] = value;
    set isWatched(bool value) => json["isWatched"] = value;
    set isNotifying(bool value) => json["isNotifying"] = value;
    set prev(_SeriesNavInfo? value) => json["prev"] = value;
    set next(_SeriesNavInfo? value) => json["next"] = value;

}

extension type _TitleCaptionTranslation(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    dynamic get workTitle => json['workTitle'] as dynamic;
    dynamic get workCaption => json['workCaption'] as dynamic;

// ----------- SETTERS ----------- 
    set workTitle(dynamic value) => json["workTitle"] = value;
    set workCaption(dynamic value) => json["workCaption"] = value;

}

extension type RequestUser(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get userId => json['userId'] as String;
    String get userName => json['userName'] as String;
    String get profileImg => json['profileImg'] as String;

// ----------- SETTERS ----------- 
    set userId(String value) => json["userId"] = value;
    set userName(String value) => json["userName"] = value;
    set profileImg(String value) => json["profileImg"] = value;

}

extension type _CollaborateStatus(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    bool get collaborating => json['collaborating'] as bool;
    bool get collaborateAnonymousFlg => json['collaborateAnonymousFlg'] as bool;
    int get collaboratedCnt => json['collaboratedCnt'] as int;
    List<dynamic> get userSamples => json['userSamples'] as List<dynamic>;

// ----------- SETTERS ----------- 
    set collaborating(bool value) => json["collaborating"] = value;
    set collaborateAnonymousFlg(bool value) => json["collaborateAnonymousFlg"] = value;
    set collaboratedCnt(int value) => json["collaboratedCnt"] = value;
    set userSamples(List<dynamic> value) => json["userSamples"] = value;

}

extension type _Request(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    Request get request => json['request'] as Request;
    RequestUser get creator => json['creator'] as RequestUser;
    RequestUser get fan => json['fan'] as RequestUser;
    _CollaborateStatus get collaborateStatus => json['collaborateStatus'] as _CollaborateStatus;
    bool get editable => json['editable'] as bool;

// ----------- SETTERS ----------- 
    set request(Request value) => json["request"] = value;
    set creator(RequestUser value) => json["creator"] = value;
    set fan(RequestUser value) => json["fan"] = value;
    set collaborateStatus(_CollaborateStatus value) => json["collaborateStatus"] = value;
    set editable(bool value) => json["editable"] = value;

}

extension type Novel(Map<String, dynamic> json) implements Work {
// ----------- GETTERS ----------- 
    int get markerCount => json['markerCount'] as int;
    bool get isBungei => json['isBungei'] as bool;
    String get content => json['content'] as String;
    String get coverUrl => json['coverUrl'] as String;
    _SuggestedSettings get suggestedSettings => json['suggestedSettings'] as _SuggestedSettings;
    dynamic get marker => json['marker'] as dynamic;
    Map<String, PartialNovel?> get userNovels => json['userNovels'] as Map<String, PartialNovel?>;
    bool get hasGlossary => json['hasGlossary'] as bool;
    String get language => json['language'] as String;
    dynamic get textEmbeddedImages => json['textEmbeddedImages'] as dynamic;
    int get characterCount => json['characterCount'] as int;
    int get wordCount => json['wordCount'] as int;
    bool get useWordCount => json['useWordCount'] as bool;
    int get readingTime => json['readingTime'] as int;
    String get genre => json['genre'] as String;
    String get id => json['id'] as String;
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String? get bookStyle => checkFalsy(json['bookStyle'])?null:json['bookStyle'] as String?;
    String get createDate => json['createDate'] as String;
    String get uploadDate => json['uploadDate'] as String;
    int get restrict => json['restrict'] as int;
    int get xRestrict => json['xRestrict'] as int;
    _Tags get tags => json['tags'] as _Tags;
    String get userId => json['userId'] as String;
    String get userName => json['userName'] as String;
    bool get likeData => json['likeData'] as bool;
    int get pageCount => json['pageCount'] as int;
    int get bookmarkCount => json['bookmarkCount'] as int;
    int get likeCount => json['likeCount'] as int;
    int get commentCount => json['commentCount'] as int;
    int get viewCount => json['viewCount'] as int;
    bool get isOriginal => json['isOriginal'] as bool;
    List<dynamic> get imageResponseOutData => json['imageResponseOutData'] as List<dynamic>;
    List<dynamic> get imageResponseData => json['imageResponseData'] as List<dynamic>;
    int get imageResponseCount => json['imageResponseCount'] as int;
    dynamic get pollData => json['pollData'] as dynamic;
    _SeriesNavData? get seriesNavData => json['seriesNavData'];
    dynamic get descriptionBoothId => json['descriptionBoothId'] as dynamic;
    dynamic get descriptionYoutubeId => json['descriptionYoutubeId'] as dynamic;
    dynamic get comicPromotion => json['comicPromotion'] as dynamic;
    dynamic get fanboxPromotion => json['fanboxPromotion'] as dynamic;
    List<dynamic> get contestBanners => json['contestBanners'] as List<dynamic>;
    bool get isBookmarkable => json['isBookmarkable'] as bool;
    dynamic get bookmarkData => json['bookmarkData'] as dynamic;
    dynamic get contestData => json['contestData'] as dynamic;
    ExtraData get extraData => json['extraData'] as ExtraData;
    _TitleCaptionTranslation get titleCaptionTranslation => json['titleCaptionTranslation'] as _TitleCaptionTranslation;
    bool get isUnlisted => json['isUnlisted'] as bool;
    _Request? get request => json['request'];
    int get commentOff => json['commentOff'] as int;
    int get aiType => json['aiType'] as int;

// ----------- SETTERS ----------- 
    set markerCount(int value) => json["markerCount"] = value;
    set isBungei(bool value) => json["isBungei"] = value;
    set content(String value) => json["content"] = value;
    set coverUrl(String value) => json["coverUrl"] = value;
    set suggestedSettings(_SuggestedSettings value) => json["suggestedSettings"] = value;
    set marker(dynamic value) => json["marker"] = value;
    set userNovels(Map<String, PartialNovel?> value) => json["userNovels"] = value;
    set hasGlossary(bool value) => json["hasGlossary"] = value;
    set language(String value) => json["language"] = value;
    set textEmbeddedImages(dynamic value) => json["textEmbeddedImages"] = value;
    set characterCount(int value) => json["characterCount"] = value;
    set wordCount(int value) => json["wordCount"] = value;
    set useWordCount(bool value) => json["useWordCount"] = value;
    set readingTime(int value) => json["readingTime"] = value;
    set genre(String value) => json["genre"] = value;
    set id(String value) => json["id"] = value;
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set bookStyle(String? value) => json["bookStyle"] = value;
    set createDate(String value) => json["createDate"] = value;
    set uploadDate(String value) => json["uploadDate"] = value;
    set restrict(int value) => json["restrict"] = value;
    set xRestrict(int value) => json["xRestrict"] = value;
    set tags(_Tags value) => json["tags"] = value;
    set userId(String value) => json["userId"] = value;
    set userName(String value) => json["userName"] = value;
    set likeData(bool value) => json["likeData"] = value;
    set pageCount(int value) => json["pageCount"] = value;
    set bookmarkCount(int value) => json["bookmarkCount"] = value;
    set likeCount(int value) => json["likeCount"] = value;
    set commentCount(int value) => json["commentCount"] = value;
    set viewCount(int value) => json["viewCount"] = value;
    set isOriginal(bool value) => json["isOriginal"] = value;
    set imageResponseOutData(List<dynamic> value) => json["imageResponseOutData"] = value;
    set imageResponseData(List<dynamic> value) => json["imageResponseData"] = value;
    set imageResponseCount(int value) => json["imageResponseCount"] = value;
    set pollData(dynamic value) => json["pollData"] = value;
    set seriesNavData(_SeriesNavData? value) => json["seriesNavData"] = value;
    set descriptionBoothId(dynamic value) => json["descriptionBoothId"] = value;
    set descriptionYoutubeId(dynamic value) => json["descriptionYoutubeId"] = value;
    set comicPromotion(dynamic value) => json["comicPromotion"] = value;
    set fanboxPromotion(dynamic value) => json["fanboxPromotion"] = value;
    set contestBanners(List<dynamic> value) => json["contestBanners"] = value;
    set isBookmarkable(bool value) => json["isBookmarkable"] = value;
    set bookmarkData(dynamic value) => json["bookmarkData"] = value;
    set contestData(dynamic value) => json["contestData"] = value;
    set extraData(ExtraData value) => json["extraData"] = value;
    set titleCaptionTranslation(_TitleCaptionTranslation value) => json["titleCaptionTranslation"] = value;
    set isUnlisted(bool value) => json["isUnlisted"] = value;
    set request(_Request? value) => json["request"] = value;
    set commentOff(int value) => json["commentOff"] = value;
    set aiType(int value) => json["aiType"] = value;

}

