

class Items_Ranking_Page_NovelTop {
  final String rank;
  final String id;
  Items_Ranking_Page_NovelTop({
    required this.rank,
    required this.id,
  });

  factory Items_Ranking_Page_NovelTop.fromJson(Map<String, dynamic> json) => Items_Ranking_Page_NovelTop(
    rank=json["rank"],
    id=json["id"],
  );

  Map<String, dynamic> Items_Ranking_Page_NovelTop.toJson() => Map<String, dynamic>{
    "rank": this.rank,
    "id": this.id,
  };

}
class Ranking_Page_NovelTop {
  final String date;
  final List<Items_Ranking_Page_NovelTop> items;
  Ranking_Page_NovelTop({
    required this.date,
    required this.items,
  });

  factory Ranking_Page_NovelTop.fromJson(Map<String, dynamic> json) => Ranking_Page_NovelTop(
    date=json["date"],
    items=json["items"],
  );

  Map<String, dynamic> Ranking_Page_NovelTop.toJson() => Map<String, dynamic>{
    "date": this.date,
    "items": this.items,
  };

}
class Pixivision_Page_NovelTop {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String url;
  Pixivision_Page_NovelTop({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.url,
  });

  factory Pixivision_Page_NovelTop.fromJson(Map<String, dynamic> json) => Pixivision_Page_NovelTop(
    id=json["id"],
    title=json["title"],
    thumbnailUrl=json["thumbnailUrl"],
    url=json["url"],
  );

  Map<String, dynamic> Pixivision_Page_NovelTop.toJson() => Map<String, dynamic>{
    "id": this.id,
    "title": this.title,
    "thumbnailUrl": this.thumbnailUrl,
    "url": this.url,
  };

}
class EditorRecommend_Page_NovelTop {
  final String novelId;
  final String comment;
  EditorRecommend_Page_NovelTop({
    required this.novelId,
    required this.comment,
  });

  factory EditorRecommend_Page_NovelTop.fromJson(Map<String, dynamic> json) => EditorRecommend_Page_NovelTop(
    novelId=json["novelId"],
    comment=json["comment"],
  );

  Map<String, dynamic> EditorRecommend_Page_NovelTop.toJson() => Map<String, dynamic>{
    "novelId": this.novelId,
    "comment": this.comment,
  };

}
class Promo_Page_NovelTop {
  final int workId;
  final String url;
  final String name;
  final String imageUrl;
  Promo_Page_NovelTop({
    required this.workId,
    required this.url,
    required this.name,
    required this.imageUrl,
  });

  factory Promo_Page_NovelTop.fromJson(Map<String, dynamic> json) => Promo_Page_NovelTop(
    workId=json["workId"],
    url=json["url"],
    name=json["name"],
    imageUrl=json["imageUrl"],
  );

  Map<String, dynamic> Promo_Page_NovelTop.toJson() => Map<String, dynamic>{
    "workId": this.workId,
    "url": this.url,
    "name": this.name,
    "imageUrl": this.imageUrl,
  };

}
class ContestOngoing_Page_NovelTop {
  final String slug;
  final String type;
  final String name;
  final String url;
  final String iconUrl;
  final List<int> workIds;
  final bool isNew;
  ContestOngoing_Page_NovelTop({
    required this.slug,
    required this.type,
    required this.name,
    required this.url,
    required this.iconUrl,
    required this.workIds,
    required this.isNew,
  });

  factory ContestOngoing_Page_NovelTop.fromJson(Map<String, dynamic> json) => ContestOngoing_Page_NovelTop(
    slug=json["slug"],
    type=json["type"],
    name=json["name"],
    url=json["url"],
    iconUrl=json["iconUrl"],
    workIds=json["workIds"],
    isNew=json["isNew"],
  );

  Map<String, dynamic> ContestOngoing_Page_NovelTop.toJson() => Map<String, dynamic>{
    "slug": this.slug,
    "type": this.type,
    "name": this.name,
    "url": this.url,
    "iconUrl": this.iconUrl,
    "workIds": this.workIds,
    "isNew": this.isNew,
  };

}
class Items_Male_GenderRanking_Page_NovelTop {
  final String rank;
  final String id;
  Items_Male_GenderRanking_Page_NovelTop({
    required this.rank,
    required this.id,
  });

  factory Items_Male_GenderRanking_Page_NovelTop.fromJson(Map<String, dynamic> json) => Items_Male_GenderRanking_Page_NovelTop(
    rank=json["rank"],
    id=json["id"],
  );

  Map<String, dynamic> Items_Male_GenderRanking_Page_NovelTop.toJson() => Map<String, dynamic>{
    "rank": this.rank,
    "id": this.id,
  };

}
class Male_GenderRanking_Page_NovelTop {
  final String date;
  final List<Items_Male_GenderRanking_Page_NovelTop> items;
  Male_GenderRanking_Page_NovelTop({
    required this.date,
    required this.items,
  });

  factory Male_GenderRanking_Page_NovelTop.fromJson(Map<String, dynamic> json) => Male_GenderRanking_Page_NovelTop(
    date=json["date"],
    items=json["items"],
  );

  Map<String, dynamic> Male_GenderRanking_Page_NovelTop.toJson() => Map<String, dynamic>{
    "date": this.date,
    "items": this.items,
  };

}
class Items_Female_GenderRanking_Page_NovelTop {
  final String rank;
  final String id;
  Items_Female_GenderRanking_Page_NovelTop({
    required this.rank,
    required this.id,
  });

  factory Items_Female_GenderRanking_Page_NovelTop.fromJson(Map<String, dynamic> json) => Items_Female_GenderRanking_Page_NovelTop(
    rank=json["rank"],
    id=json["id"],
  );

  Map<String, dynamic> Items_Female_GenderRanking_Page_NovelTop.toJson() => Map<String, dynamic>{
    "rank": this.rank,
    "id": this.id,
  };

}
class Female_GenderRanking_Page_NovelTop {
  final String date;
  final List<Items_Female_GenderRanking_Page_NovelTop> items;
  Female_GenderRanking_Page_NovelTop({
    required this.date,
    required this.items,
  });

