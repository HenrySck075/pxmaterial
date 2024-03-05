import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:sofieru/shared.dart';
import "hchtml.dart";

/// TODO: make pixiv help center looks like google help center
class Home extends StatelessWidget {

  @override 
  Widget build(ctx) {
    return GridView(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2,), children: homebtns.entries.map(
    (e) => OutlinedButton(onPressed: ()=>navigate(e.value), child: Text(e.key))
  ).toList(),);
  }
}

class Category extends StatelessWidget {
  final String c;
  Category(this.c, {super.key});

  @override 
  Widget build(ctx) {
    final headlineLarge = Theme.of(ctx).textTheme.headlineLarge??const TextStyle(height:64,fontSize: 57, fontWeight:FontWeight.w400);
    var model = parse(htmls["/hc/categories/$c"]);
    var sections = model.querySelectorAll(".section-tree section");
    var colchild = <Widget>[];
    for (final section in sections) {
      colchild.addAll([
        Text(section.querySelector("h3 a")!.text,style: headlineLarge,),
        const SizedBox(height: 8,),
        ...section.querySelectorAll("ul li a").map((e) => TextButton(onPressed: ()=>navigate(e.attributes["href"]!.replaceFirst("en-us/", "")), child: Text(e.text))),
        const Divider()
      ]);
    }
    return SingleChildScrollView( 
      child: Column( 
        children: colchild,
      )
    );
  }
}

class Article extends StatelessWidget {
  final String a;
  Article(this.a, {super.key});

  @override 
  Widget build(ctx) {
    var model = parse(htmls["/hc/articles/$a"]);
    var body = model.querySelector(".article-body")!;
    return SingleChildScrollView(child: Column(children: [
      HtmlWidget(body.outerHtml),
      const Center(child: Text("was our 'um acksually' helpful?"),),
      Center(child: Row(children: [
        OutlinedButton(onPressed: ()=>debugPrint("mcdonalds"), child: const Text("si")),
        OutlinedButton(onPressed: ()=>debugPrint("mcdonalds"), child: const Text("no")),
      ],),)
    ],),);
  }
}
