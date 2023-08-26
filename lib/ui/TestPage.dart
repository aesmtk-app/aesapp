import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    String route = Get.currentRoute;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Get.offAllNamed("/"); }, icon: Navigator.canPop(context)?Icon(Icons.arrow_back):Icon(Icons.home),
          
        ),
      ),
      body: Text("This is a test-page!, you came from: $route"),
    );
  }
}
