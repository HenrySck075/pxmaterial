
part of request;

class HomePage extends StatelessWidget {

  @override
  Widget build(ctx) => futureWidget(
    future: Future.wait([
      pxRequest("https://www.pixiv.net/ajax/commission/creators/works/recommended_tags"), 
      pxRequest("https://www.pixiv.net/ajax/commission/page/request")
    ]),
    builder: (ctx,snap) { 
      final d = RecommendedTags.fromJson(snap.data![0]);
      final hd = Requests.fromJson(snap.data![1]);
      final getUser = Memoized1<PartialUser,String>((String nuh)=>hd.users.firstWhere((element) => element.userId == nuh));
      return SingleChildScrollView( 
        child: Column( 
          children: [
            SizedBox(
            height: 34,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: d.recommendedTags.map((e) => Hero(
                  tag:e,
                  child: tagChipBuilder(TagInfo(
                    tag: e, 
                    translation: d.tagTranslation[e]?.toJson().cast<String, String>(),
                    locked: false, 
                    deletable: false, 
                    userName: "shut"
                  ),url:"/request/creators/works/illust?tags[]=$e")
                )).toList()
              )
            ),
            header("Works from creators accepting requests"),
            artworkGrid(hd.page.recommendIllustIdsByCreatorAcceptingRequest.map((e) => PxArtwork(data: hd.thumbnails.illust.firstWhere((el) => el.id==e)))),

            header("In-progress requests"),
            SizedBox( 
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: hd.page.inProgressRequestIds.map((e)=>RequestedIllust(
                  data: hd.requests.firstWhere((element) => element.requestId == e), getUser: getUser, work: null)
                ).toList()
              )
            ) 

          ],
        ),
      );
    }
  );
}
