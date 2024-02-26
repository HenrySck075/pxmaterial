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
    id: json['id'],
    illustIds: (json['illustIds'] as List<dynamic>).map((e)=>e as String).toList(),
    novelIds: (json['novelIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );
  
}

