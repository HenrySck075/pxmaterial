import 'package:json_annotation/json_annotation.dart';
part 'Request.g.dart';

@JsonSerializable()
class _RequestTranslationProposal {
  final String requestProposal;
  final String requestProposalHtml;
  final String requestProposalLang;
  _RequestTranslationProposal({
    required this.requestProposal,
    required this.requestProposalHtml,
    required this.requestProposalLang,
  });

  factory _RequestTranslationProposal.fromJson(Map<String, dynamic> json) => _$RequestTranslationProposalFromJson(json);
  Map<String, dynamic> toJson() => _$RequestTranslationProposalToJson(this);
}
@JsonSerializable()
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

  factory _RequestProposal.fromJson(Map<String, dynamic> json) => _$RequestProposalFromJson(json);
  Map<String, dynamic> toJson() => _$RequestProposalToJson(this);
}
@JsonSerializable()
class _PlanTranslationTitleContent {
  final String planTitle;
  final String planTtieLang;
  _PlanTranslationTitleContent({
    required this.planTitle,
    required this.planTtieLang,
  });

  factory _PlanTranslationTitleContent.fromJson(Map<String, dynamic> json) => _$PlanTranslationTitleContentFromJson(json);
  Map<String, dynamic> toJson() => _$PlanTranslationTitleContentToJson(this);
}
@JsonSerializable()
class _PlanTitle {
  final String planOriginalTitle;
  final String planOriginalTitleLang;
  final Map<String, _PlanTranslationTitleContent> planTranslationTitle;
  _PlanTitle({
    required this.planOriginalTitle,
    required this.planOriginalTitleLang,
    required this.planTranslationTitle,
  });

  factory _PlanTitle.fromJson(Map<String, dynamic> json) => _$PlanTitleFromJson(json);
  Map<String, dynamic> toJson() => _$PlanTitleToJson(this);
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
  Map<String, dynamic> toJson() => _$PlanTranslationDescriptionContentToJson(this);
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
  Map<String, dynamic> toJson() => _$PlanDescriptionToJson(this);
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
  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
@JsonSerializable()
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

  factory _CollaborateStatus.fromJson(Map<String, dynamic> json) => _$CollaborateStatusFromJson(json);
  Map<String, dynamic> toJson() => _$CollaborateStatusToJson(this);
}
@JsonSerializable()
class _Work {
  final bool isUnlisted;
  final String? secret;
  _Work({
    required this.isUnlisted,
    this.secret,
  });

  factory _Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);
  Map<String, dynamic> toJson() => _$WorkToJson(this);
}
@JsonSerializable()
class _PostWork {
  final String postWorkId;
  final String postWorkType;
  final _Work work;
  _PostWork({
    required this.postWorkId,
    required this.postWorkType,
    required this.work,
  });

  factory _PostWork.fromJson(Map<String, dynamic> json) => _$PostWorkFromJson(json);
  Map<String, dynamic> toJson() => _$PostWorkToJson(this);
}
@JsonSerializable()
class Request {
  final String requestId;
  final String planId;
  final String fanUserId;
  final String creatorUserId;
  final String requestStatus;
  final String requestAcceptStatus;
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
  final _PostWork postWork;
  Request({
    required this.requestId,
    required this.planId,
    required this.fanUserId,
    required this.creatorUserId,
    required this.requestStatus,
    required this.requestAcceptStatus,
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
    required this.postWork,
  });

  factory Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
