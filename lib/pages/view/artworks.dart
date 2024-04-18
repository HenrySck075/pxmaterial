// should we use refactor

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sofieru/appdata.dart';
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
        AppData.of(context).watchHistoryManager().addHistory(data.toJson());

        Widget artworkImageBuilder(idx,i,w,h,{Function()? onTap,double opacity = 1}){
          var ver = Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child:ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350, maxHeight: 1000),
              child: Hero(tag: "${id}_p$idx", child: pxImageFlutter(i["urls"]["regular"],placeholder:Skeletonizer(child:Skeleton.leaf(
                child: Material(child: SizedBox(width:w,height:h),) 
              )),width: w, height: h, opacity: AlwaysStoppedAnimation(opacity)))
            )
          );
            
          return onTap!=null? GestureDetector(
            onTap: onTap,
            child: ver
          ):ver;
        }

        
        List<dynamic> gang = dd.data![1];
        op = ((shownAll||data.illustType!=0)?gang:[gang[0]]);
        const seriesType = {
          "illust": "artworks",
          "manga": "artworks",
          "novel": "novel"
        };
        String pathJoin(List<String> segments) => "/"+segments.join("/");
        final view = (data.illustType!=2) ? [
          Center(
            child:data.illustType==0
            // illust view
            ?Column(
              children: List.from(enumerate(op!, (idx,i){

                final (w,h) = calcDim(i["width"],i["height"]);
                return artworkImageBuilder(idx,i,w,h,onTap: ()=>navigate("/artwork/view/$id?index=$idx",extra: i));}
              ))
            )
            // manga view
            :Builder(builder: (ctx){
              List<ValueNotifier<Offset>> offsets = List.generate(7, (index) => ValueNotifier(Offset.zero));
              int itemsCount = offsets.length;
              int scrollDirection = int.parse(data.bookStyle??"0");
              final alignments = [Alignment.bottomCenter,Alignment.centerLeft,Alignment.centerRight];
              return MouseRegion(
                onEnter: (e){
                  for (var i = itemsCount-1; i >= 0; i--) {
                    var o = [Offset(0,i/20),Offset(-i/10,0),Offset(i/10,0)][scrollDirection];
                    offsets[i].value=o;
                  }
                },
                onExit: (e){
                  for (var i = itemsCount-1; i >= 0; i--) {
                    offsets[i].value=Offset(0,0);
                  }
                },
                
                child:GestureDetector(onTap:()=>navigate("/artwork/manga/$id?scrollDirection=${data.bookStyle}",extra:op?.cast<Map<String,dynamic>>()),child:Stack(alignment: alignments[scrollDirection],children: enumerate(trySublist(op!,0,5), (idx, i) {
                  final (w,h) = calcDim(i["width"],i["height"]);
                  double the = 1-(idx)/10;
                  return ListenableBuilder(listenable: offsets[idx],child:artworkImageBuilder(idx,i,w*the,h*the,opacity:1-(0.1*idx*1.5)), builder: (ctx,artworkImageWidget)=>AnimatedSlide(
                    offset: offsets[idx].value,
                    duration: Durations.medium1,
                    curve: Easing.emphasizedDecelerate,
                    child:artworkImageWidget
                  ));
                  
                }).toList().reversed.toList(),))
              );
            })
          ),
          // show all button
          if (data.pageCount>1&&data.illustType==0) Center(child:FilledButton(child: Text(shownAll?"Collapse":"Show all"),onPressed: ()=>setState((){
            op=(shownAll?gang:[gang[0]]);
            shownAll=!shownAll;
          }))),
          // series navigation, if any
          if (data.seriesNavData!=null) Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Next
              FilledButton.tonal(
                onPressed: data.seriesNavData?.next==null
                  ?null
                  :()=>navigate(pathJoin([
                    seriesType[data.seriesNavData!.seriesType]!,
                    data.seriesNavData!.next!.id
                  ])), 
                child: Text("#${data.seriesNavData!.order+1} "+(data.seriesNavData!.next?.title??"has not been posted"))
              ),
              // index
              FilledButton.tonal(onPressed: ()=>navigate(pathJoin([
                "users", data.userId,
                "series", data.seriesNavData!.seriesId
              ])), child: const Text("See index")),
              // Previous
              if (data.seriesNavData?.prev!=null) FilledButton.tonal(
                onPressed: ()=>navigate(pathJoin([
                    seriesType[data.seriesNavData!.seriesType]!,
                  data.seriesNavData!.prev!.id
                ])), 
                child: Text("#${data.seriesNavData!.order-1} "+(data.seriesNavData!.prev!.title))),
            ]
          )
          ]
          // Animated artworks 
          :[
          Center(
            child: futureWidget(
              future: pxRequest("https://www.pixiv.net/ajax/illust/$id/ugoira_meta"), 
              placeholder: const Center(child: Text("Fetching data...")),
              builder: (ctx,snap){
                var data = snap.data! as Map<String, dynamic>;
                final List<dynamic> frames = data["frames"];
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
                    // schedule frame change
                    Timer.periodic(Duration(milliseconds:total), (timer) { 
                      int ts = 0;
                      for (int i = 0; i < frames.length; i++) {
                        var element = frames[i];
                        ts+=element["delay"]! as int;
                        Timer(Duration(milliseconds: ts),()=>curImg.value=widgetFrames[i]);
                      }
                    });
                    // 1 more future widget to preload the images (it doesnt)
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
/// cant compile gifski rn
void ugoiraSave(List<Image> frames, List<int> delay) {
}

