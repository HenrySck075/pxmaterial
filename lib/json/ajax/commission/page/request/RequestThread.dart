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
  factory _ThreadEntryBody.fromJson(Map<String, dynamic> json) => _ThreadEntryBody(
    fanUserId: json['fanUserId'] == null?null:json['fanUserId'],
    requestAnonymousFlg: json['requestAnonymousFlg'] == null?null:json['requestAnonymousFlg'],
    creatorUserId: json['creatorUserId'] == null?null:json['creatorUserId'],
  );

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
  factory _ThreadEntries.fromJson(Map<String, dynamic> json) => _ThreadEntries(
    threadEntryId: json['threadEntryId'],
    threadEntryType: json['threadEntryType'],
    threadEntryBody: _ThreadEntryBody.fromJson(json['threadEntryBody']),
  );

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
  factory RequestThread.fromJson(Map<String, dynamic> json) => RequestThread(
    threadId: json['threadId'],
    requestId: json['requestId'],
    threadEntries: (json['threadEntries'] as List<dynamic>).map((e)=>_ThreadEntries.fromJson(e)).toList(),
  );

}
