import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:sofieru/shared.dart';
import "hchtml.dart";

class Home extends StatelessWidget {

  @override 
  Widget build(ctx) {
    return Wrap(spacing: 4,runSpacing:4,alignment:WrapAlignment.center,children: homebtns.entries.map(
      (e) => SizedBox(
        height: 40,
        width: 200,
        child: OutlinedButton(onPressed: ()=>navigate(e.value.replaceFirst("en-us/", "")), child: Text(e.key,style: TextStyle(fontSize: 12),textAlign: TextAlign.center,))
      )
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
    return SingleChildScrollView(child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(children: [
        Text(model.querySelector(".article-header h1")!.text.trim(),style: const TextStyle(fontSize: 42, fontWeight:FontWeight.w400),),
        HtmlWidget(body.outerHtml),
        const Center(child: Text("was our 'um acksually' helpful?"),),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          OutlinedButton(onPressed: ()=>debugPrint("mcdonalds"), child: const Text("si")),
          OutlinedButton(onPressed: ()=>debugPrint("mcdonalds"), child: const Text("no")),
        ],)
      ],)
    ),);
  }
}