  factory Female_GenderRanking_Page_NovelTop.fromJson(Map<String, dynamic> json) => Female_GenderRanking_Page_NovelTop(
    date=json["date"],
    items=json["items"],
  );

  Map<String, dynamic> Female_GenderRanking_Page_NovelTop.toJson() => Map<String, dynamic>{
    "date": this.date,
    "items": this.items,
  };

}
class GenderRanking_Page_NovelTop {
  final Male_GenderRanking_Page_NovelTop male;
  final Female_GenderRanking_Page_NovelTop female;
  GenderRanking_Page_NovelTop({
    required this.male,
    required this.female,
  });

  factory GenderRanking_Page_NovelTop.fromJson(Map<String, dynamic> json) => GenderRanking_Page_NovelTop(
    male=Male_GenderRanking_Page_NovelTop.fromJson(json["male"])
    female=Female_GenderRanking_Page_NovelTop.fromJson(json["female"])
  );

  Map<String, dynamic> GenderRanking_Page_NovelTop.toJson() => Map<String, dynamic>{
    "male": this.male,
    "female": this.female,
  };

}
class RecommendUser_Page_NovelTop {
  final int id;
  final List<dynamic> illustIds;
  final List<String> novelIds;
  RecommendUser_Page_NovelTop({
    required this.id,
    required this.illustIds,
    required this.novelIds,
  });

  factory RecommendUser_Page_NovelTop.fromJson(Map<String, dynamic> json) => RecommendUser_Page_NovelTop(
    id=json["id"],
    illustIds=json["illustIds"],
    novelIds=json["novelIds"],
  );

  Map<String, dynamic> RecommendUser_Page_NovelTop.toJson() => Map<String, dynamic>{
    "id": this.id,
    "illustIds": this.illustIds,
    "novelIds": this.novelIds,
  };

}
class Recommend_Page_NovelTop {
  final List<String> ids;
  final Map<String, String> details;
  Recommend_Page_NovelTop({
    required this.ids,
    required this.details,
  });

  factory Recommend_Page_NovelTop.fromJson(Map<String, dynamic> json) => Recommend_Page_NovelTop(
    ids=json["ids"],
    details=Map<String, String>.fromJson(json["details"])
  );

  Map<String, dynamic> Recommend_Page_NovelTop.toJson() => Map<String, dynamic>{
    "ids": this.ids,
    "details": this.details.toJson(),
  };

}
class Page_NovelTop {
  final List<Tags_Page_NovelTop> tags;
  final List<int> follow;
  final List<dynamic> mypixiv;
  final List<dynamic> watchedSeriesIds;
  final List<String> popularSeriesIds;
  final List<dynamic> malePopularSeriesIds;
  final List<dynamic> femalePopularSeriesIds;
  final Ranking_Page_NovelTop ranking;
  final List<Pixivision_Page_NovelTop> pixivision;
  final List<EditorRecommend_Page_NovelTop> editorRecommend;
  final List<Promo_Page_NovelTop> promo;
  final List<ContestOngoing_Page_NovelTop> contestOngoing;
  final List<dynamic> contestResult;
  final List<String> userEventIds;
  final GenderRanking_Page_NovelTop genderRanking;
  final List<RecommendUser_Page_NovelTop> recommendUser;
  final List<dynamic> myFavoriteTags;
  final Recommend_Page_NovelTop recommend;
  final List<String> completeRequestIds;
  final String popularSeriesGender;
  final List<dynamic> newNovels;
  Page_NovelTop({
    required this.tags,
    required this.follow,
    required this.mypixiv,
    required this.watchedSeriesIds,
    required this.popularSeriesIds,
    required this.malePopularSeriesIds,
    required this.femalePopularSeriesIds,
    required this.ranking,
    required this.pixivision,
    required this.editorRecommend,
    required this.promo,
    required this.contestOngoing,
    required this.contestResult,
    required this.userEventIds,
    required this.genderRanking,
    required this.recommendUser,
    required this.myFavoriteTags,
    required this.recommend,
    required this.completeRequestIds,
    required this.popularSeriesGender,
    required this.newNovels,
  });

  factory Page_NovelTop.fromJson(Map<String, dynamic> json) => Page_NovelTop(
    tags=json["tags"],
    follow=json["follow"],
    mypixiv=json["mypixiv"],
    watchedSeriesIds=json["watchedSeriesIds"],
    popularSeriesIds=json["popularSeriesIds"],
    malePopularSeriesIds=json["malePopularSeriesIds"],
    femalePopularSeriesIds=json["femalePopularSeriesIds"],
    ranking=Ranking_Page_NovelTop.fromJson(json["ranking"])
    pixivision=json["pixivision"],
    editorRecommend=json["editorRecommend"],
    promo=json["promo"],
    contestOngoing=json["contestOngoing"],
    contestResult=json["contestResult"],
    userEventIds=json["userEventIds"],
    genderRanking=GenderRanking_Page_NovelTop.fromJson(json["genderRanking"])
    recommendUser=json["recommendUser"],
    myFavoriteTags=json["myFavoriteTags"],
    recommend=Recommend_Page_NovelTop.fromJson(json["recommend"])
    completeRequestIds=json["completeRequestIds"],
    popularSeriesGender=json["popularSeriesGender"],
    newNovels=json["newNovels"],
  );

