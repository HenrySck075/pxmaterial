import 'package:sofieru/json/base.dart' show checkFalsy;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/shared/TagInfo.dart' show TagInfo;
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart' show PartialArtwork;
import 'package:sofieru/json/ajax/shared/Work.dart' show Work;
extension type _Urls(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get mini => json['mini'] as String;
    String get thumb => json['thumb'] as String;
    String get small => json['small'] as String;
    String get regular => json['regular'] as String;
    String get original => json['original'] as String;

// ----------- SETTERS ----------- 
    set mini(String value) => json["mini"] = value;
    set thumb(String value) => json["thumb"] = value;
    set small(String value) => json["small"] = value;
    set regular(String value) => json["regular"] = value;
    set original(String value) => json["original"] = value;

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

extension type Artwork(Map<String, dynamic> json) implements Work {
  /// Artwork id
  /// Artwork title
  /// Artwork description
  /// Artwork type 
  /// 1: Illustration
  /// 2: Manga
  /// 3:Animated artwork
  /// una copia
  /// de lós 3
  /// parámetros anteriores
  /// Denotes how the user advances a page in the manga work.
  /// Values are "0" for vertical and "1" for rtl (known values)
  /// also its 0 (a falsy value) if its an artwork for some fucking reason
  /// Sub-prop for `xRestrict`. 0 is just p, 1 is violent stuff included
  /// Whether the work is marked as R-18
// ----------- GETTERS ----------- 
    String get illustId => json['illustId'] as String;
    String get illustTitle => json['illustTitle'] as String;
    String get illustComment => json['illustComment'] as String;
    int get illustType => json['illustType'] as int;
    int get sl => json['sl'] as int;
    _Urls get urls => json['urls'] as _Urls;
    String get alt => json['alt'] as String;
    String get userAccount => json['userAccount'] as String;
    Map<String, PartialArtwork?> get userIllusts => json['userIllusts'] as Map<String, PartialArtwork?>;
    int get width => json['width'] as int;
    int get height => json['height'] as int;
    int get responseCount => json['responseCount'] as int;
    bool get isHowto => json['isHowto'] as bool;
    dynamic get reuploadDate => json['reuploadDate'] as dynamic;
    bool get locationMask => json['locationMask'] as bool;
    String get id => json['id'] as String;
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String? get bookStyle => checkFalsy(json['bookStyle'])?null:json['bookStyle'];
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
    set illustId(String value) => json["illustId"] = value;
    set illustTitle(String value) => json["illustTitle"] = value;
    set illustComment(String value) => json["illustComment"] = value;
    set illustType(int value) => json["illustType"] = value;
    set sl(int value) => json["sl"] = value;
    set urls(_Urls value) => json["urls"] = value;
    set alt(String value) => json["alt"] = value;
    set userAccount(String value) => json["userAccount"] = value;
    set userIllusts(Map<String, PartialArtwork?> value) => json["userIllusts"] = value;
    set width(int value) => json["width"] = value;
    set height(int value) => json["height"] = value;
    set responseCount(int value) => json["responseCount"] = value;
    set isHowto(bool value) => json["isHowto"] = value;
    set reuploadDate(dynamic value) => json["reuploadDate"] = value;
    set locationMask(bool value) => json["locationMask"] = value;
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

