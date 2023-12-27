import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:wearable_rotary/wearable_rotary.dart';
class WatchRoot extends StatelessWidget {
  const WatchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, WearMode mode, child) {
            return mode == WearMode.active ? WatchActive() : WatchActive();
          },
        );
      },
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
      body: Center(
        child: ListView.builder(itemBuilder: (BuildContext context, int i){
          return Text(i.toString(), textAlign: TextAlign.center,);
        }, controller: RotaryScrollController(),),
      ),
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




