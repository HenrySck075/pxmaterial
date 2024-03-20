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
    repeat: json['repeat'] == null?null:json['repeat'],
    color: json['color'] == null?null:json['color'],
    url: json['url'],
    isPrivate: json['isPrivate'],
  );}

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

}

class _Region {
  final String name;
  final String region;
  final String prefecture;
  final String privacyLevel;
  _Region({
    required this.name,
    required this.region,
    required this.prefecture,
    required this.privacyLevel,
  });
  factory _Region.fromJson(Map<String, dynamic> json) {
    return _Region(
    name: json['name'],
    region: json['region'],
    prefecture: json['prefecture'],
    privacyLevel: json['privacyLevel'],
  );}

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
    name: json['name'] == null?null:json['name'],
    privacyLevel: json['privacyLevel'] == null?null:json['privacyLevel'],
  );}

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
    userWorkspacePc: json['userWorkspacePc'] == null?null:json['userWorkspacePc'],
    userWorkspaceMonitor: json['userWorkspaceMonitor'] == null?null:json['userWorkspaceMonitor'],
    userWorkspaceTool: json['userWorkspaceTool'] == null?null:json['userWorkspaceTool'],
    userWorkspaceScanner: json['userWorkspaceScanner'] == null?null:json['userWorkspaceScanner'],
    userWorkspaceTablet: json['userWorkspaceTablet'] == null?null:json['userWorkspaceTablet'],
    userWorkspaceMouse: json['userWorkspaceMouse'] == null?null:json['userWorkspaceMouse'],
    userWorkspacePrinter: json['userWorkspacePrinter'] == null?null:json['userWorkspacePrinter'],
    userWorkspaceDesktop: json['userWorkspaceDesktop'] == null?null:json['userWorkspaceDesktop'],
    userWorkspaceMusic: json['userWorkspaceMusic'] == null?null:json['userWorkspaceMusic'],
    userWorkspaceDesk: json['userWorkspaceDesk'] == null?null:json['userWorkspaceDesk'],
    userWorkspaceChair: json['userWorkspaceChair'] == null?null:json['userWorkspaceChair'],
  );}

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
  final int partial;
  final bool acceptRequest;
  final List<dynamic> sketchLives;
  final int following;
  final int mypixivCount;
  final bool followedBack;
  final String comment;
  final String commentHtml;
  final String? webpage;
  final Map<String, _SocialContent> social;
  final bool canSendMessage;
  final _Region region;
  final PrivacyLeveledData age;
  final PrivacyLeveledData birthDay;
  final PrivacyLeveledData gender;
  final PrivacyLeveledData job;
  /// User's workspace specs
  final _Workspace workspace;
  /// Whether or not the account is pixiv's account
  final bool official;
  final String? group;
  User({
    required this.userId,
    required this.name,
    required this.image,
    required this.imageBig,
    required this.premium,
    required this.isFollowed,
    required this.isMypixiv,
    required this.isBlocking,
    this.background,
    this.sketchLiveId,
    required this.partial,
    required this.acceptRequest,
    required this.sketchLives,
    required this.following,
    required this.mypixivCount,
    required this.followedBack,
    required this.comment,
    required this.commentHtml,
    this.webpage,
    required this.social,
    required this.canSendMessage,
    required this.region,
    required this.age,
    required this.birthDay,
    required this.gender,
    required this.job,
    required this.workspace,
    required this.official,
    this.group,
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
    partial: json['partial'],
    acceptRequest: json['acceptRequest'],
    sketchLives: (json['sketchLives'] as List<dynamic>),
    following: json['following'],
    mypixivCount: json['mypixivCount'],
    followedBack: json['followedBack'],
    comment: json['comment'],
    commentHtml: json['commentHtml'],
    webpage: json['webpage'],
    social: (json['social'] as Map<String,dynamic>).map((k,v)=>MapEntry(k,_SocialContent.fromJson(v))),
    canSendMessage: json['canSendMessage'],
    region: _Region.fromJson(json['region']),
    age: PrivacyLeveledData.fromJson(json['age']),
    birthDay: PrivacyLeveledData.fromJson(json['birthDay']),
    gender: PrivacyLeveledData.fromJson(json['gender']),
    job: PrivacyLeveledData.fromJson(json['job']),
    workspace: _Workspace.fromJson(json['workspace']),
    official: json['official'],
    group: json['group'],
  );}

}

