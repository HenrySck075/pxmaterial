// Widgets & builder

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart';
import 'package:sofieru/json/ajax/shared/Booth.dart';
import 'package:sofieru/json/ajax/user/User.dart';
import 'package:sofieru/json/ajax/user/PartialUser.dart';
import 'package:sofieru/shared.dart' show pxRequest, navigate, JSON, currentRouteURI;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:flutter_cache_manager/src/web/file_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;
import 'context_menu.dart';

/// Header text
Text header(String label)=>Text(label,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));

/// make `notifyListeners` non-protected :trollskullirl:
class VisibleNotifyNotifier<T> extends ChangeNotifier {
  T _value;
  VisibleNotifyNotifier(this._value);

  T get value => _value;
  set value(T v) {
    _value = v;
    notifyListeners();
  }

  @override
  /// nerd
  void notifyListeners() {
    super.notifyListeners();
  }
}
SizedBox Function(BuildContext, GoRouterState) emptyBuilder()=>(ctx,s)=>const SizedBox(width: 1,height: 1,);
/// i love when i have to find a fix related to dimensions with all the flex widgets that i know so that it can be inside other flex widgets
/*
Wrap artworkGrid(Iterable<Widget> h) => Wrap(
  runAlignment: WrapAlignment.center,
  spacing: 4,
  runSpacing: 4,
  children: h.toList(),
);
*/

/// the above is func impl, trying a class variant to see if theres any perf diff
class artworkGrid extends StatelessWidget{
  Iterable<Widget> children;
  artworkGrid(this.children,{super.key});
  @override
  Widget build(ctx)=>Wrap(
    runAlignment: WrapAlignment.center,
    spacing: 4,
    runSpacing: 4,
    children: children.toList(),
  );
}


ListenableBuilder TabChips({
  required List<String> labels,
  ValueChanged<int>? onSelect,
  int idx = 0
}) {
  var index = ValueNotifier(idx);
  return ListenableBuilder(listenable: index, builder: (n,e)=>SizedBox(height: 36,child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: labels.length,
    itemBuilder: (c,i) => ChoiceChip(
      selected: i==index.value,
      showCheckmark: false,
      label: Text(labels[i]), 
      onSelected: (selected) {
        if (selected) {
          if (onSelect!=null) onSelect(index.value);
          index.value = i;
        }
      }
    ),
    separatorBuilder: (c,i)=>const SizedBox(width: 4,),
  )));
}

/// FutureBuilder that will only build passed builder if the future is fulfilled.
/// and no not because placeholder is frequently used with `skeltal` means i will wrap the placeholer with skeltal 
FutureBuilder<T> futureWidget<T>({required Future<T>? future, required AsyncWidgetBuilder<T> builder, Widget placeholder = const Center(child: CircularProgressIndicator())}) {
  return FutureBuilder<T>(future: future, builder: (ctx, snap) {
    if (snap.data == null) return placeholder;
    if (snap.hasError) {return Scaffold(body:Center( 
      child: Column( 
        children: [
          const Text("oops, something goes wrong with the request"),
          const Text("try to figure out what's wrong with your implementation henry", style: TextStyle(fontSize: 12),),
          Text(snap.error.toString(),style: const TextStyle(fontSize: 13),),
          Text(snap.stackTrace.toString(),style: const TextStyle(fontSize: 13),),
        ],
      ),
    ));}
    return builder(ctx, snap);
  });
}


var _httpClient = RetryClient(http.Client());
extension ImGenuinelyDyingHelp on HttpFileService {
  Future<FileServiceResponse> get(String url,
      {Map<String, String>? headers}) async {
    final req = http.Request('GET', Uri.parse(url));
    if (headers != null) {
      req.headers.addAll(headers);
    }
    final httpResponse = await _httpClient.send(req);

    return HttpGetResponse(httpResponse);
  }
}

/// TODO: implement retry on this fraud
CachedNetworkImage pxImage(String url, {double? width, double? height, Widget? placeholder, BoxFit? fit}) => CachedNetworkImage(imageUrl:url,httpHeaders: const {"upgrade-insecure-requests":"1","referer":"https://www.pixiv.net/en"}, placeholder: (c,d)=>placeholder??SizedBox(width: width,height: height,),width: width, height: height,fit: fit,);

Image pxImageFlutter(String url, {double? width, double? height, Widget? placeholder,Animation<double>? opacity, BoxFit? fit}) => Image(
  image: NetworkImageWithRetry(url,headers: const {"upgrade-insecure-requests":"1","referer":"https://www.pixiv.net/en"},), 
  width: width, 
  height: height, 
  frameBuilder: (ctx,w,f,isSyncLoaded)=>w, // will figure out how to omit this
  loadingBuilder: (ctx,w,imgChunk) => imgChunk==null?w:placeholder??SizedBox(width: width, height: height,),
  opacity: opacity,
);

String hm(int seconds) {
  int m = (seconds/60).floor()%60;
  int h = (m/60).floor();
  return (h==0?"":"$h hrs ")+(m==0?"":"$m mins");
}

class PxNovel extends StatefulWidget {
  final Map<String,dynamic> data;
  int rank;
  PxNovel({super.key, required this.data, this.rank=0});

