import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_icon.dart';
import 'package:f_quiz_app/src/features/account/view_model/provider/account_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsSavedQuizResultsDisplayButton extends ConsumerWidget {
  const IsSavedQuizResultsDisplayButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textStyle = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(fontWeight: FontWeight.bold);

    var isSavedQuizResultsDisplay = ref.watch(
      accountStateProvider.select(
        (acountState) => acountState.isSavedQuizResultsDisplay,
      ),
    );

    return Column(
      children: [
        Text(
          'Все результаты',
          style: textStyle,
        ),
        SizedBox(
          height: AppDimensions.mediumVerticalPadding,
        ),
        IconButton(
          onPressed: ref
              .watch(accountStateProvider.notifier)
              .onIsSavedQuizResultsDisplayButtonPressed,
          icon: !isSavedQuizResultsDisplay
              ? const AppBaseIcon(
                  icon: Icons.add_circle_outline,
                )
              : const AppBaseIcon(
                  icon: Icons.remove_circle_outline,
                ),
        ),
      ],
    );
  }
}
