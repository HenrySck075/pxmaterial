import 'package:flutter/material.dart';

class LatestFollowingPage extends StatefulWidget {
  @override
  State<LatestFollowingPage> createState()=>_LatestFollowingPageState();
}
class _LatestFollowingPageState extends State<LatestFollowingPage>{
  int idx = 0;
  @override
  Widget build(context) {
    return Scaffold( 
      bottomNavigationBar: NavigationBar(destinations: const[
        NavigationDestination(icon: Icon(Icons.favorite_outlined), label: "Following"),
        NavigationDestination(icon: Icon(Icons.bookmark_outlined), label: "Watchlist"),
        NavigationDestination(icon: Icon(Icons.person_outlined), label: "Mypixiv"),// need better icon
      ],selectedIndex: idx, onDestinationSelected: (v)=>setState(() {
        idx = v;
      }),),
      body: [Placeholder(),Placeholder(),Placeholder()][idx],
    );
  }
}
