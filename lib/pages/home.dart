
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../shared.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.palette_outlined), 
            label: "Illusts"
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_library_outlined), 
            label: "Manga"
          ),
          NavigationDestination(
            icon: Icon(Icons.art_track_outlined), 
            label: "Novels"
          )
        ],
        selectedIndex: index,
        onDestinationSelected: (a)=>setState(() {
          index = a;
        }),
      ),
      body: [const HomePage_Illusts(), const Placeholder(), const Placeholder()][index],
    );
  }
}

String parseDate(String h) {
  String y = h.substring(0,4);
  String m = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"][int.parse(h.substring(4,6))-1];
  String d = h.substring(6);
  d = d+["th","st","nd","rd","th","th","th","th","th","th"][int.parse(d)%10];
  return "$m $d $y";
}
class HomePage_Illusts extends StatelessWidget {
  const HomePage_Illusts({super.key});

  Future<dynamic> ok({bool noCache=false})=>pxRequest("https://www.pixiv.net/ajax/top/illust?mode=all",noCache: noCache);
  
  @override
  Widget build(BuildContext context) {
    
    var data = ok();
    return futureWidget(
      future:data,
      builder: (ctx,d) {
        // if (d.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
        JSON mainresp = thumbRemap(d.data!);
        
        // sliver abuse
        return RefreshIndicator(
          onRefresh: () async {
            data = ok(noCache: true);
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recommended Illusts
                const Text("Recommended works",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                artworkGrid(List.from(mainresp["page"]["recommend"]["ids"].map((id) {
                  return pxArtwork(mainresp["thumbnails"]["illust"][id]);
                }))),
                FilledButton(child: const Text("Show all"),onPressed: ()=>navigate("/following"),),
                const SizedBox(height: 50,),
                // Ranking
                const Text("Daily ranking",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(parseDate(mainresp["page"]["ranking"]["date"]),style: const TextStyle(fontSize: 10,color: Colors.grey)),
                artworkGrid(List.generate(4, ((index) {
                    var i = mainresp["page"]["ranking"]["items"][index];
                    return pxArtwork(mainresp["thumbnails"]["illust"][i["id"]],rank:int.parse(i["rank"]));
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
