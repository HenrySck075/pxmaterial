import 'package:flutter/material.dart';

class LatestFollowingPage extends StatefulWidget {
  @override
  State<LatestFollowingPage> createState()=>_LatestFollowingPageState();
}
class _LatestFollowingPageState extends State<LatestFollowingPage> with SingleTickerProviderStateMixin{
  int idx = 0;
  late final TabController _shut;
  @override
  void initState() {
    super.initState();
    _shut = TabController(length: 3, vsync: this,initialIndex: idx);
  }
  @override
  Widget build(context) {
    return Scaffold( 
      appBar: AppBar(bottom:TabBar(tabs: const[
        Tab(icon: Icon(Icons.favorite_outlined), text: "Following"),
        Tab(icon: Icon(Icons.bookmark_outlined), text: "Watchlist"),
        Tab(icon: Icon(Icons.person_outlined), text: "Mypixiv"),// need better icon
      ],onTap: (v)=>setState(() {
        idx = v;
      }),controller: _shut,),toolbarHeight: 0,),
      body: TabBarView(controller: _shut,children: [
        Placeholder(), Placeholder(), Placeholder()
      ]),
    );
  }
}
