import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/series/IllustSeries.dart' show IllustSeries;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
import 'package:sofieru/json/ajax/shared/Booth.dart' show Booth;
extension type _Tags(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get tag => json['tag'] as String;
    List<int> get ids => json['ids'] as List<int>;

// ----------- SETTERS ----------- 
    set tag(String value) => json["tag"] = value;
    set ids(List<int> value) => json["ids"] = value;

}

extension type _Recommend(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<String> get ids => json['ids'] as List<String>;

// ----------- SETTERS ----------- 
    set ids(List<String> value) => json["ids"] = value;

}

extension type _RecommendByTag(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get tag => json['tag'] as String;
    List<String> get ids => json['ids'] as List<String>;

// ----------- SETTERS ----------- 
    set tag(String value) => json["tag"] = value;
    set ids(List<String> value) => json["ids"] = value;

}

extension type _Items(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get rank => json['rank'] as String;
    String get id => json['id'] as String;

// ----------- SETTERS ----------- 
    set rank(String value) => json["rank"] = value;
    set id(String value) => json["id"] = value;

}

extension type _Ranking(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<_Items> get items => json['items'] as List<_Items>;
    String get date => json['date'] as String;

// ----------- SETTERS ----------- 
    set items(List<_Items> value) => json["items"] = value;
    set date(String value) => json["date"] = value;

}

extension type _Pixivision(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get id => json['id'] as String;
    String get title => json['title'] as String;
    String get thumbnailUrl => json['thumbnailUrl'] as String;
    String get url => json['url'] as String;

// ----------- SETTERS ----------- 
    set id(String value) => json["id"] = value;
    set title(String value) => json["title"] = value;
    set thumbnailUrl(String value) => json["thumbnailUrl"] = value;
    set url(String value) => json["url"] = value;

}

extension type _RecommendUser(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    int get id => json['id'] as int;
    List<String> get illustIds => json['illustIds'] as List<String>;
    List<String> get novelIds => json['novelIds'] as List<String>;

// ----------- SETTERS ----------- 
    set id(int value) => json["id"] = value;
    set illustIds(List<String> value) => json["illustIds"] = value;
    set novelIds(List<String> value) => json["novelIds"] = value;

}

extension type _ContestOngoing(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get slug => json['slug'] as String;
    String get type => json['type'] as String;
    String get name => json['name'] as String;
    String get url => json['url'] as String;
    String get iconUrl => json['iconUrl'] as String;
    List<int> get workIds => json['workIds'] as List<int>;
    bool get isNew => json['isNew'] as bool;

// ----------- SETTERS ----------- 
    set slug(String value) => json["slug"] = value;
    set type(String value) => json["type"] = value;
    set name(String value) => json["name"] = value;
    set url(String value) => json["url"] = value;
    set iconUrl(String value) => json["iconUrl"] = value;
    set workIds(List<int> value) => json["workIds"] = value;
    set isNew(bool value) => json["isNew"] = value;

}

extension type _ContestResult(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get slug => json['slug'] as String;
    String get type => json['type'] as String;
    String get name => json['name'] as String;
    String get url => json['url'] as String;
    String get iconUrl => json['iconUrl'] as String;
    List<int> get winnerWorkIds => json['winnerWorkIds'] as List<int>;

// ----------- SETTERS ----------- 
    set slug(String value) => json["slug"] = value;
    set type(String value) => json["type"] = value;
    set name(String value) => json["name"] = value;
    set url(String value) => json["url"] = value;
    set iconUrl(String value) => json["iconUrl"] = value;
    set winnerWorkIds(List<int> value) => json["winnerWorkIds"] = value;

}

extension type _EditorRecommend(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get illustId => json['illustId'] as String;
    String get comment => json['comment'] as String;

// ----------- SETTERS ----------- 
    set illustId(String value) => json["illustId"] = value;
    set comment(String value) => json["comment"] = value;

}

extension type _TrendingTags(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get tag => json['tag'] as String;
    int get trendingRate => json['trendingRate'] as int;
    List<int> get ids => json['ids'] as List<int>;

// ----------- SETTERS ----------- 
    set tag(String value) => json["tag"] = value;
    set trendingRate(int value) => json["trendingRate"] = value;
    set ids(List<int> value) => json["ids"] = value;

}

