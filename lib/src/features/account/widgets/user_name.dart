import 'package:f_quiz_app/src/core/configs/assets/app_assets_fonts.dart';
import 'package:f_quiz_app/src/core/features/user/presentation/view_model.dart/provider/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserName extends ConsumerWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontFamily: AppAssetsFonts.orelegaOne);
    var userName = ref.watch(currentUserProvider.select((user) => user?.name));

    return userName != null
        ? FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              userName,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          )
        : const SizedBox.shrink();
  }
}