  Map<String, dynamic> Page_NovelTop.toJson() => Map<String, dynamic>{
    "tags": this.tags,
    "follow": this.follow,
    "mypixiv": this.mypixiv,
    "watchedSeriesIds": this.watchedSeriesIds,
    "popularSeriesIds": this.popularSeriesIds,
    "malePopularSeriesIds": this.malePopularSeriesIds,
    "femalePopularSeriesIds": this.femalePopularSeriesIds,
    "ranking": this.ranking,
    "pixivision": this.pixivision,
    "editorRecommend": this.editorRecommend,
    "promo": this.promo,
    "contestOngoing": this.contestOngoing,
    "contestResult": this.contestResult,
    "userEventIds": this.userEventIds,
    "genderRanking": this.genderRanking,
    "recommendUser": this.recommendUser,
    "myFavoriteTags": this.myFavoriteTags,
    "recommend": this.recommend,
    "completeRequestIds": this.completeRequestIds,
    "popularSeriesGender": this.popularSeriesGender,
    "newNovels": this.newNovels,
  };

}
class TitleCaptionTranslation_Novel_Thumbnails_NovelTop {
  final Null? workTitle;
  final Null? workCaption;
  TitleCaptionTranslation_Novel_Thumbnails_NovelTop({
     this.workTitle,
     this.workCaption,
  });

  factory TitleCaptionTranslation_Novel_Thumbnails_NovelTop.fromJson(Map<String, dynamic> json) => TitleCaptionTranslation_Novel_Thumbnails_NovelTop(
    workTitle=json["workTitle"],
    workCaption=json["workCaption"],
  );

  Map<String, dynamic> TitleCaptionTranslation_Novel_Thumbnails_NovelTop.toJson() => Map<String, dynamic>{
    "workTitle": this.workTitle,
    "workCaption": this.workCaption,
  };

}
class Novel_Thumbnails_NovelTop {
  final String id;
  final String title;
  final int xRestrict;
  final int restrict;
  final String url;
  final List<String> tags;
  final String userId;
  final String userName;
  final String profileImageUrl;
  final int textCount;
  final int wordCount;
  final int readingTime;
  final bool useWordCount;
  final String description;
  final bool isBookmarkable;
  final Null? bookmarkData;
  final int bookmarkCount;
  final bool isOriginal;
  final Null? marker;
  final TitleCaptionTranslation_Novel_Thumbnails_NovelTop titleCaptionTranslation;
  final String createDate;
  final String updateDate;
  final bool isMasked;
  final bool isUnlisted;
  final int aiType;
  final String genre;
  Novel_Thumbnails_NovelTop({
    required this.id,
    required this.title,
    required this.xRestrict,
    required this.restrict,
    required this.url,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.profileImageUrl,
    required this.textCount,
    required this.wordCount,
    required this.readingTime,
    required this.useWordCount,
    required this.description,
    required this.isBookmarkable,
     this.bookmarkData,
    required this.bookmarkCount,
    required this.isOriginal,
     this.marker,
    required this.titleCaptionTranslation,
    required this.createDate,
    required this.updateDate,
    required this.isMasked,
    required this.isUnlisted,
    required this.aiType,
    required this.genre,
  });

  factory Novel_Thumbnails_NovelTop.fromJson(Map<String, dynamic> json) => Novel_Thumbnails_NovelTop(
    id=json["id"],
    title=json["title"],
    xRestrict=json["xRestrict"],
    restrict=json["restrict"],
    url=json["url"],
    tags=json["tags"],
    userId=json["userId"],
    userName=json["userName"],
    profileImageUrl=json["profileImageUrl"],
    textCount=json["textCount"],
    wordCount=json["wordCount"],
    readingTime=json["readingTime"],
    useWordCount=json["useWordCount"],
    description=json["description"],
    isBookmarkable=json["isBookmarkable"],
    bookmarkData=json["bookmarkData"],
    bookmarkCount=json["bookmarkCount"],
    isOriginal=json["isOriginal"],
    marker=json["marker"],
    titleCaptionTranslation=TitleCaptionTranslation_Novel_Thumbnails_NovelTop.fromJson(json["titleCaptionTranslation"])
    createDate=json["createDate"],
    updateDate=json["updateDate"],
    isMasked=json["isMasked"],
    isUnlisted=json["isUnlisted"],
    aiType=json["aiType"],
    genre=json["genre"],
  );

  Map<String, dynamic> Novel_Thumbnails_NovelTop.toJson() => Map<String, dynamic>{
    "id": this.id,
    "title": this.title,
    "xRestrict": this.xRestrict,
    "restrict": this.restrict,
    "url": this.url,
    "tags": this.tags,
    "userId": this.userId,
    "userName": this.userName,
    "profileImageUrl": this.profileImageUrl,
    "textCount": this.textCount,
    "wordCount": this.wordCount,
    "readingTime": this.readingTime,
    "useWordCount": this.useWordCount,
    "description": this.description,
    "isBookmarkable": this.isBookmarkable,
    "bookmarkData": this.bookmarkData,
    "bookmarkCount": this.bookmarkCount,
    "isOriginal": this.isOriginal,
    "marker": this.marker,
    "titleCaptionTranslation": this.titleCaptionTranslation,
    "createDate": this.createDate,
    "updateDate": this.updateDate,
    "isMasked": this.isMasked,
    "isUnlisted": this.isUnlisted,
    "aiType": this.aiType,
    "genre": this.genre,
  };

}
class Cover_NovelSeries_Thumbnails_NovelTop {
  final Map<String, String> urls;
  Cover_NovelSeries_Thumbnails_NovelTop({
    required this.urls,
  });

  factory Cover_NovelSeries_Thumbnails_NovelTop.fromJson(Map<String, dynamic> json) => Cover_NovelSeries_Thumbnails_NovelTop(
    urls=Map<String, String>.fromJson(json["urls"])
  );

