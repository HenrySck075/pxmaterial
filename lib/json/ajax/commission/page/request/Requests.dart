import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
import 'package:sofieru/json/ajax/shared/UserEmbed.dart' show UserEmbed;
extension type _Page(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<String> get completeRequestIdsIllust => json['completeRequestIdsIllust'] as List<String>;
    List<String> get completeRequestIdsManga => json['completeRequestIdsManga'] as List<String>;
    List<String> get completeRequestIdsNovels => json['completeRequestIdsNovels'] as List<String>;
    List<String> get inProgressRequestIds => json['inProgressRequestIds'] as List<String>;
    List<String> get newerCreatorUserIds => json['newerCreatorUserIds'] as List<String>;
    List<dynamic> get followCreatorUserIds => json['followCreatorUserIds'] as List<dynamic>;
    List<String> get recommendIllustIdsByCreatorAcceptingRequest => json['recommendIllustIdsByCreatorAcceptingRequest'] as List<String>;
    List<UserEmbed> get userList => json['userList'] as List<UserEmbed>;

// ----------- SETTERS ----------- 
    set completeRequestIdsIllust(List<String> value) => json["completeRequestIdsIllust"] = value;
    set completeRequestIdsManga(List<String> value) => json["completeRequestIdsManga"] = value;
    set completeRequestIdsNovels(List<String> value) => json["completeRequestIdsNovels"] = value;
    set inProgressRequestIds(List<String> value) => json["inProgressRequestIds"] = value;
    set newerCreatorUserIds(List<String> value) => json["newerCreatorUserIds"] = value;
    set followCreatorUserIds(List<dynamic> value) => json["followCreatorUserIds"] = value;
    set recommendIllustIdsByCreatorAcceptingRequest(List<String> value) => json["recommendIllustIdsByCreatorAcceptingRequest"] = value;
    set userList(List<UserEmbed> value) => json["userList"] = value;

}

extension type Requests(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _Page get page => json['page'] as _Page;
    Map<String, TagTranslation> get tagTranslation => json['tagTranslation'] as Map<String, TagTranslation>;
    Thumbnails get thumbnails => json['thumbnails'] as Thumbnails;
    List<dynamic> get illustSeries => json['illustSeries'] as List<dynamic>;
    List<Request> get requests => json['requests'] as List<Request>;
    List<PartialUser> get users => json['users'] as List<PartialUser>;

// ----------- SETTERS ----------- 
    set page(_Page value) => json["page"] = value;
    set tagTranslation(Map<String, TagTranslation> value) => json["tagTranslation"] = value;
    set thumbnails(Thumbnails value) => json["thumbnails"] = value;
    set illustSeries(List<dynamic> value) => json["illustSeries"] = value;
    set requests(List<Request> value) => json["requests"] = value;
    set users(List<PartialUser> value) => json["users"] = value;

}

