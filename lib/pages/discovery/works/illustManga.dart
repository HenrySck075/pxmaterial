import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/shared/http.dart';

class IllustManga extends StatefulWidget {
  const IllustManga({super.key});
  @override
  State<IllustManga> createState()=>_IllustMangaState();
}
class _IllustMangaState extends State<IllustManga> {
  var req = pxRequest("https://www.pixiv.net/ajax/discovery/artworks?mode=all&limit=60",extraData: {"id":1});
  final _scsvCtrl = ScrollController();
  final yipee = VisibleNotifyNotifier<List<dynamic>>([]);
  int id = 1;
  @override 
  void initState() {
    super.initState();
    _scsvCtrl.addListener(() {
      if (_scsvCtrl.position.pixels>=_scsvCtrl.position.maxScrollExtent) {
        id++;
        pxRequest("https://www.pixiv.net/ajax/discovery/artworks?mode=all&limit=60",extraData: {"id":id}).then((value) {
          yipee.value.addAll(value["thumbnails"]["illust"]);
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
          yipee.value.map((e) => PxArtwork(data: e)).toList()
        ),
      )
    );
  });
}
