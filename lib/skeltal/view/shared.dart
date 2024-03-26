import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

ListTile listTileWidget = const ListTile( 
  title: Text("        "),
  leading: Bone.circle(size:24),
  subtitle: Text("       "), 
);

SizedBox comments = SizedBox(
  height: 400,
  child: Column(children: List.generate(3, (index) => listTileWidget),)
);
