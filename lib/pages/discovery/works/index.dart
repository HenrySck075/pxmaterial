
import 'package:flutter/material.dart';
import 'package:sofieru/pages/discovery/works/illustManga.dart';
import 'package:sofieru/shared.dart';
class Works extends StatefulWidget {
  @override
  State<Works> createState() => _WorksState();
}
class _WorksState extends State<Works> with TickerProviderStateMixin{
  late final TabController _tabCtrl;
  final ture = ["/discovery","/novel/discovery"];
  @override 
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
  }
  @override 
  Widget build(ctx) {
    int idx = ture.indexOf(currentRouteURI().path);
    if (idx==-1) idx=0;
    _tabCtrl.index=idx;
    
    return NestedScrollView(
      headerSliverBuilder: (ctx,what) => [
        SliverToBoxAdapter(child: TabBar(
          controller: _tabCtrl,
          tabs: const [
            Tab(text: "Illusts & Manga"),
            Tab(text: "Novels"),
          ],
          onTap: (v)=>navigate(ture[v]))
        )
      ],
      body: TabBarView(
        controller: _tabCtrl,
        children: [IllustManga(),Placeholder()]
      ),
    );
  }
}
