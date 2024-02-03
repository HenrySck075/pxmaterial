// would you believe me when i say i just did a ctrl+c ctrl+v the artworks.dart file 

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sofieru/shared.dart';
import 'shared.dart';


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
  final _authorNovelsViewCtrl = ScrollController();
  final _sccvCtrl = ScrollController();
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
    _sccvCtrl.addListener(() {
      if (_sccvCtrl.position.pixels>=_sccvCtrl.position.maxScrollExtent && relatedNextIds.isNotEmpty) {
        // there's like several more endpoints that does the EXACT SAME THING as this. dude can you be consistent pls
        pxRequest("https://www.pixiv.net/ajax/novel/recommend/novels?novel_ids[]=${relatedNextIds.sublist(0,18).join('&novel_ids[]=')}",otherHeaders: {"Referer":"https://www.pixiv.net/en/artworks/$id"}).then((value) {
          related.value.addAll(value["novels"]);
          relatedNextIds = relatedNextIds.sublist(20);
          related.notifyListeners();
        });
      }
    });
    _authorNovelsViewCtrl.addListener(() {
//       print("""Current: ${_authorNovelsViewCtrl.position.pixels} 
// Max scroll extent: ${_authorNovelsViewCtrl.position.maxScrollExtent}
// Min scroll extent: ${_authorNovelsViewCtrl.position.minScrollExtent}""");
      if (_authorNovelsViewCtrl.position.pixels>=_authorNovelsViewCtrl.position.maxScrollExtent && range[1]!=authNovelIds.length-1) {
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/novels?ids[]=${authNovelIds.sublist(range[1]+1,range[1]+8).join('&ids[]=')}").then((value) {
          authNovelData.value.addAll(value.values);
          updateRange(visibleRange[1]+1, visibleRange[1]+8);
          authNovelData.notifyListeners();
        });
      }
      if (_authorNovelsViewCtrl.position.pixels==_authorNovelsViewCtrl.position.minScrollExtent && range[1]!=0) {
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/novels?ids[]=${authNovelIds.sublist(range[0]-8,range[0]-1).join('&ids[]=')}").then((value) {
          authNovelData.value.insertAll(0,value.values);
          updateRange(visibleRange[0]-8, visibleRange[0]-1);
          authNovelData.notifyListeners();
        });
      }
    });
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
        return SingleChildScrollView(
          controller: _sccvCtrl,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // The artwork view
              Text(data["content"],softWrap: true,),
              const Divider(),
              // Toolbar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: ()=>print("Leave this for other uses (i might be dumb)"), icon: const Icon(Icons.download)),
                  IconButton(onPressed: (){
                    Clipboard.setData(ClipboardData(text: "https://www.pixiv.net/en/novels/$id")).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Novel URL copied to clipboard!"))
                    ));
                  }, icon: const Icon(Icons.link))
                ],
              ),
              const Divider(),
              // Artwork info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(data["title"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                  HtmlWidget(data["description"],onTapUrl: (mimk)async => launchUrl(Uri.parse(mimk))),
                  const SizedBox(height: 10,),
                  Wrap(
                    spacing: 8,
                    children: List.from(data["tags"]["tags"].map((t)=>ActionChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Flexible(flex:4,child: Text(t["tag"],overflow: TextOverflow.ellipsis,style: TextStyle(color: t["tag"].startsWith("R-18")?Colors.red:null),)),
                          if (t.containsKey("translation")) Flexible(flex:4,child: Text("(${t['translation']['en']})",style: const TextStyle(color: Colors.grey, fontSize: 10),overflow: TextOverflow.ellipsis))
                        ]
                      ),
                      onPressed: ()=>navigate("/tags/${t['tag']}/artworks?"+(t["xRestrict"]==1?"mode=r18":"")),))),
                  )
                ]),
              ),
              const Divider(),
              // Author view
              futureWidget(
                // google said this is bad, but idk
                future: pxRequest("https://www.pixiv.net/ajax/user/${data['userId']}?full=0"), 
                builder: (ctx, snap) {
                  JSON d = snap.data!;
                  return GestureDetector(
                    onTap: ()=>showDialog(
                      context: context, 
                      // ignore: prefer_const_constructors
                      builder: (c) => AuthorInfo(userId: d['userId'])
                    ),
                    child: ListTile(
                      title: Text(d["name"]),
                      subtitle: Text("Does${d['acceptRequest']?'':"n't"} accepting requests"),
                      leading: CircleAvatar(backgroundImage: pxImageUncached(d["image"]).image,) ),
                    );
                  },
                placeholder: const SizedBox(height: 1,width: 1)
              ),
              futureWidget(
                future: pxRequest("https://www.pixiv.net/ajax/user/$authorId/novels?ids[]=${authNovelIds.sublist(range[0],range[1]+1).join('&ids[]=')}"),
                builder: (context,snap) {
                  if (authNovelData.value.isEmpty) authNovelData.value = [...snap.data!.values];
                  // Future.delayed(const Duration(milliseconds: 50),()=>_authorNovelsViewCtrl.position.ensureVisible(current.currentContext!.findRenderObject()!));
                  return ListenableBuilder(
                    listenable: authNovelData,
                    builder: (ctx,w)=>ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 120),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _authorNovelsViewCtrl,
                        padding: const EdgeInsets.only(left:2,right:2),
                        children: [...authNovelData.value.map((e) => Padding(
                          padding: const EdgeInsets.only(left:2.0, right:2),
                          child: PxNovel(
                            // key: (e["id"]==id)?current:null,
                            data: e,
                          ),
                        ))],
                      )
                    )
                  );
                }
              ),
              const Divider(),
              // Comments
              Column(
                children: [
                  const Text("Comments",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                  Comments(id: id, type: "novel",)
                ],
              ),
              const Divider(),
              const Text("Related novels",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
              futureWidget(
                future: pxRequest("https://www.pixiv.net/ajax/novel/$id/recommend/init?limit=18"), 
                builder:(ctx,snap) {
                  related.value = snap.data!["novels"];
                  relatedNextIds = snap.data!["nextIds"];
                  return ListenableBuilder(
                    listenable: related,
                    builder: (ctx,w)=>artworkGrid([...related.value.map((e) => PxNovel(data: e))])
                  );
                } 
              ),
              SizedBox(height: 35,)
            ],
          ),
        );
      }),
    );
  }
}
