import 'package:flutter/material.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/shared/http.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState()=>_UsersState();
}

class _UsersState extends State<Users> {
  var req = pxRequest("https://www.pixiv.net/ajax/discovery/users?mode=all&limit=10");
  final _scsvCtrl = ScrollController();
  final yipee = ManualNotifier<List<dynamic>>([]);
  @override
  void initState() {
    super.initState();
    _scsvCtrl.addListener(() {
      if (_scsvCtrl.position.pixels>=_scsvCtrl.position.maxScrollExtent) {
        pxRequest("https://www.pixiv.net/ajax/discovery/users?mode=all&limit=10").then((value) {
          yipee.value.addAll(value["illusts"]);
          yipee.notifyListeners();
        });
      }
    });
  }
  @override
  Widget build(ctx) => futureWidget(future: req, builder: (ctx,snap) {
    yipee.value = snap.data["thumbnails"]["illust"];
    return ListenableBuilder(
      listenable: yipee,
      builder:(i,dk)=>SingleChildScrollView( 
        controller: _scsvCtrl,
        child: artworkGrid(
          List.from(yipee.value.map((e) => PxArtwork(data: e)))
        ),
      )
    );
  });
}
