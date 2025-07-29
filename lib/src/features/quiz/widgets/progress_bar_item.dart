import 'package:flutter/material.dart';

class _ProgressBarItem extends StatelessWidget {
  const _ProgressBarItem({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: Icon(
        Icons.brightness_1,
        color: color,
      ),
    );
  }
}

class ProgressBarItemRight extends StatelessWidget {
  const ProgressBarItemRight({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProgressBarItem(color: Colors.green);
  }
}

class ProgressBarItemWrong extends StatelessWidget {
  const ProgressBarItemWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return _ProgressBarItem(color: Colors.red[800] ?? Colors.red);
  }
}
