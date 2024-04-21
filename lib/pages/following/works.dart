import 'package:flutter/material.dart';

class WorksFromFollowing extends StatelessWidget {
  WorksFromFollowing({super.key});

  @override 
  Widget build(ctx)=>ListView( 
    children: [
      SegmentedButton(segments: const [
        // value is route name
        ButtonSegment(value: "followart", label: Text("Illusts & Manga")),
        ButtonSegment(value: "follownovel", label: Text("Novels"))
      ], selected: {"followart"}),

    ],
  );
}
