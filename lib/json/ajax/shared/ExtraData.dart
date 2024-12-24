extension type _AlternateLanguages(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get ja => json['ja'] as String;
    String get en => json['en'] as String;

// ----------- SETTERS ----------- 
    set ja(String value) => json["ja"] = value;
    set en(String value) => json["en"] = value;

}

extension type _EmbedMeta(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get description => json['description'] as String;
    String get image => json['image'] as String;
    String get title => json['title'] as String;
    String? get type => json['type'];
    String? get card => json['card'];

// ----------- SETTERS ----------- 
    set description(String value) => json["description"] = value;
    set image(String value) => json["image"] = value;
    set title(String value) => json["title"] = value;
    set type(String? value) => json["type"] = value;
    set card(String? value) => json["card"] = value;

}

extension type _Meta(Map<String, dynamic> json) {
  /// Page title
  /// Page description
  /// that one text that appears on any users that views the page without logged in
// ----------- GETTERS ----------- 
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String get canonical => json['canonical'] as String;
    _AlternateLanguages? get alternateLanguages => json['alternateLanguages'];
    String get descriptionHeader => json['descriptionHeader'] as String;
    _EmbedMeta? get ogp => json['ogp'];
    _EmbedMeta? get twitter => json['twitter'];

// ----------- SETTERS ----------- 
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set canonical(String value) => json["canonical"] = value;
    set alternateLanguages(_AlternateLanguages? value) => json["alternateLanguages"] = value;
    set descriptionHeader(String value) => json["descriptionHeader"] = value;
    set ogp(_EmbedMeta? value) => json["ogp"] = value;
    set twitter(_EmbedMeta? value) => json["twitter"] = value;

}

extension type ExtraData(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _Meta get meta => json['meta'] as _Meta;

// ----------- SETTERS ----------- 
    set meta(_Meta value) => json["meta"] = value;

}