  Map<String, dynamic> Cover_NovelSeries_Thumbnails_NovelTop.toJson() => Map<String, dynamic>{
    "urls": this.urls.toJson(),
  };

}
class NovelSeries_Thumbnails_NovelTop {
  final String id;
  final String title;
  final Null? titleCaptionTranslation;
  final Cover_NovelSeries_Thumbnails_NovelTop cover;
  final List<String> tags;
  final int xRestrict;
  final bool isOriginal;
  final String genre;
  final String createDateTime;
  final String updateDateTime;
  final String userId;
  final String userName;
  final String profileImageUrl;
  final int bookmarkCount;
  final bool isOneshot;
  final String caption;
  final bool isConcluded;
  final int episodeCount;
  final int publishedEpisodeCount;
  final String latestPublishDateTime;
  final String latestEpisodeId;
  final bool isWatched;
  final bool isNotifying;
  final int restrict;
  final int textLength;
  final int wordCount;
  final int readingTime;
  final int publishedTextLength;
  final int publishedWordCount;
  final int publishedReadingTime;
  final bool useWordCount;
  final int aiType;
  NovelSeries_Thumbnails_NovelTop({
    required this.id,
    required this.title,
     this.titleCaptionTranslation,
    required this.cover,
    required this.tags,
    required this.xRestrict,
    required this.isOriginal,
    required this.genre,
    required this.createDateTime,
    required this.updateDateTime,
    required this.userId,
    required this.userName,
    required this.profileImageUrl,
    required this.bookmarkCount,
    required this.isOneshot,
    required this.caption,
    required this.isConcluded,
    required this.episodeCount,
    required this.publishedEpisodeCount,
    required this.latestPublishDateTime,
    required this.latestEpisodeId,
    required this.isWatched,
    required this.isNotifying,
    required this.restrict,
    required this.textLength,
    required this.wordCount,
    required this.readingTime,
    required this.publishedTextLength,
    required this.publishedWordCount,
    required this.publishedReadingTime,
    required this.useWordCount,
    required this.aiType,
  });

  factory NovelSeries_Thumbnails_NovelTop.fromJson(Map<String, dynamic> json) => NovelSeries_Thumbnails_NovelTop(
    id=json["id"],
    title=json["title"],
    titleCaptionTranslation=json["titleCaptionTranslation"],
    cover=Cover_NovelSeries_Thumbnails_NovelTop.fromJson(json["cover"])
    tags=json["tags"],
    xRestrict=json["xRestrict"],
    isOriginal=json["isOriginal"],
    genre=json["genre"],
    createDateTime=json["createDateTime"],
    updateDateTime=json["updateDateTime"],
    userId=json["userId"],
    userName=json["userName"],
    profileImageUrl=json["profileImageUrl"],
    bookmarkCount=json["bookmarkCount"],
    isOneshot=json["isOneshot"],
    caption=json["caption"],
    isConcluded=json["isConcluded"],
    episodeCount=json["episodeCount"],
    publishedEpisodeCount=json["publishedEpisodeCount"],
    latestPublishDateTime=json["latestPublishDateTime"],
    latestEpisodeId=json["latestEpisodeId"],
    isWatched=json["isWatched"],
    isNotifying=json["isNotifying"],
    restrict=json["restrict"],
    textLength=json["textLength"],
    wordCount=json["wordCount"],
    readingTime=json["readingTime"],
    publishedTextLength=json["publishedTextLength"],
    publishedWordCount=json["publishedWordCount"],
    publishedReadingTime=json["publishedReadingTime"],
    useWordCount=json["useWordCount"],
    aiType=json["aiType"],
  );

  Map<String, dynamic> NovelSeries_Thumbnails_NovelTop.toJson() => Map<String, dynamic>{
    "id": this.id,
    "title": this.title,
    "titleCaptionTranslation": this.titleCaptionTranslation,
    "cover": this.cover,
    "tags": this.tags,
    "xRestrict": this.xRestrict,
    "isOriginal": this.isOriginal,
    "genre": this.genre,
    "createDateTime": this.createDateTime,
    "updateDateTime": this.updateDateTime,
    "userId": this.userId,
    "userName": this.userName,
    "profileImageUrl": this.profileImageUrl,
    "bookmarkCount": this.bookmarkCount,
    "isOneshot": this.isOneshot,
    "caption": this.caption,
    "isConcluded": this.isConcluded,
    "episodeCount": this.episodeCount,
    "publishedEpisodeCount": this.publishedEpisodeCount,
    "latestPublishDateTime": this.latestPublishDateTime,
    "latestEpisodeId": this.latestEpisodeId,
    "isWatched": this.isWatched,
    "isNotifying": this.isNotifying,
    "restrict": this.restrict,
    "textLength": this.textLength,
    "wordCount": this.wordCount,
    "readingTime": this.readingTime,
    "publishedTextLength": this.publishedTextLength,
    "publishedWordCount": this.publishedWordCount,
    "publishedReadingTime": this.publishedReadingTime,
    "useWordCount": this.useWordCount,
    "aiType": this.aiType,
  };

}
class Thumbnails_NovelTop {
  final List<dynamic> illust;
  final List<Novel_Thumbnails_NovelTop> novel;
  final List<NovelSeries_Thumbnails_NovelTop> novelSeries;
  Thumbnails_NovelTop({
    required this.illust,
    required this.novel,
    required this.novelSeries,
  });

  factory Thumbnails_NovelTop.fromJson(Map<String, dynamic> json) => Thumbnails_NovelTop(
    illust=json["illust"],
    novel=json["novel"],
    novelSeries=json["novelSeries"],
  );

  Map<String, dynamic> Thumbnails_NovelTop.toJson() => Map<String, dynamic>{
    "illust": this.illust,
    "novel": this.novel,
    "novelSeries": this.novelSeries,
  };

}
class Users_NovelTop {
  final int partial;
  final String comment;
  final bool followedBack;
  final String userId;
  final String name;
  final String image;
  final String imageBig;
  final bool premium;
  final bool isFollowed;
  final bool isMypixiv;
  final bool isBlocking;
  final Null? background;
  final bool acceptRequest;
  Users_NovelTop({
    required this.partial,
    required this.comment,
    required this.followedBack,
    required this.userId,
    required this.name,
    required this.image,
    required this.imageBig,
    required this.premium,
    required this.isFollowed,
    required this.isMypixiv,
    required this.isBlocking,
     this.background,
    required this.acceptRequest,
  });

  factory Users_NovelTop.fromJson(Map<String, dynamic> json) => Users_NovelTop(
    partial=json["partial"],
    comment=json["comment"],
    followedBack=json["followedBack"],
    userId=json["userId"],
    name=json["name"],
    image=json["image"],
    imageBig=json["imageBig"],
    premium=json["premium"],
    isFollowed=json["isFollowed"],
    isMypixiv=json["isMypixiv"],
    isBlocking=json["isBlocking"],
    background=json["background"],
    acceptRequest=json["acceptRequest"],
  );

