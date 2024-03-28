
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sofieru/json/ajax/shared/TagInfo.dart';
import 'package:sofieru/pages/view/shared.dart' show tagChipBuilder;
import 'package:sofieru/shared.dart';
import 'package:sofieru/skeltal/view/layout.dart';
Column mainSkel({
  String? title, String? desc, List<String>? tags, captionTranslations
}) => Column( 
  children: [
    const SizedBox.square(dimension: 350,),

    if (desc==null) const Card(child: SizedBox(),)
    else Skeleton.keep(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding( 
          padding: const EdgeInsets.all(4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(captionTranslations.workTitle??title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            const SizedBox(height: 10,),
            HtmlWidget(captionTranslations.workCaption??desc,onTapUrl: HtmlUrlLauncher),
            const SizedBox(height: 10,),
            Wrap(
              spacing: 8,
              children: tags!=null?List.from(tags.map((t)=>tagChipBuilder(TagInfo(tag: t, locked: true, deletable: true))),):[]
            )
          ])
        )
      ),
    ),),

    authorView,
    authorWorks,
    const Skeleton.keep(child:Text("Related artworks"))
  ],
);
