import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:flutter/material.dart';

import 'app_title.dart';
import 'author_signature.dart';
import 'main_page_image.dart';
import 'question_categories.dart';

class MainPageScreenBody extends StatelessWidget {
  const MainPageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppAnimatedBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: AppTitle(),
          ),
          Expanded(
            flex: 6,
            child: MainPageImage(),
          ),
          Expanded(
            flex: 8,
            child: QuestionCategories(),
          ),
          Flexible(
            flex: 1,
            child: AuthorSignature(),
          ),
        ],
      ),
    );
  }
}
