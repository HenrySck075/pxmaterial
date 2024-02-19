import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/commission/page/request/Request.dart' as payload;
import 'package:sofieru/shared.dart';


class RequestPage extends StatelessWidget {
  final String id;
  RequestPage({super.key, required this.id});
  @override
  Widget build(ctx) {
    return futureWidget(
      future: pxRequest("https://www.pixiv.net/ajax/commission/page/requests/$id?refresh=false"), // they're just like me frfr
      builder: (ctx,snap) {
        var data = payload.Request.fromJson(snap.data!);
        return Card( 
          child:Text(data.requests.singleWhere((element) => element.request.requestId==id).request.plan.planDescription.planOriginalDescription)
        );
      }
    );
  }
}
