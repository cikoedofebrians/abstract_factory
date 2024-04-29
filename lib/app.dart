// UI
import 'dart:io';

import 'package:abstract_factory/abstract_button.dart';
import 'package:abstract_factory/android_button.dart';
import 'package:abstract_factory/any_button.dart';
import 'package:abstract_factory/ios_button.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Late Variable yang akan diinisiasikan di initializer
  late final AbstractButton button;

  @override
  void initState() {
    // Memberikan isi variabel sesuai platform, karena menggunakan abstract jadi bisa tetep berfungsi
    if (Platform.isIOS) {
      button = iOSButton(context: context);
    } else if (Platform.isAndroid) {
      button = AndroidButton(context: context);
    } else {
      button = AnyButton(context: context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // Merender Button
          child: button.renderButton(),
        ),
      ),
    );
  }
}
