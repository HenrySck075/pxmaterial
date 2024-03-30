import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'Request.dart' show Request;
import 'package:sofieru/json/ajax/shared/Thumbnails.dart' show Thumbnails;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
import 'package:sofieru/json/ajax/shared/UserEmbed.dart' show UserEmbed;
class _Creator {
  final String creatorUserId;
  final bool creatorStoppedFlg;
  final int requestPriceLowerLimit;
  final int requestPriceUpperLimit;
  final String? tokusho;
  _Creator({
    required this.creatorUserId,
    required this.creatorStoppedFlg,
    required this.requestPriceLowerLimit,
    required this.requestPriceUpperLimit,
    this.tokusho,
  });
  factory _Creator.fromJson(Map<String, dynamic> json) {
    return _Creator(
    creatorUserId: json['creatorUserId'],
    creatorStoppedFlg: json['creatorStoppedFlg'],
    requestPriceLowerLimit: json['requestPriceLowerLimit'],
    requestPriceUpperLimit: json['requestPriceUpperLimit'],
    tokusho: json['tokusho'],
  );}

}

class _ConfettiModalStatus {
  final bool inProgressFan;
  final bool inProgressCreator;
  final bool completeFanOrCollaborateUser;
  _ConfettiModalStatus({
    required this.inProgressFan,
    required this.inProgressCreator,
    required this.completeFanOrCollaborateUser,
  });
  factory _ConfettiModalStatus.fromJson(Map<String, dynamic> json) {
    return _ConfettiModalStatus(
    inProgressFan: json['inProgressFan'],
    inProgressCreator: json['inProgressCreator'],
    completeFanOrCollaborateUser: json['completeFanOrCollaborateUser'],
  );}

}

class _Twitter_card {
  final String card;
  final String title;
  final String description;
  final String image;
  _Twitter_card({
    required this.card,
    required this.title,
    required this.description,
    required this.image,
  });
  factory _Twitter_card.fromJson(Map<String, dynamic> json) {
    return _Twitter_card(
    card: json['card'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
  );}

}

class _Meta_ogp {
  final String type;
  final String title;
  final String description;
  final String url;
  final String image;
  _Meta_ogp({
    required this.type,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
  });
  factory _Meta_ogp.fromJson(Map<String, dynamic> json) {
    return _Meta_ogp(
    type: json['type'],
    title: json['title'],
    description: json['description'],
    url: json['url'],
    image: json['image'],
  );}

}

class _Ogp {
  final _Twitter_card twitter_card;
  final _Meta_ogp meta_ogp;
  final String page_title;
  final String description;
  _Ogp({
    required this.twitter_card,
    required this.meta_ogp,
    required this.page_title,
    required this.description,
  });
  factory _Ogp.fromJson(Map<String, dynamic> json) {
    return _Ogp(
    twitter_card: _Twitter_card.fromJson(json['twitter_card']),
    meta_ogp: _Meta_ogp.fromJson(json['meta_ogp']),
    page_title: json['page_title'],
    description: json['description'],
  );}

}

class _Page {
  final _Creator creator;
  final List<int> recommendedUserIds;
  final _ConfettiModalStatus confettiModalStatus;
  final List<UserEmbed> userList;
  final List<String> inProgressRequestIds;
  final List<dynamic> completeRequestIds;
  final bool alreadyRequestCollaborate;
  final String? platformFeeCampaignLabel;
  final List<dynamic> eligibleCampaignList;
  final bool isUnlisted;
  final _Ogp ogp;
  final bool locationMask;
  _Page({
    required this.creator,
    required this.recommendedUserIds,
    required this.confettiModalStatus,
    required this.userList,
    required this.inProgressRequestIds,
    required this.completeRequestIds,
    required this.alreadyRequestCollaborate,
    this.platformFeeCampaignLabel,
    required this.eligibleCampaignList,
    required this.isUnlisted,
    required this.ogp,
    required this.locationMask,
  });
  factory _Page.fromJson(Map<String, dynamic> json) {
    return _Page(
    creator: _Creator.fromJson(json['creator']),
    recommendedUserIds: (json['recommendedUserIds'] as List<dynamic>).map((e)=>e as int).toList(),
    confettiModalStatus: _ConfettiModalStatus.fromJson(json['confettiModalStatus']),
    userList: (json['userList'] as List<dynamic>).map((e)=>UserEmbed.fromJson(e)).toList(),
    inProgressRequestIds: (json['inProgressRequestIds'] as List<dynamic>).map((e)=>e as String).toList(),
    completeRequestIds: (json['completeRequestIds'] as List<dynamic>),
    alreadyRequestCollaborate: json['alreadyRequestCollaborate'],
    platformFeeCampaignLabel: json['platformFeeCampaignLabel'],
    eligibleCampaignList: (json['eligibleCampaignList'] as List<dynamic>),
    isUnlisted: json['isUnlisted'],
    ogp: _Ogp.fromJson(json['ogp']),
    locationMask: json['locationMask'],
  );}

}

class RequestPage {
  final _Page page;
  final Map<String, TagTranslation> tagTranslation;
  final Thumbnails thumbnails;
  final List<dynamic> illustSeries;
  final List<Request> requests;
  final List<PartialUser> users;
  RequestPage({
    required this.page,
    required this.tagTranslation,
    required this.thumbnails,
    required this.illustSeries,
    required this.requests,
    required this.users,
  });
  factory RequestPage.fromJson(Map<String, dynamic> json) {
    return RequestPage(
    page: _Page.fromJson(json['page']),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    thumbnails: Thumbnails.fromJson(json['thumbnails']),
    illustSeries: (json['illustSeries'] as List<dynamic>),
    requests: (json['requests'] as List<dynamic>).map((e)=>Request.fromJson(e)).toList(),
    users: (json['users'] as List<dynamic>).map((e)=>PartialUser.fromJson(e)).toList(),
  );}

}

