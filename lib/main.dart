
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'shared.dart';
import 'pages/home.dart';
import 'pages/following.dart';
import 'pages/artworks.dart';
import 'pages/tags/index.dart' as tags;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  updateCookie(await rootBundle.loadString("assets/cookie"));
  updateRouter(GoRouter(
    initialLocation: "/en",
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
        builder: (ctx,st,wid)=>ShellPage(child: wid),
        routes: [
          GoRoute( 
            path: "/",
            builder: (ctx,nuhuh)=>FilledButton(onPressed: ()=>ctx.go("/en"), child: const Text("     ")),
            redirect: (context, state) => state.uri.path.startsWith("/en")?null:"/en${state.uri.path}",
            routes: [
              GoRoute(
                path: "en",
                builder: (bn,wef)=>const HomePage(),
                routes: [
                  GoRoute(
                    path:"following",
                    builder: (no,care)=>LatestFollowingPage()
                  ),
                  GoRoute(
                    path: "artworks/:id",
                    builder: (no, state) =>  IllustPage(id:state.pathParameters["id"]!)
                  ),
                  GoRoute(
                    path: "tags/:tag",
                    builder: (ctx,s)=>Text("You've found a page that is impossible for me to use as the index page for /tags, wahoo!. Now press back to exit"),
                    routes: [
                      ShellRoute(
                        builder: (ctx,st,w)=>tags.ShellPage(tag: st.pathParameters["tag"]!,child: w,),
                        routes: [
                          GoRoute(path: "top", builder: (ctx,st)=>tags.MainPage(tag: st.pathParameters["tag"]!)),
                          GoRoute(path: "artworks", builder: (c,st)=>tags.IllustPage(tag: st.pathParameters["tag"]!))
                        ]
                      )
                    ]
                  )
                ]
              ),
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
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
  List<String> e = ["","/following"];
  @override
  Widget build(BuildContext context) {
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
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A creative community focused on illustrations, manga and novels",
            child: Text("pixiv")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A free app where you can enjoy being creative with sketching tools and Live streams",
            child: Text("Sketch")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A fan community that supports creator's activities",
            child: Text("FANBOX")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A website to read manga and get updates about new comics for free",
            child: Text("pixivコミック")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A website for novels to read your favorite stories and discover new titles",
            child: Text("pixivノベル")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A community encyclopedia to help you better understand the tags on pixiv",
            child: Text("百科事典")
          ),
          icon: ImageIcon(Image.memory(base64Decode("iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAGaSURBVHgB7d0xSgNBFIDhF90D2FkERIucwDNYWdlYCyKk8ggeQdBKsBErEcFK7K0V7C0UQTxDqoT0M4EJCf8s83/lZrufR4a3CxshSZLUokHuh6eL8TR1fWt7M3n//+tb8vr70WW05Or0YFBy/0YIZQCYAWAGgBkA1sWafU6G0ZL985vk6fHjepw8HTkBMAPADAAzAMwAsO7+4Tn5rz3c24kimV2QFnMCYAaAGQBmAJgBYN0oc9r5e7lNXs89EVuVx5PdqMnx3U+skxMAMwDMADADwAwA676+f5M/jA7Pogi0Cyo9pdR2ynICYAaAGQBmAJgBYNXtglrjBMAMADMAzAAwA8B6vwvqOycAZgCYAWAGgBkA1vtdUG1PuEo5ATADwAwAMwDMALDm3guqjRMAMwDMADADwAwA870gmBMAMwDMADADwAwAq24X1PfdTiknAGYAmAFgBoAZAOYuCOYEwAwAMwDMADADwLLfvMp9CULL8QsalTIAzAAwA8AMACv68uecp6PFcqedHCcAZgCYAWAGgBlAkiRJgBl5iEe4GvUrRgAAAABJRU5ErkJggg==")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "The International Indie Art Marketplace",
            child: Text("BOOTH")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A service for anyone to easily create merch and doujinshi",
            child: Text("FACTORY")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "Creative media delivering the best works and information to the world",
            child: Text("pixivision")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "Learn how to draw with these videos",
            child: Text("sensei")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      NavigationDrawerDestination(
          label: const Tooltip(
            message: "A platform to create 3D characters, take their photos and upload your work",
            child: Text("VRoid")
          ),
          icon: ImageIcon(Image.memory(base64Decode("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")).image, size:14)
      ),
      const Text("© pixiv",style: TextStyle(color: Colors.grey, fontSize: 8),)
    ];
    List<int> l = List.generate(11,(v)=>navs.length-v-3);
    context.watch<Config>().init();
    // var appState = context.watch<MyAppState>();
    return Scaffold(
      drawer: NavigationDrawer(
        selectedIndex: pageIndex,
        onDestinationSelected: (value) {
          if (!l.contains(value)){
            setState(() {
              pageIndex = value;
              navigate(e[value],method: "go");
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
