import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:sofieru/shared.dart';
/// /ranking.php is straight up getting their content server-side holy shit 😔
class RankingPage extends StatelessWidget {
  @override
  Widget build(ctx) => futureWidget(future: pxRequestUnprocessed("https://www.pixiv.net/ranking.php?mode=weekly"), builder: (ctx,snap){
    var html = parse(snap.data!.body);
    var leRanking = html.querySelectorAll("#wrapper .layout-body ._unit .ranking-items.adjust");

  });
}