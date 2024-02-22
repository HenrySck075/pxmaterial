
class TagTranslation {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  TagTranslation({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });
  factory TagTranslation.fromJson(Map<String, dynamic> json) => TagTranslation(
    en: json['en'] as String,
    ko: json['ko'] as String,
    zh: json['zh'] as String,
    zh_tw: json['zh_tw'] as String,
    romaji: json['romaji'] as String,
  );
  
}
