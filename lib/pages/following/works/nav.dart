import 'package:flutter/material.dart';
import 'package:sofieru/pages/following/works/illustManga.dart';

class WorksFromFollowing extends StatefulWidget {
  WorksFromFollowing({super.key});

  @override
  State<WorksFromFollowing> createState() => _WorksFromFollowingState();
}

class _WorksFromFollowingState extends State<WorksFromFollowing> {
  List<Widget> meow = [IllustManga(),Placeholder()];

  List<String> d = ["followart","follownovel"];

  String _sel = "followart";

  @override 
  Widget build(ctx)=>SingleChildScrollView(child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SegmentedButton(segments: const [
        // value is route name
        ButtonSegment(value: "followart", label: Text("Illusts & Manga")),
        ButtonSegment(value: "follownovel", label: Text("Novels"))
      ], selected: {"followart"}, onSelectionChanged: (s)=>{
        setState((){
          _sel = s.elementAt(0);
        })
      },),
      meow[d.indexOf(_sel)]
    ],
  ));
}
