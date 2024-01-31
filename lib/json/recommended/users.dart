
class RecommendUser {
  final int id;
  final List<dynamic> illustIds;
  final List<String> novelIds;
  RecommendUser({
    required this.id,
    required this.illustIds,
    required this.novelIds,
  });

  factory RecommendUser.fromJson(Map<String, dynamic> json) => RecommendUser(
    id=json["id"],
    illustIds=json["illustIds"],
    novelIds=json["novelIds"],
  );

  Map<String, dynamic> RecommendUser.toJson() => Map<String, dynamic>{
    "id": this.id,
    "illustIds": this.illustIds,
    "novelIds": this.novelIds,
  };

}
