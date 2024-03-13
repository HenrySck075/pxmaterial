
part of request;

SizedBox BoundedListView({
  Axis scrollDirection = Axis.vertical,
  double width = double.infinity,
  double height = double.infinity,
  required List<Widget> children
}) => SizedBox(height:height,width:width,child:ListView( 
  scrollDirection: scrollDirection,
  children: children 
));

class RequestsPage extends StatelessWidget {
  final String id;
  final months = ["January","Frburary","March","April","May","June","July","August","September","October","November","December"];
  final status = {
    "inProgress": ("In progress", const Color.fromARGB(255, 0, 150, 250)),
    "complete": ("Completed", const Color.fromARGB(255, 48, 210, 136)),
    // the havent accepted state
  };
  static const bold = TextStyle(fontWeight: FontWeight.bold);
  RequestsPage({super.key, required this.id});
  @override
  Widget build(ctx) {
    return Scaffold(
      body: futureWidget(
        future: Future.wait([
          pxRequest("https://www.pixiv.net/ajax/commission/page/requests/$id?refresh=false"), // they're just like me frfr
          pxRequest("https://www.pixiv.net/ajax/commission/page/requests/$id/thread"), // they're just like me frfr
        ]),
        builder: (ctx,snap) {
          var data = RequestPage.fromJson(snap.data![0]);
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
          List<Request> ipRequests = [];
          List<Request> cRequests = [];
          for (final e in data.requests) {
            if (e.requestId!=id) {
              if (e.requestStatus=="inProgress") {
                ipRequests.add(e);
              } else if (e.requestStatus=="complete") {
                cRequests.add(e);
              }

            }
          }

          final memoizedGetUser = Memoized1<PartialUser, String>((p0) => data.users.firstWhere((element) => element.userId==p0));
          return SingleChildScrollView( 
            child: Padding( 
              padding: const EdgeInsets.all(8),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    title: Text("${status[thisReq.requestStatus]?.$1} request"),
                    children: [
                      if (thisReq.requestStatus=="inProgress") const Text("This request is currently in-progress, which means the creator is making the work. If you want to support them or respond to the request, you can share and co-request the work.\n") else const Text("The request has been completed. You can check out the finished work below (if it's public) or send a new request."),
                      if (thisReq.requestStatus=="inProgress") ...[const Text("Notes",style: bold,),

                      // multiline doesnt render correctly on neovim
                      const Text("""
- If you anonymously co-request the work, no one will know it was you who co-requested it.
- Co-requests cannot be canceled.
- Co-request messages are public for anyone to see.
""")],
                      const Text("More info",style: bold,),
                      ...[
                        ("What is Request?", "/hc/articles/900002307686-What-is-the-Requests-feature"),
                        ("What is Co-request?", "/hc/articles/900001640066"),
                        ("The request flow", "/hc/articles/900002679206-Request-flow")
                      ].map((e) => TextButton(onPressed: ()=>navigate(e.$2), child: Text(e.$1)))

                    ],
                  ),
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
                                  // fake data, unused in TagInfo widget
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
                    ListTile(
                      leading: CircleAvatar( 
                        backgroundImage: pxImageFlutter( fanUser.image).image
                      ),
                      title: Wrap(children: [
                        Text("${(thread.threadEntries[0].threadEntryBody.requestAnonymousFlg??false)?fanUser.name:'An anonymous user'} sent the request via "),
                        TextButton(onPressed: ()=>debugPrint("joe biden"), child: Text(thisReq.plan.planTitle.planTranslationTitle?["en"]?.planTitle??thisReq.plan.planTitle.planOriginalTitle,style: TextStyle(color: Theme.of(ctx).colorScheme.secondary,)))
                      ]),
                    ),
                    
                    if (thread.threadEntries.length>=2) ListTile(
                      leading: CircleAvatar( 
                        backgroundImage: pxImageFlutter( creatorUser.image).image
                      ),
                      title: Wrap(children: [
                        Text("${creatorUser.name} ${thisReq.requestAcceptStatus=='success'?'accepted':'idk'} the request "),
                      ]),
                    ),
                    
                    if (thread.threadEntries.length>=3) ...[
                      ListTile(
                        leading: CircleAvatar( 
                          backgroundImage: pxImageFlutter( creatorUser.image).image
                        ),
                        title: Wrap(children: [
                          Text("${creatorUser.name} posted the artwork"),
                        ]),
                      ),
                      /// TODO: limit to only show if its not private
                      /// this also only works with artworks currently
                      if (thisReq.requestStatus=="complete") PxArtwork(data: data.thumbnails.illust.firstWhere((element) => element.id == thisReq.postWork!.postWorkId,orElse:()=>data.thumbnails.illust.firstWhere((element) => element.id == thisReq.postWork!.postWorkId))),
                      const SizedBox(height: 16,),
                      // In-progress requests
                      if (ipRequests.isNotEmpty) ...[
                        header("Other in-progress requests"),
                        BoundedListView( 
                          height: 280,
                          scrollDirection: Axis.horizontal,
                          children: ipRequests.map((e) => RequestedIllust(data: e, getUser: memoizedGetUser, work: null)).toList(),
                        )
                      ],
                      // Completed requests
                      if (cRequests.isNotEmpty) ...[
                        header("Completed requests"),
                        BoundedListView( 
                          height: 280,
                          scrollDirection: Axis.horizontal,
                          children: ipRequests.map((e) => RequestedIllust(data: e, getUser: memoizedGetUser, work: null)).toList(),
                        )
                      ]
                    ]
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
