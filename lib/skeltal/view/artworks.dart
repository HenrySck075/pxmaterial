import "package:flutter/material.dart";
import "shared.dart";

ListTile authorView = listTileWidget;

SizedBox authorWorks = SizedBox(
  height: 190,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(7, (index) => const SizedBox(width: 190,height: 190,),),
  ),
);
