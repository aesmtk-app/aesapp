import 'dart:convert';

import 'package:aesapp/static/app.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';

final logger = Logger("appwrite");

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 100,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Filter",
            border: OutlineInputBorder()
          ),
        ),

      ),
      ElevatedButton(
          onPressed: ()async{
            AESAppUtils.showErrorToast(Navigator.canPop(context).toString());

            // send to endpoint

          },
          child: const Text("setupFCM")
      ),
    ],);
  }
}
