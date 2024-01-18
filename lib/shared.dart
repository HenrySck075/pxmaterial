// Collection of classes and utilities that will be used across the codebases
// ignore_for_file: no_logic_in_create_state
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
export 'package:sofieru/silly.dart';

import 'package:shared_preferences/shared_preferences.dart';

String apiVersion = "6c38cc7c723c6ae8b0dc7022d497a1ee751824c0";

GoRouter router = GoRouter(routes: []);
String cooki = "";
void updateCookie(String die) {
  cooki = die;
}
void updateRouter(GoRouter r) {
  router = r;
}

Map<String, String> getQueries() => router.routeInformationProvider.value.uri.queryParameters;

Map<String, dynamic> _config = {};
Future<void> updatePref() async{
  // how to effectively freeze app init
  await (await SharedPreferences.getInstance()).setString("config", jsonEncode(_config));
}
class Config extends ChangeNotifier {
  Map<String, dynamic> search_options = {
    "order": "date_d",
    "mode": "all",
    "type": "all",
    "s_type": "s_tag_full"
  };
  bool inited = false;
  Future<void> init() async {
    if (inited) return;
    _config = jsonDecode((await SharedPreferences.getInstance()).getString("config")??"{}");
    if (_config.containsKey("search_options")) {
      search_options = _config["search_options"];
    }
    inited = true;
    await update();
  }
  Future<void> update() async {
    _config["search_options"] = search_options;

    updatePref().then((oge)=>notifyListeners());
  }
}

void navigate(String location, {String method = "push"}) {
  late var r;
  switch (method) {
    case "push":
      r = router.push;
      break;
    case "replace":
      r = router.replace;
      break;
    case "go":
      r = router.go;
      break;
    default: 
      r = router.push;
  }
  r(location);
}
typedef JSON = Map<String, dynamic>;

/// high chance that pixiv will liter these emojis everywhere (they're inconsistent)
Map<String, int> emojis = {'normal': 101, 'surprise': 102, 'serious': 103, 'heaven': 104, 'happy': 105, 'excited': 106, 'sing': 107, 'cry': 108, 'normal2': 201, 'shame2': 202, 'love2': 203, 'interesting2': 204, 'blush2': 205, 'fire2': 206, 'angry2': 207, 'shine2': 208, 'panic2': 209, 'normal3': 301, 'satisfaction3': 302, 'surprise3': 303, 'smile3': 304, 'shock3': 305, 'gaze3': 306, 'wink3': 307, 'happy3': 308, 'excited3': 309, 'love3': 310, 'normal4': 401, 'surprise4': 402, 'serious4': 403, 'love4': 404, 'shine4': 405, 'sweat4': 406, 'shame4': 407, 'sleep4': 408, 'heart': 501, 'teardrop': 502, 'star': 503};
String p(String the) {
  emojis.entries.forEach((e) {
    the = the.replaceAll("(${e.key})", '<img src="https://s.pximg.net/common/images/emoji/${e.value}.png" width="24" height="24">');
  });
  return the;
}
Iterable<T> map<T,E extends Iterable>(E realestate, T toElement(E e)) sync* {
  for (var value in realestate) {
    yield toElement(value);
  }
}
Iterable<T> enumerate<T, E>(Iterable<E> iter, T cooker(int index, E e)) sync* {
  print(iter);
  int index = 0;
  final int len = iter.length;
  while (index < len) {
    yield cooker(index, iter.elementAt(index));
    index+=1;
  }
}
Map<String, Future<dynamic>> mentalRetardation = {};
var client = http.Client();
/// [pxRequest] without postprocess
Future<void> wait(FutureOr<bool> Function(dynamic) predicate) async => await Future.doWhile(() => Future.delayed(const Duration(milliseconds: 500)).then(predicate));
Future<http.Response> pxRequestUnprocessed(String url, {
  Map<String, String> otherHeaders = const {}, String method="GET", Object? body, 
  void Function(double percent, int total)? onProgress
}) async {
  // wait for cookies to not empty (it will never)
  if (cooki == "") await wait((_) => cooki=="");

  var headers = {
    "cookie": cooki.trim(),
    "referer": "https://www.pixiv.net/en/",
    "x-user-id": "76179633",
    "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0"
  };
  headers.addAll(otherHeaders);

  url = '${url+(url.contains("?")?"&":"?")}lang=en&version=$apiVersion';
  if (kIsWeb) {
    url="http://localhost:8072/request?url=${Uri.encodeFull(url)}";
    headers = {"headers":jsonEncode(headers)};
  }

  Uri parsedUrl = Uri.parse(url);

  var req = http.Request(method.toUpperCase(),parsedUrl);
  req.headers.addAll(headers);
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
  
  return http.Response(String.fromCharCodes(bytes), resp.statusCode, headers: resp.headers);
}
Future<dynamic> pxRequest(String url, {Map<String, String> otherHeaders = const {}, String method="GET", Object? body, bool noCache = false}) {
  if (mentalRetardation.containsKey(url) && !noCache) {return mentalRetardation[url]!;}// we dont really needs to null check but dart sucks so
  var d = pxRequestUnprocessed(url,otherHeaders: otherHeaders, method: method, body:body).then((v){
    debugPrint(v.body);
    return jsonDecode(v.body)["body"];
  });
  mentalRetardation[url] = d;
  return d;

}
T? tryCast<T,O>(O? obj) {
  try {return obj as T;}
  catch (e) {return null;}
}

dynamic tryConvert(dynamic h) {
  if (h is Map) return h;
  List<MapEntry<String,dynamic>> nerd = [];
  h.forEach((v){nerd.add(MapEntry(v["id"], v));});
  h = Map.fromEntries(nerd);
  return h;
}
dynamic thumbRemap(dynamic d) {
  d["thumbnails"]["novel"] = tryConvert(d["thumbnails"]["novel"]);
  d["thumbnails"]["illust"] = tryConvert(d["thumbnails"]["illust"]);
  return d;
}
/// ^^
/// Lying
class SpicyStates extends ChangeNotifier {
  String  language = "en";

  // reset to its default value
  void refreshState(List<String> entries) {
    
    notifyListeners();
  }
}

