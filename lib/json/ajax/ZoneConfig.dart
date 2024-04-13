class _adUrl {
  final String url;
  _adUrl({
    required this.url,
  });
  factory _adUrl.fromJson(Map<String, dynamic> json) {
    return _adUrl(
    url: json['url'],
  );}

}

/// Ads
class ZoneConfig {
  final _adUrl logo;
  final _adUrl header;
  final _adUrl footer;
  final _adUrl infeed;
  ZoneConfig({
    required this.logo,
    required this.header,
    required this.footer,
    required this.infeed,
  });
  factory ZoneConfig.fromJson(Map<String, dynamic> json) {
    return ZoneConfig(
    logo: _adUrl.fromJson(json['logo']),
    header: _adUrl.fromJson(json['header']),
    footer: _adUrl.fromJson(json['footer']),
    infeed: _adUrl.fromJson(json['infeed']),
  );}

}

