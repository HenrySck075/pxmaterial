import 'package:json_annotation/json_annotation.dart';
part 'RequestLite.g.dart';

@JsonSerializable()
class _RequestTranslationProposal {
  final String requestProposal;
  final String requestProposalLang;
  _RequestTranslationProposal({
    required this.requestProposal,
    required this.requestProposalLang,
  });

  factory _RequestTranslationProposal.fromJson(Map<String, dynamic> json) => _$RequestTranslationProposalFromJson(json);
  
}
@JsonSerializable()
class _RequestProposal {
  final String requestOriginalProposal;
  final String requestOriginalProposalLang;
  final List<_RequestTranslationProposal> requestTranslationProposal;
  _RequestProposal({
    required this.requestOriginalProposal,
    required this.requestOriginalProposalLang,
    required this.requestTranslationProposal,
  });

  factory _RequestProposal.fromJson(Map<String, dynamic> json) => _$RequestProposalFromJson(json);
  
}
@JsonSerializable()
class _PlanTitle {
  final String planOriginalTitle;
  final String planOriginalTitleLang;
  final List<dynamic> planTranslationTitle;
  _PlanTitle({
    required this.planOriginalTitle,
    required this.planOriginalTitleLang,
    required this.planTranslationTitle,
  });

  factory _PlanTitle.fromJson(Map<String, dynamic> json) => _$PlanTitleFromJson(json);
  
}
@JsonSerializable()
class _PlanTranslationDescriptionContent {
  final String planDescription;
  final String planDescriptionHtml;
  final String planLang;
  _PlanTranslationDescriptionContent({
    required this.planDescription,
    required this.planDescriptionHtml,
    required this.planLang,
  });

  factory _PlanTranslationDescriptionContent.fromJson(Map<String, dynamic> json) => _$PlanTranslationDescriptionContentFromJson(json);
  
}
@JsonSerializable()
class _PlanDescription {
  final String planOriginalDescription;
  final String planOriginalDescriptionHtml;
  final String planOriginalLang;
  final Map<String, _PlanTranslationDescriptionContent> planTranslationDescription;
  _PlanDescription({
    required this.planOriginalDescription,
    required this.planOriginalDescriptionHtml,
    required this.planOriginalLang,
    required this.planTranslationDescription,
  });

  factory _PlanDescription.fromJson(Map<String, dynamic> json) => _$PlanDescriptionFromJson(json);
  
}
@JsonSerializable()
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
  final String? planCoverImage;
  final int planAiType;
  _Plan({
    this.currentPlanId,
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

  factory _Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
  
}
@JsonSerializable()
class _Request {
  final String requestId;
  final String requestStatus;
  final _RequestProposal requestProposal;
  final List<String> requestTags;
  final bool requestAdultFlg;
  final int requestPrice;
  final String role;
  final String? postWork;
  final _Plan plan;
  _Request({
    required this.requestId,
    required this.requestStatus,
    required this.requestProposal,
    required this.requestTags,
    required this.requestAdultFlg,
    required this.requestPrice,
    required this.role,
    this.postWork,
    required this.plan,
  });

  factory _Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);
  
}
@JsonSerializable()
class _Creator {
  final String userId;
  final String userName;
  final String profileImg;
  _Creator({
    required this.userId,
    required this.userName,
    required this.profileImg,
  });

  factory _Creator.fromJson(Map<String, dynamic> json) => _$CreatorFromJson(json);
  
}
@JsonSerializable()
class _CollaborateStatus {
  final bool collaborating;
  final bool collaborateAnonymousFlg;
  final int collaboratedCnt;
  final List<dynamic> userSamples;
  _CollaborateStatus({
    required this.collaborating,
    required this.collaborateAnonymousFlg,
    required this.collaboratedCnt,
    required this.userSamples,
  });

  factory _CollaborateStatus.fromJson(Map<String, dynamic> json) => _$CollaborateStatusFromJson(json);
  
}
@JsonSerializable()
class RequestLite {
  final _Request request;
  final _Creator creator;
  final String? fan;
  final _CollaborateStatus collaborateStatus;
  final bool editable;
  RequestLite({
    required this.request,
    required this.creator,
    this.fan,
    required this.collaborateStatus,
    required this.editable,
  });

  factory RequestLite.fromJson(Map<String, dynamic> json) => _$RequestLiteFromJson(json);
  
}
