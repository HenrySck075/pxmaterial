extension type Tag(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get tag => json['tag'] as String;
    List<int> get ids => json['ids'] as List<int>;

// ----------- SETTERS ----------- 
    set tag(String value) => json["tag"] = value;
    set ids(List<int> value) => json["ids"] = value;

}

