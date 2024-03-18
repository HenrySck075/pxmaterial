import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

ListTile listTileWidget = const ListTile( 
  title: Text("        "),
  leading: Bone.circle(size:24),
  subtitle: Text("       "), 
);

Column comments = Column(children: List.generate(3, (index) => listTileWidget),);
