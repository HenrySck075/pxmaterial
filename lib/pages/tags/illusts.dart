import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sofieru/shared.dart';

class IllustPage extends StatefulWidget {
  final String tag;
  const IllustPage({super.key, required this.tag});
  @override
  State<IllustPage> createState()=>_IllustPageState(tag:tag);
}
class _IllustPageState extends State<IllustPage> {
  final String tag;
  late Future<dynamic> meta;
  _IllustPageState({required this.tag});
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
              const Text("Works",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              artworkGrid([...data["illust"]["data"].map((v)=>PxSimpleArtwork(data: v))]),
              NumberPaginator(
                numberPages: data["illust"]["lastPage"],
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
