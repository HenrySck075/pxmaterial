import '../../../user/User.dart' show User;
import '../../../shared/Thumbnails.dart' show Thumbnails;
import '../../../shared/TagTranslation.dart' show TagTranslationContent;
import '../../../request/RequestLite.dart' show RequestLite;
import 'Page.dart' show Page;
import 'package:json_annotation/json_annotation.dart';
part 'Request.g.dart';

@JsonSerializable()
class Request {
  /// Metadata to build contents around the main content
  final Page page;
  /// List of [RequestLite] objects to lookup
  final List<RequestLite> requests;
  /// Map of tag translations 
  final Map<String, TagTranslationContent> tagTranslation;
  /// Collection of works objects
  final Thumbnails thumbnails;
  /// List of [User]s to lookup
  final List<User> users;
  Request({
    required this.page,
    required this.requests,
    required this.tagTranslation,
    required this.thumbnails,
    required this.users,
  });

  factory Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);
  
}
