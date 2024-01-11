import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sofieru/shared.dart';

class ArtworksPage extends StatefulWidget {
  final String tag;
  const ArtworksPage({super.key, required this.tag});
  @override
  State<ArtworksPage> createState()=>_ArtworksPageState(tag:tag);
}
class _ArtworksPageState extends State<ArtworksPage> {
  final String tag;
  late Future<dynamic> meta;
  _ArtworksPageState({required this.tag});
  int page = 1;
  String order = "date_d";
  Future<dynamic> b()=>pxRequest("https://www.pixiv.net/ajax/search/illustrations/$tag?s_mode=s_tag_full&p=$page&order=$order");
  @override
  void initState() {
    super.initState();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Illustrations and Manga",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              artworkGrid([...data["illustManga"]["data"].map((v)=>PxSimpleArtwork(data: v))]),
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
