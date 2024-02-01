import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';

class IllustManga extends StatelessWidget {
  var req = pxRequest("https://www.pixiv.net/ajax/discovery/artworks?mode=all&limit=60");
  @override 
  Widget build(ctx) => futureWidget(future: req, builder: (ctx,snap) {
    List<dynamic> yipee = snap.data["thumbnails"]["illust"];
    return SingleChildScrollView( 
      child: artworkGrid(
        List.from(yipee.map((e) => PxArtwork(data: e)))
      ),
    );
  });
}
