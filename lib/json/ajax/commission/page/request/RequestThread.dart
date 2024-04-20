class _ThreadEntryBody {
  /// Requester's user ID, null if `threadEntryType` is not `sendRequest` or `requestAnonymousFlg` is true or smth idk
  final String? fanUserId;
  /// Whether or not the requester is anonymous, null if `threadEntryType` is not `sendRequest`
  final bool? requestAnonymousFlg;
  /// Creator's user ID, null if `threadEntryType` is not `acceptRequest`
  final String? creatorUserId;
  _ThreadEntryBody({
    this.fanUserId,
    this.requestAnonymousFlg,
    this.creatorUserId,
  });
  factory _ThreadEntryBody.fromJson(Map<String, dynamic> json) {
    return _ThreadEntryBody(
    fanUserId: json['fanUserId'],
    requestAnonymousFlg: json['requestAnonymousFlg'],
    creatorUserId: json['creatorUserId'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "fanUserId": fanUserId,
    "requestAnonymousFlg": requestAnonymousFlg,
    "creatorUserId": creatorUserId,
  };
}

class _ThreadEntries {
  final String threadEntryId;
  /// Values: `sendRequest`, `acceptRequest`, 
  final String threadEntryType;
  /// body
  final _ThreadEntryBody threadEntryBody;
  _ThreadEntries({
    required this.threadEntryId,
    required this.threadEntryType,
    required this.threadEntryBody,
  });
  factory _ThreadEntries.fromJson(Map<String, dynamic> json) {
    return _ThreadEntries(
    threadEntryId: json['threadEntryId'],
    threadEntryType: json['threadEntryType'],
    threadEntryBody: _ThreadEntryBody.fromJson(json['threadEntryBody']),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "threadEntryId": threadEntryId,
    "threadEntryType": threadEntryType,
    "threadEntryBody": threadEntryBody.toJson(),
  };
}

class RequestThread {
  final String threadId;
  final String requestId;
  final List<_ThreadEntries> threadEntries;
  RequestThread({
    required this.threadId,
    required this.requestId,
    required this.threadEntries,
  });
  factory RequestThread.fromJson(Map<String, dynamic> json) {
    return RequestThread(
    threadId: json['threadId'],
    requestId: json['requestId'],
    threadEntries: (json['threadEntries'] as List<dynamic>).map((e)=>_ThreadEntries.fromJson(e)).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "threadId": threadId,
    "requestId": requestId,
    "threadEntries": threadEntries.map((e)=>e.toJson()).toList(),
  };
}