  Map<String, dynamic> Users_NovelTop.toJson() => Map<String, dynamic>{
    "partial": this.partial,
    "comment": this.comment,
    "followedBack": this.followedBack,
    "userId": this.userId,
    "name": this.name,
    "image": this.image,
    "imageBig": this.imageBig,
    "premium": this.premium,
    "isFollowed": this.isFollowed,
    "isMypixiv": this.isMypixiv,
    "isBlocking": this.isBlocking,
    "background": this.background,
    "acceptRequest": this.acceptRequest,
  };

}
class 腐向けKTR_TagTranslation_NovelTop {
  final String romaji;
  腐向けKTR_TagTranslation_NovelTop({
    required this.romaji,
  });

  factory 腐向けKTR_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 腐向けKTR_TagTranslation_NovelTop(
    romaji=json["romaji"],
  );

  Map<String, dynamic> 腐向けKTR_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "romaji": this.romaji,
  };

}
class 二次創作_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  二次創作_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory 二次創作_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 二次創作_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> 二次創作_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class 腐ルーロック_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  腐ルーロック_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory 腐ルーロック_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 腐ルーロック_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> 腐ルーロック_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class 本好きの下剋上_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  本好きの下剋上_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory 本好きの下剋上_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 本好きの下剋上_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> 本好きの下剋上_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class Twst夢_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  Twst夢_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory Twst夢_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => Twst夢_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> Twst夢_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class 続きを全裸待機_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  続きを全裸待機_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory 続きを全裸待機_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 続きを全裸待機_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> 続きを全裸待機_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class 夢小説_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  夢小説_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory 夢小説_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 夢小説_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> 夢小説_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class 夢術廻戦_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  夢術廻戦_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory 夢術廻戦_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 夢術廻戦_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> 夢術廻戦_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class 待ってました!_TagTranslation_NovelTop {
  final String en;
  final String ko;
  final String zh;
  final String zh_tw;
  final String romaji;
  待ってました!_TagTranslation_NovelTop({
    required this.en,
    required this.ko,
    required this.zh,
    required this.zh_tw,
    required this.romaji,
  });

  factory 待ってました!_TagTranslation_NovelTop.fromJson(Map<String, dynamic> json) => 待ってました!_TagTranslation_NovelTop(
    en=json["en"],
    ko=json["ko"],
    zh=json["zh"],
    zh_tw=json["zh_tw"],
    romaji=json["romaji"],
  );

  Map<String, dynamic> 待ってました!_TagTranslation_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
    "ko": this.ko,
    "zh": this.zh,
    "zh_tw": this.zh_tw,
    "romaji": this.romaji,
  };

}
class RequestTranslationProposal_RequestProposal_Requests_NovelTop {
  final String requestProposal;
  final String requestProposalHtml;
  final String requestProposalLang;
  RequestTranslationProposal_RequestProposal_Requests_NovelTop({
    required this.requestProposal,
    required this.requestProposalHtml,
    required this.requestProposalLang,
  });

  factory RequestTranslationProposal_RequestProposal_Requests_NovelTop.fromJson(Map<String, dynamic> json) => RequestTranslationProposal_RequestProposal_Requests_NovelTop(
    requestProposal=json["requestProposal"],
    requestProposalHtml=json["requestProposalHtml"],
    requestProposalLang=json["requestProposalLang"],
  );

  Map<String, dynamic> RequestTranslationProposal_RequestProposal_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "requestProposal": this.requestProposal,
    "requestProposalHtml": this.requestProposalHtml,
    "requestProposalLang": this.requestProposalLang,
  };

}
class RequestProposal_Requests_NovelTop {
  final String requestOriginalProposal;
  final String requestOriginalProposalHtml;
  final String requestOriginalProposalLang;
  final List<RequestTranslationProposal_RequestProposal_Requests_NovelTop> requestTranslationProposal;
  RequestProposal_Requests_NovelTop({
    required this.requestOriginalProposal,
    required this.requestOriginalProposalHtml,
    required this.requestOriginalProposalLang,
    required this.requestTranslationProposal,
  });

  factory RequestProposal_Requests_NovelTop.fromJson(Map<String, dynamic> json) => RequestProposal_Requests_NovelTop(
    requestOriginalProposal=json["requestOriginalProposal"],
    requestOriginalProposalHtml=json["requestOriginalProposalHtml"],
    requestOriginalProposalLang=json["requestOriginalProposalLang"],
    requestTranslationProposal=json["requestTranslationProposal"],
  );

  Map<String, dynamic> RequestProposal_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "requestOriginalProposal": this.requestOriginalProposal,
    "requestOriginalProposalHtml": this.requestOriginalProposalHtml,
    "requestOriginalProposalLang": this.requestOriginalProposalLang,
    "requestTranslationProposal": this.requestTranslationProposal,
  };

}
class En_PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop {
  final String planTitle;
  final String planTtieLang;
  En_PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop({
    required this.planTitle,
    required this.planTtieLang,
  });

  factory En_PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop.fromJson(Map<String, dynamic> json) => En_PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop(
    planTitle=json["planTitle"],
    planTtieLang=json["planTtieLang"],
  );

  Map<String, dynamic> En_PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "planTitle": this.planTitle,
    "planTtieLang": this.planTtieLang,
  };

}
class PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop {
  final En_PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop en;
  PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop({
    required this.en,
  });

  factory PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop.fromJson(Map<String, dynamic> json) => PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop(
    en=En_PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop.fromJson(json["en"])
  );

  Map<String, dynamic> PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
  };

}
class PlanTitle_Plan_Requests_NovelTop {
  final String planOriginalTitle;
  final String planOriginalTitleLang;
  final PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop planTranslationTitle;
  PlanTitle_Plan_Requests_NovelTop({
    required this.planOriginalTitle,
    required this.planOriginalTitleLang,
    required this.planTranslationTitle,
  });

