
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
  List<int> timestamps;

  int w;
  int h;
  /// realer duration (in miliseconds)
  final int _duration;
  final int _framesLength;

  /// if duration is -1, it will be set to timestamps.last+30
  AnimatedArtworkPlayer({super.key, required this.frames, required this.timestamps, int? duration, required this.w, required this.h}) : _duration = duration??timestamps.last+30, _framesLength = frames.length;

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
    print("Timestamp data: ${widget.timestamps}");
    _ctrl = AnimationController(vsync: this, duration: Duration(milliseconds: widget._duration), upperBound: widget._duration/1000);
    next=widget.timestamps[1]/1000;

    _ctrl.addListener(() {
      if (_ctrl.value < previous) {
        idx.value--;
        next = previous;
        previous = widget.timestamps[idx.value]/1000;
      }
      else if (_ctrl.value > next) {
        idx.value = (idx.value+1==widget._framesLength ? 0 : idx.value+1);
        previous = next;
        next = widget.timestamps[idx.value]/1000;
      }
      print('AnimatedArtworkPlayer: next: $next | previous: $previous');
    });
    // manually restart animation
    _ctrl.addStatusListener((stat){
      if (stat == AnimationStatus.completed) {
        next=widget.timestamps[1]/1000;
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
      ListenableBuilder(listenable: idx, builder: (ctx,v) {
        return SizedBox(
          width: widget.w.toDouble(),
          height: widget.h.toDouble(),
          child:widget.frames[idx.value] 
        );
      }),
      const SizedBox(height:8),
      ListenableBuilder(
        listenable: _ctrl, builder: (ctx,h)=>Slider(
          value: _ctrl.value, 
          onChanged: (n){_ctrl.value=n;}, 
          onChangeEnd: (n){_ctrl.forward(from: n);},
          onChangeStart: (n){_ctrl.stop();},
          max: _ctrl.upperBound,
        ),
        //condition: ()=>!isUserDragging,
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
        future: pxRequest("https://www.pixiv.net/ajax/illust/$id/ugoira_meta"), 
        placeholder: const Center(child: Text("Fetching data...")),
        builder: (ctx,snap){
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
                builder: (ctx,s)=>AnimatedArtworkPlayer(frames:widgetFrames, timestamps: frameTimestamps,duration: total,w:w,h:h)
              );
            } 
          );
        })
      ),
    ]);
  }
}

void ugoiraSave(String id, List<Image> frames, List<int> delays, [bool lowqual = false]) {
  var f = frames[0];

  var tss = [];
  var tsss = 0;
  var l = delays.length;
  for (int i = 0; i < l; i++) {
    tss.add(tsss);
    tsss+=delays[i];
  }

  getApplicationDocumentsDirectory().then((dwnPath){
    var gifski = GifSki()..create((f.width??1).toInt(), (f.height??1).toInt(), lowqual?50:100, lowqual, "${dwnPath.path}/$id.gif");
    // they're assumed to match the length
    for (int i = 0; i < l; i++) {
      frames[i].image.resolve(ImageConfiguration.empty).addListener(ImageStreamListener((image, synchronousCall) {
        // if this fails then that's a skill issue
        image.image.toByteData().then((value) => gifski.addFrameRGB(i, value!.buffer.asUint8List(), tss[i]));
      }));

    }
    gifski.close();
  });
}

