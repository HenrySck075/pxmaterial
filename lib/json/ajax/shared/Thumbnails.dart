import '../novel/PartialNovel.dart' show PartialNovel;
import '../illust/PartialArtwork.dart' show PartialArtwork;
class Thumbnails {
  final List<PartialArtwork> illust;
  final List<PartialNovel> novel;
  final List<dynamic> novelSeries;
  final List<dynamic> novelDraft;
  final List<dynamic> collection;
  Thumbnails({
    required this.illust,
    required this.novel,
    required this.novelSeries,
    required this.novelDraft,
    required this.collection,
  });
  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
    illust: (json['illust'] as List<dynamic>).map((e)=>PartialArtwork.fromJson(e)).toList(),
    novel: (json['novel'] as List<dynamic>).map((e)=>PartialNovel.fromJson(e)).toList(),
    novelSeries: (json['novelSeries'] as List<dynamic>),
    novelDraft: (json['novelDraft'] as List<dynamic>),
    collection: (json['collection'] as List<dynamic>),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "illust": illust.map((e)=>e.toJson()).toList(),
    "novel": novel.map((e)=>e.toJson()).toList(),
    "novelSeries": novelSeries,
    "novelDraft": novelDraft,
    "collection": collection,
  };
}

