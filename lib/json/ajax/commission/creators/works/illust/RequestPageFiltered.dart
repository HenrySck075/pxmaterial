import 'package:sofieru/json/ajax/user/User.dart' show User;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
extension type _Pager(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    int get page => json['page'] as int;
    bool get hasNextPage => json['hasNextPage'] as bool;

// ----------- SETTERS ----------- 
    set page(int value) => json["page"] = value;
    set hasNextPage(bool value) => json["hasNextPage"] = value;

}

extension type RequestPageFiltered(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<int> get workIds => json['workIds'] as List<int>;
    String get workType => json['workType'] as String;
    String get mode => json['mode'] as String;
    List<String> get tags => json['tags'] as List<String>;
    _Pager get pager => json['pager'] as _Pager;
    Map<String, TagTranslation> get tagTranslation => json['tagTranslation'] as Map<String, TagTranslation>;
    Thumbnails get thumbnails => json['thumbnails'] as Thumbnails;
    List<dynamic> get illustSeries => json['illustSeries'] as List<dynamic>;
    List<Request> get requests => json['requests'] as List<Request>;
    List<User> get users => json['users'] as List<User>;

// ----------- SETTERS ----------- 
    set workIds(List<int> value) => json["workIds"] = value;
    set workType(String value) => json["workType"] = value;
    set mode(String value) => json["mode"] = value;
    set tags(List<String> value) => json["tags"] = value;
    set pager(_Pager value) => json["pager"] = value;
    set tagTranslation(Map<String, TagTranslation> value) => json["tagTranslation"] = value;
    set thumbnails(Thumbnails value) => json["thumbnails"] = value;
    set illustSeries(List<dynamic> value) => json["illustSeries"] = value;
    set requests(List<Request> value) => json["requests"] = value;
    set users(List<User> value) => json["users"] = value;

}

