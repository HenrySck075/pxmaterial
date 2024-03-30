class _Items {
  final String rank;
  final String id;
  _Items({
    required this.rank,
    required this.id,
  });
  factory _Items.fromJson(Map<String, dynamic> json) {
    return _Items(
    rank: json['rank'],
    id: json['id'],
  );}

}

class Ranking {
  final List<_Items> items;
  final String date;
  Ranking({
    required this.items,
    required this.date,
  });
  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
    items: (json['items'] as List<dynamic>).map((e)=>_Items.fromJson(e)).toList(),
    date: json['date'],
  );}

}

