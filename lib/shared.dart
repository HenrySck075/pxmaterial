/// Collection of classes and utilities that will be used across the codebases (unordered) (actually its sort by newest and relevancy)
/// TODO: i regret squeezing everything into 1 file. tl;dr: chunk this
// ignore_for_file: no_logic_in_create_state
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
export 'package:sofieru/silly.dart';
import 'package:flutter_image/network.dart';

//import 'package:window_size/window_size.dart';


Future<FetchInstructions> retry(Uri uri, FetchFailure? fail) async {
  if (fail != null) {
    if ([403].contains(fail.httpStatusCode)) {return FetchInstructions.giveUp(uri: uri);}
    else {return await Future.delayed(Duration(milliseconds:500*fail.attemptCount), ()=>FetchInstructions.attempt(uri: uri, timeout: Duration(seconds:30)));}
  }
  else {
    return FetchInstructions.attempt(uri: uri, timeout: Duration(seconds: 30));
  }
}

class Breakpoints {
  BuildContext context;
  MediaQueryData _q;
  Breakpoints({required this.context}):_q=MediaQuery.of(context);

  bool get compact=>_q.size.width<60;
  bool get medium=>_q.size.width>=600&&_q.size.width<840;
  bool get extended=>_q.size.width>=840;
  bool get large=>_q.size.width>=1200&&_q.size.width<1600;
  bool get extralarge=>_q.size.width>=1600;

  bool get mediumOrMore=>medium||extended;
  bool get largeOrMore=>large||extralarge;
}
/// skill issue
class WidthDependentTabBar extends StatelessWidget {
  List<Widget> tabs;
  TabController? controller;
  void Function(int)? onTap;
  WidthDependentTabBar({
    super.key, 
    required this.tabs, 
    this.controller,
    this.onTap,
  });
  @override
  Widget build(ctx)=>TabBar(
    tabs: tabs,
    controller: controller,
    isScrollable: Breakpoints(context: ctx).mediumOrMore,
    tabAlignment: Breakpoints(context: ctx).mediumOrMore?TabAlignment.start:null
  );
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
      //setWindowTitle(title);
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

/// high chance that pixiv will litter these emojis everywhere (they're inconsistent)
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



void printWrapped(String text) => RegExp('.{1,800}').allMatches(text).map((m) => m.group(0)).forEach(print);

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

