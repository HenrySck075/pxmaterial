// should we use refactor

// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sofieru/appdata.dart';
import 'package:sofieru/context_menu.dart';
import 'package:sofieru/pages/view/artworkview.dart' show ArtworkImageView;
import 'package:sofieru/pages/view/layout.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/shared/http.dart';
import 'animated.dart' show AnimatedArtworkView;
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
  List<dynamic>? response;
  int illustIndex = 0;
  final current = GlobalKey();

  // related artworks
  var related = ManualNotifier([]);
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
  // TODO: move this thing outside
  Widget artworkImageBuilder(idx,i,w,h,{Function()? onTap,double opacity = 1}) {
    var ver = Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child:ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 350,),
        child: Hero(
          tag: "${id}_p$idx", 
          child: pxImageFlutter(
            i["urls"]["regular"],
            placeholder:Skeletonizer(
              child:Skeleton.leaf(
                child: Material(child: SizedBox(width:w,height:h),) 
              )
            ),
            width: w, 
            height: h, 
            opacity: AlwaysStoppedAnimation(opacity)
          )
        )
      )
    );
      
    return onTap!=null? GestureDetector(
      onTap: onTap,
      child: ver
    ):ver;
  }
  @override
  Widget build(context) {
    var ed = [
      pxRequest("https://www.pixiv.net/ajax/illust/$id",otherHeaders:{"Referer": "https://www.pixiv.net/en/artworks/$id"}),
      pxRequest("https://www.pixiv.net/ajax/illust/$id/pages"),
    ];
    return Scaffold(
      body: futureWidget(
        placeholder: SingleChildScrollView(child: mainSkel()),
        future: Future.wait(ed),
        builder: (context, dd) {
          var rawData = dd.data![0];
          var data = rawData;
          AppData.of(context).watchHistoryManager().addHistory(rawData);

          List<dynamic> gang = dd.data![1];
          response = ((shownAll || data.illustType != 0) ? gang : [gang[0]]);
          const seriesType = {
            "illust": "artworks",
            "manga": "artworks",
            "novel": "novel"
          };

          String pathJoin(List<String> segments) => (segments..insert(0, "")).join("/");
          late final List<Widget> view;
          if (data.illustType != 2) {
            view = illustMangaView(data, context, gang, pathJoin, seriesType);
          } else {
            view = [
              AnimatedArtworkView(
                  id: data.id, w: data.width, h: data.height)
            ];
          }
          return WorkLayout(
            wtype: WorkType.illust,
            data: data,
            // The artwork view
            view: Column(children: view),
            // author works
            authorWorksItemBuilder: (e, k) => PxSimpleArtwork.fromJson(
                  key: k,
                  payload: e,
                  isCurrent: e["id"] == id,
                ),
            relatedWorksItemBuilder: (e) =>
                PxArtwork.fromJson(payload: e));
        }
      )
    );
  }
  

  List<Widget> illustMangaView(Artwork data, BuildContext context, List<dynamic> gang, String Function(List<String> segments) pathJoin, Map<String, String> seriesType) {
    return [
      Center(
        child:data.illustType==0
        // illust view
        ?Column(
          children: List.from(enumerate(response!, (idx,i){

            final (w,h) = calcDim(i["width"],i["height"]);
            return ContextMenuWrapper(
              items: [
                ContextMenuItem(label: "Download", onPressed: ()=>ArtworkImageView.showDownloadDialog(context, i),)
              ],
              // god tier composition (it has like 5 nested widgets for an image)
              child: Container( 
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(4)
                ),
                child: artworkImageBuilder(idx,i,w,h,onTap: ()=>navigate("/artwork/view/$id?index=$idx",extra: i))
              )
            );}
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
                offsets[i].value=const Offset(0,0);
              }
            },
            
            child:GestureDetector(onTap:()=>navigate("/artwork/manga/$id?scrollDirection=${data.bookStyle}",extra:response?.cast<Map<String,dynamic>>()),child:Stack(alignment: alignments[scrollDirection],children: enumerate(trySublist(response!,0,5), (idx, i) {
              final (w,h) = calcDim(i["width"],i["height"]);
              double the = 1-(idx)/10;
              return ListenableBuilder(
                listenable: offsets[idx],
                child: Container(
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child:artworkImageBuilder(idx,i,w*the,h*the,opacity:1-(0.1*idx*1.5)), 
                ),
                builder: (ctx,artworkImageWidget)=>AnimatedSlide(
                  offset: offsets[idx].value,
                  duration: Durations.medium1,
                  curve: Easing.emphasizedDecelerate,
                  child:artworkImageWidget
                )
              );
            }).toList().reversed.toList(),))
          );
        })
      ),
      // show all button
      if (data.pageCount>1&&data.illustType==0) Center(child:FilledButton(child: Text(shownAll?"Collapse":"Show all"),onPressed: ()=>setState((){
        response=(shownAll?gang:[gang[0]]);
        shownAll=!shownAll;
      }))),
      if (data.bookStyle == "0") const SizedBox(height:30),
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
            child: Text("#${data.seriesNavData!.order+1} ${(data.seriesNavData!.next?.title??'has not been posted')}")
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
            child: Text("#${data.seriesNavData!.order-1} ${data.seriesNavData!.prev!.title}")),
        ]
      )
    ];
  }
}
