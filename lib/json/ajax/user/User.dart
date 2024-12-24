import 'package:sofieru/json/base.dart' show checkFalsy;
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

extension type _SocialContent(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get url => json['url'] as String;

// ----------- SETTERS ----------- 
    set url(String value) => json["url"] = value;

}

extension type _Region(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String? get name => json['name'];
    String? get region => json['region'];
    String? get prefecture => json['prefecture'];
    String? get privacyLevel => json['privacyLevel'];

// ----------- SETTERS ----------- 
    set name(String? value) => json["name"] = value;
    set region(String? value) => json["region"] = value;
    set prefecture(String? value) => json["prefecture"] = value;
    set privacyLevel(String? value) => json["privacyLevel"] = value;

}

/// Represents the data with privacy level
extension type PrivacyLeveledData(Map<String, dynamic> json) {
  /// Value
  /// Privacy level. Will be `null` if it's other users
// ----------- GETTERS ----------- 
    String? get name => json['name'];
    String? get privacyLevel => json['privacyLevel'];

// ----------- SETTERS ----------- 
    set name(String? value) => json["name"] = value;
    set privacyLevel(String? value) => json["privacyLevel"] = value;

}

extension type _Workspace(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String? get userWorkspacePc => json['userWorkspacePc'];
    String? get userWorkspaceMonitor => json['userWorkspaceMonitor'];
    String? get userWorkspaceTool => json['userWorkspaceTool'];
    String? get userWorkspaceScanner => json['userWorkspaceScanner'];
    String? get userWorkspaceTablet => json['userWorkspaceTablet'];
    String? get userWorkspaceMouse => json['userWorkspaceMouse'];
    String? get userWorkspacePrinter => json['userWorkspacePrinter'];
    String? get userWorkspaceDesktop => json['userWorkspaceDesktop'];
    String? get userWorkspaceMusic => json['userWorkspaceMusic'];
    String? get userWorkspaceDesk => json['userWorkspaceDesk'];
    String? get userWorkspaceChair => json['userWorkspaceChair'];

// ----------- SETTERS ----------- 
    set userWorkspacePc(String? value) => json["userWorkspacePc"] = value;
    set userWorkspaceMonitor(String? value) => json["userWorkspaceMonitor"] = value;
    set userWorkspaceTool(String? value) => json["userWorkspaceTool"] = value;
    set userWorkspaceScanner(String? value) => json["userWorkspaceScanner"] = value;
    set userWorkspaceTablet(String? value) => json["userWorkspaceTablet"] = value;
    set userWorkspaceMouse(String? value) => json["userWorkspaceMouse"] = value;
    set userWorkspacePrinter(String? value) => json["userWorkspacePrinter"] = value;
    set userWorkspaceDesktop(String? value) => json["userWorkspaceDesktop"] = value;
    set userWorkspaceMusic(String? value) => json["userWorkspaceMusic"] = value;
    set userWorkspaceDesk(String? value) => json["userWorkspaceDesk"] = value;
    set userWorkspaceChair(String? value) => json["userWorkspaceChair"] = value;

}

/// Represents the [User] object
extension type User(Map<String, dynamic> json) {
  /// TODO: If you manages to get the sketchLive object, please paste it as a list item of this property
  /// User's workspace specs
  /// Whether or not the account is pixiv's account
// ----------- GETTERS ----------- 
    String get userId => json['userId'] as String;
    String get name => json['name'] as String;
    String get image => json['image'] as String;
    String get imageBig => json['imageBig'] as String;
    bool get premium => json['premium'] as bool;
    bool get isFollowed => json['isFollowed'] as bool;
    bool get isMypixiv => json['isMypixiv'] as bool;
    bool get isBlocking => json['isBlocking'] as bool;
    _Background? get background => json['background'];
    String? get sketchLiveId => json['sketchLiveId'];
    bool get acceptRequest => json['acceptRequest'] as bool;
    List<dynamic> get sketchLives => json['sketchLives'] as List<dynamic>;
    int get following => json['following'] as int;
    int get mypixivCount => json['mypixivCount'] as int;
    bool get followedBack => json['followedBack'] as bool;
    String get comment => json['comment'] as String;
    String get commentHtml => json['commentHtml'] as String;
    dynamic get webpage => json['webpage'] as dynamic;
    Map<String, _SocialContent>? get social => checkFalsy(json['social'])?null:json['social'] as Map<String, _SocialContent>?;
    bool get canSendMessage => json['canSendMessage'] as bool;
    _Region get region => json['region'] as _Region;
    PrivacyLeveledData get age => json['age'] as PrivacyLeveledData;
    PrivacyLeveledData get birthDay => json['birthDay'] as PrivacyLeveledData;
    PrivacyLeveledData get gender => json['gender'] as PrivacyLeveledData;
    PrivacyLeveledData get job => json['job'] as PrivacyLeveledData;
    _Workspace? get workspace => json['workspace'];
    bool get official => json['official'] as bool;
    dynamic get group => json['group'] as dynamic;

// ----------- SETTERS ----------- 
    set userId(String value) => json["userId"] = value;
    set name(String value) => json["name"] = value;
    set image(String value) => json["image"] = value;
    set imageBig(String value) => json["imageBig"] = value;
    set premium(bool value) => json["premium"] = value;
    set isFollowed(bool value) => json["isFollowed"] = value;
    set isMypixiv(bool value) => json["isMypixiv"] = value;
    set isBlocking(bool value) => json["isBlocking"] = value;
    set background(_Background? value) => json["background"] = value;
    set sketchLiveId(String? value) => json["sketchLiveId"] = value;
    set acceptRequest(bool value) => json["acceptRequest"] = value;
    set sketchLives(List<dynamic> value) => json["sketchLives"] = value;
    set following(int value) => json["following"] = value;
    set mypixivCount(int value) => json["mypixivCount"] = value;
    set followedBack(bool value) => json["followedBack"] = value;
    set comment(String value) => json["comment"] = value;
    set commentHtml(String value) => json["commentHtml"] = value;
    set webpage(dynamic value) => json["webpage"] = value;
    set social(Map<String, _SocialContent>? value) => json["social"] = value;
    set canSendMessage(bool value) => json["canSendMessage"] = value;
    set region(_Region value) => json["region"] = value;
    set age(PrivacyLeveledData value) => json["age"] = value;
    set birthDay(PrivacyLeveledData value) => json["birthDay"] = value;
    set gender(PrivacyLeveledData value) => json["gender"] = value;
    set job(PrivacyLeveledData value) => json["job"] = value;
    set workspace(_Workspace? value) => json["workspace"] = value;
    set official(bool value) => json["official"] = value;
    set group(dynamic value) => json["group"] = value;

}

