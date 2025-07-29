import 'package:flutter/material.dart';

class AppBaseIcon extends StatelessWidget {
  const AppBaseIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
