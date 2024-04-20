class UserEmbed {
  final String id;
  final List<String> illustIds;
  UserEmbed({
    required this.id,
    required this.illustIds,
  });
  factory UserEmbed.fromJson(Map<String, dynamic> json) {
    return UserEmbed(
    id: json['id'],
    illustIds: (json['illustIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "id": id,
    "illustIds": illustIds,
  };
}

