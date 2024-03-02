import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sofieru/json/ajax/commission/page/request/RequestPage.dart' as payload;
import 'package:sofieru/json/ajax/commission/page/request/RequestThread.dart';
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
        future: Future.wait([
          pxRequest("https://www.pixiv.net/ajax/commission/page/requests/$id?refresh=false"), // they're just like me frfr
          pxRequest("https://www.pixiv.net/ajax/commission/page/requests/$id/thread"), // they're just like me frfr
        ]),
        builder: (ctx,snap) {
          var data = payload.RequestPage.fromJson(snap.data![0]);
          var thread = RequestThread.fromJson(snap.data![1]["page"]["requestThread"]);
          var thisReq = data.requests.singleWhere((element) => element.requestId==id);
          const a = TextStyle(color: Colors.grey, fontSize:12);
          var deadline = DateTime.parse(thisReq.requestPostDeadlineDatetime);
          var idk;

          final fanUser = data.users.firstWhere((e) => thread.threadEntries[0].threadEntryBody.fanUserId! == e.userId);
          final creatorUser = data.users.firstWhere((e) => thread.threadEntries[1].threadEntryBody.creatorUserId! == e.userId);
          try {
            idk = thisReq.requestProposal.requestTranslationProposal.firstWhere((e) => e.requestProposalLang=="en");
          } on StateError {
            idk = null;
          }
          var requiresUntranslated = idk!=null;
          return SingleChildScrollView( 
            child: Padding( 
              padding: const EdgeInsets.all(8),
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
                              Text(idk.requestProposal),
                              const SizedBox(height:8),
                              const Text("Untranslated request", style: a,),
                            ],
                            HtmlWidget(thisReq.requestProposal.requestOriginalProposalHtml),
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
                            ),
                          ],
                        )
                      )
                    )
                  ),
                  const SizedBox(height:16),
                  /// the sequence is always 
                  /// sendRequest
                  /// acceptRequest / rejectRequest
                  /// smth else
                  ...[
                    if (!(thread.threadEntries[0].threadEntryBody.requestAnonymousFlg??false)==false) ListTile(
                      leading: CircleAvatar( 
                        child: pxImage( fanUser.image)
                      ),
                      title: Wrap(children: [
                        Text("${fanUser.name} sent the request via "),
                        TextButton(onPressed: ()=>debugPrint("joe biden"), child: Text(thisReq.plan.planTitle.planTranslationTitle?["en"]?.planTitle??thisReq.plan.planTitle.planOriginalTitle,style: TextStyle(color: Theme.of(ctx).colorScheme.secondary,)))
                      ]),
                    ) else Text("TODO: Anonymous")
                  ]
                ]
              )
            )
          );
        }
      )
    );
  }
}
