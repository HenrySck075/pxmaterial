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
    partial: json['partial'] as int,
    comment: json['comment'] as String,
    followedBack: json['followedBack'] as bool,
    userId: json['userId'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    imageBig: json['imageBig'] as String,
    premium: json['premium'] as bool,
    isFollowed: json['isFollowed'] as bool,
    isMypixiv: json['isMypixiv'] as bool,
    isBlocking: json['isBlocking'] as bool,
    background: json['background'] as String,
    acceptRequest: json['acceptRequest'] as bool,
  );
  
}

