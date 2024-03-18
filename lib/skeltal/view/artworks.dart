import "package:flutter/material.dart";
import "package:skeletonizer/skeletonizer.dart";
import "shared.dart";

ListTile authorView = listTileWidget;

SizedBox authorWorks = SizedBox(
  height: 190,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(7, (index) => const Padding( 
      padding: EdgeInsets.only(bottom: 4),
      child:Card(
        child: Column( 
          children: [
            SizedBox(width: 190,height: 190,),
            Spacer(),
            ListTile( 
              title: Text("drdkdydjdkydoyyk"),
              subtitle: Row( 
                children: [
                  Bone.circle(size: 24,),
                  SizedBox(width: 4,),
                  Text("ig gi gi ig ")
                ],
              ),
            )
          ],
        ),
      )
    )),
  ),
);
