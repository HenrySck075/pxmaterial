import '../../user/User.dart' show User;
import '../../novel/Novel.dart' show Novel;
import 'Artwork.dart' show Artwork;
import '../../request/Request.dart' show Request;
import 'Page.dart' show Page;
import '../../shared/BoothItem.dart' show BoothItem;
import '../../shared/TagTranslation.dart' show TagTranslationContent;
import 'package:json_annotation/json_annotation.dart';
part 'IllustTop.g.dart';

@JsonSerializable()
/// Modified for the usage of "thumbRemap"
class _Thumbnails {
  final Map<String, Artwork> illust;
  final Map<String, Novel> novel;
  final List<dynamic> novelDraft;
  final List<dynamic> novelSeries;
  _Thumbnails({
    required this.illust,
    required this.novel,
    required this.novelDraft,
    required this.novelSeries,
  });

  factory _Thumbnails.fromJson(Map<String, dynamic> json) => _$ThumbnailsFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
}
@JsonSerializable()
class IllustTop {
  final Map<String, TagTranslationContent> tagTranslation;
  final List<BoothItem> boothItems;
  final List<dynamic> illustSeries;
  final Page page;
  final List<Request> requests;
  final List<dynamic> sketchLives;
  final _Thumbnails thumbnails;
  final List<User> users;
  IllustTop({
    required this.tagTranslation,
    required this.boothItems,
    required this.illustSeries,
    required this.page,
    required this.requests,
    required this.sketchLives,
    required this.thumbnails,
    required this.users,
  });

  factory IllustTop.fromJson(Map<String, dynamic> json) => _$IllustTopFromJson(json);
  Map<String, dynamic> toJson() => _$IllustTopToJson(this);
}
