extension type TagTranslation(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String? get en => json['en'];
    String? get ko => json['ko'];
    String? get zh => json['zh'];
    String? get zh_tw => json['zh_tw'];
    String? get romaji => json['romaji'];

// ----------- SETTERS ----------- 
    set en(String? value) => json["en"] = value;
    set ko(String? value) => json["ko"] = value;
    set zh(String? value) => json["zh"] = value;
    set zh_tw(String? value) => json["zh_tw"] = value;
    set romaji(String? value) => json["romaji"] = value;

}

