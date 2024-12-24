extension type RecommendStatus(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<String> get methods => json['methods'] as List<String>;
    int get score => json['score'] as int;
    List<String> get seedIllustIds => json['seedIllustIds'] as List<String>;

// ----------- SETTERS ----------- 
    set methods(List<String> value) => json["methods"] = value;
    set score(int value) => json["score"] = value;
    set seedIllustIds(List<String> value) => json["seedIllustIds"] = value;

}

