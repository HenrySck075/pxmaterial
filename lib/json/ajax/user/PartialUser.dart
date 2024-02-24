class PartialUser {
  final int partial;
  final String comment;
  final bool followedBack;
  final String userId;
  final String name;
  final String image;
  final String imageBig;
  final bool premium;
  final bool isFollowed;
  final bool isMypixiv;
  final bool isBlocking;
  final String? background;
  final bool acceptRequest;
  PartialUser({
    required this.partial,
    required this.comment,
    required this.followedBack,
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
    background: json['background'],
    acceptRequest: json['acceptRequest'],
  );
  
}

