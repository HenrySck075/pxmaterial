import "package:flutter/material.dart";
import "package:flutter_widget_from_html/flutter_widget_from_html.dart";
import "package:skeletonizer/skeletonizer.dart";
import "package:sofieru/json/ajax/shared/TagInfo.dart";
import "package:sofieru/pages/view/shared.dart" show tagChipBuilder;
import "package:sofieru/shared.dart" show HtmlUrlLauncher;
import "shared.dart";

ListTile authorView = listTileWidget;

SizedBox authorWorks = SizedBox(
  height: 190,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(7, (index) => const SizedBox(width: 190,height: 190,),),
  ),
);

