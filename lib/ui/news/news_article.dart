import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/objects/news.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
class NewsArticlePage extends StatefulWidget {
  final NewsArticle article;
  final bool calledAsWidget;
  const NewsArticlePage(this.article, {this.calledAsWidget=false, super.key});
  @override
  State<NewsArticlePage> createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends State<NewsArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Artikel: ${widget.article.source}"):null,
      body: MarkdownWidget(data: "### ${widget.article.title}\r\n${widget.article.body}"),
    );
  }
}
