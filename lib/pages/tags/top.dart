import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';
import 'package:go_router/go_router.dart';

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
  Widget build(ctx) {
    return futureWidget(
      future: meta, 
      builder: (ctx,snap) {
        JSON data = snap.data!;
        List<JSON> popular = [...data["popular"]["permanent"].expand(data["popular"]["recent"])];
        popular.shuffle();
        popular = popular.sublist(0,6);
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Popular artworks",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 120,child: ListView( 
                children: [...popular.map((e) => PxArtwork(data: e)),]
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
}
