// ignore_for_file: camel_case_types
// Factory 1
import 'package:abstract_factory/abstract_button.dart';
import 'package:flutter/cupertino.dart';

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
