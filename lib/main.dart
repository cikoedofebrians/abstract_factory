// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Main Func
void main() {
  runApp(const MainApp());
}

// Abstract Class
abstract class AbstractButton {
  Widget renderButton();
  onTap();
}

// Factory 1
class iOSButton implements AbstractButton {
  final BuildContext context;
  iOSButton({required this.context});

  @override
  onTap() {
    showCupertinoDialog(
        context: context,
        builder: (context) => const Text("This is iOS Dialog!"));
  }

  @override
  Widget renderButton() {
    return CupertinoButton(
      onPressed: onTap,
      child: const Text("Show iOS Snackbar"),
    );
  }
}

// Factory 2
class AndroidButton implements AbstractButton {
  final BuildContext context;
  AndroidButton({required this.context});
  @override
  onTap() {
    showDialog(
      context: context,
      builder: (context) => const Text("This is Android Dialog!"),
    );
  }

  @override
  Widget renderButton() {
    return MaterialButton(
      onPressed: onTap,
      child: const Text("Show Android Snackbar"),
    );
  }
}

// Factory 3
class AnyButton implements AbstractButton {
  final BuildContext context;
  AnyButton({required this.context});
  @override
  onTap() {
    showAdaptiveDialog(
      context: context,
      builder: (context) => const Text("This is Any Dialog!"),
    );
  }

  @override
  Widget renderButton() {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text("Show Any Snackbar"),
    );
  }
}

// UI
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
