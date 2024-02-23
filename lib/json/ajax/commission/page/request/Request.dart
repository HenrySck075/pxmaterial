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
    requestProposal: json['requestProposal'] as String,
    requestProposalHtml: json['requestProposalHtml'] as String,
    requestProposalLang: json['requestProposalLang'] as String,
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
    requestOriginalProposal: json['requestOriginalProposal'] as String,
    requestOriginalProposalHtml: json['requestOriginalProposalHtml'] as String,
    requestOriginalProposalLang: json['requestOriginalProposalLang'] as String,
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
    planTitle: json['planTitle'] as String,
    planTtieLang: json['planTtieLang'] as String,
  );
  
}

class _PlanTitle {
  final String planOriginalTitle;
  final String planOriginalTitleLang;
  final Map<String, _PlanTranslationTitleContent> planTranslationTitle;
  _PlanTitle({
    required this.planOriginalTitle,
    required this.planOriginalTitleLang,
    required this.planTranslationTitle,
  });
  factory _PlanTitle.fromJson(Map<String, dynamic> json) => _PlanTitle(
    planOriginalTitle: json['planOriginalTitle'] as String,
    planOriginalTitleLang: json['planOriginalTitleLang'] as String,
    planTranslationTitle: json['planTranslationTitle'].map((k,v)=>MapEntry(k,_PlanTranslationTitleContent.fromJson(v))),
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
    planDescription: json['planDescription'] as String,
    planDescriptionHtml: json['planDescriptionHtml'] as String,
    planLang: json['planLang'] as String,
  );
  
}

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
  factory _PlanDescription.fromJson(Map<String, dynamic> json) => _PlanDescription(
    planOriginalDescription: json['planOriginalDescription'] as String,
    planOriginalDescriptionHtml: json['planOriginalDescriptionHtml'] as String,
    planOriginalLang: json['planOriginalLang'] as String,
    planTranslationDescription: json['planTranslationDescription'].map((k,v)=>MapEntry(k,_PlanTranslationDescriptionContent.fromJson(v))),
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
    currentPlanId: json['currentPlanId'] as String,
    planId: json['planId'] as String,
    creatorUserId: json['creatorUserId'] as String,
    planAcceptRequestFlg: json['planAcceptRequestFlg'] as bool,
    planStandardPrice: json['planStandardPrice'] as int,
    planTitle: _PlanTitle.fromJson(json['planTitle']),
    planDescription: _PlanDescription.fromJson(json['planDescription']),
    planAcceptAdultFlg: json['planAcceptAdultFlg'] as bool,
    planAcceptAnonymousFlg: json['planAcceptAnonymousFlg'] as bool,
    planAcceptIllustFlg: json['planAcceptIllustFlg'] as bool,
    planAcceptUgoiraFlg: json['planAcceptUgoiraFlg'] as bool,
    planAcceptMangaFlg: json['planAcceptMangaFlg'] as bool,
    planAcceptNovelFlg: json['planAcceptNovelFlg'] as bool,
    planCoverImage: json['planCoverImage'] as String,
    planAiType: json['planAiType'] as int,
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
    collaborating: json['collaborating'] as bool,
    collaborateAnonymousFlg: json['collaborateAnonymousFlg'] as bool,
    collaboratedCnt: json['collaboratedCnt'] as int,
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
    isUnlisted: json['isUnlisted'] as bool,
    secret: json['secret'] as String,
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
    postWorkId: json['postWorkId'] as String,
    postWorkType: json['postWorkType'] as String,
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
    requestId: json['requestId'] as String,
    planId: json['planId'] as String,
    fanUserId: json['fanUserId'] as String,
    creatorUserId: json['creatorUserId'] as String,
    requestStatus: json['requestStatus'] as String,
    requestAcceptStatus: json['requestAcceptStatus'] as String,
    requestPostWorkType: json['requestPostWorkType'] as String,
    requestPrice: json['requestPrice'] as int,
    requestProposal: json['requestProposal'] is List?null:_RequestProposal.fromJson(json['requestProposal']),
    requestTags: json['requestTags'],
    requestAdultFlg: json['requestAdultFlg'] as bool,
    requestAnonymousFlg: json['requestAnonymousFlg'] as bool,
    requestRestrictFlg: json['requestRestrictFlg'] as bool,
    requestAcceptCollaborateFlg: json['requestAcceptCollaborateFlg'] as bool,
    requestResponseDeadlineDatetime: json['requestResponseDeadlineDatetime'] as String,
    requestPostDeadlineDatetime: json['requestPostDeadlineDatetime'] as String,
    role: json['role'] as String,
    plan: _Plan.fromJson(json['plan']),
    collaborateStatus: _CollaborateStatus.fromJson(json['collaborateStatus']),
    postWork: _PostWork.fromJson(json['postWork']),
  );
  
}

