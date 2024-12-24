extension type UserEmbed(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    List<String> get illustIds => json['illustIds'] as List<String>;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set illustIds(List<String> value) => json["illustIds"] = value;

}

