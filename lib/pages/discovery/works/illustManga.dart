import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/top/illust/Artwork.dart';
import 'package:sofieru/shared.dart';

class IllustManga extends StatefulWidget {
  @override
  State<IllustManga> createState()=>_IllustMangaState();
}
class _IllustMangaState extends State<IllustManga> {
  var req = pxRequest("https://www.pixiv.net/ajax/discovery/artworks?mode=all&limit=60");
  final _scsvCtrl = ScrollController();
  final yipee = VisibleNotifyNotifier<List<dynamic>>([]);
  @override 
  void initState() {
    super.initState();
    _scsvCtrl.addListener(() {
      if (_scsvCtrl.position.pixels>=_scsvCtrl.position.maxScrollExtent) {
        pxRequest("https://www.pixiv.net/ajax/discovery/artworks?mode=all&limit=60").then((value) {
          yipee.value.addAll(value["illusts"]);
          yipee.notifyListeners();
        });
      }
    });
  }
  @override 
  Widget build(ctx) => futureWidget(future: req, builder: (ctx,snap) {
    yipee.value = snap.data["thumbnails"]["illust"];
    return ListenableBuilder(
      listenable: yipee,
      builder:(i,dk)=>SingleChildScrollView( 
        controller: _scsvCtrl,
        child: artworkGrid(
          List.from(yipee.value.map((e) => PxArtwork(data: Artwork.fromJson(e))))
        ),
      )
    );
  });
}
