import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sofieru/appdata.dart';
import 'package:sofieru/shared.dart';

// ===============START OF DEV DATA===============
var _fakeIllustEntry = 
{
    "id": "116254075",
    "title": "ネモフィラの丘としまちゃん",
    "illustType": 0,
    "xRestrict": 0,
    "restrict": 0,
    "sl": 2,
    "url": "https://i.pximg.net/c/250x250_80_a2/img-master/img/2024/02/21/12/09/17/116254075_p0_square1200.jpg",
    "description": "",
    "tags": [
        "lmao"
    ],
    "userId": "30986221",
    "userName": "にこねこぷらす",
    "width": 768,
    "height": 768,
    "pageCount": 1,
    "isBookmarkable": true,
    "bookmarkData": null,
    "alt": "long-tailed tit, nemophila / ネモフィラの丘としまちゃん / February 21st, 2024",
    "titleCaptionTranslation": {
        "workTitle": null,
        "workCaption": null
    },
    "createDate": "2024-02-21T12:09:17+09:00",
    "updateDate": "2024-02-21T12:09:17+09:00",
    "isUnlisted": false,
    "isMasked": false,
    "aiType": 1,
    "urls": {
        "250x250": "https://i.pximg.net/c/250x250_80_a2/img-master/img/2024/02/21/12/09/17/116254075_p0_square1200.jpg",
        "360x360": "https://i.pximg.net/c/360x360_70/img-master/img/2024/02/21/12/09/17/116254075_p0_square1200.jpg",
        "540x540": "https://i.pximg.net/c/540x540_70/img-master/img/2024/02/21/12/09/17/116254075_p0_square1200.jpg",
        "1200x1200": "https://i.pximg.net/img-master/img/2024/02/21/12/09/17/116254075_p0_master1200.jpg"
    },
    "profileImageUrl": "https://i.pximg.net/user-profile/img/2023/11/24/08/43/40/25197592_ef6e6f4d2ba1462287c663fd2eda806d_50.jpg"
};



// ===============END OF DEV DATA===============






class DevTools extends StatelessWidget {
  @override
  Widget build(ctx){
    var appdata = AppData.of(ctx);
    var history = appdata.watchHistoryManager();
    var rand = Random();
    setTitle("pixiv Material Design Concept | Developer Tools");
    return Row( 
      children: [
        Card(child: Column(children: [
          FilledButton.tonal(onPressed: ()=>List.generate(7, (_)=>history.addHistory(_fakeIllustEntry..update("id", (value) => rand.nextInt(531).toString()))), child: const Text("Fill history with dummy entries")),
          FilledButton.tonal(onPressed: (){
            appdata.database.execute("DROP TABLE history;");
            appdata.database.execute('''
              CREATE TABLE IF NOT EXISTS history (
                id INTEGER NOT NULL PRIMARY KEY,
                jsondata TEXT NOT NULL
              );
            ''');
          }, child: const Text("Nuke history database"))

        ],),),
        AlertDialog(
          title: const Text("Navigate to"),
          content: Column(children: [
            TextField(
              onSubmitted: (v)=>ctx.go(v),
            ),
            FilledButton(onPressed: ()=>ctx.go("/"), child: const Text("meh"))
          ])
        )
      ],
    );
  }
}
