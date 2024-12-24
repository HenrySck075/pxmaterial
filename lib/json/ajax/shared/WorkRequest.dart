import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
extension type RequestUser(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get userId => json['userId'] as String;
    String get userName => json['userName'] as String;
    String get profileImg => json['profileImg'] as String;

// ----------- SETTERS ----------- 
    set userId(String value) => json["userId"] = value;
    set userName(String value) => json["userName"] = value;
    set profileImg(String value) => json["profileImg"] = value;

}

extension type _CollaborateStatus(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    bool get collaborating => json['collaborating'] as bool;
    bool get collaborateAnonymousFlg => json['collaborateAnonymousFlg'] as bool;
    int get collaboratedCnt => json['collaboratedCnt'] as int;
    List<dynamic> get userSamples => json['userSamples'] as List<dynamic>;

// ----------- SETTERS ----------- 
    set collaborating(bool value) => json["collaborating"] = value;
    set collaborateAnonymousFlg(bool value) => json["collaborateAnonymousFlg"] = value;
    set collaboratedCnt(int value) => json["collaboratedCnt"] = value;
    set userSamples(List<dynamic> value) => json["userSamples"] = value;

}

extension type WorkRequest(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    Request get request => json['request'] as Request;
    RequestUser get creator => json['creator'] as RequestUser;
    RequestUser get fan => json['fan'] as RequestUser;
    _CollaborateStatus get collaborateStatus => json['collaborateStatus'] as _CollaborateStatus;
    bool get editable => json['editable'] as bool;

// ----------- SETTERS ----------- 
    set request(Request value) => json["request"] = value;
    set creator(RequestUser value) => json["creator"] = value;
    set fan(RequestUser value) => json["fan"] = value;
    set collaborateStatus(_CollaborateStatus value) => json["collaborateStatus"] = value;
    set editable(bool value) => json["editable"] = value;

}

