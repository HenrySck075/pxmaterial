
import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';
export 'illust.dart' show IllustsPage;
export 'novel.dart' show NovelsPage;
class ShellPage extends StatefulWidget {
  Widget child;
  ShellPage({super.key, required this.child});

  @override
  State<ShellPage> createState()=>_ShellPageState();
}
class _ShellPageState extends State<ShellPage> {
  List<String> h = ["/","/manga","/novel"];
  @override
  Widget build(context) {
    var d = h.indexOf(router.routeInformationProvider.value.uri.path);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.palette_outlined), 
            label: "Illusts"
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_library_outlined), 
            label: "Manga"
          ),
          NavigationDestination(
            icon: Icon(Icons.art_track_outlined), 
            label: "Novels"
          )
        ],
        selectedIndex: d==-1?0:d,
        onDestinationSelected: (a){
          navigate(h[a]);
        },
      ),
      body: Padding(padding: const EdgeInsets.all(8),child:widget.child,)
    );
  }
}

