import 'package:json_annotation/json_annotation.dart';
import 'package:sofieru/json/ajax/request/RequestLite.dart' show RequestLite;
import 'package:sofieru/json/operator_bracket.dart';
import 'BasedOn.dart';
import '../shared/TitleCaptionTranslation.dart';
part 'Artwork.g.dart';

@JsonSerializable()
/// Artwork url at different sizes
class _Urls {
  final String? mini;
  final String? thumb;
  final String? small;
  final String? regular;
  final String? original;
  _Urls({
    required this.mini,
    required this.thumb,
    required this.small,
    required this.regular,
    required this.original,
  });

  factory _Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
  
  /// You still have to make sure it exists
  String? operator [] (String idk) => eval(this, idk);
}
@JsonSerializable()
/// Tag details
class _TagItem {
  /// tag name
  final String tag;
  /// idk what this is, maybe prevent users from removing it?
  final bool locked;
  /// possibly the negation of locked
  final bool deletable;
  /// the id of the user who added this tag (why?)
  final String? userId;
  /// how do you spell the tag
  final String? romaji;
  /// translations
  final Map<String, String>? translation;
  /// h
  final String? userName;
  _TagItem({
    required this.tag,
    required this.locked,
    required this.deletable,
    required this.userId,
    required this.romaji,
    required this.translation,
    required this.userName,
  });

  factory _TagItem.fromJson(Map<String, dynamic> json) => _$TagItemFromJson(json);
  
}
@JsonSerializable()
/// this doesnt make any sense
class _Tags {
  final String authorId;
  final bool isLocked;
  final List<_TagItem> tags;
  final bool writable;
  _Tags({
    required this.authorId,
    required this.isLocked,
    required this.tags,
    required this.writable,
  });

  factory _Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  
}
@JsonSerializable()
/// Description but other languages
/// 
/// TODO: Replace this with Map<String, dynamic>
class _AlternateLanguages {
  final String ja;
  final String en;
  _AlternateLanguages({
    required this.ja,
    required this.en,
  });

  factory _AlternateLanguages.fromJson(Map<String, dynamic> json) => _$AlternateLanguagesFromJson(json);
  
}
@JsonSerializable()
/// Embed metadata 
/// 
/// If `type` is non-null, the [_EmbedMeta] is for ogp, else it's for twitter
class _EmbedMeta {
  final String description;
  final String image;
  final String title;
  final String? type;
  final String? card;
  _EmbedMeta({
    required this.description,
    required this.image,
    required this.title,
    this.type,
    this.card,
  });

  factory _EmbedMeta.fromJson(Map<String, dynamic> json) => _$EmbedMetaFromJson(json);
  
}
@JsonSerializable()
/// The metadata for embeds & titles (not to be confused with Facebook)
class _Meta {
  /// Page title
  final String title;
  /// Page description
  final String description;
  /// que
  final String canonical;
  /// Description but other languages
  final _AlternateLanguages alternateLanguages;
  /// 
  final String descriptionHeader;
  /// Embed metadata for ogp (what is this)
  final _EmbedMeta ogp;
  /// Embed metadata for twitter 
  final _EmbedMeta twitter;
  _Meta({
    required this.title,
    required this.description,
    required this.canonical,
    required this.alternateLanguages,
    required this.descriptionHeader,
    required this.ogp,
    required this.twitter,
  });

  factory _Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  
}
@JsonSerializable()
/// it only contains the metadata for embeds & titles
class _ExtraData {
  final _Meta meta;
  _ExtraData({
    required this.meta,
  });

  factory _ExtraData.fromJson(Map<String, dynamic> json) => _$ExtraDataFromJson(json);
  
}
@JsonSerializable()
class _BookmarkData {
  /// Bookmark id 
  final String id;
  /// If the bookmark is the private one 
  final bool private;
  _BookmarkData({
    required this.id,
    required this.private
  }); 

  factory _BookmarkData.fromJson(Map<String, dynamic> json) => _$BookmarkDataFromJson(json);
}
@JsonSerializable()
/// The artwork object (Embedded Request Mix)
class ArtworkLite {
  /// Artwork id
  final String id;
  /// Artwork title
  final String title;
  /// Artwork type 
  /// 
  /// Available values are: 
  /// - 0: Single-pic artwork
  /// - 1: Multi-pic artwork
  /// - 2: Animated artwork
  final int illustType;
  /// Artwork restriction state. 1 for R-18
  final int xRestrict;
  /// actually i forgor
  final int restrict;
  /// que
  final int sl;
  /// Artwork thumbnail URL
  final String url;
  /// Artwork description. The only usage of this field is the featured page in /users/:id lmao
  final String description;
  /// Artwork tag
  final List<String> tags;
  /// Author id
  final String userId;
  /// Author name
  final String userName;
  /// Artwork width (first image)
  final int width;
  /// Artwork height (first image)
  final int height;
  /// Page count
  final int pageCount;
  /// why :(((((((
  final bool isBookmarkable;
  /// Bookmark data
  final _BookmarkData? bookmarkData;
  /// Page title 
  final String alt;
  /// Title & description translation
  final TitleCaptionTranslation titleCaptionTranslation;
  /// Upload date
  final String createDate;
  /// Last updated
  final String updateDate;
  /// 
  final bool isUnlisted;
  /// i wear a mask with a smile for an hour of a time
  /// stare at the ceiling while i hold back
  final bool isMasked;
  /// truthy-falsy-based int to check if this is an ai art
  /// luckily pixiv residents ditched it :)
  final int aiType;
  ArtworkLite({
    required this.id,
    required this.title,
    required this.illustType,
    required this.xRestrict,
    required this.restrict,
    required this.sl,
    required this.url,
    required this.description,
    required this.tags,
    required this.userId,
    required this.userName,
    required this.width,
    required this.height,
    required this.pageCount,
    required this.isBookmarkable,
    this.bookmarkData,
    required this.alt,
    required this.titleCaptionTranslation,
    required this.createDate,
    required this.updateDate,
    required this.isUnlisted,
    required this.isMasked,
    required this.aiType,
  });

