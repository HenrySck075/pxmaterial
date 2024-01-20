import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sofieru/shared.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:sticky_headers/sticky_headers.dart';
import 'top.dart';
export 'top.dart';
export 'illusts.dart';
import 'package:sofieru/options.dart' as opt;

class ShellPage extends StatefulWidget {
  final String tag;
  final Widget child;
  const ShellPage({super.key, required this.tag, required this.child});

  State<ShellPage> createState()=>_ShellPageState();
}
class _ShellPageState extends State<ShellPage> with TickerProviderStateMixin {
  late final String tag;
  late final Widget child;
  int selIdx = 0;

  String mode = "all";
  String type = "all";

  List<String> habibi = ["top","artworks","manga","novels","users"];
  late final TabController _tabCtrl;
  @override
  void initState() {
    tag = widget.tag;
    child = widget.child;
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
  Widget build(c) {
    var sus = router.routeInformationProvider.value.uri.pathSegments;
    selIdx = habibi.indexOf(sus[sus.length-1]);
    var memequery = MediaQuery.of(c);
    return Consumer<Config>(builder: (ctx,d,c){
      d.search_options["mode"] = mode;
      d.search_options["type"] = type;
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
                  builder: (ctx){
                    var nya = Column( 
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(children:[
                            FilledButton(
                              onPressed: (){
                                navigate("${GoRouter.of(context).routeInformationProvider.value.uri.path}?mode=$mode&type=$type",method: "replace");
                                Navigator.pop(context);
                              }, 
                              child: const Text("Apply")
                            ),
                            TextButton(
                              onPressed: ()=>Navigator.pop(context), 
                              child: const Text("Close")
                            )
                          ])
                        )
                      ],
                    );
                    return Dialog(child: nya);
                  }),
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
      });
    });
  }
}