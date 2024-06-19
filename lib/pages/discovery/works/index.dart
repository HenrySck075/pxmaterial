
import 'package:flutter/material.dart';
import 'package:sofieru/pages/discovery/works/illustManga.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/shared/route.dart';
class Works extends StatefulWidget {
  const Works({super.key});

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
      [const IllustManga(),const Placeholder()][idx]
    ]));
  }
}
