
import 'package:flutter/material.dart';
import 'package:sofieru/pages/discovery/works/illustManga.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/silly.dart';
class Works extends StatefulWidget {
  @override
  State<Works> createState() => _WorksState();
}
class _WorksState extends State<Works>{
  final ture = ["/discovery","/novel/discovery"];
  @override 
  Widget build(ctx) {
    int idx = ture.indexOf(currentRouteURI().path);
    if (idx==-1) idx=0;
    
    return SingleChildScrollView(child:Column(children: [
      TabChips(
        labels: const [
          "Illusts & Manga",
          "Novels",
        ],
        onSelect: (v)=>navigate(ture[v])
      ),
      [IllustManga(),Placeholder()][idx]
    ]));
  }
}