  factory PlanTitle_Plan_Requests_NovelTop.fromJson(Map<String, dynamic> json) => PlanTitle_Plan_Requests_NovelTop(
    planOriginalTitle=json["planOriginalTitle"],
    planOriginalTitleLang=json["planOriginalTitleLang"],
    planTranslationTitle=PlanTranslationTitle_PlanTitle_Plan_Requests_NovelTop.fromJson(json["planTranslationTitle"])
  );

  Map<String, dynamic> PlanTitle_Plan_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "planOriginalTitle": this.planOriginalTitle,
    "planOriginalTitleLang": this.planOriginalTitleLang,
    "planTranslationTitle": this.planTranslationTitle,
  };

}
class En_PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop {
  final String planDescription;
  final String planDescriptionHtml;
  final String planLang;
  En_PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop({
    required this.planDescription,
    required this.planDescriptionHtml,
    required this.planLang,
  });

  factory En_PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop.fromJson(Map<String, dynamic> json) => En_PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop(
    planDescription=json["planDescription"],
    planDescriptionHtml=json["planDescriptionHtml"],
    planLang=json["planLang"],
  );

  Map<String, dynamic> En_PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "planDescription": this.planDescription,
    "planDescriptionHtml": this.planDescriptionHtml,
    "planLang": this.planLang,
  };

}
class PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop {
  final En_PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop en;
  PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop({
    required this.en,
  });

  factory PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop.fromJson(Map<String, dynamic> json) => PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop(
    en=En_PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop.fromJson(json["en"])
  );

  Map<String, dynamic> PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "en": this.en,
  };

}
class PlanDescription_Plan_Requests_NovelTop {
  final String planOriginalDescription;
  final String planOriginalDescriptionHtml;
  final String planOriginalLang;
  final PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop planTranslationDescription;
  PlanDescription_Plan_Requests_NovelTop({
    required this.planOriginalDescription,
    required this.planOriginalDescriptionHtml,
    required this.planOriginalLang,
    required this.planTranslationDescription,
  });

  factory PlanDescription_Plan_Requests_NovelTop.fromJson(Map<String, dynamic> json) => PlanDescription_Plan_Requests_NovelTop(
    planOriginalDescription=json["planOriginalDescription"],
    planOriginalDescriptionHtml=json["planOriginalDescriptionHtml"],
    planOriginalLang=json["planOriginalLang"],
    planTranslationDescription=PlanTranslationDescription_PlanDescription_Plan_Requests_NovelTop.fromJson(json["planTranslationDescription"])
  );

  Map<String, dynamic> PlanDescription_Plan_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "planOriginalDescription": this.planOriginalDescription,
    "planOriginalDescriptionHtml": this.planOriginalDescriptionHtml,
    "planOriginalLang": this.planOriginalLang,
    "planTranslationDescription": this.planTranslationDescription,
  };

}
class Plan_Requests_NovelTop {
  final Null? currentPlanId;
  final String planId;
  final String creatorUserId;
  final bool planAcceptRequestFlg;
  final int planStandardPrice;
  final PlanTitle_Plan_Requests_NovelTop planTitle;
  final PlanDescription_Plan_Requests_NovelTop planDescription;
  final bool planAcceptAdultFlg;
  final bool planAcceptAnonymousFlg;
  final bool planAcceptIllustFlg;
  final bool planAcceptUgoiraFlg;
  final bool planAcceptMangaFlg;
  final bool planAcceptNovelFlg;
  final Null? planCoverImage;
  final int planAiType;
  Plan_Requests_NovelTop({
     this.currentPlanId,
    required this.planId,
    required this.creatorUserId,
    required this.planAcceptRequestFlg,
    required this.planStandardPrice,
    required this.planTitle,
    required this.planDescription,
    required this.planAcceptAdultFlg,
    required this.planAcceptAnonymousFlg,
    required this.planAcceptIllustFlg,
    required this.planAcceptUgoiraFlg,
    required this.planAcceptMangaFlg,
    required this.planAcceptNovelFlg,
     this.planCoverImage,
    required this.planAiType,
  });

  factory Plan_Requests_NovelTop.fromJson(Map<String, dynamic> json) => Plan_Requests_NovelTop(
    currentPlanId=json["currentPlanId"],
    planId=json["planId"],
    creatorUserId=json["creatorUserId"],
    planAcceptRequestFlg=json["planAcceptRequestFlg"],
    planStandardPrice=json["planStandardPrice"],
    planTitle=PlanTitle_Plan_Requests_NovelTop.fromJson(json["planTitle"])
    planDescription=PlanDescription_Plan_Requests_NovelTop.fromJson(json["planDescription"])
    planAcceptAdultFlg=json["planAcceptAdultFlg"],
    planAcceptAnonymousFlg=json["planAcceptAnonymousFlg"],
    planAcceptIllustFlg=json["planAcceptIllustFlg"],
    planAcceptUgoiraFlg=json["planAcceptUgoiraFlg"],
    planAcceptMangaFlg=json["planAcceptMangaFlg"],
    planAcceptNovelFlg=json["planAcceptNovelFlg"],
    planCoverImage=json["planCoverImage"],
    planAiType=json["planAiType"],
  );

  Map<String, dynamic> Plan_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "currentPlanId": this.currentPlanId,
    "planId": this.planId,
    "creatorUserId": this.creatorUserId,
    "planAcceptRequestFlg": this.planAcceptRequestFlg,
    "planStandardPrice": this.planStandardPrice,
    "planTitle": this.planTitle,
    "planDescription": this.planDescription,
    "planAcceptAdultFlg": this.planAcceptAdultFlg,
    "planAcceptAnonymousFlg": this.planAcceptAnonymousFlg,
    "planAcceptIllustFlg": this.planAcceptIllustFlg,
    "planAcceptUgoiraFlg": this.planAcceptUgoiraFlg,
    "planAcceptMangaFlg": this.planAcceptMangaFlg,
    "planAcceptNovelFlg": this.planAcceptNovelFlg,
    "planCoverImage": this.planCoverImage,
    "planAiType": this.planAiType,
  };

}
class CollaborateStatus_Requests_NovelTop {
  final bool collaborating;
  final bool collaborateAnonymousFlg;
  final int collaboratedCnt;
  final List<dynamic> collaborateUserSamples;
  CollaborateStatus_Requests_NovelTop({
    required this.collaborating,
    required this.collaborateAnonymousFlg,
    required this.collaboratedCnt,
    required this.collaborateUserSamples,
  });

