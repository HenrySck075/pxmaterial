import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/series/IllustSeries.dart' show IllustSeries;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
extension type _Page(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<int> get ids => json['ids'] as List<int>;
    bool get isLastPage => json['isLastPage'] as bool;
    List<dynamic> get tags => json['tags'] as List<dynamic>;

// ----------- SETTERS ----------- 
    set ids(List<int> value) => json["ids"] = value;
    set isLastPage(bool value) => json["isLastPage"] = value;
    set tags(List<dynamic> value) => json["tags"] = value;

}

extension type IMFromFollowing(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _Page get page => json['page'] as _Page;
    Map<String, TagTranslation> get tagTranslation => json['tagTranslation'] as Map<String, TagTranslation>;
    List<IllustSeries> get illustSeries => json['illustSeries'] as List<IllustSeries>;
    Thumbnails get thumbnails => json['thumbnails'] as Thumbnails;
    List<Request> get requests => json['requests'] as List<Request>;
    List<PartialUser> get users => json['users'] as List<PartialUser>;

// ----------- SETTERS ----------- 
    set page(_Page value) => json["page"] = value;
    set tagTranslation(Map<String, TagTranslation> value) => json["tagTranslation"] = value;
    set illustSeries(List<IllustSeries> value) => json["illustSeries"] = value;
    set thumbnails(Thumbnails value) => json["thumbnails"] = value;
    set requests(List<Request> value) => json["requests"] = value;
    set users(List<PartialUser> value) => json["users"] = value;

}

