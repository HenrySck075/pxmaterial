import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';

class Novel extends StatefulWidget {
  @override
  State<Novel> createState()=>_NovelState();
}
class _NovelState extends State<Novel> {
  var req = pxRequest("https://www.pixiv.net/ajax/discovery/novels?mode=all&limit=60");
  final _scsvCtrl = ScrollController();
  final yipee = VisibleNotifyNotifier<List<dynamic>>([]);
  @override 
  void initState() {
    super.initState();
    _scsvCtrl.addListener(() {
      if (_scsvCtrl.position.pixels>=_scsvCtrl.position.maxScrollExtent) {
        pxRequest("https://www.pixiv.net/ajax/discovery/novels?mode=all&limit=30").then((value) {
          yipee.value.addAll(value["recommendedNovelIds"]);
          yipee.notifyListeners();
        });
      }
    });
  }
  @override 
  Widget build(ctx) => futureWidget(future: req, builder: (ctx,snap) {
    yipee.value = snap.data["thumbnails"]["novel"];
    return ListenableBuilder(
      listenable: yipee,
      builder:(i,dk)=>SingleChildScrollView( 
        controller: _scsvCtrl,
        child: artworkGrid(
          List.from(yipee.value.map((e) => PxNovel(data: e)))
        ),
      )
    );
  });
}
