/// Collection of classes and utilities that will be used across the codebases (unordered) (actually its sort by newest and relevancy)
// ignore_for_file: no_logic_in_create_state
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
export 'package:sofieru/silly.dart';

import 'package:window_size/window_size.dart';

/// automatically set by tools/version.py
String apiVersion = "471f117fcde85f9ce382c9d945dc8dd854ff4358";

class Breakpoints {
  BuildContext context;
  MediaQueryData _q;
  Breakpoints({required this.context}):_q=MediaQuery.of(context);

  bool get compact=>_q.size.width<60;
  bool get medium=>_q.size.width>=600&&_q.size.width<840;
  bool get extended=>_q.size.width>=840;
  bool get large=>_q.size.width>=1200&&_q.size.width<1600;
  bool get extralarge=>_q.size.width>=1600;
}

List<T> trySublist<T>(List<T> list, int start, int? end) {
  if ((end??list.length)>list.length) end = list.length;
  return list.sublist(start,end);
}
final kIsMobile = Platform.isIOS||Platform.isAndroid;
/// set app's title
/// i love hoisting
Future<bool> HtmlUrlLauncher(String mimk) async => launchUrl(Uri.parse(mimk.contains("pixiv.net")?mimk.replaceFirst("https","pxmat").replaceFirst("www.","").replaceFirst("/en",""):mimk));

Future<void> setTitle(String title) async {
  try {
    if (kIsMobile) {
      await SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(label: title));
    }
    else {
      setWindowTitle(title);
    }
    routeObserver.addUrl(currentRouteURI().path, title);
  } catch (e) {}
}

/// for cascade ~~operator~~ syntax
T returnSelf<T>(T value) => value;
/// Listens to navigation change to modify the title
class kita extends NavigatorObserver {
  Map<String, String> urls = {};
  void didSmth(Route? route) {
    String url = route?.settings.name??currentRouteURI().path;
    print(urls.keys.contains(url));
    print(url);
    if (urls.keys.contains(url)) setTitle(urls[url]??"pixiv Material Design Concept");
  }
  @override
  void didPop(Route nocare, Route? r) => didSmth(r);
  @override
  void didRemove(Route nocare, Route? r) => didSmth(r);
  void addUrl(String url, String title) {
    urls[url] = title;
  }
}
var routeObserver = kita();

Uri currentRouteURI() {
  final RouteMatch lastMatch = router.routerDelegate.currentConfiguration.last;
  final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : router.routerDelegate.currentConfiguration;
  return matchList.uri;
}

List<T> concat2d<T>(Iterable<Iterable<T>> inp) {
  List<T> tri = [];
  inp.forEach((element) {tri.addAll(element); });
  return tri;
}
List<List<T>> split2d<T>(Iterable<T> inp, {int splitEvery=2}) {
  List<List<T>> ret = [];
  for (var i = 0; i < inp.length; i++) {
    if (i%splitEvery==0) {
      ret.add([]);
    }
    ret.last.add(inp.elementAt(i));
  }
  return ret;
}
GoRouter router = GoRouter(routes: []);
String cooki = "";
String userId = "";
void updateCookie(String die) {
  cooki = die;
  // ik im dumb
  userId = die.split("user_id=")[1].split("=")[0];
}
void updateRouter(GoRouter r) {
  router = r;
}

Map<String, String> getQueries() => router.routeInformationProvider.value.uri.queryParameters;

Map<String, dynamic> _config = {};
/*
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
*/
void navigate(String location, {String method = "push", Object? extra}) {
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
  r(location,extra:extra);
}
typedef JSON = Map<String, dynamic>;

//,/ high chance that pixiv will liter these emojis everywhere (they're inconsistent)
Map<String, int> emojis = {'normal': 101, 'surprise': 102, 'serious': 103, 'heaven': 104, 'happy': 105, 'excited': 106, 'sing': 107, 'cry': 108, 'normal2': 201, 'shame2': 202, 'love2': 203, 'interesting2': 204, 'blush2': 205, 'fire2': 206, 'angry2': 207, 'shine2': 208, 'panic2': 209, 'normal3': 301, 'satisfaction3': 302, 'surprise3': 303, 'smile3': 304, 'shock3': 305, 'gaze3': 306, 'wink3': 307, 'happy3': 308, 'excited3': 309, 'love3': 310, 'normal4': 401, 'surprise4': 402, 'serious4': 403, 'love4': 404, 'shine4': 405, 'sweat4': 406, 'shame4': 407, 'sleep4': 408, 'heart': 501, 'teardrop': 502, 'star': 503};
String p(String the) {
  emojis.entries.forEach((e) {
    the = the.replaceAll("(${e.key})", '<img src="https://s.pximg.net/common/images/emoji/${e.value}.png" width="24" height="24">');
  });
  return the;
}
Iterable<T> map<T,E extends Iterable>(E realestate, T Function(E e) toElement) sync* {
  for (var value in realestate) {
    yield toElement(value);
  }
}
Iterable<T> enumerate<T, E>(Iterable<E> iter, T Function(int index, E e) cooker) sync* {
  int index = 0;
  final int len = iter.length;
  while (index < len) {
    yield cooker(index, iter.elementAt(index));
    index+=1;
  }
}


Map<String, http.Response> _cachedResponse = {};
void clearRequestCache(){
  _cachedResponse.clear();
}
var client = http.Client();
Future<void> wait(FutureOr<bool> Function(dynamic) predicate) async => await Future.doWhile(() => Future.delayed(const Duration(milliseconds: 500)).then(predicate));
/// [pxRequest] without postprocess
Future<http.Response> pxRequestUnprocessed(String url, {
  Map<String, String>? otherHeaders, String method="GET", Object? body, bool noCache = false, Map<String, dynamic> extraData = const {},
  void Function(double percent, int total)? onProgress
}) async {
  if (otherHeaders == null) {otherHeaders = {};}
  // wait for cookies to not empty (it will never)

  var headers = {
    "referer": "https://www.pixiv.net/en/",
    "x-user-id": userId,
    "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0"
  };
  // print("-----");
  // print(url);
  // print(method);
  // print(otherHeaders);
  headers.addAll(otherHeaders);
  if (_cachedResponse.containsKey(url) && !noCache) {return Future.value(_cachedResponse[url]!);}// we dont really needs to null check but dart sucks so
  

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
Future<dynamic> pxRequest(String url, {Map<String, String>? otherHeaders, String method="GET", Object? body, bool noCache = false, Map<String, dynamic> extraData = const {}}) {
  otherHeaders ??= {};
  url = '${url+(url.contains("?")?"&":"?")}lang=en&version=$apiVersion';
  // if (cooki == "") await wait((_) => cooki=="");
  var d = pxRequestUnprocessed(url,otherHeaders: otherHeaders..addEntries([MapEntry("cookie", cooki.trim())]), method: method, body:body, noCache: noCache, extraData: extraData).then((v){
    return jsonDecode(v.body)["body"];
  });
  var h = currentRouteURI().path;
  if (_requestsOnPage[h]==null) _requestsOnPage[h] = [];
  _requestsOnPage[h]!.add(url);
  return d;
}
T? tryCast<T>(obj) {
  return obj is T?obj:null;
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

