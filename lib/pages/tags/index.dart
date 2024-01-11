import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sofieru/shared.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:sticky_headers/sticky_headers.dart';
import 'top.dart';
export 'top.dart';
import 'package:sofieru/options.dart' as opt;

class IllustPage extends StatelessWidget {
  final String tag;
  const IllustPage({super.key, required this.tag});
  @override
  Widget build(ctx) {
    return SizedBox();
  }
}

class ShellPage extends StatefulWidget {
  final String tag;
  final Widget child;
  const ShellPage({super.key, required this.tag, required this.child});

  State<ShellPage> createState()=>_ShellPageState(tag:tag,child: child);
}
class _ShellPageState extends State<ShellPage> with TickerProviderStateMixin {
  final String tag;
  final Widget child;
  _ShellPageState({required this.tag,required this.child});
  int selIdx = 0;

  String mode = "all";
  String type = "all";

  List<String> habibi = ["top","artworks","manga","novels","users"];
  late final TabController _tabCtrl;
  @override
  void initState() {
    var q = getQueries();
    super.initState();
    mode = q["mode"]??"all";
    type = q["type"]??"all";
    _tabCtrl = TabController(length: 5, vsync: this);
  }
  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(ctx) {
    Map<String, String> q = getQueries();
    var d = ctx.watch<Config>();
    d.search_options["mode"] = mode;
    d.search_options["type"] = type;
    var sus = router.routeInformationProvider.value.uri.pathSegments;
    selIdx = habibi.indexOf(sus[sus.length-1]);
    return futureWidget(
      future: pxRequest("https://www.pixiv.net/ajax/search/tags/$tag"), 
      builder: (ctx,snap){
        JSON data = snap.data!;
        return NestedScrollView( 
          headerSliverBuilder: (ctx,v)=>[
            SliverList(
              delegate:SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.hardEdge,
                  width: 120,
                  child:pxImage(data["pixpedia"]["image"],height:120)
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Text(data["tag"], style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                    // pixiv loves doing this
                    if (data["tagTranslation"] is! List) const SizedBox(width:8),
                    if (data["tagTranslation"] is! List) Text(data["tagTranslation"][data["tag"]]["en"], style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey
                    ))
                  ],
                ),
                if (data["pixpedia"].containsKey("abstract")) GestureDetector( 
                  onTap: ()=>launchUrl(Uri.parse("https://dic.pixiv.net/en/a/${data['pixpedia']['tag']}")),
                  child: Text(data["pixpedia"]["abstract"]),
                )
              ]),
            ),
            SliverToBoxAdapter(
              child: GestureDetector( 
                onTap: () =>showDialog(
                  context: context, 
                  builder: (ctx)=>AlertDialog( 
                    content: Column( 
                      children: [
                        const Text("Search target"),
                        DropdownMenu(
                          dropdownMenuEntries: [...opt.type.entries.map((e) => DropdownMenuEntry(value: e.value, label: e.key))],
                          controller: TextEditingController(),
                          initialSelection: type,
                        ),
                         DropdownMenu(
                          dropdownMenuEntries: [...opt.mode.entries.map((e) => DropdownMenuEntry(value: e.value, label: e.key))],
                          controller: TextEditingController(),
                          initialSelection: mode,
                        ),
                        FilledButton(
                          onPressed: ()=>d.update(), 
                          child: const Text("Apply")
                        )
                      ],
                    ),
                  )
                ),
                child: const Text("Search options"),
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(tabs: const [
                  Tab(text:"Top"),
                  Tab(text:"Illusts"),
                  Tab(text:"Manga"),
                  Tab(text:"Novel"),
                  Tab(text:"Users"),
                ],onTap: (v)=>navigate("/tags/$tag/${habibi[v]}"),
                controller: _tabCtrl,
              ),
            ),
          ],
          // d
          body:TabBarView(
            controller: _tabCtrl,
            children: [
              MainPage(tag:tag),
              // IllustPage(tag:tag),
              // Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          )
        );
      }
    );
  }
}
