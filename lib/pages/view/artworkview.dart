import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sofieru/shared.dart';

class ArtworkImageView extends StatelessWidget {
  JSON? data;
  String heroTag;
  ArtworkImageView({super.key, this.data, required this.heroTag});
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
    String id = GoRouterState.of(context).pathParameters["id"]!;
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
          // nest in futureWidget if data is null, else dont (for the hero animation)
          child: pendingDataGather?futureWidget(future:pxRequest("https://www.pixiv.net/ajax/illust/$id/pages"),builder: (e,snap){
            int index = int.parse(GoRouterState.of(context).uri.queryParameters["index"]??"0");
            data = snap.data![index]; 
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

class MangaView extends StatelessWidget {
  List<JSON>? data;
  int bookStyle;
  String id;
  MangaView({super.key, this.data, required this.bookStyle, required this.id});
  @override
  Widget build(ctx){
    var routerState = GoRouterState.of(ctx);
    return bookStyle==0?Placeholder():MangaHorizontalView(id: id,direction: bookStyle-1,data:data);
  }
}

class MangaHorizontalView extends StatefulWidget {
  List<JSON>? data;
  final String id;
  // 0 for rtl, 1 for ltr
  int direction;
  MangaHorizontalView({super.key, this.data, required this.id, this.direction=0});

  @override
  State<MangaHorizontalView> createState() => _MangaHorizontalViewState();
}

class _MangaHorizontalViewState extends State<MangaHorizontalView>{
  late final PageController _pageCtrl;
  /// theres _pageCtrl.page but uhm
  int idx = 0;
  @override 
  void initState() {
    super.initState();
    _pageCtrl = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    _pageCtrl.dispose();
  }
  // widget.data is supposed to be non-null here
  Widget theChild(ctx){
    var data = widget.data!;
    List<Widget> pages = data.mapIndexed((i,e) => FittedBox(
      fit: BoxFit.fitHeight,
      child:GestureDetector(
        onTap:()=>navigate("/artwork/view/${widget.id}?index=$i",extra: data[idx-1]), 
        child:Hero(tag:"${widget.id}_p$i",child:pxImage(e["urls"]["regular"],width: e["width"].toDouble(),height: e["height"].toDouble()))
      )
    )).toList();
    // if the amount of pages is odd, insert a blank page
    if (data.length.isOdd) {pages.insert(0, FittedBox(fit:BoxFit.fitHeight,child:Container(color: Colors.white,width: data[0]["width"].toDouble(),height: data[0]["height"].toDouble(),)));}
    // group every 2 pages to 1 on desktop
    if (!kIsMobile) pages = split2d(pages).map((e)=>Row(children:widget.direction==0?e.reverse:e, mainAxisSize: MainAxisSize.min));
    return Scaffold(appBar:AppBar(),backgroundColor: Colors.transparent,body:Stack(children: [
      PageView( 
        reverse: true,
        controller: _pageCtrl,
        children: pages
      ),
      // dont move this to before PageView or batman will use your shower
      MouseRegion(
        cursor: SystemMouseCursors.click, 
        child:GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: ()=>_updateIndex(widget.direction==0?idx+1:idx-1),
          child: const SizedBox(width: 200,),
        ),
      ),
      Positioned(right:0,child:MouseRegion(
        cursor:SystemMouseCursors.click, 
        child:GestureDetector(behavior: 
          HitTestBehavior.translucent,
          onTap: ()=>_updateIndex(widget.direction==0?idx-1:idx+1),
          child: const SizedBox(width: 200,),),
        )
      ),
    ],));
  }
  void _updateIndex(int index) {
    debugPrint(index.toString());
    _pageCtrl.animateToPage(
      index,
      duration: Durations.medium1,
      curve: Curves.easeOutSine,
    );
    idx = index;
  }
  @override
  Widget build(ctx) => widget.data==null?futureWidget(future:pxRequest("https://www.pixiv.net/ajax/illust/${widget.id}/pages"),builder: (e,snap){
    widget.data = snap.data!; 
    return theChild(ctx);
  }):theChild(ctx);

}
