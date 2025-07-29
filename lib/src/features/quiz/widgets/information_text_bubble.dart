import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InformationTextBubble extends StatelessWidget {
  const InformationTextBubble({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5.w),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(2.0.w),
      margin: EdgeInsets.symmetric(horizontal: 3.0.w),
      child: Text(
        text,
        style: textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
