import 'package:flutter/material.dart';
import 'shared.dart';
import 'package:sofieru/shared.dart';
class NovelsPage extends StatelessWidget {
  const NovelsPage({super.key});

  Future<dynamic> ok({bool noCache=false})=>pxRequest("https://www.pixiv.net/ajax/top/novel?mode=all",noCache: noCache);
  
  @override
  Widget build(BuildContext context) {
    
    var data = ok();
    return futureWidget(
      future:data,
      builder: (ctx,d) {
        // if (d.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
        JSON mainresp = thumbRemap(d.data!);
        
        Map<String,dynamic> getData(String id) => mainresp["thumbnails"]["novel"][id]??mainresp["thumbnails"]["novel"][id];
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
                  children: [...mainresp["page"]["follow"].map((id)=>PxNovel(data:getData(id.toString())))],
                )),
                // Recommended Illusts
                header("Recommended works"),
                artworkGrid(List.from(mainresp["page"]["recommend"]["ids"].map((id)=>PxNovel(data:getData(id))))),
                FilledButton(child: const Text("Show all"),onPressed: ()=>navigate("/discovery"),),
                const SizedBox(height: 50,),
                // Ranking
                header("Daily ranking"),
                Text(parseDate(mainresp["page"]["ranking"]["date"]),style: const TextStyle(fontSize: 10,color: Colors.grey)),
                artworkGrid(List.generate(4, ((index) {
                    var i = mainresp["page"]["ranking"]["items"][index];
                    return PxNovel(data:getData(i["id"]),rank:int.parse(i["rank"]));
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