  @override
  State<PxNovel> createState() => _PxNovelState();
}
class _PxNovelState extends State<PxNovel> {
  @override
  Widget build(ctx) {
    var id = widget.data["id"];
    TextStyle kiss = const TextStyle(color: Colors.grey, fontSize: 10);
    Padding pad(Widget h)=>Padding(padding: const EdgeInsets.only(left: 4,right: 4),child: h,);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400, minHeight:150, maxHeight:150),
      child: Card( 
        clipBehavior: Clip.hardEdge,  
        child:GestureDetector(
          onTap: () => navigate("/novels/$id"),
          child: ListTile( 
            leading: SizedBox(
              width: 70,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Stack(children: [
                  pxImage(widget.data["url"]),
                  if (widget.rank != 0) Positioned(
                    top:4, left:4,
                    child:SizedBox(
                      width: 24,
                      height: 24,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color:widget.rank==1?Colors.yellow.shade700:widget.rank==2?Colors.grey[300]:widget.rank==3?Colors.brown:Colors.grey.withOpacity(0.5)),
                        child:Center(child: Text(widget.rank.toString())), 
                      ),
                    )
                  ),
                ])
              ),
            ),
            title: Text(widget.data["title"], style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
            subtitle: Column( 
              children: [
                Flexible(flex: 4,child: Text(widget.data["description"], style: const TextStyle(color: Colors.grey),maxLines: 3,overflow: TextOverflow.ellipsis)),
                Row(
                  children: [
                    pad(Text(widget.data["useWordCount"]?widget.data["wordCount"].toString()+" word(s)":widget.data["textCount"].toString()+" character(s)", style: kiss)),
                    pad(Text(hm(widget.data["readingTime"]), style: kiss)),
                    pad(Text(widget.data["bookmarkCount"].toString(), style: kiss)),
                  ],
                ),
                SizedBox(height: 8,),
              ]
            )
          )
        )
      ),
    );
  }
}
class PxArtwork extends StatefulWidget {
  final PartialArtwork data;
  int rank;
  PxArtwork.fromJson({Key? key, required Map<String, dynamic> payload, int rank=0}) : this(key:key,data:PartialArtwork.fromJson(payload));
  PxArtwork({super.key,required this.data, this.rank=0});

  @override
  State<PxArtwork> createState() => _PxArtworkState();
}

class _PxArtworkState extends State<PxArtwork> {
  bool bookmarked = false;
  late final PartialArtwork data;
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }
  @override
  Widget build(context) {
    var id = data.id;
    // if (int.tryParse(id)==null) {return Center(child: Text("invalid id"),);}
    return Container(
      width: 190,
      height: 285,
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: ContextMenuWrapper(
        items: [
          // i know like 3 perspn who do this
          ContextMenuItem(
            label: "Open", 
            icon: Icons.link_outlined,
            onPressed: ()=>navigate( "/artworks/$id")
          ),
          ContextMenuItem(
            label: "Copy URL", 
            icon: Icons.link_outlined,
            onPressed: ()=>Clipboard.setData(ClipboardData(text: "/artworks/$id")).then((value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Path copied to clipboard!"))
          ))),
        ],
        child: Card(
          clipBehavior: Clip.hardEdge,
          child:Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column( 
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){navigate("/artworks/$id");},
                      child:pxImage(data.url),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed:(){
                          pxRequest("https://www.pixiv.net/ajax/illusts/bookmarks/add",body: {"illust_id":id, "comment":"", "restrict": 0, "tags": []},method: "post");
                          setState(() {
                            bookmarked = !bookmarked;
                            print("imagine bookmarked");
                          });
                        },
                        icon:Icon(Icons.favorite_outlined,color: bookmarked?Colors.red:Colors.white),
                      ),
                    ),
                    if (data.illustType==2) const Positioned.fill(child: Align(alignment: Alignment.center,child: Icon(Icons.play_circle_outlined,size: 48,),)),
                    if (widget.rank != 0) Positioned(
                      top:4, left:4,
                      child:SizedBox(
                        width: 24,
                        height: 24,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color:widget.rank==1?Colors.yellow.shade700:widget.rank==2?Colors.grey[300]:widget.rank==3?Colors.brown:Colors.grey.withOpacity(0.5)),
                          child:Center(child: Text(widget.rank.toString())), 
                        ),
                      )
                    ),
                    if (data.xRestrict == 1) Positioned(
                      top:4, left:4,
                      child:SizedBox(
                        width: 36,
                        height: 24,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color:const Color(0xFFFF4060)),
                          child:const Center(child: Text("R-18",style: TextStyle(color: Colors.white))), 
                        ),
                      )
                    ),
                    if (data.pageCount!=1) Positioned(
                      top:4,right:4,
                      child: SizedBox(
                        width:24,
                        height:24,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5),borderRadius: BorderRadius.circular(4)),
                          child: Center(child: Text(data.pageCount.toString(),style: const TextStyle(color:Colors.white)))
                        ),
                      )
                    )
                  ],
                ),
                const Spacer(),
                // weak ahh check ik
                Flexible(
                  flex: 4,
                  child: ListTile(
                    title: Text(
                      data.titleCaptionTranslation.workTitle??data.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (b)=>AuthorInfo(userId: data.userId,));
                      },
                      child: Row(
                        children: [if (!currentRouteURI().path.startsWith("/users")) ...[
                          /// TODO: get the default pfp
                          if (data.profileImageUrl!=null) CircleAvatar(backgroundImage: pxImageFlutter(data.profileImageUrl!).image),
                          const SizedBox.square(dimension:10),
                          Flexible(
                            flex:4,
                            child: Text(
                              data.userName,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ] else const SizedBox(height: 40,)],
                      ),
                    ),
                  ),
                ),
              ]
            ),
          )
        )
      ),
    );
  }
}
class PxBooth extends StatefulWidget {
  final Booth data;
  final PartialUser Function(String id) getUser;
  PxBooth.fromJson({Key? key, required Map<String, dynamic> payload, required PartialUser Function(String id) getUser}) : this(key:key,data:Booth.fromJson(payload),getUser:getUser);
  PxBooth({super.key,required this.data, required this.getUser});

  @override
  State<PxBooth> createState() => _PxBoothState();
}

