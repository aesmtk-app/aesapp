import 'package:flutter/material.dart';

extension GlobalPaintBounds on BuildContext {
  Rect? get globalPaintBounds {
    final renderObject = findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}
const double maxScale = 0.65;
class WatchCard extends StatelessWidget {
  const WatchCard(this.i, {this.title, this.leading, this.trailing, super.key});
  final int i;
  final Widget? trailing;
  final Widget? leading;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 2),child: Chip(
      label: Padding(
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: MediaQuery.of(context).size.width-24,
          height:52,
          child: Padding(padding: EdgeInsets.zero, child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [Row(children: [leading??Container(height: 14, width: 14,), title??Container()],), trailing??Container()],
          ),),),
      ),
      labelPadding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),

    ),);
  }
  /*
  Does not work, needs further experimenting, but no time atm :(
  @override
  Widget build(BuildContext context) {
    double scale = 1;
    double pGC = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if(context.globalPaintBounds!=null) {
      // https://developer.android.com/training/wearables/views/lists#curved-layout
      double yOff = ((context.globalPaintBounds!.height/2)/screenHeight);
      double yTCO = (context.globalPaintBounds!.topCenter.dy/screenHeight)+yOff;

      pGC = (0.5-yTCO).abs();
      scale = 1- min(pGC, maxScale);
    }
    print(i.toString()+(context.globalPaintBounds?.centerRight.toString()??""));
    print(scale);
    return Padding(padding: EdgeInsets.symmetric(horizontal: 2),child:
      Container(
        width: 192*scale,
        height: 52*scale,
        child: FittedBox(
          child: Container(
            width: 192*scale,
            height: 52*scale,
            child: Card(),
          ),
        )
    ),);
  }
  */
}
