import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/top/illust/Artwork.dart';
import 'package:sofieru/shared.dart';

class MainPage extends StatefulWidget {
  final String tag;
  const MainPage({super.key, required this.tag});
  @override
  State<MainPage> createState()=>_MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final String tag;
  late Future<dynamic> meta;
  var q = getQueries();
  int page = 1;
  String type = "all";
  Future<dynamic> b()=>pxRequest("https://www.pixiv.net/ajax/search/artworks/$tag?s_mode=s_tag_full&p=$page");
  @override
  void initState() {
    super.initState();
    page = int.parse(q["p"]??"1");
    tag = widget.tag;
    meta = b();
  }
  @override
  Widget build(ctx) => futureWidget(
    future: meta, 
    builder: (ctx,snap) {
      JSON data = snap.data!;
      List<dynamic> popular = data["popular"]["permanent"];
      popular.addAll(data["popular"]["recent"]);
      debugPrint(jsonEncode(data["popular"]));
      popular.shuffle();
      if (popular.isNotEmpty) popular = popular.sublist(0,6);
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (popular.isNotEmpty) header("Popular artworks"),
            if (popular.isNotEmpty) SizedBox(height: 280,child: ListView( 
              scrollDirection: Axis.horizontal,
              children: [...popular.map((e) => PxArtwork(data: Artwork.fromJson(e))),]
            ),),
            const Text("Illustrations and Manga",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(left:4, right: 4),
              child:artworkGrid([...data["illustManga"]["data"].map((v)=>PxSimpleArtwork(data: v))])
            ),
            Row( 
              children: [
                OutlinedButton(onPressed: ()=>navigate("tags/$tag/illustrations"), child: const Text("More illusts")),
                OutlinedButton(onPressed: ()=>navigate("tags/$tag/manga"), child: const Text("More mangas"))
              ],
            ),
          ],
        ),
      );
    }
  );
}
