
import 'package:flutter/material.dart';
import 'package:sofieru/pages/home/illust.dart';
import 'package:sofieru/pages/home/novel.dart';
import 'package:sofieru/shared.dart';
export 'illust.dart' show IllustsPage;
export 'novel.dart' show NovelsPage;
class ShellPage extends StatefulWidget {
  Widget child;
  ShellPage({super.key, required this.child});

  @override
  State<ShellPage> createState()=>_ShellPageState();
}
class _ShellPageState extends State<ShellPage> with SingleTickerProviderStateMixin{
  final List<String> h = ["/","/manga","/novel"];
  late TabController _ctrl;
  @override 
  void initState() {
    super.initState();
    var d = h.indexOf(router.routeInformationProvider.value.uri.path);
    _ctrl = TabController(length: 3, vsync: this, initialIndex:d==-1?0:d );

    setTitle("Online communty for artists [pixiv Material Design Concept]");
  }
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom:TabBar(
          controller: _ctrl,
          tabs: const [
            Tab(
              //icon: Icon(Icons.palette_outlined), 
              text: "Illusts"
            ),
            Tab(
              //icon: Icon(Icons.photo_library_outlined), 
              text: "Manga"
            ),
            Tab(
              //icon: Icon(Icons.art_track_outlined), 
              text: "Novels"
            )
          ],
          onTap: (a){
            navigate(h[a]);
          },
        )
      ),
      body: TabBarView(
        controller: _ctrl,
        children: const [
          IllustsPage(),
          Expanded(child:Placeholder()),
          NovelsPage()
        ]
      )

    );
  }
}

