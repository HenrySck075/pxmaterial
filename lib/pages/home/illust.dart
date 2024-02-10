import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/top/illust/Artwork.dart';
import 'package:sofieru/json/ajax/user/User.dart';
import 'shared.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/json/ajax/top/illust/IllustTop.dart' show IllustTop;
import 'package:sofieru/json/ajax/request/Request.dart' show Request;

class RequestedIllust extends StatelessWidget {
  final Request data;
  final Artwork work;
  /// this looks dumb ik
  final User Function(String id) getUser;
  const RequestedIllust({super.key, required this.data, required this.getUser, required this.work});

  @override
  Widget build(ctx) {
    var requester = getUser(data.fanUserId);
    return Card(
      child: Padding( 
        padding: const EdgeInsets.only(top:16,left:16,right:16),
        child:Column( 
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(data.requestProposal.requestOriginalProposal,maxLines:3,overflow: TextOverflow.ellipsis, softWrap:true,),
            Row(
              children: [ CircleAvatar(backgroundImage:ResizeImage(pxImageFlutter(requester.image).image,width: 16, height: 16)), const SizedBox(width: 4,), Text(requester.name)],
            ),
            const SizedBox(height: 8,),
            Center(child: pxImage(work.url),)
          ],
        )
      )
    );
  }
}

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
        var mainresp = IllustTop.fromJson(thumbRemap(d.data!));
        print(mainresp.page.follow);
        
        // sliver abuse
        Artwork getData(String id) => mainresp.thumbnails.illust[id]!; // it always exist unless you used a wrong variable
        return RefreshIndicator(
          onRefresh: () async {
            data = ok(noCache: true);
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header("From users that you follows"),
                SizedBox(height:290, child: ListView( 
                  scrollDirection: Axis.horizontal,
                  children: [...mainresp.page.follow.map((id)=>PxArtwork(data:getData(id.toString())))],
                )),
                // Recommended Illusts
                header("Recommended works"),
                artworkGrid(List.from(mainresp.page.recommend.ids.map((id)=>PxArtwork(data:getData(id))))),
                const SizedBox(height: 8,),
                FilledButton(child: const Text("Show all"),onPressed: ()=>navigate("/discovery"),),
                const SizedBox(height: 50,),
                // Ranking
                header("Daily ranking"),
                Text(parseDate(mainresp.page.ranking.date),style: const TextStyle(fontSize: 10,color: Colors.grey)),
                artworkGrid(List.generate(math.max(4, (MediaQuery.sizeOf(context).width/194).floor()), ((index) {
                    var i = mainresp.page.ranking.items[index];
                    return PxArtwork(data:getData(i.id),rank:int.parse(i.rank));
                  }))
                ),
                const SizedBox(height: 8,),
                FilledButton(child: const Text("Show all"),onPressed: ()=>navigate("/following")),
                const SizedBox(height: 50,),
                header("Requested works"),
                SizedBox(height:280,child:ListView( 
                  scrollDirection: Axis.horizontal,
                  children: List.from(mainresp.requests.map((i)=>RequestedIllust(data: i,work:getData(i.postWork.postWorkId),getUser: (id)=>mainresp.users.firstWhere((element) => element.userId==id),))),
                )),
                const SizedBox(height: 50,),
                ...concat2d(
                  List.from(mainresp.page.recommendByTag.map((e)=>[
                    GestureDetector( 
                      onTap: ()=>navigate("/tags/${e.tag}"),
                      child: header("#${mainresp.tagTranslation[e.tag]?.en??e.tag} artworks")
                    ),
                    SizedBox(height:280,child:ListView( 
                      scrollDirection: Axis.horizontal,
                      children: List.from(e.ids.map((i)=>PxArtwork(data: getData(i)))),
                    )),
                    const SizedBox(height: 50,),
                  ])
                ))
              ]
            ),
          )
        );
      },
    );
  }
}
