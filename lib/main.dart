// pixiv Material Design Concept - :nerd:
// Original app, services & resources (not including user-made works) belong to pixiv Inc.
// Do not go insane.


import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sofieru/pages/devtools.dart';
import 'package:sofieru/pages/helpcenter/hchtml.dart';
import 'package:sofieru/pages/settings.dart';
import 'package:sofieru/pages/view/artworkview.dart';
import 'package:sofieru/pages/yourip.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'shared.dart';
import 'shared/http.dart';
import 'shared/route.dart';
import 'appdata.dart';

// Routes
import 'pages/home/index.dart' as home;
import 'pages/following/index.dart';
import 'pages/view/artworks.dart' show ArtworkPage;
import 'pages/view/novels.dart' show NovelPage;
import 'pages/tags/index.dart' as tags;
import 'pages/discovery/index.dart' as discovery;
import 'pages/users/index.dart' as users;
import 'package:sofieru/pages/requests/index.dart' as request;
import "pages/helpcenter/helpcenter.dart" as hc;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; 

final Map<String, ThemeMode> themeMode = {
  "light": ThemeMode.light,
  "dark": ThemeMode.dark,
  "system": ThemeMode.system
};

void dumpErrorToConsole(details)=>FlutterError.dumpErrorToConsole(details,forceReport:true);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appLinks = AppLinks();
  Uri initialUri = Uri(path: "/");
  final pa = GlobalKey<NavigatorState>();
  final shellKeys = List.generate(4,(fhujioae)=>GlobalKey<NavigatorState>());
  FlutterError.onError = dumpErrorToConsole;
  var d = jsonDecode(await rootBundle.loadString("assets/helpcenter.json")) as Map<String, dynamic>;
  var btns = d.remove("buttons") as Map<String, dynamic>;
  updateData(d.cast<String, String>(), btns.cast<String, String>());
  await initDb(); 
  updateCookie(AppSettings().cookie);
  // updateCookie(await rootBundle.loadString("assets/cookie"));
  updateRouter(GoRouter(
    initialLocation: cooki == ""?"/login": kDebugMode?"/devtools":initialUri.path,
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
      
      ShellRoute(
        navigatorKey: pa,
        builder: (ctx,st,wid)=>ShellPage(child: wid),
        routes: [
          GoRoute(
            path: "/settings",
            builder: (ctx,idk)=>Settings()
          ),
          GoRoute(
            path: "/login",
            builder: (ctx,idk)=>Center( 
              child: Column( 
                children: [
                  const Text("Please enter your pixiv account's cookie here"),
                  const Text("(dont worry im not doing malicious i just need it to send request to the api :tm:)",style: TextStyle(fontSize: 12),),
                  TextField( 
                    maxLines: 1,
                    onSubmitted: (s){ 
                      updateCookie(s);
                      AppSettings().cookie = s;
                      navigate("/");
                    },
                  )
                ],
              ),
            )
          ),
          GoRoute(
            path: "/devtools",
            builder: (ctx,idk)=>DevTools()
          ),
          GoRoute(
            path: "/history",
            builder: (ctx,youripaddressis1921681160) => HistoryPage()
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
                name: "/",
                builder: (nuh,uh)=>const home.IllustsPage()
              ),
              GoRoute(
                parentNavigatorKey: shellKeys[0],
                path: "/manga",
                name: "/manga",
                builder: (nuh,uh)=>const Placeholder()
              ),
              GoRoute(
                parentNavigatorKey: shellKeys[0],
                path: "/novel",
                name: "/novel",
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
              GoRoute(
                path:"/following",
                name:"/following",
                builder: (ctx,kd)=>Placeholder()
              )
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
                  GoRoute(name: "/discovery",path: "/discovery",builder: (ctx,s)=>const Placeholder()),
                  GoRoute(path: "/novel/discovery",builder: (ctx,s)=>const Placeholder()),
                ]
              ),
              GoRoute(
                path: "/discovery/users",builder: (ctx,s)=>const Placeholder(),
              ),
            ], builder: (context, state, child) => discovery.DiscoveryPage(child: child,)
          ),

          GoRoute(
            path: "/artwork/view/:id",
            builder: (n, state) => ArtworkImageView(data: (state.extra as Map<String, dynamic>?), heroTag: "${state.pathParameters['id']}_p${state.uri.queryParameters['index']??'0'}")
          ),
          GoRoute(
            path: "/artwork/manga/:id",
            builder: (n, state) => MangaView(data: ((state.extra as List?)?.cast<Map<String,dynamic>>()), id: state.pathParameters['id']!,bookStyle: int.parse(state.uri.queryParameters["scrollDirection"]??"0"))
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
            name: "/request",
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
        ],
      )
    ],
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
      shortcuts: {
        const SingleActivator(LogicalKeyboardKey.f11): VoidCallbackIntent(() {navigate("/devtools");})
      },
      title: 'pixiv Material Design Concept', // doesnt work on desktop
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0495f6),brightness: Brightness.light,),
        fontFamily: "GoogleSans"
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0495f6),brightness: Brightness.dark,),
      ),
      themeMode: themeMode[AppSettings().themeMode],
      routerConfig: router,
      /*
      builder: (ctx,c)=>ContextMenuOverlay(
        cardBuilder: (ctx,children) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration( 
            color: ElevationOverlay.applySurfaceTint(
              Theme.of(ctx).colorScheme.surface,
              Theme.of(ctx).colorScheme.surfaceTint,
              Theme.of(ctx).cardTheme.elevation??1.0,
              
            ),
            borderRadius: BorderRadius.circular(12)
          ),
          child:Column(
            children: children,
          )
        ),
        buttonBuilder: (ctx, cfg, [s])=>Material(
          borderRadius: BorderRadius.circular(2),
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          child: InkWell( 
            onTap: cfg.onPressed,
            child: ListTile( 
              title: Text(cfg.label,style: s?.textStyle,),
              leading: cfg.icon,
            ),
          ),
        ),
        child: c??Placeholder(),
      )
      */
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
    "noaka"
  ];
  String MadeWithLoveByHenry = "";
  final List<String> navBarEntries = ["/","/discovery"];
  @override
  void initState() {
    super.initState();
    pxRequest("https://www.pixiv.net/ajax/user/extra"); // this has the Set-Cookie header so um cool ig
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
      TextButton(onPressed:()=>showAboutDialog(
        context: context,
        applicationName:"pixiv Material Design", 
        applicationVersion: "0.7.7",
        applicationLegalese: "SiIvaGunner woke up",
        children: [
          const SizedBox(height: 8,),
          const Center(child:Text("Fully made in",style: TextStyle(fontSize:24),)),
          ConstrainedBox( 
            constraints: const BoxConstraints(maxWidth:100),
            child: Image.asset("assets/FlutterVT_sawaratsuki1004.png")
          ),
          Center(child:StatefulBuilder(builder: (ctx,setState2){
            var hover = false;
            return MouseRegion( 
              onEnter: (a){setState2((){hover=true;});},
              onExit: (a){setState2((){hover=false;});},
              child: GestureDetector( 
                onTap: ()=>launchUrl(Uri.parse("https://twitter.com/sawaratsuki1004")),
                // its not dead code its just stupid
                child: Text("Art by our god sawaratsuki :fire:",style: TextStyle(fontSize:14, color: Theme.of(ctx).textTheme.labelLarge?.color,decoration: hover?TextDecoration.underline:null),),
              )
            );}
          ))
        ]
      ), child: Text("About this app"))
    ];
    // var appState = context.watch<MyAppState>();
    const theFunny = {
      "/novel/discovery": '/discovery'
    };
    var d = currentRouteURI().path;
    var navBarIndex = navBarEntries.indexOf(theFunny[d]??d);
    // usually -1
    if (navBarIndex<0) {navBarIndex = 0;}

    final uploadWorkButton = FloatingActionButton(onPressed: ()=>print("nice >:]"),child: Icon(Icons.add),);

    final medQuery = MediaQuery.of(context);

    final inView = GoRouterState.of(context).uri.path.startsWith("/artwork/");

    final drawer = NavigationDrawer(
      selectedIndex: pageIndex,
      onDestinationSelected: (value) {
        setState(() {
          pageIndex = value;
        });
        // this fixes the issue
        GoRouter.of(context).goNamed(e[value]);
      },
      children: navs
    );
    final settings = AppSettings();
    final body = AppData(
      child:Center(
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          
          // basic google layout constraint
          
          constraints: inView?null:BoxConstraints(maxWidth:min((190*(medQuery.size.width/190).floor().toDouble()+32), settings.noViewConstraints&&currentRouteURI().path=="/settings"?double.infinity:1160)),
          child: widget.child 
        )
      )
    );
    final breakpoi = Breakpoints(context: context);
    return RefreshIndicator(
    child: Scaffold(
      drawer: drawer,
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.surfaceVariant, 
        backgroundColor: Colors.transparent,
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

      body: body,

      floatingActionButton: breakpoi.extended&&!inView?uploadWorkButton:null,
      bottomNavigationBar: !breakpoi.extended&&!inView?NavigationBar(
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Discovery',
          ),
          SizedBox(width: 24,child: uploadWorkButton,),
          const NavigationDestination(
            icon: Icon(Icons.home),
            label: 'filler',
          ),
          const NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'items',
          ),
        ],
        onDestinationSelected: (idx){
          if (idx<navBarEntries.length) {navigate(navBarEntries[idx]);}
          else {showDialog(context: context, builder: (nuh)=>const AlertDialog(title: Text("no lol"),content: Text("hi"),));}
        },
        selectedIndex: navBarIndex,
      ):null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomSheet: kDebugMode?Container(height: 24, width:double.infinity, color: Colors.yellow, child: const Text("Debug build, don't scream for slow perfomances.",textAlign:TextAlign.center,style: TextStyle(color: Colors.black))):null,
    ),
    onRefresh: (){ 
      setState(() {
        deletePageRequestCache(currentRouteURI().path);
      });
      return Future.value();
    },
    );
  }
  KeyEventResult onKeyPresses(KeyEvent key) {
    if (key is KeyDownEvent) {return KeyEventResult.ignored;}
    if (key.logicalKey == LogicalKeyboardKey.f11) {
      navigate("/devtools");
      return KeyEventResult.handled; // dunno if it will reach the listener
    }
    return KeyEventResult.ignored;
  }
}
