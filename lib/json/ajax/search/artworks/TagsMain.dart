import 'package:sofieru/json/ajax/shared/ExtraData.dart' show ExtraData;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslations;
import '../../illust/PartialArtwork.dart' show PartialArtwork;
class _BookmarkRanges {
  final int? min;
  final int? max;
  _BookmarkRanges({
    this.min,
    this.max,
  });
  factory _BookmarkRanges.fromJson(Map<String, dynamic> json) {
    return _BookmarkRanges(
    min: json['min'],
    max: json['max'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "min": min,
    "max": max,
  };
}

class _IllustManga {
  final List<PartialArtwork> data;
  final int total;
  final int lastPage;
  /// what the fuck does this mean?
  final List<_BookmarkRanges> bookmarkRanges;
  _IllustManga({
    required this.data,
    required this.total,
    required this.lastPage,
    required this.bookmarkRanges,
  });
  factory _IllustManga.fromJson(Map<String, dynamic> json) {
    return _IllustManga(
    data: (json['data'] as List<dynamic>).map((e)=>PartialArtwork.fromJson(e)).toList(),
    total: json['total'],
    lastPage: json['lastPage'],
    bookmarkRanges: (json['bookmarkRanges'] as List<dynamic>).map((e)=>_BookmarkRanges.fromJson(e)).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "data": data.map((e)=>e.toJson()).toList(),
    "total": total,
    "lastPage": lastPage,
    "bookmarkRanges": bookmarkRanges.map((e)=>e.toJson()).toList(),
  };
}

class _Popular {
  final List<PartialArtwork> recent;
  final List<PartialArtwork> permanent;
  _Popular({
    required this.recent,
    required this.permanent,
  });
  factory _Popular.fromJson(Map<String, dynamic> json) {
    return _Popular(
    recent: (json['recent'] as List<dynamic>).map((e)=>PartialArtwork.fromJson(e)).toList(),
    permanent: (json['permanent'] as List<dynamic>).map((e)=>PartialArtwork.fromJson(e)).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "recent": recent.map((e)=>e.toJson()).toList(),
    "permanent": permanent.map((e)=>e.toJson()).toList(),
  };
}

class TagsMain {
  final _IllustManga illustManga;
  final _Popular popular;
  final List<String> relatedTags;
  final TagTranslations tagTranslation;
  final ExtraData extraData;
  TagsMain({
    required this.illustManga,
    required this.popular,
    required this.relatedTags,
    required this.tagTranslation,
    required this.extraData,
  });
  factory TagsMain.fromJson(Map<String, dynamic> json) {
    return TagsMain(
    illustManga: _IllustManga.fromJson(json['illustManga']),
    popular: _Popular.fromJson(json['popular']),
    relatedTags: (json['relatedTags'] as List<dynamic>).map((e)=>e as String).toList(),
    tagTranslation: TagTranslations.fromJson(json['tagTranslation']),
    extraData: ExtraData.fromJson(json['extraData']),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "illustManga": illustManga.toJson(),
    "popular": popular.toJson(),
    "relatedTags": relatedTags,
    "tagTranslation": tagTranslation.toJson(),
    "extraData": extraData.toJson(),
  };
}

