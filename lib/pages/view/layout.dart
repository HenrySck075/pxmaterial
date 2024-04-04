// should we use refactor

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sofieru/json/ajax/illust/Artwork.dart' show Artwork;
import 'package:sofieru/json/ajax/novel/Novel.dart';
import 'package:sofieru/json/ajax/user/PartialUser.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/skeltal/view/layout.dart';
import 'shared.dart';
import "package:sofieru/skeltal/skeltal.dart";

enum WorkType {illust,novel}

class WorkLayout extends StatefulWidget {
  final WorkType wtype;
  final Map<String, dynamic> data;

  /// The work view section
  final Widget view;
  /// Author works item builder
  final Widget Function(Map<String,dynamic> data) authorWorksItemBuilder;
  final Widget Function(Map<String,dynamic> data) relatedWorksItemBuilder;


  const WorkLayout({
    super.key, required this.wtype, required this.data,
    required this.view, required this.authorWorksItemBuilder, required this.relatedWorksItemBuilder
  });
  @override
  State<WorkLayout> createState() => _WorkLayoutState();
}

class _WorkLayoutState extends State<WorkLayout> {
  late final String id;
  late final String type;
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
    id = widget.data["id"]!;
    type = widget.wtype.name;
    var param = "${type}_ids[]";
    _scsvCtrl.addListener(() {
      if (_scsvCtrl.position.pixels>=_scsvCtrl.position.maxScrollExtent && relatedNextIds.isNotEmpty) {
        // there's like several more endpoints that does the EXACT SAME THING as this. dude can you be consistent pls
        pxRequest("https://www.pixiv.net/ajax/illust/recommend/${type}s?$param="+relatedNextIds.sublist(0,18).join('&'+param+'='),otherHeaders: {"Referer":"https://www.pixiv.net/en/artworks/$id"}).then((value) {
          related.value.addAll(value["${type}s"]);
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
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/${type}s?ids[]=${authArtworkIds.sublist(range[1]+1,range[1]+8).join('&ids[]=')}").then((value) {
          authArtworkData.value.addAll(value.values);
          updateRange(visibleRange[1]+1, visibleRange[1]+8);
          authArtworkData.notifyListeners();
        });
      }
      if (_authorArtworksViewCtrl.position.pixels==_authorArtworksViewCtrl.position.minScrollExtent && range[1]!=0) {
        pxRequest("https://www.pixiv.net/ajax/user/$authorId/${type}s?ids[]=${authArtworkIds.sublist(range[0]-8,range[0]-1).join('&ids[]=')}").then((value) {
          authArtworkData.value.insertAll(0,value.values);
          updateRange(visibleRange[0]-8, visibleRange[0]-1);
          authArtworkData.notifyListeners();
        });
      }
    });
  }
  @override
  Widget build(context) {
    return Scaffold(
      body: Builder(builder: (context) {
        /// please for the love of god add union types
        var data = widget.wtype==WorkType.illust?Artwork.fromJson(widget.data):Novel.fromJson(widget.data);
        authorId = data.userId;
        authArtworkIds = [...(data is Artwork?data.userIllusts:(data as Novel).userNovels).keys];
        illustIndex = authArtworkIds.indexOf(id);
        updateRange(illustIndex-7, illustIndex+7);
        if (data is Artwork) setTitle("${data.alt} - pixiv");
        return ListView(
            //crossAxisAlignment:CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            controller: _scsvCtrl,
            children: [
              widget.view,
              
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
                
                GestureDetector(
                  onTap: ()=>navigate("/requests/${data.request!.request.requestId}"),
                  child: ListTile( 
                    title: Text("Work requested by ${data.request!.fan.userName}"),
                  )
                )
              ],
              
              // Artwork info
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding( 
                    padding: const EdgeInsets.all(8),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(data.titleCaptionTranslation.workTitle??data.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      const SizedBox(height: 10,),
                      HtmlWidget(data.titleCaptionTranslation.workCaption??data.description,onTapUrl: HtmlUrlLauncher),
                      const SizedBox(height: 10,),
                      Wrap(
                        spacing: 8,
                        children: List.from(data.tags.tags.map((t)=>tagChipBuilder(t)),
                      ))
                    ])
                  )
                ),
              ),
              
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
                placeholder: skeltal(authorView)
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
                      return SizedBox(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: _authorArtworksViewCtrl,
                          padding: const EdgeInsets.only(left:2,right:2),
                          children: [...authArtworkData.value.map((e) => Padding(
                            padding: const EdgeInsets.only(left:2.0, right:2),
                            child: widget.authorWorksItemBuilder(e),
                          ))],
                        )
                      );
                    }
                  );
                },
                placeholder: skeltal(authorWorks)
              ),
              // Comments
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding:EdgeInsets.only(left:4),child: Text("Comments",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.left)),
                  Comments(id: id)
                ],
              ),
              const SizedBox(height: 35,),
              
              const Text("Related artworks",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
              futureWidget(
                future: pxRequest("https://www.pixiv.net/ajax/$type/$id/recommend/init?limit=18"), 
                builder:(ctx,snap) {
                  related.value = snap.data!["${type}s"];
                  relatedNextIds = snap.data!["nextIds"];
                  return ListenableBuilder(
                    listenable: related,
                    builder: (ctx,w)=>artworkGrid([...related.value.map((e) => widget.relatedWorksItemBuilder(e))])
                  );
                } 
              ),
              SizedBox(height: 35,)
            ],
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
