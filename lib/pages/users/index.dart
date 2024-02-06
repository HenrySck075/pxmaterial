
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofieru/shared.dart';
// import 'package:sticky_headers/sticky_headers.dart';

import 'home.dart';

class ShellPage extends StatefulWidget {
  final String id;
  const ShellPage({super.key, required this.id});
  @override
  State<ShellPage> createState()=>_ShellPageState();
}
class _ShellPageState extends State<ShellPage> with TickerProviderStateMixin {
  late final String id;
  late final Widget child;
  int selIdx = 0;

  String mode = "all";
  String type = "all";

  List<String> habibi = ["","illustrations","manga","novels"];
  late final TabController _tabCtrl;
  final _toggleDesc = VisibleNotifyNotifier(false);
  @override
  void initState() {
    id = widget.id;
    var q = getQueries();
    super.initState();
    mode = q["mode"]??"all";
    type = q["type"]??"all";
    _tabCtrl = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(c) {
    var sus = currentRouteURI().pathSegments;
    selIdx = habibi.indexOf(sus[sus.length-1]);
    if (selIdx == -1) {selIdx = 0;}
    _tabCtrl.index=selIdx;
    return Consumer<Config>(builder: (ctx,d,c){
      d.search_options["mode"] = mode;
      d.search_options["type"] = type;
      return futureWidget(
      future: pxRequest("https://www.pixiv.net/ajax/user/$id?full=1"), 
      builder: (ctx,snap){
        JSON data = snap.data!;
        setTitle('${data["name"]} - pixiv');
        return NestedScrollView( 
          // Reference: Google Contacts
          headerSliverBuilder: (ctx,v)=>[
            SliverList(
              delegate:SliverChildListDelegate(List.from(insertionBuilder([
                 if (data["background"]?["url"]!=null) Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 160,
                  clipBehavior: Clip.hardEdge,
                  child:pxImage(data["background"]["url"],width:MediaQuery.sizeOf(ctx).width*0.9)
                ),
                CircleAvatar(backgroundImage: pxImageFlutter(data["imageBig"]).image),
                Text(data["name"], style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
                Card(
                  child: ListenableBuilder(listenable: _toggleDesc, builder: (ctx,whar)=>Padding(
                      padding: const EdgeInsets.all(16),
                      child:Column(
                        children:[
                          data["comment"]!=""?GestureDetector(onTap:(){_toggleDesc.value = !_toggleDesc.value;},child:Text(_toggleDesc.value?data["comment"]:"View")):const Text("No description provided"), 
                          const SizedBox(height:4),
                          AuthorInfo_Medias(data),
                          const SizedBox(height:4),
                          Text("${data['following']} following")
                        ]
                      )
                    )
                  )
                ),
              ], (w)=>Center(child:w)))),
            ),
            SliverToBoxAdapter(
              child: TabBar(tabs: const [
                  Tab(text:"Home"),
                  Tab(text:"Illusts"),
                  Tab(text:"Manga"),
                  Tab(text:"Novel"),
                ],onTap: (v)=>navigate("/user/$id/${habibi[v]}"),
                controller: _tabCtrl,
              ),
            ),
          ],
          // d
          body:TabBarView(
            controller: _tabCtrl,
            children: [
              HomePage(id:id),
              // IllustPage(tag:tag),
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          )
        );
      });
    });
  }
}
