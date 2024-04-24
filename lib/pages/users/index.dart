
import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/user/User.dart';
import 'package:sofieru/pages/users/illusts.dart';
import 'package:sofieru/shared.dart';
import 'package:sticky_headers/sticky_headers.dart';

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

  TabController? _tabCtrl;
  final _toggleDesc = VisibleNotifyNotifier(false);
  @override
  void initState() {
    id = widget.id;
    var q = getQueries();
    super.initState();
    mode = q["mode"]??"all";
    type = q["type"]??"all";
  }
  @override
  void dispose() {
    _tabCtrl!.dispose();
    super.dispose();
  }
  
  @override
  Widget build(c) {
    return futureWidget(
      future: Future.wait([pxRequest("https://www.pixiv.net/ajax/user/$id?full=1"),pxRequest("https://www.pixiv.net/ajax/user/$id/profile/all")]), 
      builder: (ctx,snap){
        var data = User.fromJson(snap.data![0]);
        var allWorks = snap.data![1];

        bool displayIllustTab = allWorks["illusts"] is! List;
        bool displayMangaTab = allWorks["manga"] is! List||allWorks["mangaSeries"] is! List;
        bool displayNovelTab = allWorks["novels"] is! List||allWorks["novelSeries"] is! List;
        bool displayRequestTab = allWorks["request"]["showRequestTab"];
        List<(String,Tab)> habibi = [
          const ("", Tab(text:"Home")),
          if (displayIllustTab) const ("illustrations", Tab(text:"Illusts")),
          if (displayMangaTab) const ("manga", Tab(text:"Manga")),
          if (displayNovelTab) const ("novels",Tab(text:"Novel")),
          if (displayRequestTab) const ("request",Tab(text:"Requests"))
        ];
        _tabCtrl = TabController(length: habibi.length, vsync: this);
        var sus = currentRouteURI().pathSegments;
        selIdx = habibi.indexWhere((e)=>e.$1==sus[sus.length-1]);
        if (selIdx == -1) {selIdx = 0;}
        _tabCtrl!.index=selIdx;
        setTitle('${data.name} - pixiv');
        return NestedScrollView( 
          // Reference: Google Contacts
          headerSliverBuilder: (ctx,v)=>[
            SliverList(
              delegate:SliverChildListDelegate([
                 if (data.background?.url!=null) Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 280,
                  clipBehavior: Clip.hardEdge,
                  child:pxImage(data.background!.url,width:MediaQuery.sizeOf(ctx).width*0.9,fit: BoxFit.fitWidth)
                ),
                Row(mainAxisSize: MainAxisSize.min,children: [
                  CircleAvatar(backgroundImage: pxImageFlutter(data.imageBig,width: 50).image),
                  const SizedBox(width: 4,),
                  Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment:CrossAxisAlignment.start, children: [
                    Text(data.name, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    )),
                    Text("${data.following} following"),
                  ])
                ]),
                const SizedBox(height:4),
                data.comment!=""?GestureDetector(onTap:(){print("joe");},child:Text(data.comment,maxLines:2,overflow: TextOverflow.ellipsis,)):const Text("No description provided"), 
                const SizedBox(height:4),
                AuthorInfo_Medias(data,ctx,alignment: MainAxisAlignment.start),
              ]),
            ),
            SliverToBoxAdapter(
              child: StickyHeader(header:WidthDependentTabBar(tabs: habibi.map((e) => e.$2).toList(),onTap: (v)=>navigate("/users/$id/${habibi[v].$1}"),
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
  }
}
