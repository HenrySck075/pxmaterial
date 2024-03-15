class UserEmbed {
  final String id;
  final List<String> illustIds;
  UserEmbed({
    required this.id,
    required this.illustIds,
  });
  factory UserEmbed.fromJson(Map<String, dynamic> json) => UserEmbed(
    id: json['id'],
    illustIds: (json['illustIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );

}

