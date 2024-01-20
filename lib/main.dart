
import 'dart:math';

import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'shared.dart';

// Routes
import 'pages/home/index.dart' as home;
import 'pages/following/index.dart';
import 'pages/view/artworks.dart' show IllustPage;
import 'pages/view/novels.dart' show NovelPage;
import 'pages/tags/index.dart' as tags;
import 'pages/discovery/index.dart' as discovery;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pa = GlobalKey<NavigatorState>();
  final shellKeys = List.generate(3,(fhujioae)=>GlobalKey<NavigatorState>());
  updateCookie(await rootBundle.loadString("assets/cookie"));
  updateRouter(GoRouter(
    initialLocation: "/home/illust",
    errorBuilder: (n,s)=>ShellPage(
      child:Center(
        child: Column(children: [
          Image.asset("assets/decoren.jpg"),
          Text(s.error?.message??""),
          FilledButton(onPressed: ()=>n.pop(), child: const Text("Take me back"))
        ])
      )
    ),
    routes: <RouteBase>[
      ShellRoute(
        parentNavigatorKey: pa,
        builder: (ctx,st,wid)=>ShellPage(child: wid),
        routes: [
          ShellRoute(
            parentNavigatorKey: null,
            routes: [
              GoRoute(
                parentNavigatorKey: shellKeys[0],
                path: "/",
                builder: (nuh,uh)=>const home.IllustsPage()
              ),
              GoRoute(
                parentNavigatorKey: shellKeys[0],
                path: "/manga",
                builder: (nuh,uh)=>const Placeholder()
              ),
              GoRoute(
                parentNavigatorKey: shellKeys[0],
                path: "/novel",
                builder: (nuh,uh)=>const home.NovelsPage()
              )
            ], 
            builder: (context, state, child) => home.ShellPage(child: child),
          ),  
          GoRoute(
            parentNavigatorKey: pa,
            path:"/following",
            builder: (no,care)=>LatestFollowingPage()
          ),
          ShellRoute( 
            parentNavigatorKey: pa,
            routes: [
              GoRoute(
                path: "/discovery",builder: (ctx,s)=>Placeholder(),
                parentNavigatorKey: shellKeys[1],
              )
            ], builder: (context, state, child) => discovery.DiscoveryPage()
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/artworks/:id",
            builder: (no, state) => IllustPage(id:state.pathParameters["id"]!)
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/novels/:id",
            builder: (no, state) => NovelPage(id:state.pathParameters["id"]!)
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/series/:id",
            builder: (no, state) => Placeholder()
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/tags/:tag",
            builder: (ctx,s)=>const Text("You've found a page that is impossible for me to use as the index page for /tags, wahoo!. Now press back to exit"),
            routes: [
              ShellRoute(
                builder: (ctx,st,w)=>tags.ShellPage(tag: st.pathParameters["tag"]!,child: w,),
                routes: [
                  GoRoute(parentNavigatorKey: shellKeys[2],path: "top", builder: (ctx,st)=>tags.MainPage(tag: st.pathParameters["tag"]!)),
                  GoRoute(parentNavigatorKey: shellKeys[2],path: "illustrations", builder: (c,st)=>tags.IllustPage(tag: st.pathParameters["tag"]!)),
                  GoRoute(parentNavigatorKey: shellKeys[2],path: "manga", builder: (c,st)=>Placeholder())
                ]
              )
            ]
          )
        ]
      )
    ]
  ));
  runApp(const MyApp());
}
MaterialPage p(GoRouterState state, Widget child) => MaterialPage(key: state.pageKey, child: child);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Config(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'the app',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0495f6),brightness: Brightness.light,),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0495f6),brightness: Brightness.dark,),
        ),
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}

class ShellPage extends StatefulWidget {
  Widget child;
  String path;
  ShellPage({super.key, required this.child, this.path=""});
  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  List<String> e = ["/home/illust","/following"];
  List<String> minecraft = [
    "mococo is very cute",
    "mococo is very very cute",
    "mococo is very very very cute",
    "ShellRoute is a broken stuff",
    "n",
    "if you guys know more funny thing to add here pls do it",
    "At 100% speed, does this look possible to you?",
    "What really makes Mel does that?",
    "check steam"
  ];
  String MadeWithNerdByHenrysck075 = "";
  @override
  Widget build(BuildContext context) {
    MadeWithNerdByHenrysck075 = minecraft[Random().nextInt(minecraft.length)];
    List<Widget> navs = [
      Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Text(
          'Home',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.home),
        label: Text('Home'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.favorite),
        label: Text('Following'),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
        child: Divider(),
      ),

      Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Text(
          'Other services',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      const Text("© pixiv",style: TextStyle(color: Colors.grey, fontSize: 8),),
      Text(MadeWithNerdByHenrysck075,softWrap: true,style: const TextStyle(color: Colors.grey, fontSize: 8),),
    ];
    List<int> l = List.generate(11,(v)=>navs.length-v-3);
    context.watch<Config>().init();
    // var appState = context.watch<MyAppState>();
    return Scaffold(
      drawer: NavigationDrawer(
        selectedIndex: pageIndex,
        onDestinationSelected: (value) {
          if (pageIndex!=0 && value==0) {
            // showDialog(context: context, builder: (n)=>AlertDialog(title: Text("Heads up"),content: Text("Please do not use this to navigate back to /illust. Use the navigate icon instead. This should be fixed asap", softWrap: true,),));
            // return;
          }
          if (!l.contains(value)){
            setState(() {
              pageIndex = value;
              print(e[value]);
              navigate(e[value],method: "push");
            });
          }
        },
        children: navs
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: SearchAnchor(
          builder: (ctx,ctrl) => SearchBar( 
            padding: const MaterialStatePropertyAll(EdgeInsets.only(bottom: 4)),
            // backgroundColor: MaterialStatePropertyAll(Theme.of(context).cardColor),
            elevation: const MaterialStatePropertyAll(1),
            onTap: ctrl.openView,
          ), 
          suggestionsBuilder: (dontcare,ctrl)=>[
            const Text("Number 15, Burger King Foot Lettuce")
          ],
        ),
        actions: [
          IconButton(onPressed: ()=>showDialog(
            context: context, 
            builder: (c) => AlertDialog(
              title: const Text("Navigate to"),
              content: TextField(
                onSubmitted: (v)=>c.go(v),
              ),
            )
          ), icon: const Icon(Icons.navigation)),
          IconButton(onPressed: (){
            Clipboard.setData(ClipboardData(text: GoRouter.of(context).routeInformationProvider.value.uri.path)).then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Current path URL copied to clipboard!"))
            ));
          }, icon: const Icon(Icons.link))
        ],
      ),
      body: widget.child
    );
  }
}
