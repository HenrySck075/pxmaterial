import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/shared/http.dart';

class HomePage extends StatefulWidget {
  final String id;
  const HomePage({super.key, required this.id});
  @override
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<dynamic> meta;
  @override
  void initState() {
    super.initState();
    meta = pxRequest("https://www.pixiv.net/ajax/user/${widget.id}/profile/top");
  }
  @override
  Widget build(ctx)=>futureWidget(
    future: meta,
    builder: (ctx,snap) {
      JSON data = snap.data!;
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (data["illusts"] is Map || data["manga"] is Map ) ...[
              header("Illustrations and Manga"),
              artworkGrid(
                returnSelf<List<MapEntry<dynamic, dynamic>>>((data["illusts"] is Map?data["illusts"].entries.toList():[]) // illust entries
                ..addAll(data["manga"] is Map?data["manga"].entries:const Iterable<MapEntry<String,dynamic>>.empty()) // add all manga entries // i adore forced types
                ..sort((e1,e2)=>DateTime.parse(e1.value["createDate"]).millisecondsSinceEpoch.compareTo(DateTime.parse(e2.value["createDate"]).millisecondsSinceEpoch)) // sort
                ).sublist(0,18).map((e) => PxArtwork.fromJson(payload: e.value))
              )
            ],
            // similar to above
            ...[
              header("Requested Works"),
              artworkGrid(
                returnSelf<List<dynamic>>(data["requestPostWorks"]["artworks"].toList()
                ..sort((e1,e2)=>DateTime.parse(e1["createDate"]).millisecondsSinceEpoch.compareTo(DateTime.parse(e2["createDate"]).millisecondsSinceEpoch))
                ).map((e) => PxArtwork.fromJson(payload: e))
              )
            ],
          ]
        )
      );
    }
  );
}
