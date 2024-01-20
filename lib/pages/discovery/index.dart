import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';

class DiscoveryPage extends StatefulWidget {
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
      ],selectedIndex: idx, onDestinationSelected: (v)=>setState(() {
        navigate("/home/illust");
      }),),
      body: SizedBox()
    );
  }
}
