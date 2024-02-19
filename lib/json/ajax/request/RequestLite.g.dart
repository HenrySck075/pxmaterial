// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestLite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestTranslationProposal _$RequestTranslationProposalFromJson(
        Map<String, dynamic> json) =>
    _RequestTranslationProposal(
      requestProposal: json['requestProposal'] as String,
      requestProposalLang: json['requestProposalLang'] as String,
    );

Map<String, dynamic> _$RequestTranslationProposalToJson(
        _RequestTranslationProposal instance) =>
    <String, dynamic>{
      'requestProposal': instance.requestProposal,
      'requestProposalLang': instance.requestProposalLang,
    };

_RequestProposal _$RequestProposalFromJson(Map<String, dynamic> json) =>
    _RequestProposal(
      requestOriginalProposal: json['requestOriginalProposal'] as String,
      requestOriginalProposalLang:
          json['requestOriginalProposalLang'] as String,
      requestTranslationProposal: (json['requestTranslationProposal']
              as List<dynamic>)
          .map((e) =>
              _RequestTranslationProposal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestProposalToJson(_RequestProposal instance) =>
    <String, dynamic>{
      'requestOriginalProposal': instance.requestOriginalProposal,
      'requestOriginalProposalLang': instance.requestOriginalProposalLang,
      'requestTranslationProposal': instance.requestTranslationProposal,
    };

_PlanTitle _$PlanTitleFromJson(Map<String, dynamic> json) => _PlanTitle(
      planOriginalTitle: json['planOriginalTitle'] as String,
      planOriginalTitleLang: json['planOriginalTitleLang'] as String,
      planTranslationTitle: json['planTranslationTitle'] as List<dynamic>,
    );

Map<String, dynamic> _$PlanTitleToJson(_PlanTitle instance) =>
    <String, dynamic>{
      'planOriginalTitle': instance.planOriginalTitle,
      'planOriginalTitleLang': instance.planOriginalTitleLang,
      'planTranslationTitle': instance.planTranslationTitle,
    };

_PlanTranslationDescriptionContent _$PlanTranslationDescriptionContentFromJson(
        Map<String, dynamic> json) =>
    _PlanTranslationDescriptionContent(
      planDescription: json['planDescription'] as String,
      planDescriptionHtml: json['planDescriptionHtml'] as String,
      planLang: json['planLang'] as String,
    );

Map<String, dynamic> _$PlanTranslationDescriptionContentToJson(
        _PlanTranslationDescriptionContent instance) =>
    <String, dynamic>{
      'planDescription': instance.planDescription,
      'planDescriptionHtml': instance.planDescriptionHtml,
      'planLang': instance.planLang,
    };

_PlanDescription _$PlanDescriptionFromJson(Map<String, dynamic> json) =>
    _PlanDescription(
      planOriginalDescription: json['planOriginalDescription'] as String,
      planOriginalDescriptionHtml:
          json['planOriginalDescriptionHtml'] as String,
      planOriginalLang: json['planOriginalLang'] as String,
      planTranslationDescription:
          (json['planTranslationDescription'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            _PlanTranslationDescriptionContent.fromJson(
                e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PlanDescriptionToJson(_PlanDescription instance) =>
    <String, dynamic>{
      'planOriginalDescription': instance.planOriginalDescription,
      'planOriginalDescriptionHtml': instance.planOriginalDescriptionHtml,
      'planOriginalLang': instance.planOriginalLang,
      'planTranslationDescription': instance.planTranslationDescription,
    };

_Plan _$PlanFromJson(Map<String, dynamic> json) => _Plan(
      currentPlanId: json['currentPlanId'] as String?,
      planId: json['planId'] as String,
      creatorUserId: json['creatorUserId'] as String,
      planAcceptRequestFlg: json['planAcceptRequestFlg'] as bool,
      planStandardPrice: json['planStandardPrice'] as int,
      planTitle: _PlanTitle.fromJson(json['planTitle'] as Map<String, dynamic>),
      planDescription: _PlanDescription.fromJson(
          json['planDescription'] as Map<String, dynamic>),
      planAcceptAdultFlg: json['planAcceptAdultFlg'] as bool,
      planAcceptAnonymousFlg: json['planAcceptAnonymousFlg'] as bool,
      planAcceptIllustFlg: json['planAcceptIllustFlg'] as bool,
      planAcceptUgoiraFlg: json['planAcceptUgoiraFlg'] as bool,
      planAcceptMangaFlg: json['planAcceptMangaFlg'] as bool,
      planAcceptNovelFlg: json['planAcceptNovelFlg'] as bool,
      planCoverImage: json['planCoverImage'] as String?,
      planAiType: json['planAiType'] as int,
    );

Map<String, dynamic> _$PlanToJson(_Plan instance) => <String, dynamic>{
      'currentPlanId': instance.currentPlanId,
      'planId': instance.planId,
      'creatorUserId': instance.creatorUserId,
      'planAcceptRequestFlg': instance.planAcceptRequestFlg,
      'planStandardPrice': instance.planStandardPrice,
      'planTitle': instance.planTitle,
      'planDescription': instance.planDescription,
      'planAcceptAdultFlg': instance.planAcceptAdultFlg,
      'planAcceptAnonymousFlg': instance.planAcceptAnonymousFlg,
      'planAcceptIllustFlg': instance.planAcceptIllustFlg,
      'planAcceptUgoiraFlg': instance.planAcceptUgoiraFlg,
      'planAcceptMangaFlg': instance.planAcceptMangaFlg,
      'planAcceptNovelFlg': instance.planAcceptNovelFlg,
      'planCoverImage': instance.planCoverImage,
      'planAiType': instance.planAiType,
    };

_Request _$RequestFromJson(Map<String, dynamic> json) => _Request(
      requestId: json['requestId'] as String,
      requestStatus: json['requestStatus'] as String,
      requestProposal: _RequestProposal.fromJson(
          json['requestProposal'] as Map<String, dynamic>),
      requestTags: (json['requestTags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      requestAdultFlg: json['requestAdultFlg'] as bool,
      requestPrice: json['requestPrice'] as int,
      role: json['role'] as String,
      postWork: json['postWork'] as String?,
      plan: _Plan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestToJson(_Request instance) => <String, dynamic>{
      'requestId': instance.requestId,
      'requestStatus': instance.requestStatus,
      'requestProposal': instance.requestProposal,
      'requestTags': instance.requestTags,
      'requestAdultFlg': instance.requestAdultFlg,
      'requestPrice': instance.requestPrice,
      'role': instance.role,
      'postWork': instance.postWork,
      'plan': instance.plan,
    };

_Creator _$CreatorFromJson(Map<String, dynamic> json) => _Creator(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      profileImg: json['profileImg'] as String,
    );

Map<String, dynamic> _$CreatorToJson(_Creator instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'profileImg': instance.profileImg,
    };

_CollaborateStatus _$CollaborateStatusFromJson(Map<String, dynamic> json) =>
    _CollaborateStatus(
      collaborating: json['collaborating'] as bool,
      collaborateAnonymousFlg: json['collaborateAnonymousFlg'] as bool,
      collaboratedCnt: json['collaboratedCnt'] as int,
      userSamples: json['userSamples'] as List<dynamic>,
    );

Map<String, dynamic> _$CollaborateStatusToJson(_CollaborateStatus instance) =>
    <String, dynamic>{
      'collaborating': instance.collaborating,
      'collaborateAnonymousFlg': instance.collaborateAnonymousFlg,
      'collaboratedCnt': instance.collaboratedCnt,
      'userSamples': instance.userSamples,
    };

RequestLite _$RequestLiteFromJson(Map<String, dynamic> json) => RequestLite(
      request: _Request.fromJson(json['request'] as Map<String, dynamic>),
      creator: _Creator.fromJson(json['creator'] as Map<String, dynamic>),
      fan: json['fan'] as String?,
      collaborateStatus: _CollaborateStatus.fromJson(
          json['collaborateStatus'] as Map<String, dynamic>),
      editable: json['editable'] as bool,
    );

Map<String, dynamic> _$RequestLiteToJson(RequestLite instance) =>
    <String, dynamic>{
      'request': instance.request,
      'creator': instance.creator,
      'fan': instance.fan,
      'collaborateStatus': instance.collaborateStatus,
      'editable': instance.editable,
    };
