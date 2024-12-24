import 'package:sofieru/json/base.dart' show checkFalsy;
extension type _RequestTranslationProposal(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get requestProposal => json['requestProposal'] as String;
    String get requestProposalHtml => json['requestProposalHtml'] as String;
    String get requestProposalLang => json['requestProposalLang'] as String;

// ----------- SETTERS ----------- 
    set requestProposal(String value) => json["requestProposal"] = value;
    set requestProposalHtml(String value) => json["requestProposalHtml"] = value;
    set requestProposalLang(String value) => json["requestProposalLang"] = value;

}

extension type _RequestProposal(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get requestOriginalProposal => json['requestOriginalProposal'] as String;
    String get requestOriginalProposalHtml => json['requestOriginalProposalHtml'] as String;
    String get requestOriginalProposalLang => json['requestOriginalProposalLang'] as String;
    List<_RequestTranslationProposal> get requestTranslationProposal => json['requestTranslationProposal'] as List<_RequestTranslationProposal>;

// ----------- SETTERS ----------- 
    set requestOriginalProposal(String value) => json["requestOriginalProposal"] = value;
    set requestOriginalProposalHtml(String value) => json["requestOriginalProposalHtml"] = value;
    set requestOriginalProposalLang(String value) => json["requestOriginalProposalLang"] = value;
    set requestTranslationProposal(List<_RequestTranslationProposal> value) => json["requestTranslationProposal"] = value;

}

extension type _PlanTranslationTitleContent(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String? get planTitle => json['planTitle'];
    String? get planTtieLang => json['planTtieLang'];

// ----------- SETTERS ----------- 
    set planTitle(String? value) => json["planTitle"] = value;
    set planTtieLang(String? value) => json["planTtieLang"] = value;

}

extension type _PlanTitle(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get planOriginalTitle => json['planOriginalTitle'] as String;
    String get planOriginalTitleLang => json['planOriginalTitleLang'] as String;
    Map<String, _PlanTranslationTitleContent>? get planTranslationTitle => checkFalsy(json['planTranslationTitle'])?null:json['planTranslationTitle'] as Map<String, _PlanTranslationTitleContent>?;

// ----------- SETTERS ----------- 
    set planOriginalTitle(String value) => json["planOriginalTitle"] = value;
    set planOriginalTitleLang(String value) => json["planOriginalTitleLang"] = value;
    set planTranslationTitle(Map<String, _PlanTranslationTitleContent>? value) => json["planTranslationTitle"] = value;

}

extension type _PlanTranslationDescriptionContent(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String? get planDescription => json['planDescription'];
    String? get planDescriptionHtml => json['planDescriptionHtml'];
    String? get planLang => json['planLang'];

// ----------- SETTERS ----------- 
    set planDescription(String? value) => json["planDescription"] = value;
    set planDescriptionHtml(String? value) => json["planDescriptionHtml"] = value;
    set planLang(String? value) => json["planLang"] = value;

}

extension type _PlanDescription(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get planOriginalDescription => json['planOriginalDescription'] as String;
    String get planOriginalDescriptionHtml => json['planOriginalDescriptionHtml'] as String;
    String get planOriginalLang => json['planOriginalLang'] as String;
    Map<String, _PlanTranslationDescriptionContent>? get planTranslationDescription => checkFalsy(json['planTranslationDescription'])?null:json['planTranslationDescription'] as Map<String, _PlanTranslationDescriptionContent>?;

// ----------- SETTERS ----------- 
    set planOriginalDescription(String value) => json["planOriginalDescription"] = value;
    set planOriginalDescriptionHtml(String value) => json["planOriginalDescriptionHtml"] = value;
    set planOriginalLang(String value) => json["planOriginalLang"] = value;
    set planTranslationDescription(Map<String, _PlanTranslationDescriptionContent>? value) => json["planTranslationDescription"] = value;

}

extension type _Urls(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get cover => json['cover'] as String;
    String get card => json['card'] as String;

// ----------- SETTERS ----------- 
    set cover(String value) => json["cover"] = value;
    set card(String value) => json["card"] = value;

}

extension type _PlanCoverImage(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _Urls get urls => json['urls'] as _Urls;

// ----------- SETTERS ----------- 
    set urls(_Urls value) => json["urls"] = value;

}

