import 'package:f_quiz_app/src/features/account/widgets/account_base_data_title_text.dart';
import 'package:f_quiz_app/src/features/account/widgets/account_base_data_value_text.dart';
import 'package:flutter/material.dart';

class AccountBaseUserDataRow extends StatelessWidget {
  const AccountBaseUserDataRow({
    super.key,
    required this.titleText,
    required this.valueText,
  });

  final String titleText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AccountBaseDataTitleText(
            titleText: titleText,
          ),
        ),
        Expanded(
          child: AccountBaseDataValueText(valueText: valueText),
        ),
      ],
    );
  }
}
