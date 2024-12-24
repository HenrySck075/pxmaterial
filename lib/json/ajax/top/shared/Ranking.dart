extension type _Items(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get rank => json['rank'] as String;
    String get id => json['id'] as String;

// ----------- SETTERS ----------- 
    set rank(String value) => json["rank"] = value;
    set id(String value) => json["id"] = value;

}

extension type Ranking(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<_Items> get items => json['items'] as List<_Items>;
    String get date => json['date'] as String;

// ----------- SETTERS ----------- 
    set items(List<_Items> value) => json["items"] = value;
    set date(String value) => json["date"] = value;

}

