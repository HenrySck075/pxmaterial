import '../novel/PartialNovel.dart' show PartialNovel;
import '../illust/PartialArtwork.dart' show PartialArtwork;
class Thumbnails {
  final List<PartialArtwork>? illust;
  final List<PartialNovel>? novel;
  final List<dynamic>? novelSeries;
  final List<dynamic>? novelDraft;
  final List<dynamic>? collection;
  Thumbnails({
    this.illust,
    this.novel,
    this.novelSeries,
    this.novelDraft,
    this.collection,
  });
  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    illust: json['illust'] is List?null:(json['illust'] as List<dynamic>).map((e)=>PartialArtwork.fromJson(e)).toList(),
    novel: json['novel'] is List?null:(json['novel'] as List<dynamic>).map((e)=>PartialNovel.fromJson(e)).toList(),
    novelSeries: json['novelSeries'] is List?null:(json['novelSeries'] as List<dynamic>),
    novelDraft: json['novelDraft'] is List?null:(json['novelDraft'] as List<dynamic>),
    collection: json['collection'] is List?null:(json['collection'] as List<dynamic>),
  );

}
