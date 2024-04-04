import 'package:sofieru/json/ajax/commission/page/requests/Request.dart' show Request;
class RequestUser {
  final String userId;
  final String userName;
  final String profileImg;
  RequestUser({
    required this.userId,
    required this.userName,
    required this.profileImg,
  });
  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
    userId: json['userId'],
    userName: json['userName'],
    profileImg: json['profileImg'],
  );}

}

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
  factory _CollaborateStatus.fromJson(Map<String, dynamic> json) {
    return _CollaborateStatus(
    collaborating: json['collaborating'],
    collaborateAnonymousFlg: json['collaborateAnonymousFlg'],
    collaboratedCnt: json['collaboratedCnt'],
    userSamples: (json['userSamples'] as List<dynamic>),
  );}

}

class WorkRequest {
  final Request request;
  final RequestUser creator;
  final RequestUser fan;
  final _CollaborateStatus collaborateStatus;
  final bool editable;
  WorkRequest({
    required this.request,
    required this.creator,
    required this.fan,
    required this.collaborateStatus,
    required this.editable,
  });
  factory WorkRequest.fromJson(Map<String, dynamic> json) {
    return WorkRequest(
    request: Request.fromJson(json['request']),
    creator: RequestUser.fromJson(json['creator']),
    fan: RequestUser.fromJson(json['fan']),
    collaborateStatus: _CollaborateStatus.fromJson(json['collaborateStatus']),
    editable: json['editable'],
  );}

}

