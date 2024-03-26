import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';
export 'works/index.dart' show Works;

class DiscoveryPage extends StatefulWidget {
  Widget child;
  DiscoveryPage({super.key, required this.child});
  @override
  State<DiscoveryPage> createState()=>_DiscoveryPageState();
}
class _DiscoveryPageState extends State<DiscoveryPage> with SingleTickerProviderStateMixin{
  late TabController _ctrl;
  int idx = 0;
  List<String> locations = ["/discovery","/discovery/users"];
  @override
  void initState() {
    super.initState();
    _ctrl = TabController(length: 2, vsync: this, initialIndex: idx);
  }
  @override
  Widget build(context) {
    return Scaffold( 
      appBar: AppBar(bottom:TabBar(
      controller: _ctrl,
        tabs: const[
          Tab(
            icon: Icon(Icons.palette_outlined), 
            text: "Works"
          ),
          Tab(
            icon: Icon(Icons.person_outlined), 
            text: "Users"
          ),
        ],
        onTap: (v)=> navigate(locations[idx])
      )),
      body: Padding(padding: const EdgeInsets.all(4),child:widget.child)
    );
  }
}
