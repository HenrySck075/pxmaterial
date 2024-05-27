import 'package:sofieru/json/base.dart' show checkFalsy;
class _Background {
  final String? repeat;
  final String? color;
  final String url;
  final bool isPrivate;
  _Background({
    this.repeat,
    this.color,
    required this.url,
    required this.isPrivate,
  });
  factory _Background.fromJson(Map<String, dynamic> json) {
    return _Background(
    repeat: json['repeat'],
    color: json['color'],
    url: json['url'],
    isPrivate: json['isPrivate'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "repeat": repeat,
    "color": color,
    "url": url,
    "isPrivate": isPrivate,
  };
}

class _SocialContent {
  final String url;
  _SocialContent({
    required this.url,
  });
  factory _SocialContent.fromJson(Map<String, dynamic> json) {
    return _SocialContent(
    url: json['url'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "url": url,
  };
}

class _Region {
  final String? name;
  final String? region;
  final String? prefecture;
  final String? privacyLevel;
  _Region({
    this.name,
    this.region,
    this.prefecture,
    this.privacyLevel,
  });
  factory _Region.fromJson(Map<String, dynamic> json) {
    return _Region(
    name: json['name'],
    region: json['region'],
    prefecture: json['prefecture'],
    privacyLevel: json['privacyLevel'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "name": name,
    "region": region,
    "prefecture": prefecture,
    "privacyLevel": privacyLevel,
  };
}

/// Represents the data with privacy level
class PrivacyLeveledData {
  /// Value
  final String? name;
  /// Privacy level. Will be `null` if it's other users
  final String? privacyLevel;
  PrivacyLeveledData({
    this.name,
    this.privacyLevel,
  });
  factory PrivacyLeveledData.fromJson(Map<String, dynamic> json) {
    return PrivacyLeveledData(
    name: json['name'],
    privacyLevel: json['privacyLevel'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "name": name,
    "privacyLevel": privacyLevel,
  };
}

class _Workspace {
  final String? userWorkspacePc;
  final String? userWorkspaceMonitor;
  final String? userWorkspaceTool;
  final String? userWorkspaceScanner;
  final String? userWorkspaceTablet;
  final String? userWorkspaceMouse;
  final String? userWorkspacePrinter;
  final String? userWorkspaceDesktop;
  final String? userWorkspaceMusic;
  final String? userWorkspaceDesk;
  final String? userWorkspaceChair;
  _Workspace({
    this.userWorkspacePc,
    this.userWorkspaceMonitor,
    this.userWorkspaceTool,
    this.userWorkspaceScanner,
    this.userWorkspaceTablet,
    this.userWorkspaceMouse,
    this.userWorkspacePrinter,
    this.userWorkspaceDesktop,
    this.userWorkspaceMusic,
    this.userWorkspaceDesk,
    this.userWorkspaceChair,
  });
  factory _Workspace.fromJson(Map<String, dynamic> json) {
    return _Workspace(
    userWorkspacePc: json['userWorkspacePc'],
    userWorkspaceMonitor: json['userWorkspaceMonitor'],
    userWorkspaceTool: json['userWorkspaceTool'],
    userWorkspaceScanner: json['userWorkspaceScanner'],
    userWorkspaceTablet: json['userWorkspaceTablet'],
    userWorkspaceMouse: json['userWorkspaceMouse'],
    userWorkspacePrinter: json['userWorkspacePrinter'],
    userWorkspaceDesktop: json['userWorkspaceDesktop'],
    userWorkspaceMusic: json['userWorkspaceMusic'],
    userWorkspaceDesk: json['userWorkspaceDesk'],
    userWorkspaceChair: json['userWorkspaceChair'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "userWorkspacePc": userWorkspacePc,
    "userWorkspaceMonitor": userWorkspaceMonitor,
    "userWorkspaceTool": userWorkspaceTool,
    "userWorkspaceScanner": userWorkspaceScanner,
    "userWorkspaceTablet": userWorkspaceTablet,
    "userWorkspaceMouse": userWorkspaceMouse,
    "userWorkspacePrinter": userWorkspacePrinter,
    "userWorkspaceDesktop": userWorkspaceDesktop,
    "userWorkspaceMusic": userWorkspaceMusic,
    "userWorkspaceDesk": userWorkspaceDesk,
    "userWorkspaceChair": userWorkspaceChair,
  };
}

/// Represents the [User] object
class User {
  final String userId;
  final String name;
  final String image;
  final String imageBig;
  final bool premium;
  final bool isFollowed;
  final bool isMypixiv;
  final bool isBlocking;
  final _Background? background;
  final String? sketchLiveId;
  final bool acceptRequest;
  /// TODO: If you manages to get the sketchLive object, please paste it as a list item of this property
  final List<dynamic> sketchLives;
  final int following;
  final int mypixivCount;
  final bool followedBack;
  final String comment;
  final String commentHtml;
  final String? webpage;
  final Map<String, _SocialContent>? social;
  final bool canSendMessage;
  final _Region region;
  final PrivacyLeveledData age;
  final PrivacyLeveledData birthDay;
  final PrivacyLeveledData gender;
  final PrivacyLeveledData job;
  /// User's workspace specs
  final _Workspace? workspace;
  /// Whether or not the account is pixiv's account
  final bool official;
  final String? group;
  User({
    required this.userId,
    required this.name,
    this.image = 'https://i.pximg.net/user-profile/img/2024/01/06/23/08/52/25361717_78a1808990ec4effc6d8417a09b67725_50.jpg',
    this.imageBig = 'https://i.pximg.net/user-profile/img/2024/01/06/23/08/52/25361717_78a1808990ec4effc6d8417a09b67725_50.jpg',
    required this.premium,
    required this.isFollowed,
    required this.isMypixiv,
    required this.isBlocking,
    this.background,
    this.sketchLiveId,
    required this.acceptRequest,
    required this.sketchLives,
    required this.following,
    required this.mypixivCount,
    required this.followedBack,
    required this.comment,
    required this.commentHtml,
    required this.webpage,
    this.social,
    required this.canSendMessage,
    required this.region,
    required this.age,
    required this.birthDay,
    required this.gender,
    required this.job,
    this.workspace,
    required this.official,
    required this.group,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
    userId: json['userId'],
    name: json['name'],
    image: json['image'],
    imageBig: json['imageBig'],
    premium: json['premium'],
    isFollowed: json['isFollowed'],
    isMypixiv: json['isMypixiv'],
    isBlocking: json['isBlocking'],
    background: json['background'] == null?null:_Background.fromJson(json['background']),
    sketchLiveId: json['sketchLiveId'],
    acceptRequest: json['acceptRequest'] ?? false,
    sketchLives: (json['sketchLives'] as List<dynamic>),
    following: json['following'],
    mypixivCount: json['mypixivCount'],
    followedBack: json['followedBack'],
    comment: json['comment'],
    commentHtml: json['commentHtml'],
    webpage: json['webpage'],
    social: checkFalsy(json['social'])?null:(json['social'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,_SocialContent.fromJson(v))),
    canSendMessage: json['canSendMessage'],
    region: _Region.fromJson(json['region']),
    age: PrivacyLeveledData.fromJson(json['age']),
    birthDay: PrivacyLeveledData.fromJson(json['birthDay']),
    gender: PrivacyLeveledData.fromJson(json['gender']),
    job: PrivacyLeveledData.fromJson(json['job']),
    workspace: json['workspace'] == null?null:_Workspace.fromJson(json['workspace']),
    official: json['official'],
    group: json['group'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "userId": userId,
    "name": name,
    "image": image,
    "imageBig": imageBig,
    "premium": premium,
    "isFollowed": isFollowed,
    "isMypixiv": isMypixiv,
    "isBlocking": isBlocking,
    "background": background?.toJson(),
    "sketchLiveId": sketchLiveId,
    "acceptRequest": acceptRequest,
    "sketchLives": sketchLives,
    "following": following,
    "mypixivCount": mypixivCount,
    "followedBack": followedBack,
    "comment": comment,
    "commentHtml": commentHtml,
    "webpage": webpage,
    "social": social?.map((k,v)=>MapEntry(k,v.toJson())),
    "canSendMessage": canSendMessage,
    "region": region.toJson(),
    "age": age.toJson(),
    "birthDay": birthDay.toJson(),
    "gender": gender.toJson(),
    "job": job.toJson(),
    "workspace": workspace?.toJson(),
    "official": official,
    "group": group,
  };
}