  factory CollaborateStatus_Requests_NovelTop.fromJson(Map<String, dynamic> json) => CollaborateStatus_Requests_NovelTop(
    collaborating=json["collaborating"],
    collaborateAnonymousFlg=json["collaborateAnonymousFlg"],
    collaboratedCnt=json["collaboratedCnt"],
    collaborateUserSamples=json["collaborateUserSamples"],
  );

  Map<String, dynamic> CollaborateStatus_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "collaborating": this.collaborating,
    "collaborateAnonymousFlg": this.collaborateAnonymousFlg,
    "collaboratedCnt": this.collaboratedCnt,
    "collaborateUserSamples": this.collaborateUserSamples,
  };

}
class Work_PostWork_Requests_NovelTop {
  final bool isUnlisted;
  final Null? secret;
  Work_PostWork_Requests_NovelTop({
    required this.isUnlisted,
     this.secret,
  });

  factory Work_PostWork_Requests_NovelTop.fromJson(Map<String, dynamic> json) => Work_PostWork_Requests_NovelTop(
    isUnlisted=json["isUnlisted"],
    secret=json["secret"],
  );

  Map<String, dynamic> Work_PostWork_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "isUnlisted": this.isUnlisted,
    "secret": this.secret,
  };

}
class PostWork_Requests_NovelTop {
  final String postWorkId;
  final String postWorkType;
  final Work_PostWork_Requests_NovelTop work;
  PostWork_Requests_NovelTop({
    required this.postWorkId,
    required this.postWorkType,
    required this.work,
  });

  factory PostWork_Requests_NovelTop.fromJson(Map<String, dynamic> json) => PostWork_Requests_NovelTop(
    postWorkId=json["postWorkId"],
    postWorkType=json["postWorkType"],
    work=Work_PostWork_Requests_NovelTop.fromJson(json["work"])
  );

  Map<String, dynamic> PostWork_Requests_NovelTop.toJson() => Map<String, dynamic>{
    "postWorkId": this.postWorkId,
    "postWorkType": this.postWorkType,
    "work": this.work,
  };

}
class Requests_NovelTop {
  final String requestId;
  final String planId;
  final String fanUserId;
  final String creatorUserId;
  final String requestStatus;
  final String requestAcceptStatus;
  final String requestPostWorkType;
  final int requestPrice;
  final RequestProposal_Requests_NovelTop requestProposal;
  final List<String> requestTags;
  final bool requestAdultFlg;
  final bool requestAnonymousFlg;
  final bool requestRestrictFlg;
  final bool requestAcceptCollaborateFlg;
  final String requestResponseDeadlineDatetime;
  final String requestPostDeadlineDatetime;
  final String role;
  final Plan_Requests_NovelTop plan;
  final CollaborateStatus_Requests_NovelTop collaborateStatus;
  final PostWork_Requests_NovelTop postWork;
  Requests_NovelTop({
    required this.requestId,
    required this.planId,
    required this.fanUserId,
    required this.creatorUserId,
    required this.requestStatus,
    required this.requestAcceptStatus,
    required this.requestPostWorkType,
    required this.requestPrice,
    required this.requestProposal,
    required this.requestTags,
    required this.requestAdultFlg,
    required this.requestAnonymousFlg,
    required this.requestRestrictFlg,
    required this.requestAcceptCollaborateFlg,
    required this.requestResponseDeadlineDatetime,
    required this.requestPostDeadlineDatetime,
    required this.role,
    required this.plan,
    required this.collaborateStatus,
    required this.postWork,
  });

  factory Requests_NovelTop.fromJson(Map<String, dynamic> json) => Requests_NovelTop(
    requestId=json["requestId"],
    planId=json["planId"],
    fanUserId=json["fanUserId"],
    creatorUserId=json["creatorUserId"],
    requestStatus=json["requestStatus"],
    requestAcceptStatus=json["requestAcceptStatus"],
    requestPostWorkType=json["requestPostWorkType"],
    requestPrice=json["requestPrice"],
    requestProposal=RequestProposal_Requests_NovelTop.fromJson(json["requestProposal"])
    requestTags=json["requestTags"],
    requestAdultFlg=json["requestAdultFlg"],
    requestAnonymousFlg=json["requestAnonymousFlg"],
    requestRestrictFlg=json["requestRestrictFlg"],
    requestAcceptCollaborateFlg=json["requestAcceptCollaborateFlg"],
    requestResponseDeadlineDatetime=json["requestResponseDeadlineDatetime"],
    requestPostDeadlineDatetime=json["requestPostDeadlineDatetime"],
    role=json["role"],
    plan=Plan_Requests_NovelTop.fromJson(json["plan"])
    collaborateStatus=CollaborateStatus_Requests_NovelTop.fromJson(json["collaborateStatus"])
    postWork=PostWork_Requests_NovelTop.fromJson(json["postWork"])
  );

