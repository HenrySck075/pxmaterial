import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';
export 'works/index.dart' show Works;

class DiscoveryPage extends StatefulWidget {
  Widget child;
  DiscoveryPage({super.key, required this.child});
  @override
  State<DiscoveryPage> createState()=>_DiscoveryPageState();
}
class _DiscoveryPageState extends State<DiscoveryPage>{
  int idx = 0;
  List<String> locations = ["/discovery","/discovery/users"];
  @override
  Widget build(context) {
    return Scaffold( 
      bottomNavigationBar: NavigationBar(destinations: const[
        NavigationDestination(icon: Icon(Icons.palette_outlined), label: "Works"),
        NavigationDestination(icon: Icon(Icons.person_outlined), label: "Users"),
      ],selectedIndex: idx, onDestinationSelected: (v)=> navigate(locations[idx])
      ),
      body: Padding(padding: EdgeInsets.all(4),child:widget.child)
    );
  }
}
