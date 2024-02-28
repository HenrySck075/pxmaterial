import 'package:sofieru/json/ajax/user/PartialUser.dart' show PartialUser;
import 'Request.dart' show Request;
import 'package:sofieru/json/ajax/top/illust/PartialArtwork.dart' show PartialArtwork;
import 'package:sofieru/json/ajax/shared/TagTranslation.dart' show TagTranslation;
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
  factory _Creator.fromJson(Map<String, dynamic> json) => _Creator(
    creatorUserId: json['creatorUserId'],
    creatorStoppedFlg: json['creatorStoppedFlg'],
    requestPriceLowerLimit: json['requestPriceLowerLimit'],
    requestPriceUpperLimit: json['requestPriceUpperLimit'],
    tokusho: json['tokusho'],
  );

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
  factory _ConfettiModalStatus.fromJson(Map<String, dynamic> json) => _ConfettiModalStatus(
    inProgressFan: json['inProgressFan'],
    inProgressCreator: json['inProgressCreator'],
    completeFanOrCollaborateUser: json['completeFanOrCollaborateUser'],
  );

}

class _UserList {
  final String id;
  final List<String> illustIds;
  _UserList({
    required this.id,
    required this.illustIds,
  });
  factory _UserList.fromJson(Map<String, dynamic> json) => _UserList(
    id: json['id'],
    illustIds: (json['illustIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );

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
  factory _Twitter_card.fromJson(Map<String, dynamic> json) => _Twitter_card(
    card: json['card'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
  );

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
  factory _Meta_ogp.fromJson(Map<String, dynamic> json) => _Meta_ogp(
    type: json['type'],
    title: json['title'],
    description: json['description'],
    url: json['url'],
    image: json['image'],
  );

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
  factory _Ogp.fromJson(Map<String, dynamic> json) => _Ogp(
    twitter_card: _Twitter_card.fromJson(json['twitter_card']),
    meta_ogp: _Meta_ogp.fromJson(json['meta_ogp']),
    page_title: json['page_title'],
    description: json['description'],
  );

}

class _Page {
  final _Creator creator;
  final List<int> recommendedUserIds;
  final _ConfettiModalStatus confettiModalStatus;
  final List<_UserList> userList;
  final List<String> inProgressRequestIds;
  final List<String> completeRequestIds;
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
  factory _Page.fromJson(Map<String, dynamic> json) => _Page(
    creator: _Creator.fromJson(json['creator']),
    recommendedUserIds: (json['recommendedUserIds'] as List<dynamic>).map((e)=>e as int).toList(),
    confettiModalStatus: _ConfettiModalStatus.fromJson(json['confettiModalStatus']),
    userList: (json['userList'] as List<dynamic>).map((e)=>_UserList.fromJson(e)).toList(),
    inProgressRequestIds: (json['inProgressRequestIds'] as List<dynamic>).map((e)=>e as String).toList(),
    completeRequestIds: (json['completeRequestIds'] as List<dynamic>).map((e)=>e as String).toList(),
    alreadyRequestCollaborate: json['alreadyRequestCollaborate'],
    platformFeeCampaignLabel: json['platformFeeCampaignLabel'],
    eligibleCampaignList: (json['eligibleCampaignList'] as List<dynamic>),
    isUnlisted: json['isUnlisted'],
    ogp: _Ogp.fromJson(json['ogp']),
    locationMask: json['locationMask'],
  );

}

class _Thumbnails {
  final List<PartialArtwork> illust;
  final List<dynamic> novel;
  final List<dynamic> novelSeries;
  final List<dynamic> novelDraft;
  final List<dynamic> collection;
  _Thumbnails({
    required this.illust,
    required this.novel,
    required this.novelSeries,
    required this.novelDraft,
    required this.collection,
  });
  factory _Thumbnails.fromJson(Map<String, dynamic> json) => _Thumbnails(
    illust: (json['illust'] as List<dynamic>).map((e)=>PartialArtwork.fromJson(e)).toList(),
    novel: (json['novel'] as List<dynamic>),
    novelSeries: (json['novelSeries'] as List<dynamic>),
    novelDraft: (json['novelDraft'] as List<dynamic>),
    collection: (json['collection'] as List<dynamic>),
  );

}

class RequestPage {
  final _Page page;
  final Map<String, TagTranslation> tagTranslation;
  final _Thumbnails thumbnails;
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
  factory RequestPage.fromJson(Map<String, dynamic> json) => RequestPage(
    page: _Page.fromJson(json['page']),
    tagTranslation: (json['tagTranslation'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,TagTranslation.fromJson(v))),
    thumbnails: _Thumbnails.fromJson(json['thumbnails']),
    illustSeries: (json['illustSeries'] as List<dynamic>),
    requests: (json['requests'] as List<dynamic>).map((e)=>Request.fromJson(e)).toList(),
    users: (json['users'] as List<dynamic>).map((e)=>PartialUser.fromJson(e)).toList(),
  );

}

