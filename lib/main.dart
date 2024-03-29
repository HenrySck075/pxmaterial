// pixiv Material Design Concept - :nerd:
// Original app, services & resources (not including user-made works) belong to pixiv Inc.
// Do not go insane.


import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sofieru/pages/helpcenter/hchtml.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links/uni_links.dart';
import 'package:uni_links_desktop/uni_links_desktop.dart';
import 'shared.dart';

// Routes
import 'pages/home/index.dart' as home;
import 'pages/following/index.dart';
import 'pages/view/artworks.dart' show ArtworkPage;
import 'pages/view/novels.dart' show NovelPage;
import 'pages/tags/index.dart' as tags;
import 'pages/discovery/index.dart' as discovery;
import 'pages/users/index.dart' as users;
import 'package:sofieru/pages/requests/index.dart' as request;
import 'pages/1984.dart';
import "pages/helpcenter/helpcenter.dart" as hc;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; 

extension m on NavigatorState {
  void _debugCheckDuplicatedPageKeys() {
    assert(() {
      final Set<Key> keyReservation = <Key>{};
      for (final Page<dynamic> page in widget.pages) {
        final LocalKey? key = page.key;
        if (key != null ) {
          if (!keyReservation.contains(key)) return false;
          keyReservation.add(key);
        }
      }
      return true;
    }());
  }
}
void dumpErrorToConsole(details)=>FlutterError.dumpErrorToConsole(details,forceReport:true);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    registerProtocol('pxmat');
  }
  Uri initialUri;
  try {
    initialUri = await getInitialUri()??Uri(path: "/");
    // Use the uri and warn the user, if it is not correct,
    // but keep in mind it could be `null`.
  } on FormatException {
    // Handle exception by warning the user their action did not succeed
    initialUri = Uri(path: "/");
  } on MissingPluginException {
    initialUri = Uri(path: "/");
  }
  final pa = GlobalKey<NavigatorState>();
  final shellKeys = List.generate(4,(fhujioae)=>GlobalKey<NavigatorState>());
  FlutterError.onError = dumpErrorToConsole;
  var d = jsonDecode(await rootBundle.loadString("assets/helpcenter.json")) as Map<String, dynamic>;
  var btns = d.remove("buttons") as Map<String, dynamic>;
  updateData(d.cast<String, String>(), btns.cast<String, String>());
  updateCookie(await rootBundle.loadString("assets/cookie"));
  updateRouter(GoRouter(
    initialLocation: kDebugMode?"/terminal":initialUri.path,
    observers: [routeObserver],
    errorBuilder: (n,s)=>ShellPage(
      child:Center(
        child: Column(children: [
          Text("Not yet ;)"),
          Text(s.error?.message??""),
          FilledButton(onPressed: ()=>n.pop(), child: const Text("Take me back"))
        ])
      )
    ),
    routes: <RouteBase>[
      GoRoute(
        path: "/terminal",
        builder: (ctx,idk)=>AlertDialog(
          title: const Text("Navigate to"),
          content: Column(children: [
            TextField(
              onSubmitted: (v)=>ctx.go(v),
            ),
            FilledButton(onPressed: ()=>ctx.go("/"), child: const Text("meh"))
          ])
        )
      ),
      ShellRoute(
        navigatorKey: pa,
        builder: (ctx,st,wid)=>ShellPage(child: wid),
        routes: [
          GoRoute(
            path:"/pg",
            parentNavigatorKey: pa,
            builder:(ctx,st)=>Playground()
          ),
          ShellRoute(
            builder: (hs,jdjd,child) => Scaffold(body: child,),
            routes: [
              GoRoute(
                path: "/hc",
                builder: (ctx,jsj)=>hc.Home(),
                routes: [
                  GoRoute(
                    path:"articles/:t",
                    builder: (gz,cj)=>hc.Article(cj.pathParameters["t"]!)
                  ),
                  GoRoute(
                    path:"categories/:t",
                    builder: (gz,cj)=>hc.Category(cj.pathParameters["t"]!)
                  ),
                ]
              ),
            ]
          ),
          ShellRoute(
            parentNavigatorKey: pa,
            navigatorKey: shellKeys[0],
            restorationScopeId: "you sucks",
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
          /// TODO: 
          ShellRoute(
            parentNavigatorKey: pa,
            builder: (no,care,c)=>LatestFollowingPage(),
            routes: [
              GoRoute(path:"/following",builder: (ctx,kd)=>Placeholder())
            ]
          ),
          ShellRoute( 
            parentNavigatorKey: pa,
            navigatorKey: shellKeys[1], 
            routes: [
              ShellRoute(
                parentNavigatorKey: shellKeys[1],
                builder: (context, state, child) => discovery.Works(),
                routes: [
                  GoRoute(path: "/discovery",builder: (ctx,s)=>const Placeholder()),
                  GoRoute(path: "/novel/discovery",builder: (ctx,s)=>const Placeholder()),
                ]
              ),
              GoRoute(
                path: "/discovery/users",builder: (ctx,s)=>const Placeholder(),
              ),
            ], builder: (context, state, child) => discovery.DiscoveryPage(child: child,)
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/artworks/:id",
            builder: (no, state) => ArtworkPage(id:state.pathParameters["id"]!)
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/novels/:id",
            builder: (no, state) => NovelPage(id:state.pathParameters["id"]!)
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/series/:id",
            builder: (no, state) => const Placeholder()
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/requests/:id",
            builder: (no, state) => request.RequestsPage(id: state.pathParameters["id"]!,)
          ),
          GoRoute(
            parentNavigatorKey: pa,
            path: "/request",
            builder: (h,h2) => request.HomePage(),
            routes: [
              GoRoute( 
                path: "creators/works/illust",
                builder: (ctx,fwerujio )=>Placeholder()// why tf does they made this optional
              )
            ]
          ),
          ShellRoute(
            builder: (ctx,st,w)=>users.ShellPage(id: st.pathParameters["id"]!),
            parentNavigatorKey: pa,
            navigatorKey: shellKeys[3],
            routes: [
              GoRoute(parentNavigatorKey: shellKeys[3],path: "/users/:id", builder: (ctx,st)=>const SizedBox(width:1,height:1)),
              GoRoute(parentNavigatorKey: shellKeys[3],path: "/users/:id/illustrations", builder: (c,st)=>const Placeholder()),//tags.IllustPage(tag: st.pathParameters["tag"]!)),
              GoRoute(parentNavigatorKey: shellKeys[3],path: "/users/:id/manga", builder: (c,st)=>const Placeholder()),
              GoRoute(parentNavigatorKey: shellKeys[3],path: "/users/:id/novels", builder: (c,st)=>const Placeholder()),
              GoRoute(parentNavigatorKey: shellKeys[3],path: "/users/:id/requestss", builder: (c,st)=>const Placeholder()),
              GoRoute(parentNavigatorKey: shellKeys[3],path: "/users/:id/bookmarks", builder: (c,st)=>const Placeholder()) // TODO: make this ShellPage
            ]
          ),
          ShellRoute(
            builder: (ctx,st,w)=>tags.ShellPage(tag: st.pathParameters["tag"]!),
            parentNavigatorKey: pa,
            navigatorKey: shellKeys[2],
            routes: [
              GoRoute(parentNavigatorKey: shellKeys[2],path: "/tags/:tag", builder: (ctx,st)=>const Placeholder()),
              GoRoute(parentNavigatorKey: shellKeys[2],path: "/tags/:tag/illustrations", builder: (c,st)=>const Placeholder()),
              GoRoute(parentNavigatorKey: shellKeys[2],path: "/tags/:tag/manga", builder: (c,st)=>const Placeholder()),
              GoRoute(parentNavigatorKey: shellKeys[2],path: "/tags/:tag/novels", builder: (c,st)=>const Placeholder()),
              GoRoute(parentNavigatorKey: shellKeys[2],path: "/tags/:tag/users", builder: (c,st)=>const Placeholder()),

            ]
          ),

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'pixiv Material Design Concept', // doesnt work on desktop
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
    );
  }
}

class ShellPage extends StatefulWidget {
  final Widget child;
  String path;
  ShellPage({super.key, required this.child, this.path=""});
  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  List<String> e = ["/","/following","/request","/hc"];
  final List<String> minecraft = [
    "mococo is very cute",
    "mococo is very very cute",
    "mococo is very very very cute",
    "ShellRoute is a broken stuff",
    "nvm i fixed it",
    "if you guys know more funny thing to add here pls do it",
    "At 100% speed, does this look possible to you?",
    "What really makes Mel does that?",
    "check steam",
    "dash spider jumpscare",
    "really the mikeneko & mafu stuff is crazy (gd reference), if someone asked me who i will support i will say mike and also convinced them with a game theory-quality explaination",
    "limbo",
    "by MindCap and more",
    "bah",
    "newgrounds song on a GD rips when",
    "All Wrongs Reserved for me in the past",
    "jkterjter",
    "tidal wave",
    "is that",
  ];
  String MadeWithLoveByHenry = "";
  final List<String> navBarEntries = ["/","/discovery"];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MadeWithLoveByHenry = minecraft[Random().nextInt(minecraft.length)];
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
      const Divider(),
      const NavigationDrawerDestination(
        icon: Icon(Icons.favorite),
        label: Text('Requests'),
      ),
      const Divider(),
      const NavigationDrawerDestination(
        icon: Icon(Icons.help),
        label: Text('Help center'),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
        child: Divider(),
      ),

      const Text("© pixiv",style: TextStyle(color: Colors.grey, fontSize: 8),),
      Text(MadeWithLoveByHenry,softWrap: true,style: const TextStyle(color: Colors.grey, fontSize: 8),),
      const Text("Do not redistribute without crediting authors of this repository and the original app.",style: TextStyle(color: Colors.grey, fontSize: 8),), // - HenrySck075 (Henry Spheria)
    ];
    // var appState = context.watch<MyAppState>();
    var navBarIndex = navBarEntries.indexOf(currentRouteURI().path);
    // usually -1
    if (navBarIndex<0) {navBarIndex = 0;}
    return Scaffold(
      drawer: NavigationDrawer(
        selectedIndex: pageIndex,
        onDestinationSelected: (value) {
          setState(() {
            pageIndex = value;
          });
          // this fixes the issue
          navigate(e[value],method: e.contains(currentRouteURI().path) ? "replace" : "push");
        },
        children: navs
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer, 
        actions: [
          SearchAnchor(
            builder: (ctx,ctrl) => IconButton( 
              icon: const Icon(Icons.search),
              onPressed: ctrl.openView,
            ), 
            suggestionsBuilder: (dontcare,ctrl)=>[
              const Text("Number 15, Burger King Foot Lettuce")
            ],
          ),
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
            if (router.canPop()) router.pop();
          }, icon: const Icon(Icons.arrow_left), tooltip: "back",),
          IconButton(onPressed: (){
            Clipboard.setData(ClipboardData(text: currentRouteURI().path)).then((value) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Current path URL copied to clipboard! Debug: ${currentRouteURI().path}"))
            ));
          }, icon: const Icon(Icons.link)),
          if (kDebugMode) const IconButton(onPressed: clearRequestCache, icon:Icon(Icons.refresh), tooltip: "Reset request cache (DEBUG)",)
        ],
      ),
      backgroundColor:Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Theme.of(context).scaffoldBackgroundColor
          ),
          padding: const EdgeInsets.only(top: 8),
          
          // basic google layout constraint
          
          constraints: const BoxConstraints(maxWidth:1260),
          clipBehavior: Clip.hardEdge,
          child: widget.child
        ) 
      ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite),
          label: 'Discovery',
        ),
      ],onDestinationSelected: (idx)=>navigate(navBarEntries[idx]),selectedIndex: navBarIndex,),
    );
  }
}
