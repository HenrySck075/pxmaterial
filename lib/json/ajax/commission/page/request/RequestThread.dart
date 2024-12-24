extension type _ThreadEntryBody(Map<String, dynamic> json) {
  /// Requester's user ID, null if `threadEntryType` is not `sendRequest` or `requestAnonymousFlg` is true or smth idk
  /// Whether or not the requester is anonymous, null if `threadEntryType` is not `sendRequest`
  /// Creator's user ID, null if `threadEntryType` is not `acceptRequest`
// ----------- GETTERS ----------- 
    String? get fanUserId => json['fanUserId'];
    bool? get requestAnonymousFlg => json['requestAnonymousFlg'];
    String? get creatorUserId => json['creatorUserId'];

// ----------- SETTERS ----------- 
    set fanUserId(String? value) => json["fanUserId"] = value;
    set requestAnonymousFlg(bool? value) => json["requestAnonymousFlg"] = value;
    set creatorUserId(String? value) => json["creatorUserId"] = value;

}

extension type _ThreadEntries(Map<String, dynamic> json) {
  /// Values: `sendRequest`, `acceptRequest`, 
  /// body
// ----------- GETTERS ----------- 
    String get threadEntryId => json['threadEntryId'] as String;
    String get threadEntryType => json['threadEntryType'] as String;
    _ThreadEntryBody get threadEntryBody => json['threadEntryBody'] as _ThreadEntryBody;

// ----------- SETTERS ----------- 
    set threadEntryId(String value) => json["threadEntryId"] = value;
    set threadEntryType(String value) => json["threadEntryType"] = value;
    set threadEntryBody(_ThreadEntryBody value) => json["threadEntryBody"] = value;

}

extension type RequestThread(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get threadId => json['threadId'] as String;
    String get requestId => json['requestId'] as String;
    List<_ThreadEntries> get threadEntries => json['threadEntries'] as List<_ThreadEntries>;

// ----------- SETTERS ----------- 
    set threadId(String value) => json["threadId"] = value;
    set requestId(String value) => json["requestId"] = value;
    set threadEntries(List<_ThreadEntries> value) => json["threadEntries"] = value;

}

