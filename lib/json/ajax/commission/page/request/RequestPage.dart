import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
import 'package:sofieru/json/ajax/shared/UserEmbed.dart' show UserEmbed;
extension type _Creator(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get creatorUserId => json['creatorUserId'] as String;
    bool get creatorStoppedFlg => json['creatorStoppedFlg'] as bool;
    int get requestPriceLowerLimit => json['requestPriceLowerLimit'] as int;
    int get requestPriceUpperLimit => json['requestPriceUpperLimit'] as int;
    dynamic get tokusho => json['tokusho'] as dynamic;

// ----------- SETTERS ----------- 
    set creatorUserId(String value) => json["creatorUserId"] = value;
    set creatorStoppedFlg(bool value) => json["creatorStoppedFlg"] = value;
    set requestPriceLowerLimit(int value) => json["requestPriceLowerLimit"] = value;
    set requestPriceUpperLimit(int value) => json["requestPriceUpperLimit"] = value;
    set tokusho(dynamic value) => json["tokusho"] = value;

}

extension type _ConfettiModalStatus(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    bool get inProgressFan => json['inProgressFan'] as bool;
    bool get inProgressCreator => json['inProgressCreator'] as bool;
    bool get completeFanOrCollaborateUser => json['completeFanOrCollaborateUser'] as bool;

// ----------- SETTERS ----------- 
    set inProgressFan(bool value) => json["inProgressFan"] = value;
    set inProgressCreator(bool value) => json["inProgressCreator"] = value;
    set completeFanOrCollaborateUser(bool value) => json["completeFanOrCollaborateUser"] = value;

}

extension type _Twitter_card(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get card => json['card'] as String;
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String get image => json['image'] as String;

// ----------- SETTERS ----------- 
    set card(String value) => json["card"] = value;
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set image(String value) => json["image"] = value;

}

extension type _Meta_ogp(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get type => json['type'] as String;
    String get title => json['title'] as String;
    String get description => json['description'] as String;
    String get url => json['url'] as String;
    String get image => json['image'] as String;

// ----------- SETTERS ----------- 
    set type(String value) => json["type"] = value;
    set title(String value) => json["title"] = value;
    set description(String value) => json["description"] = value;
    set url(String value) => json["url"] = value;
    set image(String value) => json["image"] = value;

}

extension type _Ogp(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _Twitter_card get twitter_card => json['twitter_card'] as _Twitter_card;
    _Meta_ogp get meta_ogp => json['meta_ogp'] as _Meta_ogp;
    String get page_title => json['page_title'] as String;
    String get description => json['description'] as String;

// ----------- SETTERS ----------- 
    set twitter_card(_Twitter_card value) => json["twitter_card"] = value;
    set meta_ogp(_Meta_ogp value) => json["meta_ogp"] = value;
    set page_title(String value) => json["page_title"] = value;
    set description(String value) => json["description"] = value;

}

extension type _Page(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _Creator get creator => json['creator'] as _Creator;
    List<int> get recommendedUserIds => json['recommendedUserIds'] as List<int>;
    _ConfettiModalStatus get confettiModalStatus => json['confettiModalStatus'] as _ConfettiModalStatus;
    List<UserEmbed> get userList => json['userList'] as List<UserEmbed>;
    List<String> get inProgressRequestIds => json['inProgressRequestIds'] as List<String>;
    List<dynamic> get completeRequestIds => json['completeRequestIds'] as List<dynamic>;
    bool get alreadyRequestCollaborate => json['alreadyRequestCollaborate'] as bool;
    dynamic get platformFeeCampaignLabel => json['platformFeeCampaignLabel'] as dynamic;
    List<dynamic> get eligibleCampaignList => json['eligibleCampaignList'] as List<dynamic>;
    bool get isUnlisted => json['isUnlisted'] as bool;
    _Ogp get ogp => json['ogp'] as _Ogp;
    bool get locationMask => json['locationMask'] as bool;

// ----------- SETTERS ----------- 
    set creator(_Creator value) => json["creator"] = value;
    set recommendedUserIds(List<int> value) => json["recommendedUserIds"] = value;
    set confettiModalStatus(_ConfettiModalStatus value) => json["confettiModalStatus"] = value;
    set userList(List<UserEmbed> value) => json["userList"] = value;
    set inProgressRequestIds(List<String> value) => json["inProgressRequestIds"] = value;
    set completeRequestIds(List<dynamic> value) => json["completeRequestIds"] = value;
    set alreadyRequestCollaborate(bool value) => json["alreadyRequestCollaborate"] = value;
    set platformFeeCampaignLabel(dynamic value) => json["platformFeeCampaignLabel"] = value;
    set eligibleCampaignList(List<dynamic> value) => json["eligibleCampaignList"] = value;
    set isUnlisted(bool value) => json["isUnlisted"] = value;
    set ogp(_Ogp value) => json["ogp"] = value;
    set locationMask(bool value) => json["locationMask"] = value;

}

extension type RequestPage(Map<String, dynamic> json) {
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

