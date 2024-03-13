
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
      final hd = RequestPage.fromJson(snap.data![1]);
      return SingleChildScrollView( 
        child: Column( 
          children: [
            ListView(
              scrollDirection: Axis.horizontal,
              children: d.recommendesTags.map((e) => Hero(
                tag:e,
                child: tagChipBuilder(TagInfo(
                  tag: e, 
                  translation: d.tagTranslation[e]?.toJson().cast<String, String>(),
                  locked: false, 
                  deletable: false, 
                  userName: "shut"
                ),url:"/request/creators/works/illust?tags[]=$e")
              )).toList()
            ),
            header("Works from creators accepting requests"),
            artworkGrid(hd.page.recommendIllustIdsByCreatorAcceptingRequest.map((e) => PxArtwork(data: hd.thumbnails.illust!.firstWhere((el) => el.id==e))))

          ],
        ),
      );
    }
  );
}
