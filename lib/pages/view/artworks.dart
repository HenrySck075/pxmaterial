// should we use refactor

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sofieru/shared.dart';
import 'shared.dart';


class IllustPage extends StatefulWidget {
  final String id;
  const IllustPage({super.key, required this.id});
  @override
  State<IllustPage> createState() => _IllustPageState(id:id);
}

class _IllustPageState extends State<IllustPage> {
  final String id;
  String authorId = "";
  _IllustPageState({required this.id});
  // Future<JSON>? data;
  bool shownAll = false;
  // Future<List<Map<String,String>>>? op;
  Future<List<dynamic>>? ed;
  List<dynamic>? op;
  final _authorIllustsViewCtrl = ScrollController();
  final _sccvCtrl = ScrollController();
  int illustIndex = 0;
  List<String> authIllustIds = [];
  List<int> range = [0,0];
  List<int> visibleRange = [-1,-1];
  var authIllustData = VisibleNotifyNotifier([]);
  final current = GlobalKey();

  // related artworks
  var related = VisibleNotifyNotifier([]);
  List<dynamic> relatedNextIds = []; // bruh
  /// to prevent spamming the request
  bool relatedFetching = false;

  void updateRange(int start, int end) {
    if (end >= authIllustIds.length-1) end=authIllustIds.length-1;
    if (start <= 0) start=0;
    if (visibleRange[1]==-1||end>visibleRange[1]) visibleRange[1]=end;
    if (visibleRange[0]==-1||start<visibleRange[0]) visibleRange[0]=start;
    range = [start,end];
  }
  @override
  void initState() {
    super.initState();
    ed = Future.wait([
      pxRequest("https://www.pixiv.net/ajax/illust/$id"),
      pxRequest("https://www.pixiv.net/ajax/illust/$id/pages"),
    ]);
    _sccvCtrl.addListener(() {
      if (_sccvCtrl.position.pixels>=_sccvCtrl.position.maxScrollExtent && relatedNextIds.isNotEmpty) {
        // there's like several more endpoints that does the EXACT SAME THING as this. dude can you be consistent pls
        pxRequest("https://www.pixiv.net/ajax/illust/recommend/illusts?illust_ids[]=${relatedNextIds.sublist(0,18).join('&illust_ids[]=')}",otherHeaders: {"Referer":"https://www.pixiv.net/en/artworks/$id"}).then((value) {
          related.value.addAll(value["illusts"]);
          relatedNextIds = relatedNextIds.sublist(20);
          related.notifyListeners();
        });
      }
    });
    _authorIllustsViewCtrl.addListener(() {
//       print("""Current: ${_authorIllustsViewCtrl.position.pixels} 
// Max scroll extent: ${_authorIllustsViewCtrl.position.maxScrollExtent}
// Min scroll extent: ${_authorIllustsViewCtrl.position.minScrollExtent}""");
      if (_authorIllustsViewCtrl.position.pixels>=_authorIllustsViewCtrl.position.maxScrollExtent && range[1]!=authIllustIds.length-1) {
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/illusts?ids[]=${authIllustIds.sublist(range[1]+1,range[1]+8).join('&ids[]=')}").then((value) {
          authIllustData.value.addAll(value.values);
          updateRange(visibleRange[1]+1, visibleRange[1]+8);
          authIllustData.notifyListeners();
        });
      }
      if (_authorIllustsViewCtrl.position.pixels==_authorIllustsViewCtrl.position.minScrollExtent && range[1]!=0) {
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/illusts?ids[]=${authIllustIds.sublist(range[0]-8,range[0]-1).join('&ids[]=')}").then((value) {
          authIllustData.value.insertAll(0,value.values);
          updateRange(visibleRange[0]-8, visibleRange[0]-1);
          authIllustData.notifyListeners();
        });
      }
    });
  }
  @override
  Widget build(context) {
    return Scaffold(
      body: futureWidget(future: ed!, builder: (context,dd) {
        JSON d = dd.data![0];
        List<dynamic> gang = dd.data![1];
        op = (shownAll?gang:[gang[0]]);
        authorId = d["userId"];
        authIllustIds = [...d["userIllusts"].keys];
        illustIndex = authIllustIds.indexOf(id);
        updateRange(illustIndex-7, illustIndex+7);
        return SingleChildScrollView(
          controller: _sccvCtrl,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // The artwork view
              Column(children: List.from(enumerate(op!, (idx,i)=>Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: GestureDetector(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>ArtworkImageView(data: i,heroTag: "${id}_p$idx",))),
                    child:Hero(tag: "${id}_p$idx", child: pxImage(i["urls"]["regular"]))
                  ),
                )))
              ),
              if (d["pageCount"]>1) FilledButton(child: Text(shownAll?"Collapse":"Show all"),onPressed: ()=>setState((){
                op=(shownAll?gang:[gang[0]]);
                shownAll=!shownAll;
              })),
              const Divider(),
              // Toolbar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: ()=>print("Leave this for other uses (i might be dumb)"), icon: const Icon(Icons.download)),
                  IconButton(onPressed: (){
                    Clipboard.setData(ClipboardData(text: "https://www.pixiv.net/en/artworks/$id")).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Artwork URL copied to clipboard!"))
                    ));
                  }, icon: const Icon(Icons.link))
                ],
              ),
              const Divider(),
              // Artwork info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(d["title"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                  HtmlWidget(d["description"],onTapUrl: (mimk)async => launchUrl(Uri.parse(mimk))),
                  const SizedBox(height: 10,),
                  Wrap(
                    spacing: 8,
                    children: List.from(d["tags"]["tags"].map((t)=>ActionChip(
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
                future: pxRequest("https://www.pixiv.net/ajax/user/${d['userId']}?full=0"), 
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
                future: pxRequest("https://www.pixiv.net/ajax/user/$authorId/illusts?ids[]=${authIllustIds.sublist(range[0],range[1]+1).join('&ids[]=')}"),
                builder: (context,snap) {
                  if (authIllustData.value.isEmpty) authIllustData.value = [...snap.data!.values];
                  // Future.delayed(const Duration(milliseconds: 50),()=>_authorIllustsViewCtrl.position.ensureVisible(current.currentContext!.findRenderObject()!));
                  return ListenableBuilder(
                    listenable: authIllustData,
                    builder: (ctx,w)=>ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 120),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _authorIllustsViewCtrl,
                        padding: const EdgeInsets.only(left:2,right:2),
                        children: [...authIllustData.value.map((e) => Padding(
                          padding: const EdgeInsets.only(left:2.0, right:2),
                          child: PxSimpleArtwork(
                            key: (e["id"]==id)?current:null,
                            data: e,
                            isCurrent: e["id"]==id,
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
                  Comments(id: id)
                ],
              ),
              const Divider(),
              const Text("Related artworks",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
              futureWidget(
                future: pxRequest("https://www.pixiv.net/ajax/illust/$id/recommend/init?limit=18"), 
                builder:(ctx,snap) {
                  related.value = snap.data!["illusts"];
                  relatedNextIds = snap.data!["nextIds"];
                  return ListenableBuilder(
                    listenable: related,
                    builder: (ctx,w)=>artworkGrid([...related.value.map((e) => PxArtwork(data: e))])
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
class ArtworkImageView extends StatelessWidget {
  JSON data = {};
  String heroTag;
  ArtworkImageView({super.key, required this.data, required this.heroTag});
  void downlo(BuildContext context, String quality) {
    var ext = data["urls"][quality].substring(data["urls"][quality].length-3);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Downloading ${heroTag}.${ext}"))
    );
    pxRequestUnprocessed(data["urls"][quality]).then((value){
      Future.value(ImageGallerySaver.saveImage(value.bodyBytes,name: "${heroTag}.${ext}")).then((value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Download completed!"))
      ));
    });
  }
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: ()=>showDialog(
            context: context, builder: (c)=>SimpleDialog(
              title: const Text("Select quality"),
              children: [
                SimpleDialogOption(
                  onPressed: ()=>downlo(context, "original"),
                  child: const Text("Original quality"),
                ),
                SimpleDialogOption(
                  onPressed: ()=>downlo(context, "regular"),
                  child: const Text("SD quality"),
                )
              ],
            )
          ), icon: const Icon(Icons.download))
        ],
      ),
      backgroundColor: Colors.black,
      
      body: InteractiveViewer(
        panEnabled: false,
        minScale: 1,
        maxScale: 20,
        child: Center(
          child:Hero(
            tag: heroTag,
            child: pxImage(data["urls"]["regular"])
          )
        )
      )
    );
  }
}