extension type _Page(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<_Tags> get tags => json['tags'] as List<_Tags>;
    List<int> get follow => json['follow'] as List<int>;
    List<dynamic> get mypixiv => json['mypixiv'] as List<dynamic>;
    _Recommend get recommend => json['recommend'] as _Recommend;
    List<_RecommendByTag> get recommendByTag => json['recommendByTag'] as List<_RecommendByTag>;
    _Ranking get ranking => json['ranking'] as _Ranking;
    List<_Pixivision> get pixivision => json['pixivision'] as List<_Pixivision>;
    List<_RecommendUser> get recommendUser => json['recommendUser'] as List<_RecommendUser>;
    List<_ContestOngoing> get contestOngoing => json['contestOngoing'] as List<_ContestOngoing>;
    List<_ContestResult> get contestResult => json['contestResult'] as List<_ContestResult>;
    List<_EditorRecommend> get editorRecommend => json['editorRecommend'] as List<_EditorRecommend>;
    List<String> get boothFollowItemIds => json['boothFollowItemIds'] as List<String>;
    List<dynamic> get sketchLiveFollowIds => json['sketchLiveFollowIds'] as List<dynamic>;
    List<dynamic> get sketchLivePopularIds => json['sketchLivePopularIds'] as List<dynamic>;
    List<dynamic> get myFavoriteTags => json['myFavoriteTags'] as List<dynamic>;
    List<String> get newPost => json['newPost'] as List<String>;
    List<_TrendingTags> get trendingTags => json['trendingTags'] as List<_TrendingTags>;
    List<String> get completeRequestIds => json['completeRequestIds'] as List<String>;
    List<String> get userEventIds => json['userEventIds'] as List<String>;

// ----------- SETTERS ----------- 
    set tags(List<_Tags> value) => json["tags"] = value;
    set follow(List<int> value) => json["follow"] = value;
    set mypixiv(List<dynamic> value) => json["mypixiv"] = value;
    set recommend(_Recommend value) => json["recommend"] = value;
    set recommendByTag(List<_RecommendByTag> value) => json["recommendByTag"] = value;
    set ranking(_Ranking value) => json["ranking"] = value;
    set pixivision(List<_Pixivision> value) => json["pixivision"] = value;
    set recommendUser(List<_RecommendUser> value) => json["recommendUser"] = value;
    set contestOngoing(List<_ContestOngoing> value) => json["contestOngoing"] = value;
    set contestResult(List<_ContestResult> value) => json["contestResult"] = value;
    set editorRecommend(List<_EditorRecommend> value) => json["editorRecommend"] = value;
    set boothFollowItemIds(List<String> value) => json["boothFollowItemIds"] = value;
    set sketchLiveFollowIds(List<dynamic> value) => json["sketchLiveFollowIds"] = value;
    set sketchLivePopularIds(List<dynamic> value) => json["sketchLivePopularIds"] = value;
    set myFavoriteTags(List<dynamic> value) => json["myFavoriteTags"] = value;
    set newPost(List<String> value) => json["newPost"] = value;
    set trendingTags(List<_TrendingTags> value) => json["trendingTags"] = value;
    set completeRequestIds(List<String> value) => json["completeRequestIds"] = value;
    set userEventIds(List<String> value) => json["userEventIds"] = value;

}

extension type IllustTop(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    List<Booth> get boothItems => json['boothItems'] as List<Booth>;
    _Page get page => json['page'] as _Page;
    Map<String, TagTranslation> get tagTranslation => json['tagTranslation'] as Map<String, TagTranslation>;
    List<IllustSeries> get illustSeries => json['illustSeries'] as List<IllustSeries>;
    Thumbnails get thumbnails => json['thumbnails'] as Thumbnails;
    List<Request> get requests => json['requests'] as List<Request>;
    List<PartialUser> get users => json['users'] as List<PartialUser>;

// ----------- SETTERS ----------- 
    set boothItems(List<Booth> value) => json["boothItems"] = value;
    set page(_Page value) => json["page"] = value;
    set tagTranslation(Map<String, TagTranslation> value) => json["tagTranslation"] = value;
    set illustSeries(List<IllustSeries> value) => json["illustSeries"] = value;
    set thumbnails(Thumbnails value) => json["thumbnails"] = value;
    set requests(List<Request> value) => json["requests"] = value;
    set users(List<PartialUser> value) => json["users"] = value;

}

