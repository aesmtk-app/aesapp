import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/objects/news.dart';
import 'package:flutter/material.dart';

class NewsPreviewCard extends StatelessWidget {
  final NewsPreview pre;
  const NewsPreviewCard(this.pre, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(pre.source),
                  ),
                ),
                Text(AESAppUtils.monthDayYearFormat.format(pre.published), style: TextStyle(height: 1,color: Theme.of(context).colorScheme.primary),),
              ],
            ),
            Text(pre.title, style: TextStyle(fontWeight: FontWeight.bold),),
            Text(pre.preview.length<500?pre.preview:"${pre.preview.substring(0, 500)}...", maxLines: 15, overflow: TextOverflow.clip,)
          ],
        ),
      )
    );
  }
}
