import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart' show PartialArtwork;
extension type _BookmarkRanges(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    int? get min => json['min'];
    int? get max => json['max'];

// ----------- SETTERS ----------- 
    set min(int? value) => json["min"] = value;
    set max(int? value) => json["max"] = value;

}

extension type _IllustManga(Map<String, dynamic> json) {
  /// what the fuck does this mean?
// ----------- GETTERS ----------- 
    List<PartialArtwork> get data => json['data'] as List<PartialArtwork>;
    int get total => json['total'] as int;
    int get lastPage => json['lastPage'] as int;
    List<_BookmarkRanges> get bookmarkRanges => json['bookmarkRanges'] as List<_BookmarkRanges>;

// ----------- SETTERS ----------- 
    set data(List<PartialArtwork> value) => json["data"] = value;
    set total(int value) => json["total"] = value;
    set lastPage(int value) => json["lastPage"] = value;
    set bookmarkRanges(List<_BookmarkRanges> value) => json["bookmarkRanges"] = value;

}

extension type _Popular(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<PartialArtwork> get recent => json['recent'] as List<PartialArtwork>;
    List<PartialArtwork> get permanent => json['permanent'] as List<PartialArtwork>;

// ----------- SETTERS ----------- 
    set recent(List<PartialArtwork> value) => json["recent"] = value;
    set permanent(List<PartialArtwork> value) => json["permanent"] = value;

}

extension type TagsMain(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _IllustManga get illustManga => json['illustManga'] as _IllustManga;
    _Popular get popular => json['popular'] as _Popular;
    List<String> get relatedTags => json['relatedTags'] as List<String>;
    Map<String, TagTranslation> get tagTranslation => json['tagTranslation'] as Map<String, TagTranslation>;
    ExtraData get extraData => json['extraData'] as ExtraData;

// ----------- SETTERS ----------- 
    set illustManga(_IllustManga value) => json["illustManga"] = value;
    set popular(_Popular value) => json["popular"] = value;
    set relatedTags(List<String> value) => json["relatedTags"] = value;
    set tagTranslation(Map<String, TagTranslation> value) => json["tagTranslation"] = value;
    set extraData(ExtraData value) => json["extraData"] = value;

}

