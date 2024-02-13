
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofieru/json/ajax/user/User.dart';
import 'package:sofieru/pages/users/illusts.dart';
import 'package:sofieru/shared.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:sofieru/json/ajax/shared/fucking.dart';

import 'home.dart';

class ShellPage extends StatefulWidget {
  final String id;
  int page;
  ShellPage({super.key, required this.id, this.page = 0});
  @override
  State<ShellPage> createState()=>_ShellPageState();
}
class _ShellPageState extends State<ShellPage> with TickerProviderStateMixin {
  late final String id;
  late final Widget child;
  int selIdx = 0;

  String mode = "all";
  String type = "all";

  
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
    return Consumer<Config>(builder: (ctx,d,c){
      d.search_options["mode"] = mode;
      d.search_options["type"] = type;
      return futureWidget(
      future: Future.wait([pxRequest("https://www.pixiv.net/ajax/user/$id?full=1"),pxRequest("https://www.pixiv.net/ajax/user/$id/profile/all")]), 
      builder: (ctx,snap){
        var data = User.fromJson(snap.data![0]);
        var allWorks = snap.data![1];

        bool displayIllustTab = ifNullfies(allWorks["illusts"])!=null;
        bool displayMangaTab = ifNullfies(allWorks["manga"])!=null||ifNullfies(allWorks["mangaSeries"])!=null;
        bool displayNovelTab = ifNullfies(allWorks["novels"])!=null||ifNullfies(allWorks["novelSeries"])!=null;
        bool displayRequestTab = allWorks["request"]["showRequestTab"];
        List<(String,Tab)> habibi = [
          const ("", Tab(text:"Home")),
          if (displayIllustTab) const ("illustrations", Tab(text:"Illusts")),
          if (displayMangaTab) const ("manga", Tab(text:"Manga")),
          if (displayNovelTab) const ("novels",Tab(text:"Novel")),
          if (displayRequestTab) const ("request",Tab(text:"Requests"))
        ];
        var sus = currentRouteURI().pathSegments;
        selIdx = habibi.indexWhere((e)=>e.$1==sus[sus.length-1]);
        if (selIdx == -1) {selIdx = 0;}
        _tabCtrl.index=selIdx;
        setTitle('${data.name} - pixiv');
        return NestedScrollView( 
          // Reference: Google Contacts
          headerSliverBuilder: (ctx,v)=>[
            SliverList(
              delegate:SliverChildListDelegate(List.from(insertionBuilder([
                 if (data.background?.url!=null) Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 160,
                  clipBehavior: Clip.hardEdge,
                  child:pxImage(data.background!.url,width:MediaQuery.sizeOf(ctx).width*0.9)
                ),
                CircleAvatar(backgroundImage: pxImageFlutter(data.imageBig).image),
                Text(data.name, style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
                Card(
                  child: ListenableBuilder(listenable: _toggleDesc, builder: (ctx,whar)=>Padding(
                      padding: const EdgeInsets.all(16),
                      child:Column(
                        children:[
                          data.comment!=""?GestureDetector(onTap:(){_toggleDesc.value = !_toggleDesc.value;},child:Text(_toggleDesc.value?data.comment:"View description")):const Text("No description provided"), 
                          const SizedBox(height:4),
                          AuthorInfo_Medias(data,ctx),
                          const SizedBox(height:4),
                          Text("${data.following} following")
                        ]
                      )
                    )
                  )
                ),
              ], (w)=>Center(child:w)))),
            ),
            SliverToBoxAdapter(
              child: StickyHeader(header:TabBar(tabs: habibi.map((e) => e.$2).toList(),onTap: (v)=>navigate("/users/$id/${habibi[v].$1}"),
                controller: _tabCtrl,
              ),content:const SizedBox(width:1,height:1,),
            )),
          ],
          // d
          body:Scaffold(body: TabBarView(
            controller: _tabCtrl,
            children: [
              HomePage(id:id),
              // IllustPage(tag:tag),
              if (displayIllustTab) IllustPage(illustIds: allWorks["illusts"].keys.toList(),id: id,page: widget.page,),
              if (displayMangaTab) Placeholder(),
              if (displayNovelTab) Placeholder(),
              if (displayRequestTab) Placeholder(),
            ],
          ))
        );
      });
    });
  }
}
