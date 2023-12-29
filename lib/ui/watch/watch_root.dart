import 'package:aesapp/ui/watch/watch_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear/wear.dart';
import 'package:wearable_rotary/wearable_rotary.dart';
class WatchRoot extends StatelessWidget {
  const WatchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) => InheritedShape(shape: shape, child: AmbientMode(
        builder: (context, WearMode mode, child) {

          return mode == WearMode.active ? WatchActive() : WatchActive();
        },
      ))
    );
  }
}
class WatchActive extends StatefulWidget {
  const WatchActive({super.key});

  @override
  State<WatchActive> createState() => _WatchActiveState();
}

class _WatchActiveState extends State<WatchActive> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body:
            Center(child: NotificationListener<ScrollNotification>(
              onNotification: (scroll){
                if(scroll.metrics.pixels<=scroll.metrics.maxScrollExtent){
                  setState(() {

                  });
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: RotaryScrollController(),
                child: Column(

                  children: [
                    Container(height: (MediaQuery.of(context).size.height/2)-42,),
                    ...List.generate(10, (i) => WatchCard(i, title: Text(i.toString(),style: TextStyle(),),)),
                    Container(height: (MediaQuery.of(context).size.height/2)-42,)

                  ],
                ),
              ),
            ))
    );
  }
}



class WatchAmbient extends StatefulWidget {
  const WatchAmbient({super.key});

  @override
  State<WatchAmbient> createState() => _WatchAmbientState();
}

class _WatchAmbientState extends State<WatchAmbient> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}




