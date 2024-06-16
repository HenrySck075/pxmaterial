import 'dart:convert';

import 'package:sofieru/json/base.dart' show checkFalsy;
import 'package:sofieru/shared.dart';
class _RequestTranslationProposal {
  final String requestProposal;
  final String requestProposalHtml;
  final String requestProposalLang;
  _RequestTranslationProposal({
    required this.requestProposal,
    required this.requestProposalHtml,
    required this.requestProposalLang,
  });
  factory _RequestTranslationProposal.fromJson(Map<String, dynamic> json) {
    return _RequestTranslationProposal(
    requestProposal: json['requestProposal'],
    requestProposalHtml: json['requestProposalHtml'],
    requestProposalLang: json['requestProposalLang'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "requestProposal": requestProposal,
    "requestProposalHtml": requestProposalHtml,
    "requestProposalLang": requestProposalLang,
  };
}

class _RequestProposal {
  final String requestOriginalProposal;
  final String requestOriginalProposalHtml;
  final String requestOriginalProposalLang;
  final List<_RequestTranslationProposal> requestTranslationProposal;
  _RequestProposal({
    required this.requestOriginalProposal,
    required this.requestOriginalProposalHtml,
    required this.requestOriginalProposalLang,
    required this.requestTranslationProposal,
  });
  factory _RequestProposal.fromJson(Map<String, dynamic> json) {
    return _RequestProposal(
    requestOriginalProposal: json['requestOriginalProposal'],
    requestOriginalProposalHtml: json['requestOriginalProposalHtml'],
    requestOriginalProposalLang: json['requestOriginalProposalLang'],
    requestTranslationProposal: (json['requestTranslationProposal'] as List<dynamic>).map((e)=>_RequestTranslationProposal.fromJson(e)).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "requestOriginalProposal": requestOriginalProposal,
    "requestOriginalProposalHtml": requestOriginalProposalHtml,
    "requestOriginalProposalLang": requestOriginalProposalLang,
    "requestTranslationProposal": requestTranslationProposal.map((e)=>e.toJson()).toList(),
  };
}

class _PlanTranslationTitleContent {
  final String? planTitle;
  final String? planTtieLang;
  _PlanTranslationTitleContent({
    this.planTitle,
    this.planTtieLang,
  });
  factory _PlanTranslationTitleContent.fromJson(Map<String, dynamic> json) {
    return _PlanTranslationTitleContent(
    planTitle: json['planTitle'],
    planTtieLang: json['planTtieLang'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "planTitle": planTitle,
    "planTtieLang": planTtieLang,
  };
}

class _PlanTitle {
  final String planOriginalTitle;
  final String planOriginalTitleLang;
  final Map<String, _PlanTranslationTitleContent>? planTranslationTitle;
  _PlanTitle({
    required this.planOriginalTitle,
    required this.planOriginalTitleLang,
    this.planTranslationTitle,
  });
  factory _PlanTitle.fromJson(Map<String, dynamic> json) {
    return _PlanTitle(
    planOriginalTitle: json['planOriginalTitle'],
    planOriginalTitleLang: json['planOriginalTitleLang'],
    planTranslationTitle: checkFalsy(json['planTranslationTitle'])?null:(json['planTranslationTitle'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,_PlanTranslationTitleContent.fromJson(v))),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "planOriginalTitle": planOriginalTitle,
    "planOriginalTitleLang": planOriginalTitleLang,
    "planTranslationTitle": planTranslationTitle?.map((k,v)=>MapEntry(k,v.toJson())),
  };
}

class _PlanTranslationDescriptionContent {
  final String? planDescription;
  final String? planDescriptionHtml;
  final String? planLang;
  _PlanTranslationDescriptionContent({
    this.planDescription,
    this.planDescriptionHtml,
    this.planLang,
  });
  factory _PlanTranslationDescriptionContent.fromJson(Map<String, dynamic> json) {
    return _PlanTranslationDescriptionContent(
    planDescription: json['planDescription'],
    planDescriptionHtml: json['planDescriptionHtml'],
    planLang: json['planLang'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "planDescription": planDescription,
    "planDescriptionHtml": planDescriptionHtml,
    "planLang": planLang,
  };
}

class _PlanDescription {
  final String planOriginalDescription;
  final String planOriginalDescriptionHtml;
  final String planOriginalLang;
  final Map<String, _PlanTranslationDescriptionContent>? planTranslationDescription;
  _PlanDescription({
    required this.planOriginalDescription,
    required this.planOriginalDescriptionHtml,
    required this.planOriginalLang,
    this.planTranslationDescription,
  });
  factory _PlanDescription.fromJson(Map<String, dynamic> json) {
    return _PlanDescription(
    planOriginalDescription: json['planOriginalDescription'],
    planOriginalDescriptionHtml: json['planOriginalDescriptionHtml'],
    planOriginalLang: json['planOriginalLang'],
    planTranslationDescription: checkFalsy(json['planTranslationDescription'])?null:(json['planTranslationDescription'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,_PlanTranslationDescriptionContent.fromJson(v))),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "planOriginalDescription": planOriginalDescription,
    "planOriginalDescriptionHtml": planOriginalDescriptionHtml,
    "planOriginalLang": planOriginalLang,
    "planTranslationDescription": planTranslationDescription?.map((k,v)=>MapEntry(k,v.toJson())),
  };
}

class _Urls {
  final String cover;
  final String card;
  _Urls({
    required this.cover,
    required this.card,
  });
  factory _Urls.fromJson(Map<String, dynamic> json) {
    return _Urls(
    cover: json['cover'],
    card: json['card'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "cover": cover,
    "card": card,
  };
}

class _PlanCoverImage {
  final _Urls urls;
  _PlanCoverImage({
    required this.urls,
  });
  factory _PlanCoverImage.fromJson(Map<String, dynamic> json) {
    return _PlanCoverImage(
    urls: _Urls.fromJson(json['urls']),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "urls": urls.toJson(),
  };
}

class _Plan {
  final String? currentPlanId;
  final String planId;
  final String creatorUserId;
  final bool planAcceptRequestFlg;
  final int planStandardPrice;
  final _PlanTitle planTitle;
  final _PlanDescription planDescription;
  final bool planAcceptAdultFlg;
  final bool planAcceptAnonymousFlg;
  final bool planAcceptIllustFlg;
  final bool planAcceptUgoiraFlg;
  final bool planAcceptMangaFlg;
  final bool planAcceptNovelFlg;
  final _PlanCoverImage? planCoverImage;
  final int planAiType;
  _Plan({
    required this.currentPlanId,
    required this.planId,
    required this.creatorUserId,
    required this.planAcceptRequestFlg,
    required this.planStandardPrice,
    required this.planTitle,
    required this.planDescription,
    required this.planAcceptAdultFlg,
    required this.planAcceptAnonymousFlg,
    required this.planAcceptIllustFlg,
    required this.planAcceptUgoiraFlg,
    required this.planAcceptMangaFlg,
    required this.planAcceptNovelFlg,
    this.planCoverImage,
    required this.planAiType,
  });
  factory _Plan.fromJson(Map<String, dynamic> json) {
    return _Plan(
    currentPlanId: json['currentPlanId'],
    planId: json['planId'],
    creatorUserId: json['creatorUserId'],
    planAcceptRequestFlg: json['planAcceptRequestFlg'],
    planStandardPrice: json['planStandardPrice'],
    planTitle: _PlanTitle.fromJson(json['planTitle']),
    planDescription: _PlanDescription.fromJson(json['planDescription']),
    planAcceptAdultFlg: json['planAcceptAdultFlg'],
    planAcceptAnonymousFlg: json['planAcceptAnonymousFlg'],
    planAcceptIllustFlg: json['planAcceptIllustFlg'],
    planAcceptUgoiraFlg: json['planAcceptUgoiraFlg'],
    planAcceptMangaFlg: json['planAcceptMangaFlg'],
    planAcceptNovelFlg: json['planAcceptNovelFlg'],
    planCoverImage: json['planCoverImage'] == null?null:_PlanCoverImage.fromJson(json['planCoverImage']),
    planAiType: json['planAiType'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "currentPlanId": currentPlanId,
    "planId": planId,
    "creatorUserId": creatorUserId,
    "planAcceptRequestFlg": planAcceptRequestFlg,
    "planStandardPrice": planStandardPrice,
    "planTitle": planTitle.toJson(),
    "planDescription": planDescription.toJson(),
    "planAcceptAdultFlg": planAcceptAdultFlg,
    "planAcceptAnonymousFlg": planAcceptAnonymousFlg,
    "planAcceptIllustFlg": planAcceptIllustFlg,
    "planAcceptUgoiraFlg": planAcceptUgoiraFlg,
    "planAcceptMangaFlg": planAcceptMangaFlg,
    "planAcceptNovelFlg": planAcceptNovelFlg,
    "planCoverImage": planCoverImage?.toJson(),
    "planAiType": planAiType,
  };
}

class _CollaborateStatus {
  final bool collaborating;
  final bool collaborateAnonymousFlg;
  final int collaboratedCnt;
  final List<dynamic> collaborateUserSamples;
  _CollaborateStatus({
    required this.collaborating,
    required this.collaborateAnonymousFlg,
    required this.collaboratedCnt,
    required this.collaborateUserSamples,
  });
  factory _CollaborateStatus.fromJson(Map<String, dynamic> json) {
    return _CollaborateStatus(
    collaborating: json['collaborating'],
    collaborateAnonymousFlg: json['collaborateAnonymousFlg'],
    collaboratedCnt: json['collaboratedCnt'],
    collaborateUserSamples: (json['collaborateUserSamples'] as List<dynamic>),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "collaborating": collaborating,
    "collaborateAnonymousFlg": collaborateAnonymousFlg,
    "collaboratedCnt": collaboratedCnt,
    "collaborateUserSamples": collaborateUserSamples,
  };
}

class _Work {
  final bool isUnlisted;
  final String? secret;
  _Work({
    required this.isUnlisted,
    required this.secret,
  });
  factory _Work.fromJson(Map<String, dynamic> json) {
    return _Work(
    isUnlisted: json['isUnlisted'],
    secret: json['secret'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "isUnlisted": isUnlisted,
    "secret": secret,
  };
}

class _PostWork {
  final String postWorkId;
  final String postWorkType;
  final _Work? work;
  _PostWork({
    required this.postWorkId,
    required this.postWorkType,
    this.work,
  });
  factory _PostWork.fromJson(Map<String, dynamic> json) {
    return _PostWork(
    postWorkId: json['postWorkId'],
    postWorkType: json['postWorkType'],
    work: json['work'] == null?null:_Work.fromJson(json['work']),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "postWorkId": postWorkId,
    "postWorkType": postWorkType,
    "work": work?.toJson(),
  };
}

class _Fanbox {
  final bool fanIsSupporter;
  _Fanbox({
    required this.fanIsSupporter,
  });
  factory _Fanbox.fromJson(Map<String, dynamic> json) {
    return _Fanbox(
    fanIsSupporter: json['fanIsSupporter'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "fanIsSupporter": fanIsSupporter,
  };
}

class _Modification {
  final String? requestPostWorkType;
  final String? requestAdultFlg;
  _Modification({
    required this.requestPostWorkType,
    required this.requestAdultFlg,
  });
  factory _Modification.fromJson(Map<String, dynamic> json) {
    return _Modification(
    requestPostWorkType: json['requestPostWorkType'],
    requestAdultFlg: json['requestAdultFlg'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "requestPostWorkType": requestPostWorkType,
    "requestAdultFlg": requestAdultFlg,
  };
}

class _RequestResend {
  final String? requestResendDeadlineDatetime;
  final String? requestResendOfferEnabled;
  final String? requestResendEnabled;
  final String? requestResendStatus;
  final _Modification modification;
  final String? fanAdultSendable;
  final String? isResentRequest;
  _RequestResend({
    required this.requestResendDeadlineDatetime,
    required this.requestResendOfferEnabled,
    required this.requestResendEnabled,
    required this.requestResendStatus,
    required this.modification,
    required this.fanAdultSendable,
    required this.isResentRequest,
  });
  factory _RequestResend.fromJson(Map<String, dynamic> json) {
    return _RequestResend(
    requestResendDeadlineDatetime: json['requestResendDeadlineDatetime'],
    requestResendOfferEnabled: json['requestResendOfferEnabled'],
    requestResendEnabled: json['requestResendEnabled'],
    requestResendStatus: json['requestResendStatus'],
    modification: _Modification.fromJson(json['modification']),
    fanAdultSendable: json['fanAdultSendable'],
    isResentRequest: json['isResentRequest'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "requestResendDeadlineDatetime": requestResendDeadlineDatetime,
    "requestResendOfferEnabled": requestResendOfferEnabled,
    "requestResendEnabled": requestResendEnabled,
    "requestResendStatus": requestResendStatus,
    "modification": modification.toJson(),
    "fanAdultSendable": fanAdultSendable,
    "isResentRequest": isResentRequest,
  };
}

class _FanLetter {
  final bool fanLetterArrived;
  final bool fanLetterSendEnabled;
  _FanLetter({
    required this.fanLetterArrived,
    required this.fanLetterSendEnabled,
  });
  factory _FanLetter.fromJson(Map<String, dynamic> json) {
    return _FanLetter(
    fanLetterArrived: json['fanLetterArrived'],
    fanLetterSendEnabled: json['fanLetterSendEnabled'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "fanLetterArrived": fanLetterArrived,
    "fanLetterSendEnabled": fanLetterSendEnabled,
  };
}

class Request {
  final String requestId;
  final String planId;
  final String? fanUserId;
  final String creatorUserId;
  final String requestStatus;
  final String? requestAcceptStatus;
  final String requestPostWorkType;
  final int requestPrice;
  final _RequestProposal requestProposal;
  final List<String> requestTags;
  final bool requestAdultFlg;
  final bool requestAnonymousFlg;
  final bool requestRestrictFlg;
  final bool requestAcceptCollaborateFlg;
  final String requestResponseDeadlineDatetime;
  final String requestPostDeadlineDatetime;
  final String role;
  final _Plan plan;
  final _CollaborateStatus collaborateStatus;
  final String? giftFile;
  final _PostWork? postWork;
  final String? notifyBadge;
  final _Fanbox? fanbox;
  final _RequestResend? requestResend;
  final _FanLetter? fanLetter;
  Request({
    required this.requestId,
    required this.planId,
    required this.fanUserId,
    required this.creatorUserId,
    required this.requestStatus,
    this.requestAcceptStatus,
    required this.requestPostWorkType,
    required this.requestPrice,
    required this.requestProposal,
    required this.requestTags,
    required this.requestAdultFlg,
    required this.requestAnonymousFlg,
    required this.requestRestrictFlg,
    required this.requestAcceptCollaborateFlg,
    required this.requestResponseDeadlineDatetime,
    required this.requestPostDeadlineDatetime,
    required this.role,
    required this.plan,
    required this.collaborateStatus,
    required this.giftFile,
    this.postWork,
    required this.notifyBadge,
    this.fanbox,
    this.requestResend,
    this.fanLetter,
  });
  factory Request.fromJson(Map<String, dynamic> json) {
    printWrapped(JsonEncoder.withIndent("  ").convert(json));
    return Request(
    requestId: json['requestId'],
    planId: json['planId'],
    fanUserId: json['fanUserId'],
    creatorUserId: json['creatorUserId'],
    requestStatus: json['requestStatus'],
    requestAcceptStatus: json['requestAcceptStatus'],
    requestPostWorkType: json['requestPostWorkType'],
    requestPrice: json['requestPrice'],
    requestProposal: _RequestProposal.fromJson(json['requestProposal']),
    requestTags: (json['requestTags'] as List<dynamic>).map((e)=>e as String).toList(),
    requestAdultFlg: json['requestAdultFlg'],
    requestAnonymousFlg: json['requestAnonymousFlg'],
    requestRestrictFlg: json['requestRestrictFlg'],
    requestAcceptCollaborateFlg: json['requestAcceptCollaborateFlg'],
    requestResponseDeadlineDatetime: json['requestResponseDeadlineDatetime'],
    requestPostDeadlineDatetime: json['requestPostDeadlineDatetime'],
    role: json['role'],
    plan: _Plan.fromJson(json['plan']),
    collaborateStatus: _CollaborateStatus.fromJson(json['collaborateStatus']),
    giftFile: json['giftFile'],
    postWork: json['postWork'] == null?null:_PostWork.fromJson(json['postWork']),
    notifyBadge: json['notifyBadge'],
    fanbox: json['fanbox'] == null?null:_Fanbox.fromJson(json['fanbox']),
    requestResend: json['requestResend'] == null?null:_RequestResend.fromJson(json['requestResend']),
    fanLetter: json['fanLetter'] == null?null:_FanLetter.fromJson(json['fanLetter']),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "requestId": requestId,
    "planId": planId,
    "fanUserId": fanUserId,
    "creatorUserId": creatorUserId,
    "requestStatus": requestStatus,
    "requestAcceptStatus": requestAcceptStatus,
    "requestPostWorkType": requestPostWorkType,
    "requestPrice": requestPrice,
    "requestProposal": requestProposal.toJson(),
    "requestTags": requestTags,
    "requestAdultFlg": requestAdultFlg,
    "requestAnonymousFlg": requestAnonymousFlg,
    "requestRestrictFlg": requestRestrictFlg,
    "requestAcceptCollaborateFlg": requestAcceptCollaborateFlg,
    "requestResponseDeadlineDatetime": requestResponseDeadlineDatetime,
    "requestPostDeadlineDatetime": requestPostDeadlineDatetime,
    "role": role,
    "plan": plan.toJson(),
    "collaborateStatus": collaborateStatus.toJson(),
    "giftFile": giftFile,
    "postWork": postWork?.toJson(),
    "notifyBadge": notifyBadge,
    "fanbox": fanbox?.toJson(),
    "requestResend": requestResend?.toJson(),
    "fanLetter": fanLetter?.toJson(),
  };
}

