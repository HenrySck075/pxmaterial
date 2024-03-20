import 'package:sofieru/json/ajax/commission/page/request/Request.dart' show Request;
class RequestUser {
  RequestUser({
    required this.userId,
    required this.userName,
    required this.profileImg,
  });
  factory RequestUser.fromJson(Map<String, dynamic> json) => RequestUser(
    userId: json['userId'],
    userName: json['userName'],
    profileImg: json['profileImg'],
  );

}

class _CollaborateStatus {
  _CollaborateStatus({
    required this.collaborating,
    required this.collaborateAnonymousFlg,
    required this.collaboratedCnt,
    required this.userSamples,
  });
  factory _CollaborateStatus.fromJson(Map<String, dynamic> json) => _CollaborateStatus(
    collaborating: json['collaborating'],
    collaborateAnonymousFlg: json['collaborateAnonymousFlg'],
    collaboratedCnt: json['collaboratedCnt'],
    userSamples: (json['userSamples'] as List<dynamic>),
  );

}

class WorkRequest {
  WorkRequest({
    required this.request,
    required this.creator,
    required this.fan,
    required this.collaborateStatus,
    required this.editable,
  });
  factory WorkRequest.fromJson(Map<String, dynamic> json) => WorkRequest(
    request: Request.fromJson(json['request']),
    creator: RequestUser.fromJson(json['creator']),
    fan: RequestUser.fromJson(json['fan']),
    collaborateStatus: _CollaborateStatus.fromJson(json['collaborateStatus']),
    editable: json['editable'],
  );

}

