import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/ui/news/news_article.dart';
import 'package:aesapp/ui/news/news_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/app.dart';
import '../../objects/news.dart';
import '../aesapp/appbar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsPreview? selectedArticle;
  Stream<List<NewsPreview>> newsPreviews = Get.find<DataProvider>().allNews();

  Widget _loadMoreButton(){
    return ElevatedButton(onPressed: ()=>Get.find<DataProvider>().getMoreNews(), child: Text("Weitere 15 laden"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "News"):null,
      body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<NewsPreview>> snap){
          if(snap.hasData){
            print("build");
            List<NewsPreview> pres = snap.data!;
            if(context.isPortrait){
              return ListView(
                children: [
                  ...pres.map((e)
                  => GestureDetector(onTap: ()async{NewsArticle t =(await Get.find<API>().getArticle(e.id));Get.to(()  =>NewsArticlePage(t));},child: NewsPreviewCard(e),)).toList(),
                  _loadMoreButton()
                ],
              );
            }
            return Row(
              children: [
                Flexible(
                    flex: 550,
                    child: ListView(
                      children: [
                        ...pres.map((e) => ListTile(
                          title: Column(
                            children: [
                              Text(e.title),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [Text(AESAppUtils.monthDayFormat.format(e.published))],
                              )
                            ],
                          ),
                          onTap: ()async{
                            setState(() {
                              selectedArticle=e;
                            });
                          },
                          selected: e==selectedArticle,

                        )).toList(),
                        _loadMoreButton()
                      ],
                    )

                ),
                if (context.isLandscape)
                  const VerticalDivider(),
                if (context.isLandscape)
                  Flexible(
                    flex: AESAppUtils.getLandscapeSecondFlexFactor(context),
                    child: Placeholder(),
                  )
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
          },
          stream: newsPreviews,
      ),
    );
  }
}