  Map<String, dynamic> Requests_NovelTop.toJson() => Map<String, dynamic>{
    "requestId": this.requestId,
    "planId": this.planId,
    "fanUserId": this.fanUserId,
    "creatorUserId": this.creatorUserId,
    "requestStatus": this.requestStatus,
    "requestAcceptStatus": this.requestAcceptStatus,
    "requestPostWorkType": this.requestPostWorkType,
    "requestPrice": this.requestPrice,
    "requestProposal": this.requestProposal,
    "requestTags": this.requestTags,
    "requestAdultFlg": this.requestAdultFlg,
    "requestAnonymousFlg": this.requestAnonymousFlg,
    "requestRestrictFlg": this.requestRestrictFlg,
    "requestAcceptCollaborateFlg": this.requestAcceptCollaborateFlg,
    "requestResponseDeadlineDatetime": this.requestResponseDeadlineDatetime,
    "requestPostDeadlineDatetime": this.requestPostDeadlineDatetime,
    "role": this.role,
    "plan": this.plan,
    "collaborateStatus": this.collaborateStatus,
    "postWork": this.postWork,
  };

}
class Logo_ZoneConfig_NovelTop {
  final String url;
  Logo_ZoneConfig_NovelTop({
    required this.url,
  });

  factory Logo_ZoneConfig_NovelTop.fromJson(Map<String, dynamic> json) => Logo_ZoneConfig_NovelTop(
    url=json["url"],
  );

  Map<String, dynamic> Logo_ZoneConfig_NovelTop.toJson() => Map<String, dynamic>{
    "url": this.url,
  };

}
class Header_ZoneConfig_NovelTop {
  final String url;
  Header_ZoneConfig_NovelTop({
    required this.url,
  });

  factory Header_ZoneConfig_NovelTop.fromJson(Map<String, dynamic> json) => Header_ZoneConfig_NovelTop(
    url=json["url"],
  );

  Map<String, dynamic> Header_ZoneConfig_NovelTop.toJson() => Map<String, dynamic>{
    "url": this.url,
  };

}
class Footer_ZoneConfig_NovelTop {
  final String url;
  Footer_ZoneConfig_NovelTop({
    required this.url,
  });

  factory Footer_ZoneConfig_NovelTop.fromJson(Map<String, dynamic> json) => Footer_ZoneConfig_NovelTop(
    url=json["url"],
  );

  Map<String, dynamic> Footer_ZoneConfig_NovelTop.toJson() => Map<String, dynamic>{
    "url": this.url,
  };

}
class Topbranding_rectangle_ZoneConfig_NovelTop {
  final String url;
  Topbranding_rectangle_ZoneConfig_NovelTop({
    required this.url,
  });

  factory Topbranding_rectangle_ZoneConfig_NovelTop.fromJson(Map<String, dynamic> json) => Topbranding_rectangle_ZoneConfig_NovelTop(
    url=json["url"],
  );

  Map<String, dynamic> Topbranding_rectangle_ZoneConfig_NovelTop.toJson() => Map<String, dynamic>{
    "url": this.url,
  };

}
class Noveltop_appeal_ZoneConfig_NovelTop {
  final String url;
  Noveltop_appeal_ZoneConfig_NovelTop({
    required this.url,
  });

  factory Noveltop_appeal_ZoneConfig_NovelTop.fromJson(Map<String, dynamic> json) => Noveltop_appeal_ZoneConfig_NovelTop(
    url=json["url"],
  );

  Map<String, dynamic> Noveltop_appeal_ZoneConfig_NovelTop.toJson() => Map<String, dynamic>{
    "url": this.url,
  };

}
class ZoneConfig_NovelTop {
  final Logo_ZoneConfig_NovelTop logo;
  final Header_ZoneConfig_NovelTop header;
  final Footer_ZoneConfig_NovelTop footer;
  final Topbranding_rectangle_ZoneConfig_NovelTop topbranding_rectangle;
  final Noveltop_appeal_ZoneConfig_NovelTop noveltop_appeal;
  ZoneConfig_NovelTop({
    required this.logo,
    required this.header,
    required this.footer,
    required this.topbranding_rectangle,
    required this.noveltop_appeal,
  });

  factory ZoneConfig_NovelTop.fromJson(Map<String, dynamic> json) => ZoneConfig_NovelTop(
    logo=Logo_ZoneConfig_NovelTop.fromJson(json["logo"])
    header=Header_ZoneConfig_NovelTop.fromJson(json["header"])
    footer=Footer_ZoneConfig_NovelTop.fromJson(json["footer"])
    topbranding_rectangle=Topbranding_rectangle_ZoneConfig_NovelTop.fromJson(json["topbranding_rectangle"])
    noveltop_appeal=Noveltop_appeal_ZoneConfig_NovelTop.fromJson(json["noveltop_appeal"])
  );

  Map<String, dynamic> ZoneConfig_NovelTop.toJson() => Map<String, dynamic>{
    "logo": this.logo,
    "header": this.header,
    "footer": this.footer,
    "topbranding_rectangle": this.topbranding_rectangle,
    "noveltop_appeal": this.noveltop_appeal,
  };

}
class NovelTop {
  final Page_NovelTop page;
  final Thumbnails_NovelTop thumbnails;
  final List<Users_NovelTop> users;
  final Map<String, 待ってました!_TagTranslation_NovelTop> tagTranslation;
  final List<dynamic> novelSeries;
  final List<Requests_NovelTop> requests;
  final ZoneConfig_NovelTop zoneConfig;
  NovelTop({
    required this.page,
    required this.thumbnails,
    required this.users,
    required this.tagTranslation,
    required this.novelSeries,
    required this.requests,
    required this.zoneConfig,
  });

  factory NovelTop.fromJson(Map<String, dynamic> json) => NovelTop(
    page=Page_NovelTop.fromJson(json["page"])
    thumbnails=Thumbnails_NovelTop.fromJson(json["thumbnails"])
    users=json["users"],
    tagTranslation=Map<String, 待ってました!_TagTranslation_NovelTop>.fromJson(json["tagTranslation"])
    novelSeries=json["novelSeries"],
    requests=json["requests"],
    zoneConfig=ZoneConfig_NovelTop.fromJson(json["zoneConfig"])
  );

  Map<String, dynamic> NovelTop.toJson() => Map<String, dynamic>{
    "page": this.page,
    "thumbnails": this.thumbnails,
    "users": this.users,
    "tagTranslation": this.tagTranslation.toJson(),
    "novelSeries": this.novelSeries,
    "requests": this.requests,
    "zoneConfig": this.zoneConfig,
  };

}
