import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'to_main_page_button.dart';
import 'information_text_bubble.dart';

class BaseQuizInformationScreen extends ConsumerWidget {
  const BaseQuizInformationScreen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppAnimatedBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InformationTextBubble(text: text),
          SizedBox(
            height: AppDimensions.largeVerticalPadding,
          ),
          const ToMainPageButton(),
        ],
      ),
    );
  }
}
