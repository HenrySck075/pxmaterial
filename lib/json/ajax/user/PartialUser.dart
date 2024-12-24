extension type _Background(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String? get repeat => json['repeat'];
    String? get color => json['color'];
    String get url => json['url'] as String;
    bool get isPrivate => json['isPrivate'] as bool;

// ----------- SETTERS ----------- 
    set repeat(String? value) => json["repeat"] = value;
    set color(String? value) => json["color"] = value;
    set url(String value) => json["url"] = value;
    set isPrivate(bool value) => json["isPrivate"] = value;

}

extension type PartialUser(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String? get comment => json['comment'];
    bool? get followedBack => json['followedBack'];
    String get userId => json['userId'] as String;
    String get name => json['name'] as String;
    String get image => json['image'] as String;
    String get imageBig => json['imageBig'] as String;
    bool get premium => json['premium'] as bool;
    bool get isFollowed => json['isFollowed'] as bool;
    bool get isMypixiv => json['isMypixiv'] as bool;
    bool get isBlocking => json['isBlocking'] as bool;
    _Background? get background => json['background'];
    bool get acceptRequest => json['acceptRequest'] as bool;

// ----------- SETTERS ----------- 
    set comment(String? value) => json["comment"] = value;
    set followedBack(bool? value) => json["followedBack"] = value;
    set userId(String value) => json["userId"] = value;
    set name(String value) => json["name"] = value;
    set image(String value) => json["image"] = value;
    set imageBig(String value) => json["imageBig"] = value;
    set premium(bool value) => json["premium"] = value;
    set isFollowed(bool value) => json["isFollowed"] = value;
    set isMypixiv(bool value) => json["isMypixiv"] = value;
    set isBlocking(bool value) => json["isBlocking"] = value;
    set background(_Background? value) => json["background"] = value;
    set acceptRequest(bool value) => json["acceptRequest"] = value;

}

