import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sofieru/shared.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final String tag;
  const MainPage({super.key, required this.tag});
  @override
  State<MainPage> createState()=>_MainPageState(tag:tag);
}

class _MainPageState extends State<MainPage> {
  final String tag;
  late Future<dynamic> meta;
  _MainPageState({required this.tag});
  var q = getQueries();
  int page = 1;
  String type = "all";
  Future<dynamic> b()=>pxRequest("https://www.pixiv.net/ajax/search/artworks/$tag?s_mode=s_tag_full&p=$page");
  @override
  void initState() {
    super.initState();
    page = int.parse(q["p"]??"1");
    meta = b();
  }
  @override
  Widget build(ctx) {
    return futureWidget(
      future: meta, 
      builder: (ctx,snap) {
        JSON data = snap.data!;
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Illustrations and Manga",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(left:4, right: 4),
                child:artworkGrid([...data["illustManga"]["data"].map((v)=>PxSimpleArtwork(data: v))])
              ),
              NumberPaginator(
                numberPages: data["illustManga"]["lastPage"],
                onPageChange: (val){
                  setState(() {
                    page = val;
                    meta = b();
                  });
                },
              )
            ],
          ),
        );
      }
    );
  }
}
