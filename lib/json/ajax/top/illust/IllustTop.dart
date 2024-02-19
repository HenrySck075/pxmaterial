import '../../user/PartialUser.dart' show PartialUser;
import '../../novel/Novel.dart' show Novel;
import 'Artwork.dart' show Artwork;
import '../../request/Request.dart' show Request;
import 'Page.dart' show Page;
import '../../shared/BoothItem.dart' show BoothItem;
import '../../shared/TagTranslation.dart' show TagTranslationContent;
import '../../shared/Thumbnails.dart' show ThumbnailsRemap;
import 'package:json_annotation/json_annotation.dart';
part 'IllustTop.g.dart';

@JsonSerializable()
class IllustTop {
  final Map<String, TagTranslationContent> tagTranslation;
  final List<BoothItem> boothItems;
  final List<dynamic> illustSeries;
  final Page page;
  final List<Request> requests;
  final List<dynamic> sketchLives;
  final ThumbnailsRemap thumbnails;
  final List<PartialUser> users;
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
  
}
