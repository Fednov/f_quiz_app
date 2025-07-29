import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppAnimatedBackground extends StatefulWidget {
  const AppAnimatedBackground({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<AppAnimatedBackground> createState() => _AppAnimatedBackgroundState();
}

class _AppAnimatedBackgroundState extends State<AppAnimatedBackground>
    with SingleTickerProviderStateMixin {
//Background gradient colors
  List<Color> backgroundColors = [
    Colors.yellow[200] ?? Colors.yellow,
    Colors.orange[300] ?? Colors.orange,
    Colors.red[500] ?? Colors.red,
  ];

//Animation duration depending on the Screen width
  final Duration _animationDuration = Duration(seconds: 3.0.w.round());

  late AnimationController _backgroundAnimationController;

  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _backgroundAnimationController,
      builder: (context, _) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _topAlignmentAnimation.value,
              end: _bottomAlignmentAnimation.value,
              colors: backgroundColors,
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: widget.child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _backgroundAnimationController =
        AnimationController(vsync: this, duration: _animationDuration);

    _topAlignmentAnimation =
        _tweenSequenceTop.animate(_backgroundAnimationController);

    _bottomAlignmentAnimation =
        _tweenSequenceBottom.animate(_backgroundAnimationController);

    _backgroundAnimationController.repeat();
  }

  final _tweenSequenceBottom = TweenSequence<Alignment>([
    TweenSequenceItem<Alignment>(
      tween: Tween<Alignment>(
        begin: Alignment.bottomRight,
        end: Alignment.bottomLeft,
      ),
      weight: 1,
    ),
    TweenSequenceItem<Alignment>(
      tween: Tween<Alignment>(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
      ),
      weight: 1,
    ),
  ]);

  final _tweenSequenceTop = TweenSequence<Alignment>([
    TweenSequenceItem<Alignment>(
      tween: Tween<Alignment>(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ),
      weight: 1,
    ),
    TweenSequenceItem<Alignment>(
      tween: Tween<Alignment>(
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
      weight: 1,
    ),
  ]);

  @override
  void dispose() {
    _backgroundAnimationController.dispose();
    super.dispose();
  }
}