  factory ArtworkLite.fromJson(Map<String, dynamic> json) => _$ArtworkLiteFromJson(json);
  
}
@JsonSerializable()
/// The artwork object
class Artwork {
  /// Artwork id
  final String illustId;
  /// Artwork title
  final String illustTitle;
  /// Artwork description
  final String illustComment;
  final String id;
  final String title;
  final String description;
  /// Artwork type 
  /// 
  /// Available values are: 
  /// - 0: Single-pic artwork
  /// - 1: Multi-pic artwork
  /// - 2: Animated artwork
  final int illustType;
  /// Upload date
  final String createDate;
  /// wdym
  final String uploadDate;
  /// nuh
  final int restrict;
  /// Artwork restriction state. 1 for R-18
  final int xRestrict;
  /// TODO: i got your attention
  final int sl;
  /// Artwork url at different sizes
  final _Urls urls;
  /// Artwork tags with additional boilerplate
  final _Tags tags;
  /// Page title
  final String alt;
  /// Author id
  final String userId;
  /// Author name
  final String userName;
  /// 192.168.1.1 /// TODO: why
  final String userAccount;
  /// Author artworks 
  /// 3 available data are the next, current and the artwork before
  final Map<String, ArtworkLite?> userIllusts;
  /// TODO: how many todos are there
  final bool likeData;
  /// Artwork width (first image)
  final int width;
  /// Artwork height (first image)
  final int height;
  /// Page count
  final int pageCount;
  /// Bookmark count
  final int bookmarkCount;
  /// Like count
  final int likeCount;
  /// holy shit
  final int commentCount;
  /// wait i think this is normal
  final int responseCount;
  /// flood
  final int viewCount;
  /// book
  final int bookStyle;
  /// is a tutorial
  final bool isHowto;
  /// is oc 
  final bool isOriginal;
  /// The base artworks this one based on
  final List<BasedOn> imageResponseOutData;
  /// idk
  final List<dynamic> imageResponseData;
  /// cant you just do Artwork.imageResponseOutData.length?
  final int imageResponseCount;
  /// THERES A POLL???
  final String? pollData;
  /// Manga series navigation data 
  /// TODO: update type
  final String? seriesNavData;
  /// The relevant booth
  final String? descriptionBoothId;
  /// subscrib
  final String? descriptionYoutubeId;
  /// 
  final String? comicPromotion;
  /// 
  final String? fanboxPromotion;
  /// Contest banner, idk why is this relevant
  final List<dynamic> contestBanners;
  /// should the citizen br allowed to bookmark this
  final bool isBookmarkable;
  /// i dont have it
  final _BookmarkData? bookmarkData;
  ///
  final Map<String, dynamic>? contestData;
  /// Embed metadata
  final _ExtraData extraData;
  /// sweet
  final TitleCaptionTranslation titleCaptionTranslation;
  /// is unlisted
  final bool isUnlisted;
  /// The request this artwork is attached to
  final RequestLite? request;
  /// whether or not the citizen is allowed to express their "UWOOOOH CUNNNY 😭😭😭😭" comments
  final int commentOff;
  /// i hate ai arts 
  /// ai is not the future (for creativity fields) you lazy ass
  /// openai can you delete sora already
  final int aiType;
  /// minor spelling mistake, i win
  final String? reuploadDate;
  /// ip address: 
  final bool locationMask;
  Artwork({
    required this.illustId,
    required this.illustTitle,
    required this.illustComment,
    required this.id,
    required this.title,
    required this.description,
    required this.illustType,
    required this.createDate,
    required this.uploadDate,
    required this.restrict,
    required this.xRestrict,
    required this.sl,
    required this.urls,
    required this.tags,
    required this.alt,
    required this.userId,
    required this.userName,
    required this.userAccount,
    required this.userIllusts,
    required this.likeData,
    required this.width,
    required this.height,
    required this.pageCount,
    required this.bookmarkCount,
    required this.likeCount,
    required this.commentCount,
    required this.responseCount,
    required this.viewCount,
    required this.bookStyle,
    required this.isHowto,
    required this.isOriginal,
    required this.imageResponseOutData,
    required this.imageResponseData,
    required this.imageResponseCount,
    this.pollData,
    this.seriesNavData,
    this.descriptionBoothId,
    this.descriptionYoutubeId,
    this.comicPromotion,
    this.fanboxPromotion,
    required this.contestBanners,
    required this.isBookmarkable,
    this.bookmarkData,
    this.contestData,
    required this.extraData,
    required this.titleCaptionTranslation,
    required this.isUnlisted,
    this.request,
    required this.commentOff,
    required this.aiType,
    this.reuploadDate,
    required this.locationMask,
  });

  factory Artwork.fromJson(Map<String, dynamic> json) => _$ArtworkFromJson(json);
  
}
