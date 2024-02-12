// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestTranslationProposal _$RequestTranslationProposalFromJson(
        Map<String, dynamic> json) =>
    _RequestTranslationProposal(
      requestProposal: json['requestProposal'] as String,
      requestProposalHtml: json['requestProposalHtml'] as String,
      requestProposalLang: json['requestProposalLang'] as String,
    );

Map<String, dynamic> _$RequestTranslationProposalToJson(
        _RequestTranslationProposal instance) =>
    <String, dynamic>{
      'requestProposal': instance.requestProposal,
      'requestProposalHtml': instance.requestProposalHtml,
      'requestProposalLang': instance.requestProposalLang,
    };

_RequestProposal _$RequestProposalFromJson(Map<String, dynamic> json) =>
    _RequestProposal(
      requestOriginalProposal: json['requestOriginalProposal'] as String,
      requestOriginalProposalHtml:
          json['requestOriginalProposalHtml'] as String,
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
      'requestOriginalProposalHtml': instance.requestOriginalProposalHtml,
      'requestOriginalProposalLang': instance.requestOriginalProposalLang,
      'requestTranslationProposal': instance.requestTranslationProposal,
    };

_PlanTranslationTitleContent _$PlanTranslationTitleContentFromJson(
        Map<String, dynamic> json) =>
    _PlanTranslationTitleContent(
      planTitle: json['planTitle'] as String,
      planTtieLang: json['planTtieLang'] as String,
    );

Map<String, dynamic> _$PlanTranslationTitleContentToJson(
        _PlanTranslationTitleContent instance) =>
    <String, dynamic>{
      'planTitle': instance.planTitle,
      'planTtieLang': instance.planTtieLang,
    };

_PlanTitle _$PlanTitleFromJson(Map<String, dynamic> json) => _PlanTitle(
      planOriginalTitle: json['planOriginalTitle'] as String,
      planOriginalTitleLang: json['planOriginalTitleLang'] as String,
      planTranslationTitle:
          ifNullfies<Map<String, dynamic>>(json['planTranslationTitle'])?.map(
        (k, e) => MapEntry(k,
            _PlanTranslationTitleContent.fromJson(e as Map<String, dynamic>)),
      ),
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
      planCoverImage: json['planCoverImage'] as Map<String, dynamic>?,
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

_CollaborateStatus _$CollaborateStatusFromJson(Map<String, dynamic> json) =>
    _CollaborateStatus(
      collaborating: json['collaborating'] as bool,
      collaborateAnonymousFlg: json['collaborateAnonymousFlg'] as bool,
      collaboratedCnt: json['collaboratedCnt'] as int,
      collaborateUserSamples: json['collaborateUserSamples'] as List<dynamic>,
    );

Map<String, dynamic> _$CollaborateStatusToJson(_CollaborateStatus instance) =>
    <String, dynamic>{
      'collaborating': instance.collaborating,
      'collaborateAnonymousFlg': instance.collaborateAnonymousFlg,
      'collaboratedCnt': instance.collaboratedCnt,
      'collaborateUserSamples': instance.collaborateUserSamples,
    };

_Work _$WorkFromJson(Map<String, dynamic> json) => _Work(
      isUnlisted: json['isUnlisted'] as bool,
      secret: json['secret'] as String?,
    );

Map<String, dynamic> _$WorkToJson(_Work instance) => <String, dynamic>{
      'isUnlisted': instance.isUnlisted,
      'secret': instance.secret,
    };

_PostWork _$PostWorkFromJson(Map<String, dynamic> json) => _PostWork(
      postWorkId: json['postWorkId'] as String,
      postWorkType: json['postWorkType'] as String,
      work: json['work'] == null
          ? null
          : _Work.fromJson(json['work'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostWorkToJson(_PostWork instance) => <String, dynamic>{
      'postWorkId': instance.postWorkId,
      'postWorkType': instance.postWorkType,
      'work': instance.work,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      requestId: json['requestId'] as String,
      planId: json['planId'] as String,
      fanUserId: json['fanUserId'] as String?,
      creatorUserId: json['creatorUserId'] as String,
      requestStatus: json['requestStatus'] as String,
      requestAcceptStatus: json['requestAcceptStatus'] as String,
      requestPostWorkType: json['requestPostWorkType'] as String,
      requestPrice: json['requestPrice'] as int,
      requestProposal: _RequestProposal.fromJson(
          json['requestProposal'] as Map<String, dynamic>),
      requestTags: (json['requestTags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      requestAdultFlg: json['requestAdultFlg'] as bool,
      requestAnonymousFlg: json['requestAnonymousFlg'] as bool,
      requestRestrictFlg: json['requestRestrictFlg'] as bool,
      requestAcceptCollaborateFlg: json['requestAcceptCollaborateFlg'] as bool,
      requestResponseDeadlineDatetime:
          json['requestResponseDeadlineDatetime'] as String,
      requestPostDeadlineDatetime:
          json['requestPostDeadlineDatetime'] as String,
      role: json['role'] as String,
      plan: _Plan.fromJson(json['plan'] as Map<String, dynamic>),
      collaborateStatus: _CollaborateStatus.fromJson(
          json['collaborateStatus'] as Map<String, dynamic>),
      postWork: _PostWork.fromJson(json['postWork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'requestId': instance.requestId,
      'planId': instance.planId,
      'fanUserId': instance.fanUserId,
      'creatorUserId': instance.creatorUserId,
      'requestStatus': instance.requestStatus,
      'requestAcceptStatus': instance.requestAcceptStatus,
      'requestPostWorkType': instance.requestPostWorkType,
      'requestPrice': instance.requestPrice,
      'requestProposal': instance.requestProposal,
      'requestTags': instance.requestTags,
      'requestAdultFlg': instance.requestAdultFlg,
      'requestAnonymousFlg': instance.requestAnonymousFlg,
      'requestRestrictFlg': instance.requestRestrictFlg,
      'requestAcceptCollaborateFlg': instance.requestAcceptCollaborateFlg,
      'requestResponseDeadlineDatetime':
          instance.requestResponseDeadlineDatetime,
      'requestPostDeadlineDatetime': instance.requestPostDeadlineDatetime,
      'role': instance.role,
      'plan': instance.plan,
      'collaborateStatus': instance.collaborateStatus,
      'postWork': instance.postWork,
    };
