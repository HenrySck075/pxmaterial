// would you believe me when i say i just did a ctrl+c ctrl+v the artworks.dart file 

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/novel/Novel.dart';
import 'package:sofieru/json/ajax/shared/Work.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/shared/http.dart';
import "layout.dart";


class NovelPage extends StatefulWidget {
  final String id;
  const NovelPage({super.key, required this.id});
  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  late final String id;
  String authorId = "";
  // Future<JSON>? data;
  // Future<List<Map<String,String>>>? op;
  Future<dynamic>? ed;
  List<dynamic>? op;
  int novelIndex = 0;
  List<String> authNovelIds = [];
  List<int> range = [0,0];
  List<int> visibleRange = [-1,-1];
  var authNovelData = VisibleNotifyNotifier([]);
  final current = GlobalKey();

  // related artworks
  var related = VisibleNotifyNotifier([]);
  List<dynamic> relatedNextIds = []; // bruh
  /// to prevent spamming the request
  bool relatedFetching = false;

  void updateRange(int start, int end) {
    if (end >= authNovelIds.length-1) end=authNovelIds.length-1;
    if (start <= 0) start=0;
    if (visibleRange[1]==-1||end>visibleRange[1]) visibleRange[1]=end;
    if (visibleRange[0]==-1||start<visibleRange[0]) visibleRange[0]=start;
    range = [start,end];
  }
  @override
  void initState() {
    super.initState();
    id = widget.id;
    ed = pxRequest("https://www.pixiv.net/ajax/novel/$id");
  }
  @override
  Widget build(context) {
    return Scaffold(
      body: futureWidget(future: ed!, builder: (context,dd) {
        JSON data = dd.data!;
        authorId = data["userId"];
        authNovelIds = [...data["userNovels"].keys];
        novelIndex = authNovelIds.indexOf(id);
        updateRange(novelIndex-7, novelIndex+7);
        setTitle(data["alt"]+" - pixiv");
        return WorkLayout(
          data: data as Work,
          wtype: WorkType.novel,
          view: Text(data["content"],softWrap: true,),
          authorWorksItemBuilder: (e,[k])=>PxNovel(
            data: e,
          ),
          relatedWorksItemBuilder: (e) => PxNovel(data: e),
        );
      }),
    );
  }
}
