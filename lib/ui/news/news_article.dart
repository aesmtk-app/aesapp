import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
class NewsArticlePage extends StatefulWidget {
  final String md;
  const NewsArticlePage(this.md, {super.key});

  @override
  State<NewsArticlePage> createState() => _NewsArticlePageState();
}

class _NewsArticlePageState extends State<NewsArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.get(),
      body: MarkdownWidget(data: widget.md),
    );
  }
}
