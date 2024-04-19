import 'package:flutter/widgets.dart';
import 'package:sofieru/appdata.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/silly.dart';

class HistoryPage extends StatelessWidget {
  @override 
  Widget build(ctx) {
    setTitle("History - pixiv");
    // https://www.pixiv.net/ajax/illust/detail?illust_ids=107740209
    var history = AppData.of(ctx).watchHistoryManager();
    return ListView(children: [
      Text("h"),
      artworkGrid(history.getHistory().map((e) => PxArtwork(data: e)))
    ]);
  }
}
