import 'package:aesapp/objects/news.dart';
import 'package:flutter/material.dart';

class NewsPreviewCard extends StatelessWidget {
  final NewsPreview pre;
  const NewsPreviewCard(this.pre, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: Text(pre.title),);
  }
}
