// Factory 3
import 'package:abstract_factory/abstract_button.dart';
import 'package:flutter/material.dart';

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
