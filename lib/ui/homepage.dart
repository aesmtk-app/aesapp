import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/objects/news.dart';
import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/ui/news/news_article.dart';
import 'package:aesapp/ui/news/news_preview.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'aesapp/appbar.dart';

final logger = Logger("home");

class HomePage extends StatefulWidget {
  const HomePage({this.calledAsWidget = false, super.key});

  final bool calledAsWidget;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget) ? CustomAppBar.get(title: "Home") : null,
      body: Column(
        children: [
          Card(
            
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                
                margin: EdgeInsets.all(20),
                child: FutureBuilder(
                      builder: (BuildContext context, AsyncSnapshot<List<NewsPreview>> snap){
                if(snap.hasData){
                  return TextSelectionGestureDetector(child: 
                  Column(
                    children:[
                      Text('NEWS', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,shadows: [Shadow(offset: Offset(0, -5), color: Colors.white)], color: Colors.transparent),),
                     Text(snap.data!.first.title,style: TextStyle(fontSize: 20),),
                    Text(snap.data!.first.author,style: TextStyle(fontWeight: FontWeight.w100),)
                    ]
                  ));
                }
                return Center(child: CircularProgressIndicator());
                },
                future: Get.find<API>().getAllArticles("1","15"),
                    ),
              ),
            ),
          ),
          /*SizedBox(
            width: 100,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  hintText: "Filter", border: OutlineInputBorder()),
            ),
          ),*/
          ElevatedButton(
              onPressed: () async {
                //AESAppUtils.showErrorToast(Navigator.canPop(context).toString());
                AESAppUtils.showMissingConnectionBanner(context);
                                // send to endpoint
              },
              child: Text("hi")),
        ],
      ),
    );
  }
}
