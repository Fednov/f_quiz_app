import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBaseAnimatedButton extends StatefulWidget {
  const AppBaseAnimatedButton({
    required this.title,
    required this.onTap,
    super.key,
    this.color,
    this.height,
    this.width,
    this.titleAlignment,
  });

  final String title;
  final Color? color;
  final double? height;
  final double? width;
  final Alignment? titleAlignment;
  final void Function() onTap;

  @override
  State<AppBaseAnimatedButton> createState() => _AppBaseAnimatedButtonState();
}

class _AppBaseAnimatedButtonState extends State<AppBaseAnimatedButton> {
  double scale = 1.0;

  Duration animationDuration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTapUp: (tapUpDetails) {
        _onButtonTapUp();
        widget.onTap();
      },
      onTapDown: (tapDownDetails) => onButtonTapDown(),
      onTapCancel: _onButtonTapUp,
      child: AnimatedScale(
        scale: scale,
        duration: animationDuration,
        child: Container(
          height: widget.height ?? 8.0.h,
          width: widget.width ?? 80.0.w,
          alignment: widget.titleAlignment ?? Alignment.center,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
            color: widget.color ?? Colors.grey,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.title,
              style:
                  theme.textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void onButtonTapDown() {
    setState(() {
      scale = 0.97;
    });
  }

  void _onButtonTapUp() {
    setState(() {
      scale = 1.0;
    });
  }
}
