
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import "route.dart";
import 'package:sofieru/appdata.dart';
/// automatically set by tools/version.py
String apiVersion = "01de101200242486b5d1bfd48ae8a7e1b8743475";

Map<String, http.Response> _cachedResponse = {};
void clearRequestCache(){
  _cachedResponse.clear();
}
var client = http.Client();
Future<void> wait(FutureOr<bool> Function(dynamic) predicate) async => await Future.doWhile(() => Future.delayed(const Duration(milliseconds: 500)).then(predicate));

String cooki = "";
String userId = "";

void updateCookie(String die) {
  cooki = AppSettings().cookie = die;
  // ik im dumb
  try {
    userId = die.split("PHPSESSID=")[1].split("_")[0];
  } catch (e) {}
}

/// [pxRequest] without postprocess
Future<http.Response> pxRequestUnprocessed(String url, {
  Map<String, String>? otherHeaders, String method="GET", Object? body, bool noCache = false, Map<String, dynamic> extraData = const {},
  void Function(double percent, int total)? onProgress
}) async {
  if (otherHeaders == null) {otherHeaders = {};}
  // wait for cookies to not empty (it will never)

  var headers = {
    "Referer": "https://www.pixiv.net/en/",
    "X-User-Id": userId,
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0"
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
  var d = pxRequestUnprocessed(url,otherHeaders: otherHeaders..addEntries([MapEntry("Cookie", cooki.trim())]), method: method, body:body, noCache: noCache, extraData: extraData).then((v){
    String? newCook = v.headers["Set-Cookie"]?.split(";")[0];
    if (newCook!=null) {
      // i doubt that dart will even try to handle multiple Set-Cookie headers
      updateCookie(cooki.replaceFirst(RegExp(newCook.split("=")[0]+r"=([a-zA-Z0-9_\.]*)"), newCook));
    }


    var decoded = jsonDecode(v.body);
    if (decoded["error"]) {
      print(decoded["message"]);
      print(url);
      /*if (decoded["message"]=="Invalid request.") {
        cooki = "";
        userId = "";
      }
      */
    }

    return decoded["body"];
  });
  var h = currentRouteURI().path;
  if (_requestsOnPage[h]==null) _requestsOnPage[h] = [];
  _requestsOnPage[h]!.add(url);
  return d;
}
