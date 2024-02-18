import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/objects/news.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
class NewsArticlePage extends StatefulWidget {
  final NewsPreview preview;
  final bool calledAsWidget;
  const NewsArticlePage(this.preview, {this.calledAsWidget=false, super.key});
  @override
  State<NewsArticlePage> createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends State<NewsArticlePage> {
  late Future<NewsArticle> f;
  @override
  void initState() {
    f = Get.find<API>().getArticle(widget.preview.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Artikel: ${widget.preview.source}"):null,
      body: FutureBuilder<NewsArticle>(
        builder: (BuildContext context, AsyncSnapshot<NewsArticle> article){
          if(!article.hasData) return const Center(child: CircularProgressIndicator(),);
          return MarkdownWidget(data: "### ${article.data!.title}\r\n${article.data!.body.replaceAll(r"$$IMAGE_URL$$", API.apiEndpoint)}", config: MarkdownConfig(),);
        }, future: f,
      ),
    );
  }
}
