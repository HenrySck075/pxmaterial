// Widget builders

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// make `notifyListeners` non-protected :trollskullirl:
class VisibleNotifyNotifier<T> extends ChangeNotifier {
  T value;
  VisibleNotifyNotifier(this.value);

  @override
  /// nerd
  void notifyListeners() {
    super.notifyListeners();
  }
}
SizedBox Function(BuildContext, GoRouterState) emptyBuilder()=>(ctx,s)=>const SizedBox(width: 1,height: 1,);
/// i love when i have to find a fix related to dimensions with all the flex widgets that i know so that it can be inside other flex widgets
Wrap artworkGrid(List<Widget> h) => Wrap(
  alignment: WrapAlignment.spaceBetween,
  spacing: 4,
  runSpacing: 4,
  children: h,
);
FutureBuilder<T> futureWidget<T>({required Future<T>? future, required AsyncWidgetBuilder<T> builder, Widget placeholder = const Center(child: CircularProgressIndicator())}) {
  return FutureBuilder<T>(future: future, builder: (ctx, snap) {
    if (snap.data == null) return placeholder;
    // if (snap.data == null) {return Scaffold(body:Center( 
    //  child: Column( 
    //    children: [
    //      const Text("oops, something goes wrong with the request"),
    //      const Text("try to figure out what's wrong with your implementation henry", style: TextStyle(fontSize: 12),),
    //      Text(snap.error.toString(),style: const TextStyle(fontSize: 13),),
    //      Text(snap.stackTrace.toString(),style: const TextStyle(fontSize: 13),),
    //    ],
    //  ),
    //));}
    return builder(ctx, snap);
  });
}
