import 'dart:math' as math;

// import 'package:image/image.dart' as img show copyCrop, Image ;
import 'package:flutter/material.dart';
import 'package:memoized/memoized.dart'; 
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart';
import 'shared.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/json/ajax/top/illust/IllustTop.dart' show IllustTop;
import "package:sofieru/pages/requests/widgeto.dart" show RequestedIllust;


class IllustsPage extends StatelessWidget {
  const IllustsPage({super.key});

  Future<dynamic> ok({bool noCache=false})=>pxRequest("https://www.pixiv.net/ajax/top/illust?mode=all",noCache: noCache);
  
  @override
  Widget build(BuildContext context) {
    
    var data = ok();
    return futureWidget(
      future:data,
      builder: (ctx,d) {
        // if (d.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
        var mainresp = IllustTop.fromJson(d.data!);
        
        // this is the equivalent of torture
        final getData = Memoized1<PartialArtwork?, String>(
          (String id) {
            try {
              return mainresp.thumbnails.illust!.firstWhere(
                (e) => e.id==id 
              );
            } on StateError {return null;}
          }
        ); 
        var random = math.Random();
        return SingleChildScrollView(child:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header("From users that you follows"),
            SizedBox(height:290, child: ListView( 
              scrollDirection: Axis.horizontal,
              children: [...mainresp.page.follow.map((id)=>PxArtwork(data:getData(id.toString())!))],
            )),
            const SizedBox(height: 50,),
            // Recommended Illusts
            redirectionHeader(ctx,header("Recommended works")),
            artworkGrid(List.from(mainresp.page.recommend.ids.map((id)=>PxArtwork(data:getData(id)!)))),
            const SizedBox(height: 50,),
            // Ranking
            header("Daily ranking"),
            Text(parseDate(mainresp.page.ranking.date),style: const TextStyle(fontSize: 10,color: Colors.grey)),
            artworkGrid(List.generate(math.max(4, (MediaQuery.sizeOf(context).width/194).floor()), ((index) {
                var i = mainresp.page.ranking.items[index];
                return PxArtwork(data:getData(i.id)!,rank:int.parse(i.rank));
              }))
            ),
            const SizedBox(height: 8,),
            FilledButton(child: const Text("Show all"),onPressed: ()=>navigate("/following")),
            const SizedBox(height: 50,),
            // Requested works
            header("Requested works"),
            SizedBox(height:280,child:ListView( 
              scrollDirection: Axis.horizontal,
              children: mainresp.requests.map((i)=>RequestedIllust(data: i,work:getData(i.postWork!.postWorkId),getUser: (id)=>mainresp.users.firstWhere((element) => element.userId==id),)).toList(),
            )),
            const SizedBox(height: 50,),
            // Popular tags
            header("Popular tags"),
            const SizedBox(height: 8,),
            SizedBox(height:287,child:ListView( 
              scrollDirection: Axis.horizontal,
              children: mainresp.page.tags.map((e) => Padding(padding: const EdgeInsets.only(left: 2,right:2),child:Column(children: [
                Builder(builder: (ctx){
                  var h = pxImage(getData(e.ids[random.nextInt(e.ids.length)].toString())!.url,height: 257);
                  // var h5n1 = img.copyCrop(img.Image.fromBytes(width: h.width, height: h.height, bytes: h), x: 287/2-(183/2), y: 0, width: 183, height: 287);
                  return Container(
                    decoration: const BoxDecoration( 
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(colors: [Colors.transparent, Colors.black38], begin: Alignment(0,0.8), end: Alignment.bottomCenter)
                    ),
                    width: 183,
                    clipBehavior: Clip.hardEdge,
                    child: h//Image.memory(h5n1.toUint8List())
                  );
                }),
                Text("#${e.tag}",style:const TextStyle(fontSize: 18,fontWeight:FontWeight.bold))
              ]))).toList()
            )),
            const SizedBox(height: 50,),
            // Recommended works tagged #tag
            ...concat2d(
              List.from(mainresp.page.recommendByTag.map((e)=>[
                GestureDetector( 
                  onTap: ()=>navigate("/tags/${e.tag}"),
                  child: header("#${mainresp.tagTranslation[e.tag]?.en??e.tag} works")
                ),
                SizedBox(height:280,child:ListView( 
                  scrollDirection: Axis.horizontal,
                  children: List.from(e.ids.map((i){
                    var d = getData(i);
                    return d!=null?PxArtwork(data: d):null;

                  }).where((element) => element!=null)),
                )),
                const SizedBox(height: 50,),
              ])
            ))
          ]
        ));
      },
    );
  }
}
