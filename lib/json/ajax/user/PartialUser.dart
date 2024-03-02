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
    repeat: json['repeat'] == null?null:json['repeat'],
    color: json['color'] == null?null:json['color'],
    url: json['url'],
    isPrivate: json['isPrivate'],
  );

}

class PartialUser {
  final int partial;
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
    required this.partial,
    this.comment,
    this.followedBack,
    required this.userId,
    required this.name,
    required this.image,
    required this.imageBig,
    required this.premium,
    required this.isFollowed,
    required this.isMypixiv,
    required this.isBlocking,
    this.background,
    required this.acceptRequest,
  });
  factory PartialUser.fromJson(Map<String, dynamic> json) => PartialUser(
    partial: json['partial'],
    comment: json['comment'] == null?null:json['comment'],
    followedBack: json['followedBack'] == null?null:json['followedBack'],
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
  );

}

