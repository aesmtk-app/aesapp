import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/ui/news/news_article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../objects/news.dart';
import '../aesapp/appbar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "News"):null,
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<NewsPreview>> snap){
          if(snap.hasData){
            return ListView(
              children: snap.data!.sublist(0,10).map((e) => GestureDetector(onTap: ()async{NewsArticle t =(await Get.find<API>().getArticle(e.id));Get.to(()  =>NewsArticlePage(t));},child: Card(child: 
              Container(
                padding: EdgeInsets.all(20),
                child: Text(e.title),
              ),),)).toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
          },
          future: Get.find<API>().getAllArticles("1","15"),
      ),
    );
  }
}
