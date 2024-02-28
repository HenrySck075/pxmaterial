class RecommendStatus {
  final List<String> methods;
  final int score;
  final List<String> seedIllustIds;
  RecommendStatus({
    required this.methods,
    required this.score,
    required this.seedIllustIds,
  });
  factory RecommendStatus.fromJson(Map<String, dynamic> json) => RecommendStatus(
    methods: (json['methods'] as List<dynamic>).map((e)=>e as String).toList(),
    score: json['score'],
    seedIllustIds: (json['seedIllustIds'] as List<dynamic>).map((e)=>e as String).toList(),
  );

}