extension type _Plan(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    dynamic get currentPlanId => json['currentPlanId'] as dynamic;
    String get planId => json['planId'] as String;
    String get creatorUserId => json['creatorUserId'] as String;
    bool get planAcceptRequestFlg => json['planAcceptRequestFlg'] as bool;
    int get planStandardPrice => json['planStandardPrice'] as int;
    _PlanTitle get planTitle => json['planTitle'] as _PlanTitle;
    _PlanDescription get planDescription => json['planDescription'] as _PlanDescription;
    bool get planAcceptAdultFlg => json['planAcceptAdultFlg'] as bool;
    bool get planAcceptAnonymousFlg => json['planAcceptAnonymousFlg'] as bool;
    bool get planAcceptIllustFlg => json['planAcceptIllustFlg'] as bool;
    bool get planAcceptUgoiraFlg => json['planAcceptUgoiraFlg'] as bool;
    bool get planAcceptMangaFlg => json['planAcceptMangaFlg'] as bool;
    bool get planAcceptNovelFlg => json['planAcceptNovelFlg'] as bool;
    _PlanCoverImage? get planCoverImage => json['planCoverImage'];
    int get planAiType => json['planAiType'] as int;

// ----------- SETTERS ----------- 
    set currentPlanId(dynamic value) => json["currentPlanId"] = value;
    set planId(String value) => json["planId"] = value;
    set creatorUserId(String value) => json["creatorUserId"] = value;
    set planAcceptRequestFlg(bool value) => json["planAcceptRequestFlg"] = value;
    set planStandardPrice(int value) => json["planStandardPrice"] = value;
    set planTitle(_PlanTitle value) => json["planTitle"] = value;
    set planDescription(_PlanDescription value) => json["planDescription"] = value;
    set planAcceptAdultFlg(bool value) => json["planAcceptAdultFlg"] = value;
    set planAcceptAnonymousFlg(bool value) => json["planAcceptAnonymousFlg"] = value;
    set planAcceptIllustFlg(bool value) => json["planAcceptIllustFlg"] = value;
    set planAcceptUgoiraFlg(bool value) => json["planAcceptUgoiraFlg"] = value;
    set planAcceptMangaFlg(bool value) => json["planAcceptMangaFlg"] = value;
    set planAcceptNovelFlg(bool value) => json["planAcceptNovelFlg"] = value;
    set planCoverImage(_PlanCoverImage? value) => json["planCoverImage"] = value;
    set planAiType(int value) => json["planAiType"] = value;

}

extension type _CollaborateStatus(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    bool get collaborating => json['collaborating'] as bool;
    bool get collaborateAnonymousFlg => json['collaborateAnonymousFlg'] as bool;
    int get collaboratedCnt => json['collaboratedCnt'] as int;
    List<dynamic> get collaborateUserSamples => json['collaborateUserSamples'] as List<dynamic>;

// ----------- SETTERS ----------- 
    set collaborating(bool value) => json["collaborating"] = value;
    set collaborateAnonymousFlg(bool value) => json["collaborateAnonymousFlg"] = value;
    set collaboratedCnt(int value) => json["collaboratedCnt"] = value;
    set collaborateUserSamples(List<dynamic> value) => json["collaborateUserSamples"] = value;

}

extension type _Work(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    bool get isUnlisted => json['isUnlisted'] as bool;
    dynamic get secret => json['secret'] as dynamic;

// ----------- SETTERS ----------- 
    set isUnlisted(bool value) => json["isUnlisted"] = value;
    set secret(dynamic value) => json["secret"] = value;

}

extension type _PostWork(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get postWorkId => json['postWorkId'] as String;
    String get postWorkType => json['postWorkType'] as String;
    _Work? get work => json['work'];

// ----------- SETTERS ----------- 
    set postWorkId(String value) => json["postWorkId"] = value;
    set postWorkType(String value) => json["postWorkType"] = value;
    set work(_Work? value) => json["work"] = value;

}

extension type _Fanbox(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    bool get fanIsSupporter => json['fanIsSupporter'] as bool;

// ----------- SETTERS ----------- 
    set fanIsSupporter(bool value) => json["fanIsSupporter"] = value;

}

extension type _Modification(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    dynamic get requestPostWorkType => json['requestPostWorkType'] as dynamic;
    dynamic get requestAdultFlg => json['requestAdultFlg'] as dynamic;

// ----------- SETTERS ----------- 
    set requestPostWorkType(dynamic value) => json["requestPostWorkType"] = value;
    set requestAdultFlg(dynamic value) => json["requestAdultFlg"] = value;

}

