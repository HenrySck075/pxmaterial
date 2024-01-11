import 'package:flutter/material.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        //title: Align(alignment: Alignment.centerLeft, child: GestureDetector(child:Icon(Icons.list),onTap: ()=>scaffoldKey.currentState!.openDrawer(),)),
        bottom:const TabBar(
          tabs: [Tab(text: "Following"),Tab(text: "Watchlist"),Tab(text: "Mypixiv")]
        )
      ),
      body: TabBarView(
        children: [
          Placeholder(),
          Placeholder(),
          Placeholder()
        ],
      ),
    );
  }
}