// should we use refactor

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sofieru/json/ajax/illust/Artwork.dart' show Artwork;
import 'package:sofieru/json/ajax/user/PartialUser.dart';
import 'package:sofieru/shared.dart';
import 'shared.dart';
import 'package:archive/archive.dart' as arch;


class ArtworkPage extends StatefulWidget {
  final String id;
  const ArtworkPage({super.key, required this.id});
  @override
  State<ArtworkPage> createState() => _ArtworkPageState();
}

class _ArtworkPageState extends State<ArtworkPage> {
  late final String id;
  String authorId = "";
  // Future<JSON>? data;
  bool shownAll = false;
  // Future<List<Map<String,String>>>? op;
  List<dynamic>? op;
  final _authorArtworksViewCtrl = ScrollController();
  final _scsvCtrl = ScrollController();
  int illustIndex = 0;
  List<String> authArtworkIds = [];
  List<int> range = [0,0];
  List<int> visibleRange = [-1,-1];
  var authArtworkData = VisibleNotifyNotifier([]);
  final current = GlobalKey();

  // related artworks
  var related = VisibleNotifyNotifier([]);
  List<dynamic> relatedNextIds = []; // bruh
  /// to prevent spamming the request
  bool relatedFetching = false;

  void updateRange(int start, int end) {
    if (end >= authArtworkIds.length-1) end=authArtworkIds.length-1;
    if (start <= 0) start=0;
    if (visibleRange[1]==-1||end>visibleRange[1]) visibleRange[1]=end;
    if (visibleRange[0]==-1||start<visibleRange[0]) visibleRange[0]=start;
    range = [start,end];
  }
  (double, double) calcDim(int w, int h) {
    double neww = w.toDouble();
    double newh = h.toDouble();
    if (w>350) {
      neww = 350/w;
      newh = h*neww;
      neww = 350;
    } else if (h>1000) {
      newh = 1000/h;
      neww = w*newh;
      newh = 1000;
    }
    return (neww, newh);
  }
  @override
  void initState() {
    super.initState();
    id = widget.id;
    _scsvCtrl.addListener(() {
      if (_scsvCtrl.position.pixels>=_scsvCtrl.position.maxScrollExtent && relatedNextIds.isNotEmpty) {
        // there's like several more endpoints that does the EXACT SAME THING as this. dude can you be consistent pls
        pxRequest("https://www.pixiv.net/ajax/illust/recommend/illusts?illust_ids[]=${relatedNextIds.sublist(0,18).join('&illust_ids[]=')}",otherHeaders: {"Referer":"https://www.pixiv.net/en/artworks/$id"}).then((value) {
          related.value.addAll(value["illusts"]);
          relatedNextIds = relatedNextIds.sublist(20);
          related.notifyListeners();
        });
      }
    });
    _authorArtworksViewCtrl.addListener(() {
//       print("""Current: ${_authorArtworksViewCtrl.position.pixels} 
// Max scroll extent: ${_authorArtworksViewCtrl.position.maxScrollExtent}
// Min scroll extent: ${_authorArtworksViewCtrl.position.minScrollExtent}""");
      if (_authorArtworksViewCtrl.position.pixels>=_authorArtworksViewCtrl.position.maxScrollExtent && range[1]!=authArtworkIds.length-1) {
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/illusts?ids[]=${authArtworkIds.sublist(range[1]+1,range[1]+8).join('&ids[]=')}").then((value) {
          authArtworkData.value.addAll(value.values);
          updateRange(visibleRange[1]+1, visibleRange[1]+8);
          authArtworkData.notifyListeners();
        });
      }
      if (_authorArtworksViewCtrl.position.pixels==_authorArtworksViewCtrl.position.minScrollExtent && range[1]!=0) {
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/illusts?ids[]=${authArtworkIds.sublist(range[0]-8,range[0]-1).join('&ids[]=')}").then((value) {
          authArtworkData.value.insertAll(0,value.values);
          updateRange(visibleRange[0]-8, visibleRange[0]-1);
          authArtworkData.notifyListeners();
        });
      }
    });
  }
  @override
  Widget build(context) {
    var ed = [
      pxRequest("https://www.pixiv.net/ajax/illust/$id"),
      pxRequest("https://www.pixiv.net/ajax/illust/$id/pages"),
    ];
    return Scaffold(
      body: futureWidget(future: Future.wait(ed), builder: (context,dd) {
        var data = Artwork.fromJson(dd.data![0]);
        List<dynamic> gang = dd.data![1];
        op = (shownAll?gang:[gang[0]]);
        authorId = data.userId;
        authArtworkIds = [...data.userIllusts.keys];
        illustIndex = authArtworkIds.indexOf(id);
        updateRange(illustIndex-7, illustIndex+7);
        setTitle("${data.alt} - pixiv");
        return SingleChildScrollView(
          controller: _scsvCtrl,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // The artwork view
              // the lsp broke when using ternary so dont use it
              // Static artworks
              if (data.illustType!=2) ...[
              Center(child:Column(
                children: List.from(enumerate(op!, (idx,i)=>Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>ArtworkImageView(data: i,heroTag: "${id}_p$idx",))),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 350, maxHeight: 1000),
                        child: Hero(tag: "${id}_p$idx", child: pxImage(i["urls"]["regular"],placeholder:(lmao, h){
                          final (w,h) = calcDim(i["width"],i["height"]);
                          return Skeletonizer(child:Skeleton.leaf(
                            child: Material(child: SizedBox(width:w,height:h),) 
                          ));
                        }))
                      )
                    ),
                  ))
                )
              )),
              if (data.pageCount>1) Center(child:FilledButton(child: Text(shownAll?"Collapse":"Show all"),onPressed: ()=>setState((){
                op=(shownAll?gang:[gang[0]]);
                shownAll=!shownAll;
              }))),]
              // Animated artworks 
              else ...[
              Center(
                child: futureWidget(
                  future: pxRequest("https://www.pixiv.net/ajax/illust/$id/ugoira_meta"), 
                  placeholder: const Center(child: Text("Fetching data...")),
                  builder: (ctx,snap){
                    var data = snap.data! as Map<String, dynamic>;
                    final List<dynamic> frames = data["frames"];
                    ///   offset  length (look into the source code)
                    return futureWidget(
                      future: pxRequestUnprocessed(data["src"],otherHeaders: {"Upgrade-Insecure-Requests":"1"}), 
                      placeholder: const Center(child: Text("Downloading...")),
                      builder: (ctx,snap) {
                        var zipContent = snap.data!.bodyBytes;
                        final archive = arch.ZipDecoder().decodeBytes(zipContent);
                        final curImg = ValueNotifier<Widget>(const SizedBox(width:1,height:1,));
                        final total = frames.map((r)=>r["delay"] as int).toList().fold(0,(p,c)=>p+c);
                        List<Image> widgetFrames = [];
                        for (int i = 0; i < frames.length; i++) {
                          var element = frames[i];
                          widgetFrames.add(Image.memory(archive.findFile(element["file"])!.content));              
                        }
                        Timer.periodic(Duration(milliseconds:total), (timer) { 
                          int ts = 0;
                          for (int i = 0; i < frames.length; i++) {
                            var element = frames[i];
                            ts+=element["delay"]! as int;
                            Timer(Duration(milliseconds: ts),()=>curImg.value=widgetFrames[i]);
                          }
                        });
                        return futureWidget(
                          future: Future.wait(widgetFrames.map((e)=>precacheImage(e.image, ctx))), 
                          placeholder: const Center(child: Text("Loading frames...")),
                          builder: (ctx,s)=>ListenableBuilder(listenable: curImg, builder: (ctx,w)=>curImg.value,)
                        );
                      } 
                    );
                  })
                ),
              ],
              
              const Divider(),
              // Toolbar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    Clipboard.setData(ClipboardData(text: "https://www.pixiv.net/en/artworks/$id")).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Artwork URL copied to clipboard!"))
                    ));
                  }, icon: const Icon(Icons.link))
                ],
              ),
              if (data.request!=null) ...[
                const Divider(),
                GestureDetector(
                  onTap: ()=>navigate("/requests/${data.request}"),
                  child: ListTile( 
                    title: const Text("Work requested by"),
                  )
                )
              ],
              const Divider(),
              // Artwork info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(data.titleCaptionTranslation.workTitle??data.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  const SizedBox(height: 10,),
                  HtmlWidget(data.titleCaptionTranslation.workCaption??data.description,onTapUrl: HtmlUrlLauncher),
                  const SizedBox(height: 10,),
                  Wrap(
                    spacing: 8,
                    children: List.from(data.tags.tags.map((t)=>tagChipBuilder(t)),
                  ))
                ]),
              ),
              const Divider(),
              // Author view
              futureWidget(
                // google said this is bad, but idk
                future: pxRequest("https://www.pixiv.net/ajax/user/${data.userId}?full=0"), 
                builder: (ctx, snap) {
                  var d = PartialUser.fromJson(snap.data!);
                  return GestureDetector(
                    onTap: ()=>showDialog(
                      context: context, 
                      // ignore: prefer_const_constructors
                      builder: (c) => AuthorInfo(userId: d.userId)
                    ),
                    child: ListTile(
                      title: Text(d.name),
                      subtitle: Text("Does${d.acceptRequest?'':'n\'t'} accepting requests"),
                      leading: CircleAvatar(backgroundImage: pxImageFlutter(d.image).image,) ),
                    );
                  },
                placeholder: const Material(
                  child: Skeletonizer( 
                    child: SizedBox(width: double.infinity, height: 56,),
                  ) 
                ) 
              ),
              // author works
              futureWidget(
                future: pxRequest("https://www.pixiv.net/ajax/user/$authorId/illusts?ids[]=${authArtworkIds.sublist(range[0],range[1]+1).join('&ids[]=')}"),
                builder: (context,snap) {
                  if (authArtworkData.value.isEmpty) authArtworkData.value = [...snap.data!.values];
                  // Future.delayed(const Duration(milliseconds: 50),()=>_authorArtworksViewCtrl.position.ensureVisible(current.currentContext!.findRenderObject()!));
                  return ListenableBuilder(
                    listenable: authArtworkData,
                    builder: (ctx,w){
                      return ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 120),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: _authorArtworksViewCtrl,
                          padding: const EdgeInsets.only(left:2,right:2),
                          children: [...authArtworkData.value.map((e) => Padding(
                            padding: const EdgeInsets.only(left:2.0, right:2),
                            child: PxSimpleArtwork.fromJson(
                              key: (e["id"]==id)?current:null,
                              payload: e,
                              isCurrent: e["id"]==id,
                            ),
                          ))],
                        )
                      );
                    }
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
                    builder: (ctx,w)=>artworkGrid([...related.value.map((e) => PxArtwork.fromJson(payload: e))])
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
void ugoiraSave(List<Image> frames, List<int> delay) {
}
class ArtworkImageView extends StatelessWidget {
  final JSON data;
  String heroTag;
  ArtworkImageView({super.key, required this.data, required this.heroTag});
  void downlo(BuildContext context, String quality) {
    String? fn = data["urls"][quality]?.split("/").last;
    var scaf = ScaffoldMessenger.of(context);
    if (fn==null) scaf.showSnackBar(const SnackBar(content: Text("Invalid image size")));
    scaf.showSnackBar(
      SnackBar(content: Text("Downloading $fn"))
    );
    pxRequestUnprocessed(data["urls"][quality]!).then((value)async{
      final directory = await getDownloadsDirectory() ?? await getApplicationDocumentsDirectory();
      await File("${directory.path}/$fn").writeAsBytes(value.bodyBytes);
      scaf.showSnackBar(
        const SnackBar(content: Text("Download completed!"))
      );
    }).catchError((e){
      scaf.showSnackBar(
        const SnackBar(content: Text("Download (or save) failed. Check the logs for more info."))
      );
      throw e;
    }
    );
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
            child: pxImage(data["urls"]["regular"]!)
          )
        )
      )
    );
  }
}