extension type _RequestResend(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    dynamic get requestResendDeadlineDatetime => json['requestResendDeadlineDatetime'] as dynamic;
    dynamic get requestResendOfferEnabled => json['requestResendOfferEnabled'] as dynamic;
    dynamic get requestResendEnabled => json['requestResendEnabled'] as dynamic;
    dynamic get requestResendStatus => json['requestResendStatus'] as dynamic;
    _Modification get modification => json['modification'] as _Modification;
    dynamic get fanAdultSendable => json['fanAdultSendable'] as dynamic;
    dynamic get isResentRequest => json['isResentRequest'] as dynamic;

// ----------- SETTERS ----------- 
    set requestResendDeadlineDatetime(dynamic value) => json["requestResendDeadlineDatetime"] = value;
    set requestResendOfferEnabled(dynamic value) => json["requestResendOfferEnabled"] = value;
    set requestResendEnabled(dynamic value) => json["requestResendEnabled"] = value;
    set requestResendStatus(dynamic value) => json["requestResendStatus"] = value;
    set modification(_Modification value) => json["modification"] = value;
    set fanAdultSendable(dynamic value) => json["fanAdultSendable"] = value;
    set isResentRequest(dynamic value) => json["isResentRequest"] = value;

}

extension type _FanLetter(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    bool get fanLetterArrived => json['fanLetterArrived'] as bool;
    bool get fanLetterSendEnabled => json['fanLetterSendEnabled'] as bool;

// ----------- SETTERS ----------- 
    set fanLetterArrived(bool value) => json["fanLetterArrived"] = value;
    set fanLetterSendEnabled(bool value) => json["fanLetterSendEnabled"] = value;

}

extension type Request(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get requestId => json['requestId'] as String;
    String get planId => json['planId'] as String;
    dynamic get fanUserId => json['fanUserId'] as dynamic;
    String get creatorUserId => json['creatorUserId'] as String;
    String get requestStatus => json['requestStatus'] as String;
    String? get requestAcceptStatus => json['requestAcceptStatus'];
    String get requestPostWorkType => json['requestPostWorkType'] as String;
    int get requestPrice => json['requestPrice'] as int;
    _RequestProposal get requestProposal => json['requestProposal'] as _RequestProposal;
    List<String> get requestTags => json['requestTags'] as List<String>;
    bool get requestAdultFlg => json['requestAdultFlg'] as bool;
    bool get requestAnonymousFlg => json['requestAnonymousFlg'] as bool;
    bool get requestRestrictFlg => json['requestRestrictFlg'] as bool;
    bool get requestAcceptCollaborateFlg => json['requestAcceptCollaborateFlg'] as bool;
    String get requestResponseDeadlineDatetime => json['requestResponseDeadlineDatetime'] as String;
    String get requestPostDeadlineDatetime => json['requestPostDeadlineDatetime'] as String;
    String get role => json['role'] as String;
    _Plan get plan => json['plan'] as _Plan;
    _CollaborateStatus get collaborateStatus => json['collaborateStatus'] as _CollaborateStatus;
    dynamic get giftFile => json['giftFile'] as dynamic;
    _PostWork? get postWork => json['postWork'];
    dynamic get notifyBadge => json['notifyBadge'] as dynamic;
    _Fanbox? get fanbox => json['fanbox'];
    _RequestResend? get requestResend => json['requestResend'];
    _FanLetter? get fanLetter => json['fanLetter'];

// ----------- SETTERS ----------- 
    set requestId(String value) => json["requestId"] = value;
    set planId(String value) => json["planId"] = value;
    set fanUserId(dynamic value) => json["fanUserId"] = value;
    set creatorUserId(String value) => json["creatorUserId"] = value;
    set requestStatus(String value) => json["requestStatus"] = value;
    set requestAcceptStatus(String? value) => json["requestAcceptStatus"] = value;
    set requestPostWorkType(String value) => json["requestPostWorkType"] = value;
    set requestPrice(int value) => json["requestPrice"] = value;
    set requestProposal(_RequestProposal value) => json["requestProposal"] = value;
    set requestTags(List<String> value) => json["requestTags"] = value;
    set requestAdultFlg(bool value) => json["requestAdultFlg"] = value;
    set requestAnonymousFlg(bool value) => json["requestAnonymousFlg"] = value;
    set requestRestrictFlg(bool value) => json["requestRestrictFlg"] = value;
    set requestAcceptCollaborateFlg(bool value) => json["requestAcceptCollaborateFlg"] = value;
    set requestResponseDeadlineDatetime(String value) => json["requestResponseDeadlineDatetime"] = value;
    set requestPostDeadlineDatetime(String value) => json["requestPostDeadlineDatetime"] = value;
    set role(String value) => json["role"] = value;
    set plan(_Plan value) => json["plan"] = value;
    set collaborateStatus(_CollaborateStatus value) => json["collaborateStatus"] = value;
    set giftFile(dynamic value) => json["giftFile"] = value;
    set postWork(_PostWork? value) => json["postWork"] = value;
    set notifyBadge(dynamic value) => json["notifyBadge"] = value;
    set fanbox(_Fanbox? value) => json["fanbox"] = value;
    set requestResend(_RequestResend? value) => json["requestResend"] = value;
    set fanLetter(_FanLetter? value) => json["fanLetter"] = value;

}

