import 'package:json_annotation/json_annotation.dart';
import '../top/illust/Artwork.dart' show Artwork;
import '../novel/Novel.dart' show Novel;
part 'Thumbnails.g.dart';

@JsonSerializable()
/// Modified for the usage of "thumbRemap"
class ThumbnailsRemap {
  final Map<String, Artwork> illust;
  final Map<String, Novel> novel;
  final List<dynamic> novelDraft;
  final List<dynamic> novelSeries;
  ThumbnailsRemap({
    required this.illust,
    required this.novel,
    required this.novelDraft,
    required this.novelSeries,
  });

  factory ThumbnailsRemap.fromJson(Map<String, dynamic> json) => _$ThumbnailsRemapFromJson(json);
  
}
@JsonSerializable()
/// Collection of works objects
class Thumbnails {
  /// List of [Artwork]s
  final List<Artwork> illust;
  /// List of [Novel]s
  final List<Novel> novel;
  final List<dynamic> novelDraft;
  final List<dynamic> novelSeries;
  Thumbnails({
    required this.illust,
    required this.novel,
    required this.novelDraft,
    required this.novelSeries,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => _$ThumbnailsFromJson(json);
  
}
