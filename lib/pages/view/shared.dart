import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/shared/TagInfo.dart';
import 'package:sofieru/shared.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
class Comments extends StatefulWidget {
  final String id;
  /// i love you
  final String type;
  const Comments({super.key, required this.id, this.type = "illust"});
  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  List<dynamic> comments = [];
  Future<dynamic>? theReq;
  int offset = 0;
  int limit = 3;
  bool hasNext = true;
  @override
  void initState() {
    super.initState();
    theReq = pxRequest("https://www.pixiv.net/ajax/${widget.type}s/comments/roots?${widget.type}_id=${widget.id}&offset=$offset&limit=$limit").then((v){
      hasNext = v["hasNext"];
      return v["comments"];
    });
  }
  @override
  Widget build(context) {
    return futureWidget(future: theReq!, builder: (context, snapshot) {
      comments = snapshot.data;
      limit = 50;
      offset = 3;
      return Column(
        children: [
          if (comments.isEmpty) const Text("There's no comments yet", textAlign: TextAlign.center,)
          else ...List.from(comments.map((v)=>ListTile(
            title: Text(v["userName"]),
            subtitle: v["comment"] == ""?Container(
              foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 96,
                height: 96,
                child: pxImageFlutter("https://s.pximg.net/common/images/stamp/generated-stamps/${v['stampId']}_s.jpg", width: 96, height: 96)
              )
            ):HtmlWidget(p(v["comment"])),
            leading: GestureDetector(onTap:()=>navigate("/users/${v['userId']}"),child:CircleAvatar(backgroundImage: pxImageFlutter(v["img"]).image,))
          ))),
          if(hasNext) FilledButton(onPressed: (){
            
            pxRequest("https://www.pixiv.net/ajax/illusts/comments/roots?illust_id=${widget.id}&offset=$offset&limit=$limit").then((v){
              setState(() {
                comments.addAll(v["comments"]);
                offset += v["comments"].length as int;
                hasNext = v["hasNext"];
              });
            });
          }, child: const Text("Show more"))
        ],
      );}
    );
  }
}
var rnadom = Random();
ActionChip tagChipBuilder(TagInfo t, {String? url, bool randomColor = false}) => ActionChip(
  label: Row(
    mainAxisSize: MainAxisSize.min,
    children:[
      Flexible(flex:4,child: Text(t.tag,overflow: TextOverflow.ellipsis,style: TextStyle(color: t.tag.startsWith("R-18")?Colors.red:null),)),
      if (t.translation?["en"]!=null) Flexible(flex:4,child: Text("(${t.translation!['en']})",style: const TextStyle(color: Colors.grey, fontSize: 10),overflow: TextOverflow.ellipsis))
    ]
  ),
  onPressed: ()=>navigate(url??"/tags/${t.tag}")//${data.xRestrict==1?'?mode=r18':''}"),
);

