import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/ui/news/news_article.dart';
import 'package:aesapp/ui/news/news_preview_card.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  static const int _pageSize = 20;
  final PagingController<int, NewsPreview> _pagingController = PagingController(firstPageKey: 0);
  
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey)=>_fetchPreviews(pageKey));
    super.initState();
  }

  Future<void> _fetchPreviews(int pageKey)async{
    List<NewsPreview> items = await Get.find<API>().getAllArticles((pageKey~/_pageSize).toString(), _pageSize.toString());
    final isLastPage = items.length < _pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(items);
    } else {
      final nextPageKey = pageKey + items.length;
      _pagingController.appendPage(items, nextPageKey);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "News"):null,
      body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<NewsPreview>> snap){
          if(snap.hasData){
            List<NewsPreview> pres = snap.data!;
            if(context.isPortrait){
              return PagedListView<int, NewsPreview>(pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<NewsPreview>(
                    itemBuilder: (context, e, index){
                      return GestureDetector(onTap: ()async{Get.to(()=>NewsArticlePage(e));},child: NewsPreviewCard(e),);
                    }
                  ));
            }


            return Row(
              children: [
                Flexible(
                    flex: 550,
                    child: PagedListView<int, NewsPreview>(pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, e, index){
                        TextSpan textSpan = TextSpan(text: AESAppUtils.monthDayYearFormat.format(e.published), style: TextStyle(fontSize: 11, height: 1));
                        final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
                        tp.layout();
                        return ListTile(
                          title: DropCapText(
                            e.title,
                            style: Theme.of(context).listTileTheme.titleTextStyle,
                            dropCapPosition: DropCapPosition.end,
                            dropCapPadding: const EdgeInsets.symmetric(horizontal: 1),
                            dropCap: DropCap(width: tp.width+5, height: tp.height, child: Text(AESAppUtils.monthDayYearFormat.format(e.published), style: TextStyle(fontSize: 11, height: 1, color: Theme.of(context).colorScheme.primary), )),
                          ),
                          onTap: ()async{
                            setState(() {
                              selectedArticle=e;
                            });
                          },
                          selected: e==selectedArticle,

                        );
                      }
                    ))

                ),
                if (context.isLandscape)
                  const VerticalDivider(),
                if (context.isLandscape)
                  Flexible(
                    flex: AESAppUtils.getLandscapeSecondFlexFactor(context),
                    child: selectedArticle==null?const Center(child: Text("Bitte Artikel auswählen"),)
                        :NewsArticlePage(selectedArticle!, key: ValueKey(selectedArticle?.id),calledAsWidget: true,),
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
