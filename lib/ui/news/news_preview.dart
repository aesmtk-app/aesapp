import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/ui/news/news_article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../objects/news.dart';
import '../aesapp/appbar.dart';

class NewsPreviewWidget extends StatefulWidget {
  const NewsPreviewWidget({super.key});

  @override
  State<NewsPreviewWidget> createState() => _NewsPreviewWidgetState();
}

class _NewsPreviewWidgetState extends State<NewsPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<NewsPreview>> snap){
          if(snap.hasData){
            return ListView(
              children: snap.data!.sublist(0,10).map((e) => GestureDetector(onTap: ()async{Get.to(()  =>NewsArticlePage(e));},child: Card(child:
              Column(
                children: [
                  Text(e.preview),
                  Text(e.author)
                  ],
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