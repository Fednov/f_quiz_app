import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_text_button.dart';
import 'package:flutter/material.dart';

class AppBaseConfirmDialog extends StatelessWidget {
  const AppBaseConfirmDialog({
    super.key,
    required this.onConfirm,
    this.actionTitle,
  });

  final String? actionTitle;
  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _AppBaseConfirmDialogHeader(),
          if (actionTitle != null)
            _AppBaseConfirmDialogActionTitle(
              actionTitle: actionTitle,
            ),
          _AppBaseConfirmDialogButtons(onConfirm: onConfirm),
        ]
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(
                  bottom: AppDimensions.mediumVerticalPadding,
                ),
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _AppBaseConfirmDialogActionTitle extends StatelessWidget {
  const _AppBaseConfirmDialogActionTitle({
    required this.actionTitle,
  });

  final String? actionTitle;

  @override
  Widget build(BuildContext context) {
    var actionTitleTextStyle = Theme.of(context).textTheme.bodyLarge;

    return Text(
      actionTitle!,
      style: actionTitleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}

class _AppBaseConfirmDialogHeader extends StatelessWidget {
  const _AppBaseConfirmDialogHeader();

  @override
  Widget build(BuildContext context) {
    var headerTextStyle = Theme.of(context).textTheme.displaySmall;

    return Text(
      'Вы уверены?',
      style: headerTextStyle,
    );
  }
}

class _AppBaseConfirmDialogButtons extends StatelessWidget {
  const _AppBaseConfirmDialogButtons({
    required this.onConfirm,
  });

  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppBaseTextButton(
          onPressed: onConfirm,
          child: const Text('Да'),
        ),
        AppBaseTextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Нет'),
        ),
      ],
    );
  }
}
