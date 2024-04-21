import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sofieru/shared.dart';
import 'package:collection/collection.dart';

class ArtworkImageView extends StatelessWidget {
  JSON? data;
  String heroTag;
  ArtworkImageView({super.key, this.data, required this.heroTag});
  static void download(BuildContext context, String quality, JSON data) {
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
  static void showDownloadDialog(BuildContext context, JSON data)=>showDialog(
    context: context, builder: (c)=>SimpleDialog(
      title: const Text("Select quality"),
      children: [
        SimpleDialogOption(
          onPressed: ()=>ArtworkImageView.download(context, "original", data),
          child: const Text("Original quality"),
        ),
        SimpleDialogOption(
          onPressed: ()=>ArtworkImageView.download(context, "regular", data),
          child: const Text("SD quality"),
        )
      ],
    )
  );
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
          IconButton(onPressed: ()=>ArtworkImageView.showDownloadDialog(context, data!), icon: const Icon(Icons.download))
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
    setTitle("Manga view - pixiv");
    return Scaffold(
      appBar:AppBar(backgroundColor:Colors.black,foregroundColor: Colors.white,),
      backgroundColor: Colors.black,
      body:bookStyle==0?MangaVerticalView(id: id, data:data):MangaHorizontalView(id: id,direction: bookStyle-1,data:data)
    );
  }
}

class MangaVerticalView extends StatelessWidget {
  List<JSON>? data;
  final String id;
  MangaVerticalView({super.key, this.data, required this.id});
  
  Widget theChild(ctx) => ListView(children: data!.map((e) => pxImage(e["urls"]["regular"],fit:BoxFit.fitWidth)).toList());
  @override
  Widget build(ctx) {
    if (data==null) {
      return futureWidget(future: pxRequest("https://pixiv.net/ajax/illust/$id/pages"),builder: (c,s){ 
        data = <JSON>[...s.data!];
        return theChild(c);
      });
    }
    else {return theChild(ctx);}
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
    /// this is a widget, defined as a widget, and lives as awidget
    List<Widget> pages = <Widget>[...data.mapIndexed((i,e) => GestureDetector(
        onTap:()=>navigate("/artwork/view/${widget.id}?index=$i",extra: data[i]), 
        child:Hero(tag:"${widget.id}_p$i",child:pxImage(e["urls"]["regular"],fit: BoxFit.fitHeight,placeholder: const CircularProgressIndicator()))
      )
    )];
    // if the amount of pages is odd, insert a blank page
    if (data.length.isOdd) {pages.insert(0, FittedBox(fit:BoxFit.fitHeight,child:Container(color: Colors.white,width: data[0]["width"].toDouble(),height: data[0]["height"].toDouble(),)));}
    // group every 2 pages to 1 on desktop
    if (!kIsMobile) pages = split2d(pages).map((e)=>Row(children:widget.direction==0?e.reversed.toList():e, mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,)).toList();
    return Stack(alignment: Alignment.bottomCenter, children: [
      PageView( 
        reverse: true,
        controller: _pageCtrl,
        children: pages
      ),
      // dont move this to before PageView or batman will use your shower
      Builder(builder:(bctx){
        ValueNotifier opacity = ValueNotifier<double>(0);
        return MouseRegion( 
          onEnter: (e){opacity.value=1.0;},
          onExit: (e){opacity.value=0.0;},
          child: ListenableBuilder(listenable: opacity, builder: (lctx,ehar)=>AnimatedOpacity(
            opacity: opacity.value, 
            duration: Durations.medium1, 
            child: Container(
              decoration: BoxDecoration( 
                color: Colors.black,
                borderRadius: BorderRadius.circular(24)
              ),
              child:Row(mainAxisSize:MainAxisSize.min,children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  color: Colors.white,
                  onPressed: ()=>_updateIndex(widget.direction==0?idx+1:idx-1),
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  color: Colors.white,
                  onPressed: ()=>_updateIndex(widget.direction==0?idx-1:idx+1),
                ),
              ])
            )
          ))
        );
      })
    ],);
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
    widget.data = <JSON>[...snap.data!]; 
    return theChild(ctx);
  }):theChild(ctx);

}
