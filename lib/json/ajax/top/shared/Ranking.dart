
class _Items {
  final String rank;
  final String id;
  _Items({
    required this.rank,
    required this.id,
  });
  factory _Items.fromJson(Map<String, dynamic> json) => _Items(
    rank: json['rank'] as String,
    id: json['id'] as String,
  );
  
}

class Ranking {
  final List<_Items> items;
  final String date;
  Ranking({
    required this.items,
    required this.date,
  });
  factory Ranking.fromJson(Map<String, dynamic> json) => Ranking(
    items: json['items'].map((e)=>_Items.fromJson(e)).toList(),
    date: json['date'] as String,
  );
  
}
