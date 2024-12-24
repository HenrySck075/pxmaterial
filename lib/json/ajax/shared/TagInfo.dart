extension type TagInfo(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get tag => json['tag'] as String;
    bool get locked => json['locked'] as bool;
    bool get deletable => json['deletable'] as bool;
    String? get userId => json['userId'];
    String? get romaji => json['romaji'];
    Map<String, String>? get translation => json['translation'];
    String? get userName => json['userName'];

// ----------- SETTERS ----------- 
    set tag(String value) => json["tag"] = value;
    set locked(bool value) => json["locked"] = value;
    set deletable(bool value) => json["deletable"] = value;
    set userId(String? value) => json["userId"] = value;
    set romaji(String? value) => json["romaji"] = value;
    set translation(Map<String, String>? value) => json["translation"] = value;
    set userName(String? value) => json["userName"] = value;

}

