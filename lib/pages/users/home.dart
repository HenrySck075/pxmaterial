import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';

class HomePage extends StatefulWidget {
  final String id;
  HomePage({super.key, required this.id});
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
                data["illusts"].entries.toList() // illust entries
                ..addAll(data["manga"].entries) // add all manga entries
                ..sort((e1,e2)=>DateTime.parse(e1["createDate"]).millisecondsSinceEpoch <= DateTime.parse(e2["createDate"]).millisecondsSinceEpoch)
              )
            ],
            if (data["requestPostWorks"]["artworks"] is Map || data["novels"] is Map ) ...[
              header("Illustrations and Manga"),
              artworkGrid(
                data["requestPostWorks"]["artworks"].entries.toList() // illust entries
                ..addAll(data["requestPostWorks"]["novels"].entries) // add all manga entries
                ..sort((e1,e2)=>DateTime.parse(e1["createDate"]).millisecondsSinceEpoch <= DateTime.parse(e2["createDate"]).millisecondsSinceEpoch)
              )
            ],
          ]
        )
      );
    }
  );
}
