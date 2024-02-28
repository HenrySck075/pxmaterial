import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/commission/page/request/RequestPage.dart' as payload;
import 'package:sofieru/pages/view/shared.dart';
import 'package:sofieru/shared.dart';
import 'package:sofieru/json/ajax/shared/TagInfo.dart';


class RequestPage extends StatelessWidget {
  final String id;
  final months = ["January","Frburary","March","April","May","June","July","August","September","October","November","December"];
  final status = {
    "inProgress": ("In progress", const Color.fromARGB(255, 0, 150, 250)),
    "complete": ("Completed", const Color.fromARGB(255, 48, 210, 136)),
    // the havent accepted state
  };
  RequestPage({super.key, required this.id});
  @override
  Widget build(ctx) {
    return Scaffold(
      body: futureWidget(
        future: pxRequest("https://www.pixiv.net/ajax/commission/page/requests/$id?refresh=false"), // they're just like me frfr
        builder: (ctx,snap) {
          var data = payload.RequestPage.fromJson(snap.data!);
          var thisReq = data.requests.singleWhere((element) => element.requestId==id);
          const a = TextStyle(color: Colors.grey, fontSize:12);
          var deadline = DateTime.parse(thisReq.requestPostDeadlineDatetime);
          var requiresUntranslated = thisReq.plan.planDescription.planTranslationDescription?["en"]!=null;
          return SingleChildScrollView( 
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox( 
                  constraints: const BoxConstraints(maxWidth: 1160),
                  child: Card(  
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Row(children: [
                            Chip(label: Text(status[thisReq.requestStatus]!.$1), color: MaterialStatePropertyAll(status[thisReq.requestStatus]!.$2),),
                            if (thisReq.requestStatus=="inProgress") Text("Deadline: ${months[deadline.month-1]} ${deadline.day}, ${deadline.year}"),
                            const Spacer(),
                            Chip(label: Text("${thisReq.requestPrice} JPY"),)
                          ]),
                          Text("${thisReq.requestPostWorkType} request", style: a,),
                          if (requiresUntranslated) ...[
                            Text(thisReq.plan.planDescription.planTranslationDescription!["en"]!.planDescription),
                            const SizedBox(height:8),
                            const Text("Untranslated request", style: a,),
                            Text(thisReq.plan.planDescription.planOriginalDescription),
                          ],
                          const SizedBox(height:8),
                          Wrap(
                            spacing: 8,
                            children: thisReq.requestTags.map(
                              (t)=>tagChipBuilder(TagInfo(
                                tag: t, 
                                translation: data.tagTranslation[t]?.toJson().cast<String, String>(), 
                                // fake data
                                userName: "naomi/dearsqn", 
                                userId: "727", 
                                deletable: false, 
                                locked: true
                              ))
                            ).toList()
                          )
                        ],
                      )
                    )
                  )
                )
              ]
            )
          );
        }
      )
    );
  }
}
