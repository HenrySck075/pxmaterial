extension type RecommendedUser(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    int get id => json['id'] as int;
    List<String> get illustIds => json['illustIds'] as List<String>;
    List<String> get novelIds => json['novelIds'] as List<String>;

// ----------- SETTERS ----------- 
    set id(int value) => json["id"] = value;
    set illustIds(List<String> value) => json["illustIds"] = value;
    set novelIds(List<String> value) => json["novelIds"] = value;

}

