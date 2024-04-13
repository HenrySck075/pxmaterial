class TagTranslation {
  final String? en;
  final String? ko;
  final String? zh;
  final String? zh_tw;
  final String? romaji;
  TagTranslation({
    this.en,
    this.ko,
    this.zh,
    this.zh_tw,
    this.romaji,
  });
  factory TagTranslation.fromJson(Map<String, dynamic> json) {
    return TagTranslation(
    en: json['en'],
    ko: json['ko'],
    zh: json['zh'],
    zh_tw: json['zh_tw'],
    romaji: json['romaji'],
  );}
  Map<String, dynamic> toJson() => <String,dynamic>{
    "en": en,
    "ko": ko,
    "zh": zh,
    "zh_tw": zh_tw,
    "romaji": romaji,
  };
}
typedef TagTranslations=Map<String, TagTranslation>;

