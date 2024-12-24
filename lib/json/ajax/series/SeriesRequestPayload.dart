import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/series/IllustSeries.dart' show IllustSeries;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
extension type _Series(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get workId => json['workId'] as String;
    int get order => json['order'] as int;

// ----------- SETTERS ----------- 
    set workId(String value) => json["workId"] = value;
    set order(int value) => json["order"] = value;

}

extension type _Page(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<_Series> get series => json['series'] as List<_Series>;
    bool get isSetCover => json['isSetCover'] as bool;
    int get seriesId => json['seriesId'] as int;
    String get otherSeriesId => json['otherSeriesId'] as String;
    List<int> get recentUpdatedWorkIds => json['recentUpdatedWorkIds'] as List<int>;
    int get total => json['total'] as int;
    bool get isWatched => json['isWatched'] as bool;
    bool get isNotifying => json['isNotifying'] as bool;

// ----------- SETTERS ----------- 
    set series(List<_Series> value) => json["series"] = value;
    set isSetCover(bool value) => json["isSetCover"] = value;
    set seriesId(int value) => json["seriesId"] = value;
    set otherSeriesId(String value) => json["otherSeriesId"] = value;
    set recentUpdatedWorkIds(List<int> value) => json["recentUpdatedWorkIds"] = value;
    set total(int value) => json["total"] = value;
    set isWatched(bool value) => json["isWatched"] = value;
    set isNotifying(bool value) => json["isNotifying"] = value;

}

extension type SeriesRequestPayload(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    Map<String, TagTranslation> get tagTranslation => json['tagTranslation'] as Map<String, TagTranslation>;
    Thumbnails get thumbnails => json['thumbnails'] as Thumbnails;
    List<IllustSeries> get illustSeries => json['illustSeries'] as List<IllustSeries>;
    List<dynamic> get requests => json['requests'] as List<dynamic>;
    List<PartialUser> get users => json['users'] as List<PartialUser>;
    _Page get page => json['page'] as _Page;
    ExtraData get extraData => json['extraData'] as ExtraData;

// ----------- SETTERS ----------- 
    set tagTranslation(Map<String, TagTranslation> value) => json["tagTranslation"] = value;
    set thumbnails(Thumbnails value) => json["thumbnails"] = value;
    set illustSeries(List<IllustSeries> value) => json["illustSeries"] = value;
    set requests(List<dynamic> value) => json["requests"] = value;
    set users(List<PartialUser> value) => json["users"] = value;
    set page(_Page value) => json["page"] = value;
    set extraData(ExtraData value) => json["extraData"] = value;

}

