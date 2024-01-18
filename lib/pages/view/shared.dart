import 'package:flutter/material.dart';
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
          if (comments.isEmpty) const Text("There's no comments yet", textAlign: TextAlign.center,),
          ...List.from(comments.map((v)=>ListTile(
            title: Text(v["userName"]),
            subtitle: v["comment"] == ""?Container(
              foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 96,
                height: 96,
                child: pxImageUncached("https://s.pximg.net/common/images/stamp/generated-stamps/${v['stampId']}_s.jpg", width: 96, height: 96)
              )
            ):HtmlWidget(p(v["comment"])),
            leading: CircleAvatar(backgroundImage: pxImageUncached(v["img"]).image,) 
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
