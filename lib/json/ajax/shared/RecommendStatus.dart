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
    methods: json['methods'],
    score: json['score'],
    seedIllustIds: json['seedIllustIds'],
  );
  
}

