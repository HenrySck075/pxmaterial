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

class PartialUser {
  final String? comment;
  final bool? followedBack;
  final String userId;
  final String name;
  final String image;
  final String imageBig;
  final bool premium;
  final bool isFollowed;
  final bool isMypixiv;
  final bool isBlocking;
  final _Background? background;
  final bool acceptRequest;
  PartialUser({
    this.comment,
    this.followedBack,
    required this.userId,
    required this.name,
    this.image = 'https://i.pximg.net/user-profile/img/2024/01/06/23/08/52/25361717_78a1808990ec4effc6d8417a09b67725_50.jpg',
    this.imageBig = 'https://i.pximg.net/user-profile/img/2024/01/06/23/08/52/25361717_78a1808990ec4effc6d8417a09b67725_50.jpg',
    required this.premium,
    required this.isFollowed,
    required this.isMypixiv,
    required this.isBlocking,
    this.background,
    required this.acceptRequest,
  });
  factory PartialUser.fromJson(Map<String, dynamic> json) {
    return PartialUser(
    comment: json['comment'],
    followedBack: json['followedBack'],
    userId: json['userId'],
    name: json['name'],
    image: json['image'],
    imageBig: json['imageBig'],
    premium: json['premium'],
    isFollowed: json['isFollowed'],
    isMypixiv: json['isMypixiv'],
    isBlocking: json['isBlocking'],
    background: json['background'] == null?null:_Background.fromJson(json['background']),
    acceptRequest: json['acceptRequest'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "comment": comment,
    "followedBack": followedBack,
    "userId": userId,
    "name": name,
    "image": image,
    "imageBig": imageBig,
    "premium": premium,
    "isFollowed": isFollowed,
    "isMypixiv": isMypixiv,
    "isBlocking": isBlocking,
    "background": background?.toJson(),
    "acceptRequest": acceptRequest,
  };
}

