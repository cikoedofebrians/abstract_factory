// Factory 1

// Factory 2
import 'package:abstract_factory/abstract_button.dart';
import 'package:flutter/material.dart';

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
