extension type _adUrl(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    String get url => json['url'] as String;

// ----------- SETTERS ----------- 
    set url(String value) => json["url"] = value;

}

/// Ads
extension type ZoneConfig(Map<String, dynamic> json) {
// ----------- GETTERS ----------- 
    _adUrl get logo => json['logo'] as _adUrl;
    _adUrl get header => json['header'] as _adUrl;
    _adUrl get footer => json['footer'] as _adUrl;
    _adUrl get infeed => json['infeed'] as _adUrl;

// ----------- SETTERS ----------- 
    set logo(_adUrl value) => json["logo"] = value;
    set header(_adUrl value) => json["header"] = value;
    set footer(_adUrl value) => json["footer"] = value;
    set infeed(_adUrl value) => json["infeed"] = value;

}

