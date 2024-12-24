extension type Booth(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get userId => json['userId'] as String;
    String get title => json['title'] as String;
    String get url => json['url'] as String;
    String get imageUrl => json['imageUrl'] as String;
    bool get adult => json['adult'] as bool;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set userId(String value) => json["userId"] = value;
    set title(String value) => json["title"] = value;
    set url(String value) => json["url"] = value;
    set imageUrl(String value) => json["imageUrl"] = value;
    set adult(bool value) => json["adult"] = value;

}

