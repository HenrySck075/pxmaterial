class IllustSeries {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String caption;
  final int total;
  final String? content_order;
  final String url;
  final int coverImageSl;
  final String firstIllustId;
  final String latestIllustId;
  final String createDate;
  final String updateDate;
  final String? watchCount;
  final bool isWatched;
  final bool isNotifying;
  IllustSeries({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.caption,
    required this.total,
    required this.content_order,
    required this.url,
    required this.coverImageSl,
    required this.firstIllustId,
    required this.latestIllustId,
    required this.createDate,
    required this.updateDate,
    required this.watchCount,
    required this.isWatched,
    required this.isNotifying,
  });
  factory IllustSeries.fromJson(Map<String, dynamic> json) {
    return IllustSeries(
    id: json['id'],
    userId: json['userId'],
    title: json['title'],
    description: json['description'],
    caption: json['caption'],
    total: json['total'],
    content_order: json['content_order'],
    url: json['url'],
    coverImageSl: json['coverImageSl'],
    firstIllustId: json['firstIllustId'],
    latestIllustId: json['latestIllustId'],
    createDate: json['createDate'],
    updateDate: json['updateDate'],
    watchCount: json['watchCount'],
    isWatched: json['isWatched'],
    isNotifying: json['isNotifying'],
  );}

}