class _PxBoothState extends State<PxBooth> {
  bool bookmarked = false;
  late final Booth data;
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }
  @override
  Widget build(context) {
    var user = widget.getUser(data.userId);
    // if (int.tryParse(id)==null) {return Center(child: Text("invalid id"),);}
    return SizedBox(
      width: 190,
      height: 285,
      child: ContextMenuWrapper(
      
          items: [
            // i know like 3 perspn who do this
            ContextMenuItem(
              label: "Open", 
              icon: Icons.link_outlined,
              onPressed: ()=>launchUrl(Uri.parse(data.url))
            ),
            ContextMenuItem(
              label: "Copy URL", 
              icon: Icons.link_outlined,
              onPressed: ()=>Clipboard.setData(ClipboardData(text: "hi")).then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Path copied to clipboard!"))
            ))),
          ], 
        child: Card(
          clipBehavior: Clip.hardEdge,
          child:Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column( 
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: (){launchUrl(Uri.parse(data.url));},
                  child:pxImage(data.imageUrl),
                ),
                const Spacer(),
                // weak ahh check ik
                Flexible(
                  flex: 4,
                  child: ListTile(
                    title: Text(
                      data.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (b)=>AuthorInfo(userId: data.userId,));
                      },
                      child: Row(
                        children: [if (!currentRouteURI().path.startsWith("/users")) ...[
                          /// TODO: get the default pfp
                          if (user.image!=null) CircleAvatar(backgroundImage: pxImageFlutter(user.image!).image),
                          const SizedBox.square(dimension:10),
                          Flexible(
                            flex:4,
                            child: Text(
                              user.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ] else ...[const SizedBox(height: 40,)]],
                      ),
                    ),
                  ),
                ),
              ]
            ),
          )
        )
      ),
    );
  }
}

