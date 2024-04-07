// should we use refactor

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sofieru/pages/view/layout.dart';
import 'package:sofieru/shared.dart';
import 'package:archive/archive.dart' as arch;
import 'package:sofieru/skeltal/view/artworks.dart';
import 'package:sofieru/json/ajax/illust/Artwork.dart';


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
  int illustIndex = 0;
  final current = GlobalKey();

  // related artworks
  var related = VisibleNotifyNotifier([]);
  List<dynamic> relatedNextIds = []; // bruh
  /// to prevent spamming the request

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
  }
  @override
  Widget build(context) {
    var ed = [
      pxRequest("https://www.pixiv.net/ajax/illust/$id"),
      pxRequest("https://www.pixiv.net/ajax/illust/$id/pages"),
    ];
    return Scaffold(
      body: futureWidget(placeholder: SingleChildScrollView(child:mainSkel()), future: Future.wait(ed), builder: (context,dd) {
        var rawData = dd.data![0];
        var data = Artwork.fromJson(rawData);

        Widget artworkImageBuilder(idx,i,w,h,onTap,{double opacity = 1})=>Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: GestureDetector(
            onTap: onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350, maxHeight: 1000),
              child: Hero(tag: "${id}_p$idx", child: pxImage(i["urls"]["regular"],placeholder:Skeletonizer(child:Skeleton.leaf(
                child: Material(child: SizedBox(width:w,height:h),) 
              ))))
            )
          ),
        );

        List<dynamic> gang = dd.data![1];
        op = ((shownAll||data.bookStyle!=null)?gang:[gang[0]]);
        final view = (data.illustType!=2) ? [
          Center(
            child:data.bookStyle==null
            // illust view
            ?Column(
              children: List.from(enumerate(op!, (idx,i){

                final (w,h) = calcDim(i["width"],i["height"]);
                return artworkImageBuilder(idx,i,w,h,()=>navigate("/artwork/view/$id/$idx",extra: i));}
              ))
            )
            // manga view
            :Builder(builder: (ctx){
              List<Offset> offsets = List.generate(7, (index) => Offset(0, 0));
              int itemsCount = offsets.length;
              return MouseRegion(
                onEnter: (e){
                  for (var i = itemsCount-1; i >= 0; i--) {
                    offsets[i]=Offset((-100*i).toDouble(),0);
                  }
                },
                onExit: (e){
                  for (var i = itemsCount-1; i >= 0; i--) {
                    offsets[i]=Offset(0,0);
                  }
                },
                
                child:Stack(alignment: Alignment.centerLeft,children: enumerate(op!.sublist(0,7), (idx, i) {
                    final (w,h) = calcDim(i["width"],i["height"]);
                    double the = idx+1;
                    return AnimatedSlide(
                      offset: offsets[idx],
                      duration: Durations.medium1,
                      curve: Easing.emphasizedDecelerate,
                      child:artworkImageBuilder(idx,i,w/the,h/the,()=>null)
                    );
                  
                }).toList().reversed.toList(),)
              );
            })
          ),
          if (data.pageCount>1) Center(child:FilledButton(child: Text(shownAll?"Collapse":"Show all"),onPressed: ()=>setState((){
            op=(shownAll?gang:[gang[0]]);
            shownAll=!shownAll;
          }))),]
          // Animated artworks 
          :[
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
          ];
        return WorkLayout( 
          wtype: WorkType.illust,
          data: rawData,
          // The artwork view
          // the lsp broke when using ternary so dont use it
          // Static artworks
          view: Column(children:view),
          // author works
          authorWorksItemBuilder: (e)=> PxSimpleArtwork.fromJson(
            key: (e["id"]==id)?current:null,
            payload: e,
            isCurrent: e["id"]==id,
          ),
          relatedWorksItemBuilder: (e) => PxArtwork.fromJson(payload: e)
      );
      }),
    );
  }
}
void ugoiraSave(List<Image> frames, List<int> delay) {
}
class ArtworkImageView extends StatelessWidget {
  JSON? data;
  String heroTag;
  ArtworkImageView({super.key, required this.data, required this.heroTag});
  void downlo(BuildContext context, String quality) {
    String? fn = data!["urls"][quality]?.split("/").last;
    var scaf = ScaffoldMessenger.of(context);
    if (fn==null) scaf.showSnackBar(const SnackBar(content: Text("Invalid image size")));
    scaf.showSnackBar(
      SnackBar(content: Text("Downloading $fn"))
    );
    pxRequestUnprocessed(data!["urls"][quality]!).then((value)async{
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
    bool pendingDataGather = false;
    if (data==null) {
      pendingDataGather=true;
    }
    String id = heroTag.split("_")[0];
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
        trackpadScrollCausesScale: true,
        panEnabled: false,
        minScale: 1,
        maxScale: 20,
        child: Center(
          child: pendingDataGather?futureWidget(future:pxRequest("https://www.pixiv.net/ajax/illust/$id/pages"),builder: (e,snap){
              data = snap.data!; 
              return Hero(
                tag: heroTag,
                child: pxImage(data!["urls"]["regular"]!)
              );
            }):Hero(
              tag: heroTag,
              child: pxImage(data!["urls"]["regular"]!)
            )
        )
      )
    );
  }
}
