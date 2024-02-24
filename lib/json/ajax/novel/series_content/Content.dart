import 'package:sofieru/json/ajax/top/novel/PartialNovel.dart' show PartialNovel;
class _Thumbnails {
  final List<dynamic> illust;
  final List<PartialNovel> novel;
  final List<dynamic> novelSeries;
  final List<dynamic> novelDraft;
  final List<dynamic> collection;
  _Thumbnails({
    required this.illust,
    required this.novel,
    required this.novelSeries,
    required this.novelDraft,
    required this.collection,
  });
  factory _Thumbnails.fromJson(Map<String, dynamic> json) => _Thumbnails(
    illust: json['illust'],
    novel: json['novel'].map((e)=>PartialNovel.fromJson(e)).toList(),
    novelSeries: json['novelSeries'],
    novelDraft: json['novelDraft'],
    collection: json['collection'],
  );
  
}

class _Series {
  final int id;
  final int viewableType;
  final int contentOrder;
  _Series({
    required this.id,
    required this.viewableType,
    required this.contentOrder,
  });
  factory _Series.fromJson(Map<String, dynamic> json) => _Series(
    id: json['id'],
    viewableType: json['viewableType'],
    contentOrder: json['contentOrder'],
  );
  
}

class _SeriesContents {
  final String id;
  final String userId;
  final _Series series;
  final String title;
  final String commentHtml;
  final List<String> tags;
  final int restrict;
  final int xRestrict;
  final bool isOriginal;
  final int textLength;
  final int characterCount;
  final int wordCount;
  final bool useWordCount;
  final int readingTime;
  final int bookmarkCount;
  final String url;
  final int uploadTimestamp;
  final int reuploadTimestamp;
  final bool isBookmarkable;
  final String? bookmarkData;
  final int aiType;
  _SeriesContents({
    required this.id,
    required this.userId,
    required this.series,
    required this.title,
    required this.commentHtml,
    required this.tags,
    required this.restrict,
    required this.xRestrict,
    required this.isOriginal,
    required this.textLength,
    required this.characterCount,
    required this.wordCount,
    required this.useWordCount,
    required this.readingTime,
    required this.bookmarkCount,
    required this.url,
    required this.uploadTimestamp,
    required this.reuploadTimestamp,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.aiType,
  });
  factory _SeriesContents.fromJson(Map<String, dynamic> json) => _SeriesContents(
    id: json['id'],
    userId: json['userId'],
    series: _Series.fromJson(json['series']),
    title: json['title'],
    commentHtml: json['commentHtml'],
    tags: json['tags'],
    restrict: json['restrict'],
    xRestrict: json['xRestrict'],
    isOriginal: json['isOriginal'],
    textLength: json['textLength'],
    characterCount: json['characterCount'],
    wordCount: json['wordCount'],
    useWordCount: json['useWordCount'],
    readingTime: json['readingTime'],
    bookmarkCount: json['bookmarkCount'],
    url: json['url'],
    uploadTimestamp: json['uploadTimestamp'],
    reuploadTimestamp: json['reuploadTimestamp'],
    isBookmarkable: json['isBookmarkable'],
    bookmarkData: json['bookmarkData'],
    aiType: json['aiType'],
  );
  
}

class _Page {
  final List<_SeriesContents> seriesContents;
  _Page({
    required this.seriesContents,
  });
  factory _Page.fromJson(Map<String, dynamic> json) => _Page(
    seriesContents: json['seriesContents'].map((e)=>_SeriesContents.fromJson(e)).toList(),
  );
  
}

class Content {
  final List<dynamic> tagTranslation;
  final _Thumbnails thumbnails;
  final List<dynamic> illustSeries;
  final List<dynamic> requests;
  final List<dynamic> users;
  final _Page page;
  Content({
    required this.tagTranslation,
    required this.thumbnails,
    required this.illustSeries,
    required this.requests,
    required this.users,
    required this.page,
  });
  factory Content.fromJson(Map<String, dynamic> json) => Content(
    tagTranslation: json['tagTranslation'],
    thumbnails: _Thumbnails.fromJson(json['thumbnails']),
    illustSeries: json['illustSeries'],
    requests: json['requests'],
    users: json['users'],
    page: _Page.fromJson(json['page']),
  );
  
}

