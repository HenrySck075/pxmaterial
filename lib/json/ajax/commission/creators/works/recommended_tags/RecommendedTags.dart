import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
extension type RecommendedTags(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<String> get recommendedTags => json['recommendedTags'] as List<String>;
    Map<String, TagTranslation> get tagTranslation => json['tagTranslation'] as Map<String, TagTranslation>;

// ----------- SETTERS ----------- 
    set recommendedTags(List<String> value) => json["recommendedTags"] = value;
    set tagTranslation(Map<String, TagTranslation> value) => json["tagTranslation"] = value;

}

