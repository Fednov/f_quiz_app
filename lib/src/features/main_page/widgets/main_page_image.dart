import 'package:f_quiz_app/src/core/configs/assets/app_assets_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainPageImage extends StatelessWidget {
  const MainPageImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 80.w,
      child: Image.asset(
        AppAssetsImages.owlPng,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
