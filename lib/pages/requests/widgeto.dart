
import 'package:sofieru/json/ajax/user/PartialUser.dart';
import 'package:sofieru/json/ajax/commission/page/request/Request.dart' show Request;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:sofieru/json/ajax/illust/PartialArtwork.dart';
import 'package:sofieru/shared.dart';

class RequestedIllust extends StatelessWidget {
  final Request data;
  final PartialArtwork? work;
  /// this looks dumb ik
  final PartialUser Function(String id) getUser;
  const RequestedIllust({super.key, required this.data, required this.getUser, required this.work});

  @override
  Widget build(ctx) {
    var requester = data.requestAnonymousFlg?null:getUser(data.fanUserId!);
    return SizedBox(
      width: 240,
      child: Card(
        child: Padding( 
          padding: const EdgeInsets.only(top:16,left:16,right:16),
          child:Column( 
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => navigate("/requests/${data.requestId}"),
                child:Text(data.requestProposal.requestOriginalProposal,maxLines:3,overflow: TextOverflow.ellipsis, softWrap:true)
              ),
              if (requester!=null) Row(
                children: [ CircleAvatar(backgroundImage:ResizeImage(pxImageFlutter(requester.image).image,width: 16, height: 16)), const SizedBox(width: 4,), Text(requester.name)],
              ) else SvgPicture.string('<svg viewBox="0 0 48 48" size="16" class="sc-11csm01-0 fivNSm"><path d="M24 4C12.96 4 4 12.96 4 24C4 35.04 12.96 44 24 44C35.04 44 44 35.04 44 24C44 12.96 35.04 4 24 4ZM26.3575 34.5078C26.3575 35.8885 25.2382 37.0078 23.8575 37.0078C22.4768 37.0078 21.3575 35.8885 21.3575 34.5078C21.3575 33.1271 22.4768 32.0078 23.8575 32.0078C25.2382 32.0078 26.3575 33.1271 26.3575 34.5078ZM26.4737 26.5479C26.4937 26.5079 26.5137 26.4679 26.5337 26.4479C27.078 25.6496 27.8363 24.9847 28.605 24.3108C30.3785 22.7559 32.2076 21.1522 31.5937 17.7479C31.0137 14.3679 28.3137 11.5879 24.9337 11.0879C20.8137 10.4879 17.1737 13.0279 16.0737 16.6679C15.7337 17.8279 16.6137 19.0079 17.8137 19.0079H18.2137C19.0337 19.0079 19.6937 18.4279 19.9737 17.7079C20.6137 15.9279 22.4937 14.7079 24.5737 15.1479C26.4937 15.5479 27.8937 17.4479 27.7137 19.4079C27.5782 20.9349 26.4873 21.7795 25.2767 22.7168C24.5213 23.3016 23.7192 23.9225 23.0737 24.7679L23.0537 24.7479C23.019 24.7825 22.9911 24.8305 22.962 24.8803C22.9408 24.9167 22.919 24.9541 22.8937 24.9879C22.8637 25.0379 22.8287 25.0879 22.7937 25.1379C22.7587 25.1879 22.7237 25.2379 22.6937 25.2879C22.5137 25.5679 22.3737 25.8479 22.2537 26.1679C22.2437 26.2079 22.2237 26.2379 22.2037 26.2679C22.1837 26.2979 22.1637 26.3279 22.1537 26.3679C22.1337 26.3879 22.1337 26.4079 22.1337 26.4279C21.8937 27.1479 21.7337 28.0079 21.7337 29.0279H25.7537C25.7537 28.5279 25.8137 28.0879 25.9537 27.6679C25.9937 27.5279 26.0537 27.3879 26.1137 27.2479C26.1337 27.1679 26.1537 27.0879 26.1937 27.0279C26.2737 26.8679 26.3737 26.7079 26.4737 26.5479Z" transform="" fill-rule="evenodd" clip-rule="evenodd"></path></svg>',alignment: Alignment.centerLeft,colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),),
              const Spacer(),
              if (work!=null) Center(child: PxSimpleArtwork(data: work!,),) else Text("inprogress stuff lol")
            ],
          )
        )
      )
    );
  }
}
