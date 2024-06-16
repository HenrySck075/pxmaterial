import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/shared/http.dart';

class IllustPage extends StatefulWidget {
  final String id;
  int page;
  List<dynamic> illustIds;
  IllustPage({super.key, required this.id, required this.illustIds, this.page = 0});
  @override
  State<IllustPage> createState()=>_IllustPageState();
}

class _IllustPageState extends State<IllustPage> {
  Future<dynamic>? meta;
  late final int totalPages;
  Future<dynamic> _frier(int end)=>pxRequest("https://www.pixiv.net/ajax/user/${widget.id}/profile/illusts?ids[]=${widget.illustIds.sublist(48*widget.page,end).join('&ids[]=')}&work_category=illust&is_first_page=${widget.page>0?1:0}");
  @override
  void initState() {
    super.initState();
    totalPages = (widget.illustIds.length/48).ceil();
    int end = 48*widget.page+48;
    if (end > widget.illustIds.length) end = widget.illustIds.length;
    meta = _frier(end);
  }
  @override
  Widget build(ctx)=>SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.illustIds.length!=0) futureWidget(
          future: meta!,
          builder: (ctx,snap) {
            JSON data = snap.data!;
            return artworkGrid(
              returnSelf<List<MapEntry<dynamic, dynamic>>>(data["works"].entries.toList() // illust entries
              ..sort((e1,e2)=>DateTime.parse(e1.value["createDate"]).millisecondsSinceEpoch.compareTo(DateTime.parse(e2.value["createDate"]).millisecondsSinceEpoch)) // sort
              ).map((e) => PxArtwork(data: PartialArtwork.fromJson(e.value))).toList()
            );
          }
        ) else const Text("nothing lel"),
        NumberPaginator(
          numberPages: totalPages,
          initialPage: widget.page,
          onPageChange: (n)=>setState((){
            widget.page = n;
            int end = 48*widget.page+48;
            if (end > widget.illustIds.length) end = widget.illustIds.length;
            meta=_frier(end);
          }),
        )
      ]
    )
  );
}
