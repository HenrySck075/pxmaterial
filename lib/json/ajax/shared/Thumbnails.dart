import 'package:sofieru/json/ajax/shared/Placeholder.dart' show Placeholder;
class Thumbnails {
  final List<Placeholder>? illust;
  final List<Placeholder>? novel;
  final List<Placeholder>? novelSeries;
  final List<Placeholder>? novelDraft;
  final List<Placeholder>? collection;
  Thumbnails({
    this.illust,
    this.novel,
    this.novelSeries,
    this.novelDraft,
    this.collection,
  });
  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    illust: json['illust'] is List?null:(json['illust'] as List<dynamic>).map((e)=>Placeholder.fromJson(e)).toList(),
    novel: json['novel'] is List?null:(json['novel'] as List<dynamic>).map((e)=>Placeholder.fromJson(e)).toList(),
    novelSeries: json['novelSeries'] is List?null:(json['novelSeries'] as List<dynamic>).map((e)=>Placeholder.fromJson(e)).toList(),
    novelDraft: json['novelDraft'] is List?null:(json['novelDraft'] as List<dynamic>).map((e)=>Placeholder.fromJson(e)).toList(),
    collection: json['collection'] is List?null:(json['collection'] as List<dynamic>).map((e)=>Placeholder.fromJson(e)).toList(),
  );

}

