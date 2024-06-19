
import 'dart:async';

import "package:flutter/material.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sofieru/pages/view/gifskilib.dart';

import "package:sofieru/shared.dart";
import 'package:sofieru/shared/http.dart';
import 'package:archive/archive.dart' as arch;

//import "dart:ui" as ui;
//import "package:image/image.dart" as img;
/*
class Renderer extends CustomPainter {
  ValueListenable<int> _repaint;
  /// we're just passing this around atp
  List<Image> frames;
  Renderer({ValueListenable<int> repaint, required this.frames}) : _repaint = repaint;

  @override
  void paint(Canvas canvas, Size size) {
    var i = frames[_repaint.value];
    if (i.width != size.width || i.height != size.height) {}
  }
  @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
*/

/// literally gif player
class AnimatedArtworkPlayer extends StatefulWidget {
  List<Image> frames;
  List<int> delays;

  int w;
  int h;
  final String id;
  /// realer duration (in miliseconds)
  final int _duration;
  final int _framesLength;

  /// if duration is -1, it will be set to delays.last+30
  AnimatedArtworkPlayer({super.key, required this.frames, required this.delays, int? duration, required this.w, required this.h, required this.id}) : _duration = duration??delays.last+30, _framesLength = frames.length;

  @override
  State<AnimatedArtworkPlayer> createState() => _AnimatedArtworkPlayerState();
}

class _AnimatedArtworkPlayerState extends State<AnimatedArtworkPlayer> with SingleTickerProviderStateMixin {
  // ts after current
  double next = 0;
  // ts before current
  double previous = 0;
  final idx = ValueNotifier(0);
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    print("Timestamp data: ${widget.delays}");
    _ctrl = AnimationController(vsync: this, duration: Duration(milliseconds: widget._duration), upperBound: widget._duration/1000);
    next=widget.delays[1]/1000;

    _ctrl.addListener(() {
      if (_ctrl.value < previous) {
        idx.value--;
        next = previous;
        previous = widget.delays[idx.value]/1000;
      }
      else if (_ctrl.value > next) {
        idx.value = (idx.value+1==widget._framesLength ? 0 : idx.value+1);
        previous = next;
        next = widget.delays[idx.value]/1000;
      }
      print('AnimatedArtworkPlayer: next: $next | previous: $previous');
    });
    // manually restart animation
    _ctrl.addStatusListener((stat){
      if (stat == AnimationStatus.completed) {
        next=widget.delays[1]/1000;
        previous = 0;
        _ctrl.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _ctrl.forward();
    return Column(children: [
      FilledButton(
        onPressed: ()=>showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx){
            var meow = StreamController<String>();
            ugoiraSave(meow, widget.id, widget.frames, widget.delays)
            ..catchError((e){
              Navigator.pop(ctx);
              showDialog(
                context: context, 
                builder: (c)=>Dialog(
                  child: ListTile( 
                    title: const Text("Error rendering artwork"),
                    subtitle: Text("$e"),
                  ),
                )
              );
            }) // this fucker is not always a string 
            ..then((value){
              Navigator.pop(ctx);
              ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(content: Text("Rendering done. Yeah!")));
            });
            return Dialog( 
              
              child: ListTile( 
                leading: const CircularProgressIndicator(),
                title: const Text("Rendering, please chill for a lil bit"),
                subtitle: StreamBuilder(
                  stream: meow.stream, builder: (c,s)=>Text(s.data??"uwu")
                ),
              ),
            );
          }
        ),
        child: const Text("Download"),
      ),
      ListenableBuilder(listenable: idx, builder: (ctx,v)=>widget.frames[idx.value]),
      const SizedBox(height:8),
      ListenableBuilder(
        listenable: _ctrl, builder: (ctx,h)=>Slider(
          value: _ctrl.value, 
          onChanged: (n){_ctrl.value=n;}, 
          onChangeEnd: (n){_ctrl.forward(from: n);},
          onChangeStart: (n){_ctrl.stop();},
          max: _ctrl.upperBound,
        ),
      )
    ]);
  }
}

class AnimatedArtworkView extends StatelessWidget {
  const AnimatedArtworkView({
    super.key,
    required this.id,
    required this.w,
    required this.h,
  });

  final int w;
  final int h;

  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(children:[
    // the thumbnail goes here
    Center(
      child: futureWidget(
        future: pxRequest("https://www.pixiv.net/touch/ajax/illust/details?illust_id=$id&ref=").then((value) => value["illust_details"]["ugoira_meta"]), 
        placeholder: const Center(child: Text("Fetching data...")),
        builder: (ctx,snap){
          try {
            snap.data! as Map<String, dynamic>;
          } catch (s){
            return const Text("Failed to get animated artwork data");
          }
          var data = snap.data! as Map<String, dynamic>;
          final List<dynamic> frames = data["frames"];
          return futureWidget(
            future: pxRequestUnprocessed(data["src"],otherHeaders: {"Upgrade-Insecure-Requests":"1"}), 
            placeholder: const Center(child: Text("Downloading...")),
            builder: (ctx,snap) {
              var zipContent = snap.data!.bodyBytes;
              final archive = arch.ZipDecoder().decodeBytes(zipContent);
              final total = frames.map((r)=>r["delay"] as int).toList().fold(0,(p,c)=>p+c);
              List<Image> widgetFrames = [];
              List<int> frameTimestamps = [];
              int ts = 0;
              for (int i = 0; i < frames.length; i++) {
                var element = frames[i];
                widgetFrames.add(Image.memory(archive.findFile(element["file"])!.content));              
                frameTimestamps.add(ts);
                ts+=element["delay"]! as int;
              }
              // 1 more future widget to preload the images (it doesnt)
              return futureWidget(
                future: Future.wait(widgetFrames.map((e)=>precacheImage(e.image, ctx))), 
                placeholder: const Center(child: Text("Loading frames...")),
                builder: (ctx,s)=>AnimatedArtworkPlayer(id:id,frames:widgetFrames, delays: frameTimestamps,duration: total,w:w,h:h)
              );
            } 
          );
        })
      ),
    ]);
  }
}

Future ugoiraSave(StreamController<String> statusReporter, String id, List<Image> frames, List<int> delays, [bool lowqual = false]) {
  var f = frames[0];

  var tss = [];
  var tsss = 0;
  var l = delays.length;
  for (int i = 0; i < l; i++) {
    tss.add(tsss);
    tsss+=delays[i];
  }

  return getApplicationDocumentsDirectory().then((dwnPath){
    var gifski = GifSki()..create((f.width??1).toInt(), (f.height??1).toInt(), lowqual?50:100, lowqual, "$id.gif");
    /// list of frame adding call
    List<Future> schd = [];
    // they're assumed to match the length
    for (int i = 0; i < l; i++) {
      // future
      var completer = Completer();
      schd.add(completer.future);
      // get the image  
      frames[i].image.resolve(ImageConfiguration.empty).addListener(ImageStreamListener((image, synchronousCall) {
        // if this fails then that's a skill issue
        image.image.toByteData().then((value) => gifski.addFrameRGBA(i, value!.buffer.asUint8List(), tss[i])).then((value){
          completer.complete(0);
          statusReporter.add("Frame $i completed");
        });
      }));
    }
    // wait for all of them to finish and we can close gifski
    return Future.wait(schd).then((j){
      statusReporter.add("Finishing");
      gifski.close();
    });
    
  });
}

