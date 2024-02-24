class _RequestTranslationProposal {
  final String requestProposal;
  final String requestProposalHtml;
  final String requestProposalLang;
  _RequestTranslationProposal({
    required this.requestProposal,
    required this.requestProposalHtml,
    required this.requestProposalLang,
  });
  factory _RequestTranslationProposal.fromJson(Map<String, dynamic> json) => _RequestTranslationProposal(
    requestProposal: json['requestProposal'],
    requestProposalHtml: json['requestProposalHtml'],
    requestProposalLang: json['requestProposalLang'],
  );
  
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
  factory _RequestProposal.fromJson(Map<String, dynamic> json) => _RequestProposal(
    requestOriginalProposal: json['requestOriginalProposal'],
    requestOriginalProposalHtml: json['requestOriginalProposalHtml'],
    requestOriginalProposalLang: json['requestOriginalProposalLang'],
    requestTranslationProposal: json['requestTranslationProposal'].map((e)=>_RequestTranslationProposal.fromJson(e)).toList(),
  );
  
}

class _PlanTranslationTitleContent {
  final String planTitle;
  final String planTtieLang;
  _PlanTranslationTitleContent({
    required this.planTitle,
    required this.planTtieLang,
  });
  factory _PlanTranslationTitleContent.fromJson(Map<String, dynamic> json) => _PlanTranslationTitleContent(
    planTitle: json['planTitle'],
    planTtieLang: json['planTtieLang'],
  );
  
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
  factory _PlanTitle.fromJson(Map<String, dynamic> json) => _PlanTitle(
    planOriginalTitle: json['planOriginalTitle'],
    planOriginalTitleLang: json['planOriginalTitleLang'],
    planTranslationTitle: json['planTranslationTitle'] is List?null:json['planTranslationTitle'].map((k,v)=>MapEntry(k as String,_PlanTranslationTitleContent.fromJson(v))),
  );
  
}

class _PlanTranslationDescriptionContent {
  final String planDescription;
  final String planDescriptionHtml;
  final String planLang;
  _PlanTranslationDescriptionContent({
    required this.planDescription,
    required this.planDescriptionHtml,
    required this.planLang,
  });
  factory _PlanTranslationDescriptionContent.fromJson(Map<String, dynamic> json) => _PlanTranslationDescriptionContent(
    planDescription: json['planDescription'],
    planDescriptionHtml: json['planDescriptionHtml'],
    planLang: json['planLang'],
  );
  
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
  factory _PlanDescription.fromJson(Map<String, dynamic> json) => _PlanDescription(
    planOriginalDescription: json['planOriginalDescription'],
    planOriginalDescriptionHtml: json['planOriginalDescriptionHtml'],
    planOriginalLang: json['planOriginalLang'],
    planTranslationDescription: json['planTranslationDescription'] is List?null:json['planTranslationDescription'].map((k,v)=>MapEntry(k as String,_PlanTranslationDescriptionContent.fromJson(v))),
  );
  
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
  factory _Plan.fromJson(Map<String, dynamic> json) => _Plan(
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
    planCoverImage: json['planCoverImage'],
    planAiType: json['planAiType'],
  );
  
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
  factory _CollaborateStatus.fromJson(Map<String, dynamic> json) => _CollaborateStatus(
    collaborating: json['collaborating'],
    collaborateAnonymousFlg: json['collaborateAnonymousFlg'],
    collaboratedCnt: json['collaboratedCnt'],
    collaborateUserSamples: json['collaborateUserSamples'],
  );
  
}

class _Work {
  final bool isUnlisted;
  final String? secret;
  _Work({
    required this.isUnlisted,
    this.secret,
  });
  factory _Work.fromJson(Map<String, dynamic> json) => _Work(
    isUnlisted: json['isUnlisted'],
    secret: json['secret'],
  );
  
}

class _PostWork {
  final String postWorkId;
  final String postWorkType;
  final _Work work;
  _PostWork({
    required this.postWorkId,
    required this.postWorkType,
    required this.work,
  });
  factory _PostWork.fromJson(Map<String, dynamic> json) => _PostWork(
    postWorkId: json['postWorkId'],
    postWorkType: json['postWorkType'],
    work: _Work.fromJson(json['work']),
  );
  
}

class Request {
  final String requestId;
  final String planId;
  final String? fanUserId;
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
    this.fanUserId,
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
  factory Request.fromJson(Map<String, dynamic> json) => Request(
    requestId: json['requestId'],
    planId: json['planId'],
    fanUserId: json['fanUserId'],
    creatorUserId: json['creatorUserId'],
    requestStatus: json['requestStatus'],
    requestAcceptStatus: json['requestAcceptStatus'],
    requestPostWorkType: json['requestPostWorkType'],
    requestPrice: json['requestPrice'],
    requestProposal: _RequestProposal.fromJson(json['requestProposal']),
    requestTags: json['requestTags'],
    requestAdultFlg: json['requestAdultFlg'],
    requestAnonymousFlg: json['requestAnonymousFlg'],
    requestRestrictFlg: json['requestRestrictFlg'],
    requestAcceptCollaborateFlg: json['requestAcceptCollaborateFlg'],
    requestResponseDeadlineDatetime: json['requestResponseDeadlineDatetime'],
    requestPostDeadlineDatetime: json['requestPostDeadlineDatetime'],
    role: json['role'],
    plan: _Plan.fromJson(json['plan']),
    collaborateStatus: _CollaborateStatus.fromJson(json['collaborateStatus']),
    postWork: _PostWork.fromJson(json['postWork']),
  );
  
}