Map<String,String> _svgs = {
  "webpage": '<svg viewBox="0 0 32 32" size="32" class="sc-11csm01-0 fidkxa"><path d="M14 15.0796C14 13.4228 12.6569 12.0796 11 12.0796 C9.34315 12.0796 8.00001 13.4228 8.00001 15.0796L8.00001 20.5796 C8.00001 21.1319 7.55229 21.5796 7.00001 21.5796L1 21.5797C0.447716 21.5797 4e-07 21.1319 0 20.5797V20.5797 L7.15256e-06 10.9939C7.15256e-06 10.7286 0.105364 10.4743 0.292901 10.2868L10.2868 0.292893 C10.6773 -0.0976311 11.3104 -0.0976311 11.701 0.292893C11.7023 0.294252 15.0397 3.68986 21.7132 10.4797 C21.897 10.6667 22 10.9185 22 11.1807L22 20.5797C22 21.1319 21.5523 21.5797 21 21.5797H21L15 21.5796 C14.4477 21.5796 14 21.1319 14 20.5796V15.0796Z" transform="translate(5 4.42035)"></path></svg>',
  "facebook": '<svg viewBox="0 0 32 32" size="32" class="sc-11csm01-0 fidkxa"><path d="M6.2141899,5 C5.5434592,5 5,5.5434592 5,6.2141899 L5,25.7858101 C5,26.4563759 5.5434592,27 6.2141899,27 L16.7508524,27 L16.7508524,18.4804754 L13.883864,18.4804754 L13.883864,15.1602059 L16.7508524,15.1602059 L16.7508524,12.7116308 C16.7508524,9.8700308 18.4864103,8.32274236 21.0212894,8.32274236 C22.2354793,8.32274236 23.279122,8.41316777 23.5832053,8.45355834 L23.5832053,11.4231717 L21.8251441,11.423996 C20.4465069,11.423996 20.1795994,12.0790651 20.1795994,13.0403606 L20.1795994,15.1602059 L23.467474,15.1602059 L23.039334,18.4804754 L20.1795994,18.4804754 L20.1795994,27 L25.7858101,27 C26.4563759,27 27,26.4563759 27,25.7858101 L27,6.2141899 C27,5.5434592 26.4563759,5 25.7858101,5 L6.2141899,5 Z" transform=""></path></svg>',
  "circlems": '<svg viewBox="0 0 32 32" class="sc-1bryfaf-0 gQsTjM"><path d="M15.9650149,4 C22.5732537,4 27.9300299,9.35689552 27.9300299,15.9650149 C27.9300299,22.5731343 22.5732537,27.9300299 15.9650149,27.9300299 C9.35701493,27.9300299 4,22.5731343 4,15.9650149 C4,9.35689552 9.35701493,4 15.9650149,4" class="sc-1bryfaf-1 bVpphf"></path><path d="M26.0516448,15.0024454 C26.2737343,17.3607737 25.6522418,19.740117 24.3019134,21.7021469 C22.9360627,23.6865051 20.9007194,25.1230424 18.5706896,25.7474006 C13.164003,27.196117 7.58668957,23.9760573 6.13809255,18.5694902 C4.68937613,13.1628036 7.90943584,7.58549015 13.316003,6.13677374 C15.6461523,5.51241553 18.1271075,5.73880359 20.3020329,6.77462448 C22.4523612,7.79850508 24.1803612,9.54823642 25.1673463,11.7017887 C25.1815552,11.7330722 25.1814358,11.7686543 25.1668687,11.7996991 C25.1523015,11.8308633 25.1247194,11.8539081 25.0916448,11.8627439 L23.5526597,12.2751618 C23.4991672,12.2894902 23.4430478,12.2640573 23.4183314,12.2145051 C21.658212,8.67552 17.6055552,6.85068418 13.781794,7.8752812 C9.33367464,9.0671618 6.68471942,13.6554603 7.87660001,18.1035797 C9.06848061,22.5516991 13.6566597,25.2007737 18.1047791,24.0088931 C21.9285403,22.9844155 24.525794,19.3776096 24.2806597,15.4328931 C24.2773164,15.3774902 24.3131373,15.3274603 24.3668687,15.3131319 L25.9056149,14.900714 C25.938809,14.8918782 25.9741523,14.8979678 26.0023314,14.9176693 C26.0303911,14.9372513 26.0485403,14.9682961 26.0516448,15.0024454 Z M12.531504,18.0307708 C12.538907,18.0584722 12.5250563,18.0873678 12.4990264,18.0990693 L12.1193249,18.2682633 C12.1038025,18.2753081 12.0858921,18.2750693 12.0704891,18.2677857 C12.0550861,18.2605021 12.0438622,18.2468902 12.0394443,18.2302931 L11.4881607,16.1730991 C11.4806383,16.1451588 11.4943697,16.1163827 11.5205189,16.1048006 L11.9002204,15.9353678 C11.9158622,15.9285618 11.9336533,15.9288006 11.9489368,15.9359648 C11.9644592,15.9433678 11.9758025,15.9568603 11.9802204,15.9735767 L12.531504,18.0307708 Z M11.7010563,15.9313081 C11.6848174,15.9356066 11.667504,15.9329797 11.6534145,15.9239051 L11.3100115,15.6989499 C11.2854145,15.6829499 11.276698,15.6514275 11.2893548,15.6252782 L11.4652354,15.2570394 C11.4725189,15.2418752 11.4860115,15.230532 11.5023697,15.2259946 C11.5184891,15.2214573 11.5359219,15.224323 11.5498921,15.2336364 L11.8944891,15.4622931 C11.9188473,15.478532 11.9274443,15.5101737 11.914907,15.5364424 L11.7379518,15.9007409 C11.7305488,15.9156663 11.7171757,15.9267708 11.7010563,15.9313081 Z M13.7784071,15.3580825 C13.7929742,15.3710974 13.800019,15.3905601 13.7971533,15.4101422 L13.7332728,15.8328288 C13.7295713,15.8567094 13.7113026,15.8760527 13.6875414,15.8810676 C13.5259892,15.9148586 13.398825,16.0007094 13.3197802,16.1293064 C13.2237802,16.2852467 13.2069444,16.4933661 13.2705862,16.730978 L13.5228847,17.6729482 C13.5304071,17.7006497 13.5166757,17.7295452 13.4905265,17.7411273 L13.1107056,17.9104407 C13.0951832,17.9176049 13.0775116,17.9172467 13.0618698,17.9099631 C13.0465862,17.9026795 13.0352429,17.8889482 13.030825,17.8724706 L12.4795414,15.8152765 C12.4723772,15.7878138 12.485631,15.7590377 12.5115414,15.7472168 L12.8664071,15.5843512 C12.8820489,15.577187 12.8998399,15.5774258 12.9154817,15.5847094 C12.9308847,15.5918735 12.9424668,15.6057243 12.9468847,15.6223213 C12.9468847,15.6223213 12.9798399,15.7450676 13.0116011,15.8636347 C13.1043772,15.6249482 13.2784668,15.4648288 13.5261086,15.3984407 L13.7244369,15.3453064 C13.7435414,15.3401721 13.7636011,15.3449482 13.7784071,15.3580825 Z M16.1053799,16.6381904 C16.1096784,16.6531158 16.1075291,16.6693546 16.0995291,16.6827277 C15.925559,16.9812352 15.6737381,17.1819516 15.3714097,17.2630262 C14.7631709,17.4260113 14.1142157,17.059683 13.9543351,16.4630262 C13.7813202,15.8175337 14.1333202,15.2015337 14.7730814,15.0301904 C15.0706336,14.9504292 15.3772605,14.9768173 15.6600067,15.1062501 C15.6745739,15.1129367 15.6854396,15.1252352 15.6908127,15.1405188 C15.6958276,15.1555636 15.6946336,15.1721606 15.6871112,15.1863695 L15.5172008,15.510668 C15.5037082,15.5365785 15.4730217,15.5481606 15.4454396,15.5381307 C15.2462754,15.4641009 15.1277082,15.4359218 14.9022754,15.4963397 C14.5161261,15.5997427 14.3742754,15.9936531 14.4603649,16.3148471 C14.550753,16.6525188 14.9312903,16.8801009 15.2585739,16.7924591 C15.4570217,16.7393247 15.5694993,16.6141904 15.6773202,16.4427277 C15.6937978,16.4164591 15.7280664,16.4078621 15.7550515,16.4229068 L16.077559,16.6026083 C16.0912903,16.6102501 16.1014396,16.6231456 16.1053799,16.6381904 Z M16.9423366,16.7399139 C16.949859,16.7684512 16.9349336,16.7981825 16.9077098,16.8089288 L16.5239486,16.9626004 C16.5083068,16.9688094 16.4909933,16.9679736 16.4759486,16.9605706 C16.461262,16.9531676 16.4501575,16.9395557 16.4459784,16.9236751 L15.7035306,14.1529288 C15.6960083,14.1253467 15.709859,14.0963318 15.7360083,14.0847497 L16.1157098,13.9154363 C16.1312321,13.9086303 16.1491426,13.9087497 16.1645456,13.9160333 C16.1797098,13.9233168 16.1912918,13.9370482 16.1957098,13.9536452 L16.9423366,16.7399139 Z M19.1980865,15.9236293 C19.2083552,15.9446442 19.2050119,15.970077 19.1894895,15.9877487 C18.9516387,16.2586741 18.7385044,16.4439875 18.4118179,16.5313905 C17.7242955,16.7156293 17.1152208,16.3625547 16.9302656,15.6727636 C16.7761164,15.09748 17.1503253,14.4764651 17.747579,14.3163457 C18.1805343,14.2004054 18.5208328,14.2929427 18.8863253,14.626077 L18.9031611,14.6540173 L18.9050716,14.6670323 C18.905788,14.6826741 18.8999373,14.6979576 18.8890716,14.7093009 C18.8890716,14.7093009 17.7899671,15.8602263 17.7044746,15.9497785 C17.8733104,16.0789726 18.0641164,16.1238681 18.2618477,16.0709726 C18.5234596,16.000883 18.7385044,15.7612412 18.9148626,15.536286 C18.9270417,15.5205248 18.9468626,15.512286 18.9666835,15.5141964 C18.9866238,15.5163457 19.0040567,15.5287636 19.0127731,15.5465547 L19.1980865,15.9236293 Z M17.4767731,15.1034502 C17.4089522,15.2388532 17.3959373,15.3952711 17.4373701,15.5518084 C17.5435193,15.4411218 18.096594,14.864286 18.1867432,14.7703158 C18.1084149,14.7439278 18.0146835,14.74548 17.9014895,14.7758084 C17.7073402,14.8278681 17.5564149,14.9441666 17.4767731,15.1034502 Z M24.0219915,14.9053957 C24.0293945,14.9330972 24.0156632,14.9619927 23.9893945,14.9736942 L23.6098124,15.1430076 C23.5941706,15.1500524 23.5762602,15.1498136 23.5609766,15.1424106 C23.5454542,15.135127 23.5342303,15.1215151 23.5298124,15.1049181 L23.1495139,13.6860524 C23.0929169,13.4743509 22.9767378,13.3999628 22.7840214,13.4515449 C22.6463497,13.4884405 22.4053945,13.6313658 22.4795438,13.9077837 L22.8322602,15.2242017 C22.8396632,15.2519031 22.8258124,15.2807987 22.7996632,15.2925002 L22.4200811,15.4616942 C22.4044393,15.4688584 22.3867677,15.4685002 22.3712453,15.4612166 C22.3559617,15.4538136 22.344499,15.4402017 22.3400811,15.423724 L21.9597826,14.0048584 C21.9031856,13.7931569 21.7868871,13.7187688 21.59429,13.7703509 C21.4566184,13.8072464 21.2157826,13.9501718 21.2898124,14.2264703 L21.6426483,15.5428882 C21.6500512,15.5705897 21.6360811,15.5996046 21.6100512,15.6113061 L21.2302303,15.7805002 C21.214708,15.7876643 21.1970363,15.7873061 21.1813945,15.7800226 C21.1659915,15.772739 21.1546483,15.759127 21.1502303,15.7426494 L20.5989468,13.685336 C20.5916632,13.6578733 20.6055139,13.6288584 20.6314244,13.6172763 L20.9945289,13.452142 C21.0100512,13.4450972 21.0278423,13.445336 21.0434841,13.4526196 C21.0588871,13.4597837 21.0702303,13.4735151 21.0746483,13.4901121 C21.0746483,13.4901121 21.0908871,13.5506494 21.1067677,13.6095151 C21.193693,13.4688584 21.3502303,13.356142 21.5405587,13.3051569 C21.7280214,13.2548882 21.9612154,13.2257539 22.1566781,13.4010375 C22.2439617,13.22253 22.457693,13.0594255 22.7053348,12.9930375 C23.1682602,12.8689778 23.5262303,13.055127 23.6396632,13.4787688 L24.0219915,14.9053957 Z M20.5647965,15.6345545 C20.6038413,15.7803456 20.5167965,15.9306739 20.3707666,15.9698381 L20.1619308,16.0257187 C20.015901,16.0648829 19.8652144,15.9781963 19.8261696,15.8324053 L19.7705278,15.6244053 C19.731483,15.4787336 19.8185278,15.3284053 19.9645577,15.2892411 L20.1733935,15.2332411 C20.3194233,15.1941963 20.4699905,15.2808829 20.5090353,15.4265545 L20.5647965,15.6345545 Z M10.3511223,17.3694328 C11.1852715,20.4823881 14.3962566,22.3362388 17.5090924,21.5020896 L17.9576894,23.1763582 C13.9217491,24.257791 9.75828646,21.854209 8.67697303,17.8180299 C7.59554019,13.782209 9.99924168,9.61874627 14.035182,8.53731343 L14.483779,10.2114627 C11.3709432,11.0454925 9.51709243,14.256597 10.3511223,17.3694328 Z M25.8321969,13.7592836 C25.9366745,14.1492537 25.6841372,14.5320597 25.244973,14.649791 C24.9127939,14.7387463 24.6386447,14.6926567 24.3816894,14.5043582 C24.3530327,14.4833433 24.3467044,14.4432239 24.3675999,14.4143284 L24.5767939,14.1265672 C24.596973,14.0987463 24.6355402,14.0917015 24.6641969,14.1106866 C24.8044954,14.2023881 24.9259283,14.2499104 25.099182,14.2034627 C25.212376,14.1731343 25.3678387,14.078806 25.3314208,13.9431642 C25.2850924,13.7700299 25.1330924,13.7637015 24.8682566,13.7669254 C24.5732118,13.7707463 24.2062865,13.7755224 24.0865253,13.3287164 C23.9826447,12.9410149 24.2164357,12.5648955 24.6304059,12.4539701 C24.9222268,12.3757612 25.1275999,12.4023881 25.4147641,12.5559403 C25.4300477,12.5639403 25.4412715,12.5776716 25.4461671,12.5941493 C25.451182,12.6107463 25.4493909,12.6284179 25.4411521,12.6434627 L25.275779,12.9486567 C25.2674208,12.9638209 25.2533312,12.9750448 25.2366148,12.9798209 C25.2198984,12.984597 25.2021074,12.9823284 25.1870626,12.9738507 C25.035182,12.8876418 24.9421671,12.856 24.7921969,12.8961194 C24.5388238,12.9639403 24.5732118,13.0927761 24.5863462,13.1411343 C24.6222865,13.2753433 24.7594805,13.2801194 24.9991223,13.2771343 C25.2951223,13.273194 25.7006148,13.2680597 25.8321969,13.7592836 Z" class="sc-1bryfaf-2 dQCicb"></path></svg>',
  "twitter": '<svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="sc-19pwd35-0 kFZEos"><path d="M13.5186 10.7714L19.3439 4H17.9635L12.9054 9.87954L8.86547 4H4.20593L10.315 12.8909L4.20593 19.9918H5.58642L10.9279 13.7828L15.1943 19.9918H19.8539L13.5182 10.7714H13.5186ZM11.6278 12.9692L11.0088 12.0839L6.08383 5.03921H8.20417L12.1787 10.7245L12.7977 11.6098L17.9641 18.9998H15.8438L11.6278 12.9696V12.9692Z"></path></svg>',
  "pawoo": '<svg viewBox="0 0 32 32" class="sc-1lf740w-0 jBiLko"><path d="M10.3476651,20.4315053 C10.236482,20.1792053 10.1733587,19.8903171 10.1733587,19.5833313 C10.1733587,18.5973729 10.8244928,17.7980957 11.6277074,17.7980957 C12.4309221,17.7980957 13.0820562,18.5973729 13.0820562,19.5833313 C13.0820562,20.3254493 12.7131643,20.9618053 12.1881895,21.231173 C12.819893,21.2267209 13.5009406,21.0038384 13.9222139,20.4926667 C14.3477875,19.976277 14.5364049,19.090237 14.5364049,18.2444046 C14.5364049,16.5948203 13.4764192,15.2575681 12.1688604,15.2575681 C10.8613017,15.2575681 9.80131596,16.5948203 9.80131596,18.2444046 C9.80131596,19.0237627 9.91081955,19.8357213 10.2983538,20.3675564 C10.3141301,20.3892071 10.3305786,20.4105263 10.3476651,20.4315053 Z M8.13963596,11.0814764 C8.8405586,10.089699 10.2489357,8.48847029 11.698583,7.6886383 C13.1482303,6.88880632 15.2673577,6.22130239 18.2564056,6.46548663 C21.2454536,6.70967086 22.8162796,7.96301699 23.5927252,8.58716521 C24.3691709,9.21131343 25.365798,10.5724763 25.9412244,12.2185477 C26.5166508,13.864619 27.0041475,15.5937822 26.9990127,18.2190273 C26.9938779,20.8442725 26.4501111,22.9685845 25.1117422,24.1927619 C25.0779164,24.2237017 25.0437394,24.2540809 25.0092259,24.2838991 C23.6781605,25.433881 21.8465608,25.7492991 20.3552956,25.1953478 C18.825363,24.6270329 18.4868407,24.0816021 18.0402519,22.9515738 C17.5936631,21.8215455 17.4095505,20.0833607 17.4119551,18.8539433 C17.4143598,17.6245259 17.4847587,17.4976298 17.4859864,16.8699608 C17.4872141,16.2422917 17.0925209,16.2866811 17.0181495,16.8545227 C16.943778,17.4223642 16.8999846,18.1219102 16.8991489,18.5491704 C16.8980863,19.0924745 16.9318342,20.5023058 17.0095249,21.2639909 C17.0872155,22.0256759 17.3250405,23.186485 17.5639667,23.742337 C17.8028929,24.2981891 18.2596324,24.969782 18.2596324,24.969782 C18.2596324,24.969782 17.2268799,25.5232236 15.1979421,25.5638493 C13.1690043,25.604475 12.0354896,25.5888525 10.3448228,25.4037017 C8.65415608,25.2185509 6.60359439,24.7683126 5.23999895,24.2321671 C3.87640351,23.6960216 3.18815991,23.2009837 2.22325411,22.3077434 C1.25834832,21.414503 0.483604407,20.0592237 1.3922294,19.429012 C2.30085438,18.7988004 2.60049796,19.3514851 3.02157079,19.6960499 C3.2957586,19.9204183 3.83490894,20.4853046 4.65914893,20.7784678 C5.48338892,21.0716311 5.7352815,21.0703736 6.17206905,20.7754677 C6.77989521,20.3650817 6.49337645,18.1572476 6.49481705,17.6582474 C6.49625766,17.1592472 6.42964834,15.4386273 6.79203089,14.1605028 C7.15441345,12.8823783 7.43871331,12.0732538 8.13963596,11.0814764 Z"></path></svg>',
  "instagram": '<svg viewBox="0 0 32 32" class="sc-ybv0s-0 biXke"><path d="M16.0000218,5 C18.9874206,5 19.362019,5.01266272 20.5352859,5.06619549 C21.7061077,5.11959725 22.5057369,5.30556465 23.205418,5.57750759 C23.9287652,5.85857642 24.5422088,6.23470301 25.1537747,6.8462253 C25.765297,7.45779125 26.1414236,8.07123477 26.4225361,8.79458202 C26.6944353,9.49426307 26.8804027,10.2938923 26.9338045,11.4647141 C26.9873373,12.637981 27,13.0125794 27,16.0000218 C27,18.9874206 26.9873373,19.362019 26.9338045,20.5352859 C26.8804027,21.7061077 26.6944353,22.5057369 26.4225361,23.205418 C26.1414236,23.9287652 25.765297,24.5422088 25.1537747,25.1537747 C24.5422088,25.765297 23.9287652,26.1414236 23.205418,26.4225361 C22.5057369,26.6944353 21.7061077,26.8804027 20.5352859,26.9338045 C19.362019,26.9873373 18.9874206,27 16.0000218,27 C13.0125794,27 12.637981,26.9873373 11.4647141,26.9338045 C10.2938923,26.8804027 9.49426307,26.6944353 8.79458202,26.4225361 C8.07123477,26.1414236 7.45779125,25.765297 6.8462253,25.1537747 C6.23470301,24.5422088 5.85857642,23.9287652 5.57750759,23.205418 C5.30556465,22.5057369 5.11959725,21.7061077 5.06619549,20.5352859 C5.01266272,19.362019 5,18.9874206 5,16.0000218 C5,13.0125794 5.01266272,12.637981 5.06619549,11.4647141 C5.11959725,10.2938923 5.30556465,9.49426307 5.57750759,8.79458202 C5.85857642,8.07123477 6.23470301,7.45779125 6.8462253,6.8462253 C7.45779125,6.23470301 8.07123477,5.85857642 8.79458202,5.57750759 C9.49426307,5.30556465 10.2938923,5.11959725 11.4647141,5.06619549 C12.637981,5.01266272 13.0125794,5 16.0000218,5 Z M16.0000218,6.98197844 C13.0628809,6.98197844 12.7149617,6.99320024 11.5550561,7.04612169 C10.4825669,7.09502601 9.90012524,7.2742254 9.51251486,7.42486816 C8.9990632,7.62441524 8.63263014,7.86278012 8.24772696,8.24772696 C7.86278012,8.63263014 7.62441524,8.9990632 7.42486816,9.51251486 C7.2742254,9.90012524 7.09502601,10.4825669 7.04612169,11.5550561 C6.99320024,12.7149617 6.98197844,13.0628809 6.98197844,16.0000218 C6.98197844,18.9371191 6.99320024,19.2850383 7.04612169,20.4449439 C7.09502601,21.5174331 7.2742254,22.0998748 7.42486816,22.4874851 C7.62441524,23.0009368 7.86282379,23.3673699 8.24772696,23.752273 C8.63263014,24.1372199 8.9990632,24.3755848 9.51251486,24.5751318 C9.90012524,24.7257746 10.4825669,24.904974 11.5550561,24.9538783 C12.7148307,25.0067998 13.0626626,25.0180216 16.0000218,25.0180216 C18.9373374,25.0180216 19.285213,25.0067998 20.4449439,24.9538783 C21.5174331,24.904974 22.0998748,24.7257746 22.4874851,24.5751318 C23.0009368,24.3755848 23.3673699,24.1372199 23.752273,23.752273 C24.1372199,23.3673699 24.3755848,23.0009368 24.5751318,22.4874851 C24.7257746,22.0998748 24.904974,21.5174331 24.9538783,20.4449439 C25.0067998,19.2850383 25.0180216,18.9371191 25.0180216,16.0000218 C25.0180216,13.0628809 25.0067998,12.7149617 24.9538783,11.5550561 C24.904974,10.4825669 24.7257746,9.90012524 24.5751318,9.51251486 C24.3755848,8.9990632 24.1372199,8.63263014 23.752273,8.24772696 C23.3673699,7.86278012 23.0009368,7.62441524 22.4874851,7.42486816 C22.0998748,7.2742254 21.5174331,7.09502601 20.4449439,7.04612169 C19.2850383,6.99320024 18.9371191,6.98197844 16.0000218,6.98197844 Z M23.1918383,10.1281853 C23.1918383,10.8572089 22.6008384,11.4481652 21.8718147,11.4481652 C21.1428347,11.4481652 20.5518348,10.8572089 20.5518348,10.1281853 C20.5518348,9.39916164 21.1428347,8.8081617 21.8718147,8.8081617 C22.6008384,8.8081617 23.1918383,9.39916164 23.1918383,10.1281853 Z M16.0000218,10.3513549 C19.1196806,10.3513549 21.6486451,12.8803194 21.6486451,16.0000218 C21.6486451,19.1196806 19.1196806,21.6486451 16.0000218,21.6486451 C12.8803194,21.6486451 10.3513549,19.1196806 10.3513549,16.0000218 C10.3513549,12.8803194 12.8803194,10.3513549 16.0000218,10.3513549 Z M16.0000218,19.6666667 C18.0250535,19.6666667 19.6666667,18.0250535 19.6666667,16.0000218 C19.6666667,13.9749465 18.0250535,12.3333333 16.0000218,12.3333333 C13.9749465,12.3333333 12.3333333,13.9749465 12.3333333,16.0000218 C12.3333333,18.0250535 13.9749465,19.6666667 16.0000218,19.6666667 Z"></path></svg>',
  "tumblr": '<svg data-v-bc32edee="" xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"><path data-v-bc32edee="" fill="#f5f5f5" fill-rule="evenodd" d="M18.0330858,26.25 C14.9126025,26.25 12.5865662,24.6445902 12.5865662,20.8036133 L12.5865662,14.6523205 L9.75,14.6523205 L9.75,11.321564 C12.8717856,10.5111758 14.1767624,7.8256825 14.3278375,5.5 L17.568139,5.5 L17.568139,10.7812618 L21.3489249,10.7812618 L21.3489249,14.6523205 L17.568139,14.6523205 L17.568139,20.0085917 C17.568139,21.6141317 18.3782144,22.1690191 19.668865,22.1690191 L21.5,22.1690191 L21.5,26.25 L18.0330858,26.25"></path></svg>',
  "message": '<svg viewBox="0 0 32 32" class="sc-1l12h90-0 dShozY"><path d="M28,10.7981496 L16,18.7981496 L4,10.7981496 L4,9 C4,7.8954305 4.8954305,7 6,7 L26,7 C27.1045695,7 28,7.8954305 28,9 L28,10.7981496 Z M28,13.2018504 L28,23 C28,24.1045695 27.1045695,25 26,25 L6,25 C4.8954305,25 4,24.1045695 4,23 L4,13.2018504 L16,21.2018504 L28,13.2018504 Z"></path></svg>'
};
Row AuthorInfo_Medias(User dd,BuildContext ctx){
  var th = Theme.of(ctx);
  ColorFilter svgColorFilter = ColorFilter.mode(th.brightness==Brightness.dark?Colors.white:Colors.black, BlendMode.srcIn);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (dd.webpage!=null) Padding(
        padding: const EdgeInsets.only(left:2.0,right:2.0),
        child: IconButton(onPressed: ()=>launchUrl(Uri.parse(dd.webpage!)), icon: SvgPicture.string(_svgs["webpage"]!,width: 24,height: 24,colorFilter:svgColorFilter)),
      ),
      if (dd.social!=null)...List.from(dd.social!.entries.map((me)=>Padding(
        padding: const EdgeInsets.only(left:2.0,right:2.0),
        child: IconButton(onPressed:()=>launchUrl(Uri.parse(me.value.url)), icon: SvgPicture.string(_svgs[me.key]!,width: 24,height: 24,colorFilter:svgColorFilter)),
      ))),
      if (dd.canSendMessage) Padding(
        padding: const EdgeInsets.only(left:2.0,right:2.0),
        child: IconButton(onPressed:()=>null,icon:SvgPicture.string(_svgs["message"]!,width: 24,height: 24,colorFilter:svgColorFilter)),
      )
    ],
  );
}
class AuthorInfo extends StatelessWidget {
  final String userId;
  const AuthorInfo({super.key,required this.userId});
  @override
  Widget build(ctx) => AlertDialog(
    contentPadding: const EdgeInsets.all(2),
  // ignore: prefer_const_constructors
    content: FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.7,
      child: Padding(
        padding: const EdgeInsets.only(top:8,bottom:8),
        child: futureWidget(
          future:Future.wait([pxRequest("https://www.pixiv.net/ajax/user/$userId?full=1&lang=en"),pxRequest("https://www.pixiv.net/ajax/user/$userId/works/latest?lang=en")]), 
          builder:(context, snap) {
            var dd = User.fromJson(snap.data![0]);
            JSON art = snap.data![1];
            return Center(child:Column(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  
                  child:dd.background!=null?pxImage(dd.background!.url,height:160):const SizedBox(height: 1, width: 1,)
                ),
                const SizedBox(height: 12,),
                CircleAvatar(
                  backgroundImage: pxImageFlutter(
                    dd.imageBig??"https://i.pximg.net/user-profile/img/2024/01/06/23/08/52/25361717_78a1808990ec4effc6d8417a09b67725_50.jpg",
                    width: 45, 
                    height: 45
                  ).image
                ),
                Text(dd.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                Flexible(flex:4,child: Text(dd.comment!=""?dd.comment:"No description provided",style: const TextStyle(fontSize:12),overflow: TextOverflow.ellipsis,)),
                AuthorInfo_Medias(dd,ctx),
                const SizedBox(height: 12,),
                FilledButton(
                  onPressed: ()=>navigate("/users/${dd.userId}"), 
                  child: const Text("View profile")
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [...art["illusts"].values.where((v)=>v!=null).map((v)=>AuthorInfoArtwork(data: v))],
                )
              ],
            ),
          );
        },
      ),
    ),
  ));
}
/// as used in [IllustPage]
class PxSimpleArtwork extends StatefulWidget {
  final PartialArtwork data;

  
  final bool isCurrent;
  final bool authorInfo;
  const PxSimpleArtwork({super.key, required this.data, this.isCurrent = false, this.authorInfo = false});
  PxSimpleArtwork.fromJson({Key? key, required Map<String,dynamic> payload, bool isCurrent = false, bool authorInfo = false}) : this(data: PartialArtwork.fromJson(payload), isCurrent: isCurrent,authorInfo:authorInfo);

