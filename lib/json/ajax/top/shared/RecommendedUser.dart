class RecommendedUser {
  final int id;
  final List<String> illustIds;
  final List<String> novelIds;
  RecommendedUser({
    required this.id,
    required this.illustIds,
    required this.novelIds,
  });
  factory RecommendedUser.fromJson(Map<String, dynamic> json) => RecommendedUser(
    id: json['id'] as int,
    illustIds: json['illustIds'],
    novelIds: json['novelIds'],
  );
  
}

