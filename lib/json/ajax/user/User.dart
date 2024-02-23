import 'package:sofieru/json/ajax/shared/Placeholder.dart' show Placeholder;
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
  factory _Background.fromJson(Map<String, dynamic> json) => _Background(
    repeat: json['repeat'] as String,
    color: json['color'] as String,
    url: json['url'] as String,
    isPrivate: json['isPrivate'] as bool,
  );
  
}

class _SocialContent {
  final String url;
  _SocialContent({
    required this.url,
  });
  factory _SocialContent.fromJson(Map<String, dynamic> json) => _SocialContent(
    url: json['url'] as String,
  );
  
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
  factory _Region.fromJson(Map<String, dynamic> json) => _Region(
    name: json['name'] as String,
    region: json['region'] as String,
    prefecture: json['prefecture'] as String,
    privacyLevel: json['privacyLevel'] as String,
  );
  
}

class PrivacyLeveledData {
  /// Value
  final Placeholder? name;
  /// Privacy level. Will be `null` if it's other users
  final Placeholder? privacyLevel;
  PrivacyLeveledData({
    this.name,
    this.privacyLevel,
  });
  factory PrivacyLeveledData.fromJson(Map<String, dynamic> json) => PrivacyLeveledData(
    name: json['name'] as Placeholder,
    privacyLevel: json['privacyLevel'] as Placeholder,
  );
  
}

class _Workspace {
  final String userWorkspacePc;
  final String userWorkspaceMonitor;
  final String userWorkspaceTool;
  final String userWorkspaceScanner;
  final String userWorkspaceTablet;
  final String userWorkspaceMouse;
  final String userWorkspacePrinter;
  final String userWorkspaceDesktop;
  final String userWorkspaceMusic;
  final String userWorkspaceDesk;
  final String userWorkspaceChair;
  _Workspace({
    required this.userWorkspacePc,
    required this.userWorkspaceMonitor,
    required this.userWorkspaceTool,
    required this.userWorkspaceScanner,
    required this.userWorkspaceTablet,
    required this.userWorkspaceMouse,
    required this.userWorkspacePrinter,
    required this.userWorkspaceDesktop,
    required this.userWorkspaceMusic,
    required this.userWorkspaceDesk,
    required this.userWorkspaceChair,
  });
  factory _Workspace.fromJson(Map<String, dynamic> json) => _Workspace(
    userWorkspacePc: json['userWorkspacePc'] as String,
    userWorkspaceMonitor: json['userWorkspaceMonitor'] as String,
    userWorkspaceTool: json['userWorkspaceTool'] as String,
    userWorkspaceScanner: json['userWorkspaceScanner'] as String,
    userWorkspaceTablet: json['userWorkspaceTablet'] as String,
    userWorkspaceMouse: json['userWorkspaceMouse'] as String,
    userWorkspacePrinter: json['userWorkspacePrinter'] as String,
    userWorkspaceDesktop: json['userWorkspaceDesktop'] as String,
    userWorkspaceMusic: json['userWorkspaceMusic'] as String,
    userWorkspaceDesk: json['userWorkspaceDesk'] as String,
    userWorkspaceChair: json['userWorkspaceChair'] as String,
  );
  
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
  final _Background background;
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
    required this.background,
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
  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json['userId'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    imageBig: json['imageBig'] as String,
    premium: json['premium'] as bool,
    isFollowed: json['isFollowed'] as bool,
    isMypixiv: json['isMypixiv'] as bool,
    isBlocking: json['isBlocking'] as bool,
    background: _Background.fromJson(json['background']),
    sketchLiveId: json['sketchLiveId'] as String,
    partial: json['partial'] as int,
    acceptRequest: json['acceptRequest'] as bool,
    sketchLives: json['sketchLives'],
    following: json['following'] as int,
    mypixivCount: json['mypixivCount'] as int,
    followedBack: json['followedBack'] as bool,
    comment: json['comment'] as String,
    commentHtml: json['commentHtml'] as String,
    webpage: json['webpage'] as String,
    social: json['social'].map((k,v)=>MapEntry(k,_SocialContent.fromJson(v))),
    canSendMessage: json['canSendMessage'] as bool,
    region: _Region.fromJson(json['region']),
    age: PrivacyLeveledData.fromJson(json['age']),
    birthDay: PrivacyLeveledData.fromJson(json['birthDay']),
    gender: PrivacyLeveledData.fromJson(json['gender']),
    job: PrivacyLeveledData.fromJson(json['job']),
    workspace: _Workspace.fromJson(json['workspace']),
    official: json['official'] as bool,
    group: json['group'] as String,
  );
  
}

