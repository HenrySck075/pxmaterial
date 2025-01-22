
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import "route.dart";
import 'package:sofieru/appdata.dart';

/// automatically set by tools/version.py
String apiVersion = "55526bfe1ace7c59b328b3e22c5c78d3a3400d96";

Map<String, http.Response> _cachedResponse = {};
void clearRequestCache(){
  _cachedResponse.clear();
}
var client = http.Client();
Future<void> wait(FutureOr<bool> Function(dynamic) predicate) async => await Future.doWhile(() => Future.delayed(const Duration(milliseconds: 500)).then(predicate));

String cooki = "";
Map<String, String> cookiesMap = {};
String userId = "";

void updateCookie(String d) {
  d.split(";").forEach((c){
    var g = c.trim();
    int e = g.indexOf("=");
    if (e!=-1) {
      String k = g.substring(0,e);
      // stash away security cookies (i wont use this cookies again anyways)
      if (!["expires", "path", "max-age"].contains(k.toLowerCase())) {
        updateCookieMap(k, g.substring(e+1));
      }
    }
  });
}
void updateCookieMap(String key, String value) {
  cookiesMap[key] = value;

  AppSettings().cookie = cooki;
  // ik im dumb
  if (key == "PHPSESSID") {
    userId = value.split("_")[0];
  }
}

/// [pxRequest] without postprocess
Future<http.Response> pxRequestUnprocessed(String url, {
  Map<String, String>? otherHeaders, String method="GET", Object? body, bool noCache = false, Map<String, dynamic> extraData = const {},
  void Function(double percent, int total)? onProgress
}) async {
  otherHeaders ??= {};
  // wait for cookies to not empty (it will never)

  var headers = {
    "Referer": "https://www.pixiv.net/en/",
    "X-User-Id": userId,
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0",
    "Baggage": "sentry-environment=production,sentry-release=55526bfe1ace7c59b328b3e22c5c78d3a3400d96,sentry-public_key=7b15ebdd9cf64efb88cfab93783df02a,sentry-trace_id=d9b45a04333c47d1b6ca220b32d539d9,sentry-sample_rate=0.0001"
  };
  print("-----");
  print(url);
  print(method);
  /*
  headers.addAll(otherHeaders);
  printWrapped(headers.toString());
  */
  print("-----");
  if (_cachedResponse.containsKey(url) && !noCache) {return Future.value(_cachedResponse[url]!);}// we dont really needs to null check but dart sucks so
  

  Uri parsedUrl = Uri.parse(url);

  var req = http.Request(method.toUpperCase(),parsedUrl);
  req.headers.addAll(headers);
  req.headers.addAll(otherHeaders);
  req.body = body is Map?jsonEncode(body):body.toString();
  var resp = await client.send(req);

  final List<int> bytes = [];
  bool done = false;
  resp.stream.listen((value) {
    bytes.addAll(value);
    if (onProgress!=null) onProgress(bytes.length/(resp.contentLength??-1),resp.contentLength??-1);
  },onDone: ()=>done=true);
  await wait((h) => !done);
  // print("HTTP/"+method);
  // resp.then((value) => print(value.body));
  // TODO: Set new cookie when requested and restart request if 400'd
  final ret = http.Response(String.fromCharCodes(bytes), resp.statusCode, headers: resp.headers); 
  if (method.toLowerCase()=="get") {_cachedResponse[url] = ret;}
  return ret;
}
Map<String, List<String>> _requestsOnPage = {};
void deletePageRequestCache(String page) {
  _requestsOnPage[page]?.forEach((element) {
    _cachedResponse.remove(element);
  });
  _requestsOnPage.remove(page);
}

Future<dynamic> _attemptRequest(
  String url, {Map<String, String>? otherHeaders, String method="GET", Object? body, bool noCache = false, Map<String, dynamic> extraData = const {}}
) {
  otherHeaders ??= {};
  otherHeaders.addEntries([
    MapEntry("Cookie", cooki.substring(0,cooki.isEmpty?0:cooki.length-2)),
    MapEntry("X-User-Id", userId)
  ]);
  // if (cooki == "") await wait((_) => cooki=="");
  var d = pxRequestUnprocessed(
    url,
    otherHeaders: otherHeaders, 
    method: method, 
    body:body, 
    noCache: noCache, 
    extraData: extraData
  ).then((v){
    var decoded = jsonDecode(v.body);
    if (decoded["error"]) {
      print(decoded["message"]);
      print(url);
      if (v.statusCode == 400 && v.headers.containsKey("set-cookie")) {
        updateCookie(v.headers["set-cookie"] ?? "");
      }
    }

    return decoded["body"];
  });

  return d;
}

Future<dynamic> pxRequest(String url, {Map<String, String>? otherHeaders, String method="GET", Object? body, bool noCache = false, Map<String, dynamic> extraData = const {}}) {
  otherHeaders ??= {};
  var uri = Uri.parse(url);
  // copy
  Map<String, dynamic> b = uri.queryParameters.map((k,v)=>MapEntry(k,v));
  b["lang"] = "en";
  b["version"] = apiVersion;
  url = uri.replace(
    queryParameters: b
  ).toString();

  cookiesMap.forEach((k,v){
    cooki+="$k: $v; ";
  });
  var d = _attemptRequest(
    url,
    otherHeaders: otherHeaders,
    method: method,
    body: body,
    noCache: noCache,
    extraData: extraData
  );
  var h = currentRouteURI().path;
  if (_requestsOnPage[h]==null) _requestsOnPage[h] = [];
  _requestsOnPage[h]!.add(url);
  return d;
}
