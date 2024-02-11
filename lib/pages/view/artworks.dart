// should we use refactor

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:sofieru/json/ajax/illust/Artwork.dart';
import 'package:sofieru/json/ajax/top/illust/Artwork.dart' as alite;
import 'package:sofieru/json/ajax/user/User.dart';
import 'package:sofieru/shared.dart';
import 'shared.dart';
import 'package:http/http.dart' as http show Response;
import 'package:archive/archive.dart' as arch;


class ArtworkPage extends StatefulWidget {
  final String id;
  const ArtworkPage({super.key, required this.id});
  @override
  State<ArtworkPage> createState() => _ArtworkPageState();
}

/// So the plan is get the data of each individual frame in the zip file
/// so that we can save some data from downloading all of them over and over again whenever we're requested to do so (e.g. user reenter the page)
class UgoiraDisplayer extends StatefulWidget {
  final List<dynamic> frames;
  final String url;
  UgoiraDisplayer({super.key, required this.frames, required this.url});
  @override
  State<UgoiraDisplayer> createState() => _UgoiraDisplayerState();
}

class _UgoiraDisplayerState extends State<UgoiraDisplayer> with TickerProviderStateMixin {
  late final AnimationController _animCtrl;
  late final int total;
  List<Image> widgetFrames = [];
  ValueNotifier curImg = ValueNotifier<Widget>(const Center(child: Text("(flickers may occur)"),));
  @override 
  void initState() {
    super.initState();
    total = widget.frames.fold(0, (p, c) => p+(c["delay"] as int));
    void scheduleUpdate(int delay)=>Timer(Duration(milliseconds:delay), () => _animCtrl.value=_animCtrl.value==widget.frames.length-1?0:_animCtrl.value+1);
    _animCtrl = AnimationController(
      vsync: this,
      upperBound: widget.frames.length+0.0,
      value: 0.5 // A presses
    )..addListener(() {
      var i = widget.frames[_animCtrl.value.round()];
      if (_animCtrl.value == widgetFrames.length) {
        pxRequestUnprocessed(widget.url,otherHeaders: {"Range":"bytes=${i['offset']}-${i['offset']+i['length']}"}).then((value) {
          widgetFrames.add(Image.memory(Uint8List.fromList(arch.ZipFile(arch.InputStream(value.body),arch.ZipFileHeader(arch.InputStream(i["centralDirectory"]))).content)));
          curImg.value = widgetFrames[_animCtrl.value.round()];
          scheduleUpdate(i["delay"]);
        });
      } else {
        curImg.value = widgetFrames[_animCtrl.value.round()];
        scheduleUpdate(i["delay"]);
      }
    });
    _animCtrl.value=0; // start the loop
  }
  @override 
  Widget build(ctx) {
    return ListenableBuilder(listenable: curImg, builder: (ctx,w)=>curImg.value,);
  }
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
        setTitle(data.alt+" - pixiv");
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
                        constraints: const BoxConstraints(maxWidth: 550),
                        child: Hero(tag: "${id}_p$idx", child: pxImage(i["urls"]["regular"],includeCircle: true))
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
                  builder: (ctx,snap){
                    
                    var data = snap.data! as Map<String, dynamic>;
                    final List<dynamic> frames = data["frames"];
                    ///   offset  length (look into the source code)
                    return futureWidget(
                      future: pxRequestUnprocessed(data["src"],method: "HEAD").then((re) { 
                        var start = int.parse(re.headers['content-length']!)-(int.parse(frames.last['file'].substring(0,6))*56)-22;
                        var end = int.parse(re.headers['content-length']!);
                        var content_length = (end-start).toString();
                        return pxRequestUnprocessed(data["src"],otherHeaders: {"Range":"bytes=$start-$end","content-length":content_length});
                      }), // the central directory, will be very important
                      builder: (ctx,snap) {
                        var cddata = snap.data!.bodyBytes;

                        int cdOffset = 0;
                        List<int> frameOffsets = [cdOffset];
                        int i = 0;
                        while (true) {
                          cdOffset = cddata.indexOf(80);
                          if (cdOffset!=-1) break;
                          frameOffsets.insert(0,cddata.sublist(cdOffset+42,cdOffset+45).fold(0, (previousValue, element) => previousValue+element));
                          frames[i]["centralDirectory"] = cddata.sublist(cdOffset,cdOffset+56);
                          cddata = cddata.sublist(cdOffset+57);
                          i+=1;
                        }
                        for (int i = 0; i < frameOffsets.length-1; i++) {
                          frames[i]["offset"] = frameOffsets[i];
                          frames[i]["length"] = frameOffsets[i+1]-frameOffsets[i];
                        }
                        return UgoiraDisplayer(frames: frames,url:data["src"]);
                      } 
                    );
                  })
              )],
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
              const Divider(),
              // Artwork info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  const SizedBox(height: 10,),
                  HtmlWidget(data.description,onTapUrl: HtmlUrlLauncher),
                  const SizedBox(height: 10,),
                  Wrap(
                    spacing: 8,
                    children: List.from(data.tags.tags.map((t)=>ActionChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Flexible(flex:4,child: Text(t.tag,overflow: TextOverflow.ellipsis,style: TextStyle(color: t.tag.startsWith("R-18")?Colors.red:null),)),
                          if (t.translation?["en"]!=null) Flexible(flex:4,child: Text("(${t.translation!['en']})",style: const TextStyle(color: Colors.grey, fontSize: 10),overflow: TextOverflow.ellipsis))
                        ]
                      ),
                      onPressed: ()=>navigate("/tags/${t.tag}?${data.xRestrict==1?'mode=r18':''}"),))
                    ),
                  )
                ]),
              ),
              const Divider(),
              // Author view
              futureWidget(
                // google said this is bad, but idk
                future: pxRequest("https://www.pixiv.net/ajax/user/${data.userId}?full=0"), 
                builder: (ctx, snap) {
                  var d = User.fromJson(snap.data!);
                  return GestureDetector(
                    onTap: ()=>showDialog(
                      context: context, 
                      // ignore: prefer_const_constructors
                      builder: (c) => AuthorInfo(userId: d.userId)
                    ),
                    child: ListTile(
                      title: Text(d.name),
                      subtitle: Text("Does${d.acceptRequest?'':"n't"} accepting requests"),
                      leading: CircleAvatar(backgroundImage: pxImageFlutter(d.image).image,) ),
                    );
                  },
                placeholder: const SizedBox(height: 1,width: 1)
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
                            child: PxSimpleArtwork(
                              key: (e["id"]==id)?current:null,
                              data: e,
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
                    builder: (ctx,w)=>artworkGrid([...related.value.map((e) => PxArtwork(data: alite.Artwork.fromJson(e)))])
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
    var ext = data["urls"][quality]?.substring(data["urls"][quality]!.length-3);
    var scaf = ScaffoldMessenger.of(context);
    if (ext==null) scaf.showSnackBar(const SnackBar(content: Text("Invalid image size")));
    scaf.showSnackBar(
      SnackBar(content: Text("Downloading ${heroTag}.${ext}"))
    );
    pxRequestUnprocessed(data["urls"][quality]!).then((value){
      Future.value(ImageGallerySaver.saveImage(value.bodyBytes,name: "${heroTag}.${ext}")).then((value) => scaf.showSnackBar(
        const SnackBar(content: Text("Download completed!"))
      ));
    }).catchError((e)=>scaf.showSnackBar(
        const SnackBar(content: Text("Download (or save) failed. Check the logs for more info."))
      ));
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
