import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/commission/page/request/RequestPage.dart';
import 'package:sofieru/json/ajax/shared/TagInfo.dart';
import 'package:sofieru/pages/view/shared.dart';
import 'package:sofieru/shared.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(ctx) => futureWidget(
    future: pxRequest("https://www.pixiv.net/ajax/commision/page/request"), 
    builder: (ctx,snap) {
      final data = RequestPage.fromJson(snap.data!);
      final tagEntries = data.tagTranslation.keys.toList();
      return SingleChildScrollView(
        child: Column( 
          children: [
            ListView(children: tagEntries.map((e) => tagChipBuilder(TagInfo(
              tag: e, 
              locked: false, 
              deletable: false, 
              userName: "shut"
            ),url:"/request/creators/works/illust?tag=$e")).toList()),
            header("Works from creators accepting requests")

          ],
        ),
      );
    }
  ); 
}