  @override
  State<PxSimpleArtwork> createState() => _PxSimpleArtworkState();
}

class _PxSimpleArtworkState extends State<PxSimpleArtwork> {
  bool bookmarked = false;
  @override
  Widget build(context) {
    var id = widget.data.id;
    double s = widget.authorInfo?85:120;
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            navigate("/artworks/$id");
          },
          child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            foregroundDecoration: widget.isCurrent?BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black.withOpacity(0.5)
            ):null,
            clipBehavior: Clip.hardEdge,
            child: pxImage(widget.data.url,width:s,height:s)
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap:(){
              pxRequest("https://www.pixiv.net/ajax/illusts/bookmarks/add",body: {"illust_id":id, "comment":"", "restrict": 0, "tags": []},method: "post");
              setState(() {
                bookmarked = !bookmarked;
                print("imagine bookmarked");
              });
            },
            child:Icon(Icons.favorite,color: bookmarked?Colors.red:Colors.white),
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: Icon(Icons.favorite_outline,color: Colors.black,)
        ),
        if (widget.data.illustType==2) const Positioned.fill(child: Align(alignment: Alignment.center,child: Icon(Icons.play_circle_outlined,size: 24,),)),
        if (widget.data.xRestrict == 1) Positioned(
          top:4, left:4,
          child:SizedBox(
            width: 36,
            height: 24,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color:const Color(0xFFFF4060)),
              child:const Center(child: Text("R-18",style: TextStyle(color: Colors.white))), 
            ),
          )
        ),
        if (widget.data.pageCount!=1) Positioned(
          top:4,right:4,
          child: SizedBox(
            width:24,
            height:24,
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5),borderRadius: BorderRadius.circular(4)),
              child: Center(child: Text(widget.data.pageCount.toString()))
            ),
          )
        )
      ],
    );
  }
}
PxSimpleArtwork AuthorInfoArtwork({Key? key, dynamic data}) => PxSimpleArtwork.fromJson(payload: data, key: key,authorInfo: true,);
/// i woulx love to tell them to remove pixivision from /novel or just make them novel-related
class pixivision extends StatelessWidget {
  @override
  Widget build(ctx) => const Placeholder();
}

/// meaning for every time i use MappedIterable in the code
Iterable<T> insertionBuilder<T extends Widget>(Iterable<Widget> list, T Function(Widget) builder) => list.map(builder);
