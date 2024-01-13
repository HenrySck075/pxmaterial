import 'package:flutter/material.dart';
import 'shared.dart';
import 'package:sofieru/shared.dart';
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
        JSON mainresp = thumbRemap(d.data!);
        print(mainresp['page']['follow']);
        
        // sliver abuse
        Map<String,dynamic> getData(String id) => mainresp["thumbnails"]["illust"][id]??mainresp["thumbnails"]["novel"][id];
        return RefreshIndicator(
          onRefresh: () async {
            data = ok(noCache: true);
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("From users that you follows",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height:290, child: ListView( 
                  scrollDirection: Axis.horizontal,
                  children: [...mainresp["page"]["follow"].map((id)=>pxArtwork(getData(id.toString())))],
                )),
                // Recommended Illusts
                const Text("Recommended works",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                artworkGrid(List.from(mainresp["page"]["recommend"]["ids"].map((id)=>pxArtwork(getData(id))))),
                FilledButton(child: const Text("Show all"),onPressed: ()=>navigate("/discovery"),),
                const SizedBox(height: 50,),
                // Ranking
                const Text("Daily ranking",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(parseDate(mainresp["page"]["ranking"]["date"]),style: const TextStyle(fontSize: 10,color: Colors.grey)),
                artworkGrid(List.generate(4, ((index) {
                    var i = mainresp["page"]["ranking"]["items"][index];
                    return pxArtwork(getData(i["id"]),rank:int.parse(i["rank"]));
                  }))
                ),
                FilledButton(child: const Text("Show all"),onPressed: ()=>navigate("/following")),
                const SizedBox(height: 50,),
              ]
            ),
          )
        );
      },
    );
  }
}
