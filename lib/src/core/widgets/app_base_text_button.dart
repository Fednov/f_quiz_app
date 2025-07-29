import 'package:flutter/material.dart';

class AppBaseTextButton extends StatelessWidget {
  const AppBaseTextButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.onLongPress,
      this.onHover,
      this.onFocusChange});

  final Widget child;
  final void Function() onPressed;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      onHover: onHover,
      child: child,
    );
  }
}
