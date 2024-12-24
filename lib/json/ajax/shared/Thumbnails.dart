import 'package:sofieru/json/ajax/novel/PartialNovel.dart' show PartialNovel;
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart' show PartialArtwork;
extension type Thumbnails(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<PartialArtwork> get illust => json['illust'] as List<PartialArtwork>;
    List<PartialNovel> get novel => json['novel'] as List<PartialNovel>;
    List<dynamic> get novelSeries => json['novelSeries'] as List<dynamic>;
    List<dynamic> get novelDraft => json['novelDraft'] as List<dynamic>;
    List<dynamic> get collection => json['collection'] as List<dynamic>;

// ----------- SETTERS ----------- 
    set illust(List<PartialArtwork> value) => json["illust"] = value;
    set novel(List<PartialNovel> value) => json["novel"] = value;
    set novelSeries(List<dynamic> value) => json["novelSeries"] = value;
    set novelDraft(List<dynamic> value) => json["novelDraft"] = value;
    set collection(List<dynamic> value) => json["collection"] = value;

}

